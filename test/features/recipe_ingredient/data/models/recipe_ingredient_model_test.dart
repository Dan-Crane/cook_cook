import 'package:flutter_test/flutter_test.dart';
import 'dart:convert';

import 'package:cook_cook/features/recipe_ingredient/data/models/recipe_ingredient_model.dart';
import 'package:cook_cook/features/recipe_ingredient/domain/entity/recipe_ingredient_entity.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final model = RecipeIngredientModel(
    type: RecipeIngrediendType.ingrediend,
    title: 'title',
  );

  test('should be subclass of RecipeIngredientEntity', () {
    expect(model, isA<RecipeIngredientEntity>());
  });

  group('RecipeIngredientModel.fromJson', () {
    test('shold return model from json', () async {
      final Map<String, dynamic> json =
          jsonDecode(fixture('recipe_ingredient.json'));

      final result = RecipeIngredientModel.fromJson(json);

      expect(result, model);
    });
  });

  group('RecipeIngredientModel.toJson', () {
    test('shold return json from model', () async {
      final Map<String, dynamic> result = model.toJson();
      final expectJson = jsonDecode(fixture('recipe_ingredient.json'));

      expect(result, expectJson);
    });
  });

  group('RecipeIngredientModel.fromEntity', () {
    test('shold return model from entity', () async {
      final entity = RecipeIngredientEntity(
        type: RecipeIngrediendType.ingrediend,
        title: 'title',
      );
      final result = RecipeIngredientModel.fromEntity(entity);

      expect(result, model);
    });
  });

  group('RecipeIngredientModel.toEntity', () {
    test('shold return entity from model', () async {
      final entity = RecipeIngredientEntity(
        type: RecipeIngrediendType.ingrediend,
        title: 'title',
      );
      final result = model.toEntity;

      expect(entity, result);
    });
  });
}
