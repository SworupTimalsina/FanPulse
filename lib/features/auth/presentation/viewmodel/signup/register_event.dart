part of 'register_bloc.dart';

sealed class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class UploadImage extends RegisterEvent {
  final File file;

  const UploadImage({
    required this.file,
  });
}

class RegisterUser extends RegisterEvent {
  final BuildContext context;
  final String name;
  final String email;
  final String? image;
  final String username;
  final String phone;
  final String password;

  const RegisterUser({
    required this.context,
    required this.name,
    required this.email,
    this.image,
    required this.username,
    required this.phone,
    required this.password,
  });
}
