import 'package:cook_cook/features/recipe_ingredient/domain/entity/recipe_ingredient_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'recipe_ingredient_model.g.dart';

@JsonSerializable()
class RecipeIngredientModel extends RecipeIngredientEntity {
  const RecipeIngredientModel({
    required RecipeIngrediendType type,
    required String title,
  }) : super(type: type, title: title);

  factory RecipeIngredientModel.fromJson(Map<String, dynamic> json) =>
      _$RecipeIngredientModelFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeIngredientModelToJson(this);

  factory RecipeIngredientModel.fromEntity(RecipeIngredientEntity entity) {
    return RecipeIngredientModel(type: entity.type, title: entity.title);
  }
}

extension RecipeIngredientModelX on RecipeIngredientModel {
  RecipeIngredientEntity get toEntity {
    return RecipeIngredientEntity(type: type, title: title);
  }
}
