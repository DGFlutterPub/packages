import 'package:json_annotation/json_annotation.dart';
part 'dghub_splash_style.g.dart';

@JsonSerializable(includeIfNull: true)
class DGHubSplashStyle {
  String backgroundColor;
  String backgroundColorDarkTheme;
  String cardColor;
  String cardColorDarkTheme;
  String logoColor;
  String logoColorDarkTheme;
  double logoSize;
  String type;
  DGHubSplashStyle(
      {this.logoSize = 100,
      this.backgroundColor = '0xffffffff',
      this.backgroundColorDarkTheme = '0xff000000',
      this.logoColor = '0xff0f0ade',
      this.logoColorDarkTheme = '0xff0f0ade',
      this.cardColor = '0xffffffff',
      this.cardColorDarkTheme = '0xff000000',
      this.type = 'defaultDesign'});
  factory DGHubSplashStyle.fromJson(Map<String, dynamic> json) =>
      _$DGHubSplashStyleFromJson(json);
  Map<String, dynamic> toJson() => _$DGHubSplashStyleToJson(this);
}
