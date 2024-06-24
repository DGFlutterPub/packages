import 'package:json_annotation/json_annotation.dart';
part 'bottombar_style.g.dart';

@JsonSerializable(includeIfNull: true)
class BottomBarStyle {
  String selectedIconColor;
  String selectedIconColorDarkTheme;
  String unSelectedIconColor;
  String unSelectedIconColorDarkTheme;
  String selectedLabelColor;
  String selectedLabelColorDarkTheme;
  String unSelectedLabelColor;
  String unSelectedLabelColorDarkTheme;
  bool enabledBottomLine;
  bool enabledProfile;
  String logoUrl;
  String backgroundColor;
  String cardColor;
  String backgroundColorDarkTheme;
  String cardColorDarkTheme;
  double height;
  String type;
  bool forceElevated;
  bool primary;
  bool floating;
  bool pinned;
  bool snap;
  bool stretch;
  BottomBarStyle({
    this.enabledBottomLine = false,
    this.enabledProfile = true,
    this.backgroundColor = '0xffe9edf6',
    this.backgroundColorDarkTheme = '0xff1f1f1f',
    this.cardColor = '0xffffffff',
    this.cardColorDarkTheme = '0xff292a2c',
    this.height = 55,
    this.logoUrl = '',
    this.type = 'defaultDesign',
    this.floating = false,
    this.forceElevated = false,
    this.pinned = false,
    this.primary = false,
    this.snap = false,
    this.stretch = false,
    this.unSelectedIconColor = '0xff000000',
    this.unSelectedIconColorDarkTheme = '0xffffffff',
    this.selectedIconColor = '0xffc04000',
    this.selectedIconColorDarkTheme = '0xffc04000',
    this.unSelectedLabelColor = '0xff000000',
    this.unSelectedLabelColorDarkTheme = '0xffffffff',
    this.selectedLabelColor = '0xff000000',
    this.selectedLabelColorDarkTheme = '0xffffffff',
  });

  factory BottomBarStyle.fromJson(Map<String, dynamic> json) =>
      _$BottomBarStyleFromJson(json);
  Map<String, dynamic> toJson() => _$BottomBarStyleToJson(this);
}
