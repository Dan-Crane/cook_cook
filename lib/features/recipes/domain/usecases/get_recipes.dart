import 'package:cook_cook/core/errors/failures.dart';
import 'package:cook_cook/core/usecases/usecase.dart';
import 'package:cook_cook/features/recipes/domain/entities/recipe_entity.dart';
import 'package:cook_cook/features/recipes/domain/repositories/recipes_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class GetRecipes implements UseCase<List<RecipeEntity>, NoParams> {
  final RecipesRepository repository;

  const GetRecipes(this.repository);

  @override
  Future<Either<Failure, List<RecipeEntity>>> call(NoParams params) async {
    return await repository.getRecipes();
  }
}
