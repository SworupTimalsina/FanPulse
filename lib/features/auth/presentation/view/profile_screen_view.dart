import 'dart:io';

import 'package:fanpulse/features/auth/domain/entity/auth_entity.dart';
import 'package:fanpulse/features/auth/presentation/viewmodel/profile/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _key = GlobalKey<FormState>();
  final TextEditingController _NameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  File? _img;
  Future _browseImage(ImageSource imagesource) async {
    try {
      final image = await ImagePicker().pickImage(source: imagesource);
      if (image != null) {
        setState(() {
          _img = File(image.path);
        });
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    context.read<ProfileBloc>().loadClient();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Profile', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.user == null) {
            return const Center(
                child: Text("No users available",
                    style: TextStyle(color: Colors.black)));
          } else {
            final user = state.user!;
            _NameController.text = user.name;
            _emailController.text = user.email;
            _phoneController.text = user.phone;
            _usernameController.text = user.username;

            final String? imageUrl = user.image;
            final String baseUrl = Platform.isIOS
                ? "http://127.0.0.1:3000"
                : "http://10.0.2.2:3000";
            final String fullImageUrl = imageUrl != null && imageUrl.isNotEmpty
                ? "$baseUrl/uploads/$imageUrl"
                : '';

            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _key,
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            backgroundColor: Colors.white,
                            context: context,
                            isScrollControlled: true,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(20),
                              ),
                            ),
                            builder: (context) => Padding(
                              padding: const EdgeInsets.all(20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  ElevatedButton.icon(
                                    onPressed: () {
                                      _browseImage(ImageSource.camera);
                                      Navigator.pop(context);
                                    },
                                    icon: const Icon(Icons.camera,
                                        color: Colors.black),
                                    label: const Text('Camera',
                                        style: TextStyle(color: Colors.black)),
                                    style: ElevatedButton.styleFrom(
                                      foregroundColor: Colors.white,
                                      backgroundColor: Colors.black,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 20),
                                      elevation: 5,
                                    ),
                                  ),
                                  ElevatedButton.icon(
                                    onPressed: () {
                                      _browseImage(ImageSource.gallery);
                                      Navigator.pop(context);
                                    },
                                    icon: const Icon(Icons.image,
                                        color: Colors.black),
                                    label: const Text('Gallery',
                                        style: TextStyle(color: Colors.black)),
                                    style: ElevatedButton.styleFrom(
                                      foregroundColor: Colors.white,
                                      backgroundColor: Colors.black,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 20),
                                      elevation: 5,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage: _img != null
                              ? FileImage(_img!)
                              : (fullImageUrl.isNotEmpty
                                      ? NetworkImage(fullImageUrl)
                                      : const AssetImage(
                                          'assets/images/profile.png'))
                                  as ImageProvider,
                        ),
                      ),
                      const SizedBox(height: 16),
                      _buildTextField("Name", _NameController),
                      _buildTextField("Email", _emailController),
                      _buildTextField("Phone", _phoneController),
                      _buildTextField("username", _usernameController),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          final updatedUser = AuthEntity(
                            name: _NameController.text,
                            phone: _phoneController.text,
                            email: _emailController.text,
                            username: _usernameController.text,
                            image: _img?.path,
                          );

                          // Trigger the update event in the ProfileBloc
                          context
                              .read<ProfileBloc>()
                              .add(UpdateUserEvent(user: updatedUser));
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 20),
                          elevation: 5,
                        ),
                        child: const Text("Update",
                            style: TextStyle(color: Colors.white)),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        controller: controller,
        readOnly: false,
        decoration: InputDecoration(
          labelText: label,
          labelStyle:
              const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.black),
          ),
          filled: true,
          fillColor: Colors.grey[200],
          hintStyle: const TextStyle(color: Colors.black),
        ),
        style: const TextStyle(color: Colors.black),
      ),
    );
  }
}
