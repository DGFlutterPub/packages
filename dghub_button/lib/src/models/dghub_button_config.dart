import 'package:flutter/widgets.dart';

class ButtonConfig {
  bool isLoading;
  bool isError;
  bool isSuccess;
  String? label;
  String? errorLabel;
  String? successLabel;
  double? width;
  double? height;
  EdgeInsets? margin;
  double radius;
  double? elevation;
  Function() onTap;
  EdgeInsets? padding;
  Color? color;
  double labelSize;
  Widget? icon;
  double iconSize;
  ButtonConfig(
      {this.successLabel,
      this.errorLabel,
      this.labelSize = 12,
      this.color,
      this.elevation,
      this.radius = 100,
      this.margin,
      this.padding = const EdgeInsets.fromLTRB(15, 8, 15, 8),
      this.height,
      this.width,
      this.isError = false,
      this.isLoading = false,
      this.isSuccess = false,
      required this.onTap,
      this.icon,
      this.iconSize = 25,
      this.label});
}
