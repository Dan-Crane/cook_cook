import 'package:cook_cook/features/profile/domain/entity/profile_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'profile_model.g.dart';

@JsonSerializable()
class ProfileModel extends ProfileEntity {
  const ProfileModel({
    required String id,
    String? email,
    String? name,
    String? avatarURL,
    String? phoneNumber,
    bool isAdmin = false,
  }) : super(
          id: id,
          name: name,
          email: email,
          avatarURL: avatarURL,
          phoneNumber: phoneNumber,
          isAdmin: isAdmin,
        );

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileModelToJson(this);

  factory ProfileModel.fromEntity(ProfileEntity entity) {
    return ProfileModel(
      id: entity.id,
      email: entity.email,
      name: entity.name,
      avatarURL: entity.avatarURL,
      phoneNumber: entity.phoneNumber,
      isAdmin: entity.isAdmin,
    );
  }

  @override
  List<Object?> get props => [id, email, name, avatarURL, phoneNumber, isAdmin];
}

extension ProfileModelX on ProfileModel {
  ProfileEntity toEntity() {
    return ProfileEntity(
      id: id,
      email: email,
      name: name,
      avatarURL: avatarURL,
      phoneNumber: phoneNumber,
      isAdmin: isAdmin,
    );
  }
}
