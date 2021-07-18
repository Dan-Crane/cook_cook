import 'package:cook_cook/core/errors/failures.dart';
import 'package:cook_cook/features/recipes/domain/entities/recipe_entity.dart';
import 'package:dartz/dartz.dart';

abstract class RecipesRepository {
  Future<Either<Failure, List<RecipeEntity>>> getRecipes();
  Future<Either<Failure, void>> addRecipe(RecipeEntity recipe);
}
