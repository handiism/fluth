// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'indonesian_hero.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IndonesianHero _$IndonesianHeroFromJson(Map<String, dynamic> json) =>
    IndonesianHero(
      json['name'] as String,
      json['birth_year'],
      json['death_year'] as int,
      json['description'] as String,
      json['ascension_year'] as int,
    );

Map<String, dynamic> _$IndonesianHeroToJson(IndonesianHero instance) =>
    <String, dynamic>{
      'name': instance.name,
      'birth_year': instance.birthYear,
      'death_year': instance.deathYear,
      'description': instance.description,
      'ascension_year': instance.ascensionYear,
    };
