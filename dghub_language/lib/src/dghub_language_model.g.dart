// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dghub_language_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DGHubLanguageModel _$DGHubLanguageModelFromJson(Map<dynamic , dynamic> json) =>
    DGHubLanguageModel(
      id: json['id'] as String,
      data: json['data'] as Map<dynamic , dynamic>?,
      name: json['name'] as String,
      code: json['code'] as String,
    );

Map<dynamic , dynamic> _$DGHubLanguageModelToJson(DGHubLanguageModel instance) =>
    <dynamic , dynamic>{
      'data': instance.data,
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
    };
