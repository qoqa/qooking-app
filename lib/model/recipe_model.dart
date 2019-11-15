import 'package:json_annotation/json_annotation.dart';

part 'recipe_model.g.dart';

@JsonSerializable()
class Recipe{

  Recipe(this.id, this.title, this.lead, this.thumbnailUrl);

  final String id;
  final String title;
  final String lead;
  final String thumbnailUrl;

  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);
}