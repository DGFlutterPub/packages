// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dghub_splash_style.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DGHubSplashStyle _$DGHubSplashStyleFromJson(Map<String, dynamic> json) =>
    DGHubSplashStyle(
      logoSize: (json['logoSize'] as num?)?.toDouble() ?? 100,
      backgroundColor: json['backgroundColor'] as String? ?? '0xffffffff',
      backgroundColorDarkTheme:
          json['backgroundColorDarkTheme'] as String? ?? '0xff000000',
      logoColor: json['logoColor'] as String? ?? '0xff0f0ade',
      logoColorDarkTheme: json['logoColorDarkTheme'] as String? ?? '0xff0f0ade',
      cardColor: json['cardColor'] as String? ?? '0xffffffff',
      cardColorDarkTheme: json['cardColorDarkTheme'] as String? ?? '0xff000000',
      type: json['type'] as String? ?? 'defaultDesign',
    );

Map<String, dynamic> _$DGHubSplashStyleToJson(DGHubSplashStyle instance) =>
    <String, dynamic>{
      'backgroundColor': instance.backgroundColor,
      'backgroundColorDarkTheme': instance.backgroundColorDarkTheme,
      'cardColor': instance.cardColor,
      'cardColorDarkTheme': instance.cardColorDarkTheme,
      'logoColor': instance.logoColor,
      'logoColorDarkTheme': instance.logoColorDarkTheme,
      'logoSize': instance.logoSize,
      'type': instance.type,
    };
