// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Recipe _$RecipeFromJson(Map<String, dynamic> json) {
  return Recipe(
    json['id'] as String,
    json['title'] as String,
    json['lead'] as String,
    json['thumbnailUrl'] as String,
  );
}

Map<String, dynamic> _$RecipeToJson(Recipe instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'lead': instance.lead,
      'thumbnailUrl': instance.thumbnailUrl,
    };
