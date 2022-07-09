import 'package:json_annotation/json_annotation.dart';

part 'indonesian_hero.g.dart';

@JsonSerializable()
class IndonesianHero {
  @JsonKey(name: "name")
  late final String name;

  @JsonKey(name: "birth_year")
  late final dynamic birthYear;

  @JsonKey(name: "death_year")
  late final int deathYear;

  @JsonKey(name: "description")
  late final String description;

  @JsonKey(name: "ascension_year")
  late final int ascensionYear;

  IndonesianHero(this.name, this.birthYear, this.deathYear, this.description,
      this.ascensionYear);

  factory IndonesianHero.fromJson(Map<String, dynamic> json) {
    return _$IndonesianHeroFromJson(json);
  }

  Map<String, dynamic> toJson() => _$IndonesianHeroToJson(this);
}
