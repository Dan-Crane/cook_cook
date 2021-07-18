import 'package:equatable/equatable.dart';

class RecipeStepEntity extends Equatable {
  final int step;
  final String img;
  final String title;

  const RecipeStepEntity({
    required this.step,
    required this.img,
    required this.title,
  });

  @override
  List<Object> get props => [step, img, title];
}
