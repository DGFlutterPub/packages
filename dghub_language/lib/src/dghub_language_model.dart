part 'dghub_language_model.g.dart';

class DGHubLanguageModel {
  String id;
  String name;
  String code;
  Map<dynamic , dynamic>? data;

  DGHubLanguageModel({
    required this.id,
    required this.name,
    required this.code,
    this.data,
  });
  factory DGHubLanguageModel.fromJson(Map<dynamic , dynamic> json) =>
      _$DGHubLanguageModelFromJson(json);
  Map<dynamic , dynamic> toJson() => _$DGHubLanguageModelToJson(this);
}
