// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bottombar_style.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BottomBarStyle _$BottomBarStyleFromJson(Map<String, dynamic> json) =>
    BottomBarStyle(
      enabledBottomLine: json['enabledBottomLine'] as bool? ?? false,
      enabledProfile: json['enabledProfile'] as bool? ?? true,
      backgroundColor: json['backgroundColor'] as String? ?? '0xffe9edf6',
      backgroundColorDarkTheme:
          json['backgroundColorDarkTheme'] as String? ?? '0xff1f1f1f',
      cardColor: json['cardColor'] as String? ?? '0xffffffff',
      cardColorDarkTheme: json['cardColorDarkTheme'] as String? ?? '0xff292a2c',
      height: (json['height'] as num?)?.toDouble() ?? 55,
      logoUrl: json['logoUrl'] as String? ?? '',
      type: json['type'] as String? ?? 'defaultDesign',
      floating: json['floating'] as bool? ?? false,
      forceElevated: json['forceElevated'] as bool? ?? false,
      pinned: json['pinned'] as bool? ?? false,
      primary: json['primary'] as bool? ?? false,
      snap: json['snap'] as bool? ?? false,
      stretch: json['stretch'] as bool? ?? false,
      unSelectedIconColor:
          json['unSelectedIconColor'] as String? ?? '0xff000000',
      unSelectedIconColorDarkTheme:
          json['unSelectedIconColorDarkTheme'] as String? ?? '0xffffffff',
      selectedIconColor: json['selectedIconColor'] as String? ?? '0xffc04000',
      selectedIconColorDarkTheme:
          json['selectedIconColorDarkTheme'] as String? ?? '0xffc04000',
      unSelectedLabelColor:
          json['unSelectedLabelColor'] as String? ?? '0xff000000',
      unSelectedLabelColorDarkTheme:
          json['unSelectedLabelColorDarkTheme'] as String? ?? '0xffffffff',
      selectedLabelColor: json['selectedLabelColor'] as String? ?? '0xff000000',
      selectedLabelColorDarkTheme:
          json['selectedLabelColorDarkTheme'] as String? ?? '0xffffffff',
    );

Map<String, dynamic> _$BottomBarStyleToJson(BottomBarStyle instance) =>
    <String, dynamic>{
      'selectedIconColor': instance.selectedIconColor,
      'selectedIconColorDarkTheme': instance.selectedIconColorDarkTheme,
      'unSelectedIconColor': instance.unSelectedIconColor,
      'unSelectedIconColorDarkTheme': instance.unSelectedIconColorDarkTheme,
      'selectedLabelColor': instance.selectedLabelColor,
      'selectedLabelColorDarkTheme': instance.selectedLabelColorDarkTheme,
      'unSelectedLabelColor': instance.unSelectedLabelColor,
      'unSelectedLabelColorDarkTheme': instance.unSelectedLabelColorDarkTheme,
      'enabledBottomLine': instance.enabledBottomLine,
      'enabledProfile': instance.enabledProfile,
      'logoUrl': instance.logoUrl,
      'backgroundColor': instance.backgroundColor,
      'cardColor': instance.cardColor,
      'backgroundColorDarkTheme': instance.backgroundColorDarkTheme,
      'cardColorDarkTheme': instance.cardColorDarkTheme,
      'height': instance.height,
      'type': instance.type,
      'forceElevated': instance.forceElevated,
      'primary': instance.primary,
      'floating': instance.floating,
      'pinned': instance.pinned,
      'snap': instance.snap,
      'stretch': instance.stretch,
    };
