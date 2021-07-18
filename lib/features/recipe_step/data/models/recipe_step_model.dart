import 'package:cook_cook/features/recipe_step/domain/entities/recipe_step_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'recipe_step_model.g.dart';

@JsonSerializable()
class RecipeStepModel extends RecipeStepEntity {
  const RecipeStepModel({
    required int step,
    required String img,
    required String title,
  }) : super(step: step, img: img, title: title);

  factory RecipeStepModel.fromJson(Map<String, dynamic> json) =>
      _$RecipeStepModelFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeStepModelToJson(this);

  factory RecipeStepModel.fromEntity(RecipeStepEntity entity) =>
      RecipeStepModel(step: entity.step, img: entity.img, title: entity.title);
}

extension RecipeStepModelX on RecipeStepModel {
  RecipeStepEntity get toEntity {
    return RecipeStepEntity(step: step, img: img, title: title);
  }
}
