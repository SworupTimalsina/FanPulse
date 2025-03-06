import 'dart:convert';

import 'package:fanpulse/features/article/presentation/view_model/article_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddArticlePage extends StatefulWidget {
  const AddArticlePage({super.key});

  @override
  _AddArticlePageState createState() => _AddArticlePageState();
}

class _AddArticlePageState extends State<AddArticlePage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  String? _imageBase64;
  late final String userId;

  @override
  void initState() {
    super.initState();
    _initializeUserId();
  }

  Future<void> _initializeUserId() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      userId = prefs.getString('userId') ??
          "67b21e09426a74730bc17c7c"; // Example user ID
    });

    // Fetch articles after userId is loaded
    _fetchUserArticles();
  }

  final String apiUrl = "http://10.0.2.2:3000/api/v1/article";

  List<Map<String, dynamic>> _articles = [];
  bool _isLoading = false;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final bytes = await pickedFile.readAsBytes();
      setState(() {
        _imageBase64 = "data:image/jpeg;base64,${base64Encode(bytes)}";
      });
    }
  }

  void _submitArticle() {
    if (_formKey.currentState!.validate()) {
      context.read<ArticleBloc>().add(
            AddArticle(
              title: _titleController.text,
              content: _contentController.text,
              image: _imageBase64,
              author: userId,
            ),
          );

      // Clear fields after submitting
      setState(() {
        _titleController.clear();
        _contentController.clear();
        _imageBase64 = null;
      });

      _fetchUserArticles(); // Refresh list
    }
  }

  Future<void> _fetchUserArticles() async {
    setState(() => _isLoading = true);
    try {
      print("Fetching articles for userId: $userId");
      final response = await http.get(Uri.parse("$apiUrl/user/$userId"));
      print("Response status: $response");
      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['data'] != null && data['data'].isNotEmpty) {
          setState(() {
            _articles = List<Map<String, dynamic>>.from(data['data']);
          });
        } else {
          setState(() {
            _articles = [];
          });
        }
      } else {
        _showError("Failed to load articles");
      }
    } catch (e) {
      _showError("Error: $e");
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _updateArticle(String articleId, String newTitle,
      String newContent, String? newImage) async {
    final Map<String, dynamic> body = {
      "title": newTitle,
      "content": newContent,
      "image": newImage,
    };

    try {
      final response = await http.put(
        Uri.parse("$apiUrl/$articleId"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        _fetchUserArticles();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Article updated successfully!')),
        );
      } else {
        _showError("Failed to update article.");
      }
    } catch (e) {
      _showError("Error: $e");
    }
  }

  Future<void> _deleteArticle(String articleId) async {
    try {
      final response = await http.delete(Uri.parse("$apiUrl/$articleId"));
      if (response.statusCode == 200) {
        _fetchUserArticles();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Article deleted successfully!')),
        );
      } else {
        _showError("Failed to delete article.");
      }
    } catch (e) {
      _showError("Error: $e");
    }
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.red),
    );
  }

  void _openEditDialog(Map<String, dynamic> article) {
    TextEditingController titleController =
        TextEditingController(text: article['title']);
    TextEditingController contentController =
        TextEditingController(text: article['content']);
    String? imageBase64 = article['image'];

    Future<void> pickImage() async {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        final bytes = await pickedFile.readAsBytes();
        imageBase64 = "data:image/jpeg;base64,${base64Encode(bytes)}";
      }
    }

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit Article'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                  controller: titleController,
                  decoration: const InputDecoration(labelText: 'Title')),
              const SizedBox(height: 10),
              TextField(
                  controller: contentController,
                  decoration: const InputDecoration(labelText: 'Content')),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: pickImage,
                child: const Text('Pick Image'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                _updateArticle(article['_id'], titleController.text,
                    contentController.text, imageBase64);
                Navigator.pop(context);
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Manage Articles')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _titleController,
                    decoration: const InputDecoration(labelText: 'Title'),
                    validator: (value) =>
                        value!.isEmpty ? 'Enter a title' : null,
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _contentController,
                    decoration: const InputDecoration(labelText: 'Content'),
                    maxLines: 4,
                    validator: (value) =>
                        value!.isEmpty ? 'Enter content' : null,
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: _pickImage,
                    child: const Text('Pick Image'),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _submitArticle,
                    child: const Text('Submit'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: _isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : _articles.isEmpty
                      ? const Center(child: Text("No articles found"))
                      : ListView.builder(
                          itemCount: _articles.length,
                          itemBuilder: (context, index) {
                            final article = _articles[index];
                            return Card(
                              margin: const EdgeInsets.all(8.0),
                              child: ListTile(
                                title: Text(article['title']),
                                subtitle: Text(article['content']),
                                leading: article['image'] != null
                                    ? Image.memory(
                                        base64Decode(
                                            article['image'].split(',')[1]),
                                        width: 50,
                                        height: 50,
                                        fit: BoxFit.cover,
                                      )
                                    : const Icon(Icons.article),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.edit,
                                          color: Colors.blue),
                                      onPressed: () => _openEditDialog(article),
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.delete,
                                          color: Colors.red),
                                      onPressed: () =>
                                          _deleteArticle(article['_id']),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
            ),
          ],
        ),
      ),
    );
  }
}
