import 'dart:convert';

import 'package:cook_cook/features/recipe_step/data/models/recipe_step_model.dart';
import 'package:cook_cook/features/recipe_step/domain/entities/recipe_step_entity.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final model = RecipeStepModel(step: 1, img: 'img', title: 'title');

  test('should be subclass of RecipeStepEntity', () {
    expect(model, isA<RecipeStepEntity>());
  });

  group('RecipeStepModel.fromJson', () {
    test('shold return model from json', () async {
      final Map<String, dynamic> json = jsonDecode(fixture('recipe_step.json'));

      final result = RecipeStepModel.fromJson(json);

      expect(result, model);
    });
  });

  group('RecipeStepModel.toJson', () {
    test('shold return json from model', () async {
      final Map<String, dynamic> result = model.toJson();
      final expectJson = jsonDecode(fixture('recipe_step.json'));

      expect(result, expectJson);
    });
  });

  group('RecipeStepModel.fromEntity', () {
    test('shold return model from entity', () async {
      final entity = RecipeStepEntity(step: 1, img: 'img', title: 'title');
      final result = RecipeStepModel.fromEntity(entity);

      expect(result, model);
    });
  });

  group('RecipeStepModel.toEntity', () {
    test('shold return entity from model', () async {
      final entity = RecipeStepEntity(step: 1, img: 'img', title: 'title');
      final result = model.toEntity;

      expect(entity, result);
    });
  });
}
