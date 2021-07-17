import 'package:cook_cook/core/errors/failures.dart';
import 'package:cook_cook/features/recipe_ingredient/domain/entity/recipe_ingredient_entity.dart';
import 'package:cook_cook/features/recipe_step/domain/entities/recipe_step_entity.dart';
import 'package:cook_cook/features/recipes/data/datasources/recipes_datasource.dart';
import 'package:cook_cook/features/recipes/data/repositories/recipes_repository_impl.dart';
import 'package:cook_cook/features/recipes/domain/entities/recipe_entity.dart';
import 'package:cook_cook/features/recipes/domain/repositories/recipes_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'recipes_repository_impl.mocks.dart';

@GenerateMocks([RecipesDatasource])
main() {
  late RecipesRepository repo;

  setUp(() {
    repo = RecipesRepositoryImpl(MockRecipesDatasource());
  });

  group('RecipesRepositoryImpl.getRecipes', () {
    setUp(() async {
      when(repo.getRecipes()).thenAnswer((realInvocation) async {
        final entity = RecipeEntity(
          uid: 'uid',
          title: 'title',
          description: 'description',
          img: 'img',
          portion: 1,
          time: 1,
          ingridients: [
            RecipeIngredientEntity(
                type: RecipeIngrediendType.ingrediend, title: 'title')
          ],
          steps: [RecipeStepEntity(step: 1, img: 'img', title: 'title')],
        );

        return Right([entity]);
      });
    });

    test('should be once called', () async {
      await repo.getRecipes();
      verify(repo.getRecipes()).called(1);
    });

    test('should be Right List<RecipeEntity>', () async {
      final result = await repo.getRecipes();

      result.fold(
        (l) {},
        (r) => expect(r, isA<List<RecipeEntity>>()),
      );
    });

    test('should be Left Failure', () async {
      when(repo.getRecipes()).thenAnswer(
        (realInvocation) async => Left(Failure('error')),
      );

      final result = await repo.getRecipes();

      result.fold(
        (l) => expect(l, isA<Failure>()),
        (r) {},
      );
    });
  });

  // TODO tests for RecipesRepositoryImpl.addRecipe
}
