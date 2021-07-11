import 'package:equatable/equatable.dart';

enum RecipeIngrediendType { ingrediend, section }

class RecipeIngredientEntity extends Equatable {
  final RecipeIngrediendType type;
  final String title;

  const RecipeIngredientEntity({
    required this.type,
    required this.title,
  });

  @override
  List<Object> get props => [type, title];

  @override
  bool get stringify => true;
}
