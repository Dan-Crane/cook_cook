import 'dart:convert';

import 'package:cook_cook/features/recipe_ingredient/data/models/recipe_ingredient_model.dart';
import 'package:cook_cook/features/recipe_ingredient/domain/entity/recipe_ingredient_entity.dart';
import 'package:cook_cook/features/recipe_step/data/models/recipe_step_model.dart';
import 'package:cook_cook/features/recipe_step/domain/entities/recipe_step_entity.dart';
import 'package:cook_cook/features/recipes/data/models/recipe_model.dart';
import 'package:cook_cook/features/recipes/domain/entities/recipe_entity.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final model = RecipeModel(
    id: 'id',
    uid: 'uid',
    title: 'title',
    description: 'description',
    img: 'img',
    portion: 1,
    time: 10,
    ingridients: [
      RecipeIngredientModel(
        type: RecipeIngrediendType.ingrediend,
        title: 'title',
      )
    ],
    steps: [
      RecipeStepModel(step: 1, img: 'img', title: 'title'),
    ],
  );

  group('RecipeModel.fromJson', () {
    test('shold return model with id from json', () async {
      final model = RecipeModel(
        id: 'id',
        uid: 'uid',
        title: 'title',
        description: 'description',
        img: 'img',
        portion: 1,
        time: 10,
        ingridients: [
          RecipeIngredientModel(
            type: RecipeIngrediendType.ingrediend,
            title: 'title',
          )
        ],
        steps: [
          RecipeStepModel(step: 1, img: 'img', title: 'title'),
        ],
      );

      final Map<String, dynamic> json = jsonDecode(fixture('recipe.json'));

      final result = RecipeModel.fromJson(json, 'id');

      expect(result, model);
    });
  });

  group('RecipeModel.toJson', () {
    test('shold return json without id from model ', () async {
      final Map<String, dynamic> result = model.toJson();
      final expectJson = jsonDecode(fixture('recipe.json'));

      expect(result, expectJson);
    });
  });

  group('RecipeModel.fromEntity', () {
    test('shold return model from entity', () async {
      final entity = RecipeEntity(
        id: 'id',
        uid: 'uid',
        title: 'title',
        description: 'description',
        img: 'img',
        portion: 1,
        time: 10,
        ingridients: [
          RecipeIngredientEntity(
            type: RecipeIngrediendType.ingrediend,
            title: 'title',
          )
        ],
        steps: [
          RecipeStepEntity(step: 1, img: 'img', title: 'title'),
        ],
      );
      final result = RecipeModel.fromEntity(entity);

      expect(result, model);
    });
  });

  group('RecipeModel.toEntity', () {
    test('shold return entity from model', () async {
      final entity = RecipeEntity(
        id: 'id',
        uid: 'uid',
        title: 'title',
        description: 'description',
        img: 'img',
        portion: 1,
        time: 10,
        ingridients: [
          RecipeIngredientEntity(
            type: RecipeIngrediendType.ingrediend,
            title: 'title',
          )
        ],
        steps: [
          RecipeStepEntity(step: 1, img: 'img', title: 'title'),
        ],
      );
      final result = model.toEntity;

      expect(entity, result);
    });
  });
}
