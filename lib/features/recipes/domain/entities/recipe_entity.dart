import 'package:cook_cook/features/recipe_ingredient/domain/entity/recipe_ingredient_entity.dart';
import 'package:cook_cook/features/recipe_step/domain/entities/recipe_step_entity.dart';
import 'package:equatable/equatable.dart';

class RecipeEntity extends Equatable {
  final String? id;
  final String uid;
  final String title;
  final String description;
  final String img;
  final int portion;
  final int time;
  final List<RecipeIngredientEntity> ingridients;
  final List<RecipeStepEntity> steps;

  const RecipeEntity({
    this.id,
    required this.uid,
    required this.title,
    required this.description,
    required this.img,
    required this.portion,
    required this.time,
    required this.ingridients,
    required this.steps,
  });

  @override
  List<Object> get props {
    final id = this.id;

    return [
      if (id != null) id,
      uid,
      title,
      description,
      img,
      portion,
      time,
      ingridients,
      steps,
    ];
  }
}
