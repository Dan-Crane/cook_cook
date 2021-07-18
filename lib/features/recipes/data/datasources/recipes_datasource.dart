import 'package:injectable/injectable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cook_cook/core/errors/error_exceprions.dart';
import 'package:cook_cook/features/recipes/data/models/recipe_model.dart';

abstract class RecipesDatasource {
  Future<List<RecipeModel>> getRecipes();
  Future<void> addRecipe(RecipeModel recipe);
}

@LazySingleton(as: RecipesDatasource)
class RecipesDatasourceImpl implements RecipesDatasource {
  static const String _endPoint = 'recipes';

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<List<RecipeModel>> getRecipes() async {
    try {
      final response = await firestore.collection(_endPoint).get();

      return List<RecipeModel>.from(
        response.docs.map((e) => RecipeModel.fromJson(e.data(), e.id)),
      );
    } on FirebaseException catch (e) {
      throw SimpleException(e.toString());
    } catch (e) {
      throw SimpleException(e.toString());
    }
  }

  @override
  Future<void> addRecipe(RecipeModel recipe) async {
    try {
      final collection = firestore.collection(_endPoint);
      collection.add(recipe.toJson());
    } on FirebaseException catch (e) {
      throw SimpleException(e.toString());
    } catch (e) {
      throw SimpleException(e.toString());
    }
  }
}
