import 'package:cook_cook/features/recipe_ingredient/data/models/recipe_ingredient_model.dart';
import 'package:cook_cook/features/recipe_ingredient/domain/entity/recipe_ingredient_entity.dart';
import 'package:cook_cook/features/recipe_step/data/models/recipe_step_model.dart';
import 'package:cook_cook/features/recipe_step/domain/entities/recipe_step_entity.dart';
import 'package:cook_cook/features/recipes/domain/entities/recipe_entity.dart';
import 'package:equatable/equatable.dart';

class RecipeModel extends Equatable {
  final String? id;
  final String uid;
  final String title;
  final String description;
  final String img;
  final int portion;
  final int time;
  final List<RecipeIngredientModel> ingridients;
  final List<RecipeStepModel> steps;

  const RecipeModel({
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

  factory RecipeModel.fromJson(Map<String, dynamic> json, String id) {
    return RecipeModel(
      id: id,
      uid: json['uid'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      img: json['img'] as String,
      portion: json['portion'] as int,
      time: json['time'] as int,
      ingridients: (json['ingridients'] as List<dynamic>)
          .map((e) => RecipeIngredientModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      steps: (json['steps'] as List<dynamic>)
          .map((e) => RecipeStepModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'title': title,
      'description': description,
      'img': img,
      'portion': portion,
      'time': time,
      'ingridients': List<dynamic>.from(ingridients.map((e) => e.toJson())),
      'steps': List<dynamic>.from(steps.map((e) => e.toJson())),
    };
  }

  factory RecipeModel.fromEntity(RecipeEntity entity) {
    return RecipeModel(
      id: entity.id,
      uid: entity.uid,
      title: entity.title,
      description: entity.description,
      img: entity.img,
      portion: entity.portion,
      time: entity.time,
      ingridients: List<RecipeIngredientModel>.from(
        entity.ingridients.map((e) => RecipeIngredientModel.fromEntity(e)),
      ),
      steps: List<RecipeStepModel>.from(
        entity.steps.map((e) => RecipeStepModel.fromEntity(e)),
      ),
    );
  }

  @override
  List<Object?> get props =>
      [id, uid, title, description, img, portion, time, ingridients, steps];
}

extension RecipeModelX on RecipeModel {
  RecipeEntity get toEntity {
    return RecipeEntity(
      id: id,
      uid: uid,
      title: title,
      description: description,
      img: img,
      portion: portion,
      time: time,
      ingridients: List<RecipeIngredientEntity>.from(
        ingridients.map((e) => e.toEntity),
      ),
      steps: List<RecipeStepEntity>.from(
        steps.map((e) => e.toEntity),
      ),
    );
  }
}
