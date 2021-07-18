import 'package:cook_cook/core/usecases/usecase.dart';
import 'package:cook_cook/features/recipes/domain/entities/recipe_entity.dart';
import 'package:cook_cook/features/recipes/domain/repositories/recipes_repository.dart';
import 'package:cook_cook/features/recipes/domain/usecases/get_recipes.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_recipes_test.mocks.dart';

@GenerateMocks([RecipesRepository])
main() {
  late RecipesRepository repository;
  late GetRecipes usecase;

  setUp(() {
    repository = MockRecipesRepository();
    usecase = GetRecipes(repository);
  });

  final tRecipeEntity = RecipeEntity(
    uid: 'uid',
    title: 'title',
    description: 'description',
    img: 'img',
    portion: 1,
    time: 1,
    ingridients: [],
    steps: [],
  );

  test('should get recipe from repositoty', () async {
    when(repository.getRecipes()).thenAnswer(
      (realInvocation) async => Right([tRecipeEntity]),
    );

    final result = await usecase(NoParams());

    expect(result.isRight(), isTrue);
    result.fold(
      (l) {},
      (r) => expect(r, isA<List<RecipeEntity>>()),
    );
    verify(repository.getRecipes());
    verifyNoMoreInteractions(repository);
  });
}
