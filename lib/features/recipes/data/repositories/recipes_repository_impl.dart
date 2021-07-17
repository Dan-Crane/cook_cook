import 'package:cook_cook/core/errors/failures.dart';
import 'package:cook_cook/features/base/data/repositories/repository_handle_exception_mixin.dart';
import 'package:cook_cook/features/recipes/data/datasources/recipes_datasource.dart';
import 'package:cook_cook/features/recipes/data/models/recipe_model.dart';
import 'package:cook_cook/features/recipes/domain/entities/recipe_entity.dart';
import 'package:cook_cook/features/recipes/domain/repositories/recipes_repository.dart';
import 'package:dartz/dartz.dart';

class RecipesRepositoryImpl
    with RepositoryHandleExceptionMixin
    implements RecipesRepository {
  final RecipesDatasource _datasourcesImpl;

  RecipesRepositoryImpl(this._datasourcesImpl);

  Future<Either<Failure, List<RecipeEntity>>> getRecipes() async {
    return handleException(() async {
      final response = await _datasourcesImpl.getRecipes();

      return response.map((e) => e.toEntity).toList();
    }());
  }

  Future<Either<Failure, void>> addRecipe(RecipeEntity recipe) async {
    final model = RecipeModel.fromEntity(recipe);

    return handleException(_datasourcesImpl.addRecipe(model));
  }
}
