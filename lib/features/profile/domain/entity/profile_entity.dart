import 'package:equatable/equatable.dart';

class ProfileEntity extends Equatable {
  final String id;
  final String? email;
  final String? phoneNumber;

  final String? name;
  final String? avatarURL;

  final bool isAdmin;

  const ProfileEntity({
    required this.id,
    this.email,
    this.phoneNumber,
    this.name,
    this.avatarURL,
    this.isAdmin = false,
  });

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
        id,
        email,
        phoneNumber,
        name,
        avatarURL,
        isAdmin,
      ];
}
