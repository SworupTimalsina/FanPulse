import 'dart:convert';

import 'package:fanpulse/features/article/presentation/view_model/article_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

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
              author: "67b21e09426a74730bc17c7c",
            ),
          );

      // Clear fields after submitting
      setState(() {
        _titleController.clear();
        _contentController.clear();
        _imageBase64 = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Article')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: 'Title'),
                validator: (value) => value!.isEmpty ? 'Enter a title' : null,
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _contentController,
                decoration: const InputDecoration(labelText: 'Content'),
                maxLines: 4,
                validator: (value) => value!.isEmpty ? 'Enter content' : null,
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: _pickImage,
                child: const Text('Pick Image'),
              ),
              if (_imageBase64 != null)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.memory(base64Decode(_imageBase64!.split(',')[1]),
                      height: 150, width: double.infinity, fit: BoxFit.cover),
                ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitArticle,
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
