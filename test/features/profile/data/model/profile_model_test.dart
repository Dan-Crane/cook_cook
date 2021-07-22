import 'dart:convert';

import 'package:cook_cook/features/profile/data/model/profile_model.dart';
import 'package:cook_cook/features/profile/domain/entity/profile_entity.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';

main() {
  final model = ProfileModel(
    id: 'id',
    name: 'name',
    email: 'email',
    avatarURL: 'avatarURL',
    phoneNumber: 'phoneNumber',
    isAdmin: false,
  );

  test('should be subclass of ProfileEntity', () {
    expect(model, isA<ProfileEntity>());
  });

  group('ProfileModel.fromJson', () {
    test('shold return model from json', () async {
      final Map<String, dynamic> json = jsonDecode(fixture('profile.json'));

      final result = ProfileModel.fromJson(json);

      expect(result, model);
    });
  });

  group('ProfileModel.toJson', () {
    test('shold return json from model', () async {
      final Map<String, dynamic> result = model.toJson();
      final expectJson = jsonDecode(fixture('profile.json'));

      expect(result, expectJson);
    });
  });

  group('ProfileModel.fromEntity', () {
    test('shold return model from entity', () async {
      final entity = ProfileEntity(
        id: 'id',
        name: 'name',
        email: 'email',
        avatarURL: 'avatarURL',
        phoneNumber: 'phoneNumber',
        isAdmin: false,
      );
      final result = ProfileModel.fromEntity(entity);

      expect(result, model);
    });
  });

  group('ProfileModel.toEntity', () {
    test('shold return entity from model', () async {
      final entity = ProfileEntity(
        id: 'id',
        name: 'name',
        email: 'email',
        avatarURL: 'avatarURL',
        phoneNumber: 'phoneNumber',
        isAdmin: false,
      );
      final result = model.toEntity();

      expect(entity, result);
    });
  });
}
