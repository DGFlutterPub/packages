import 'package:dghub_auth/src/model/result_email.dart';
import 'package:flutter/widgets.dart';

class EmailLoginConfig {
  bool isLoading;
  bool isSuccess;
  bool isError;
  Function(ResultEmail data)? result;
  Function()? onTapForgotPassword;
  List<Widget> customWidget;
  EmailLoginConfig(
      {this.isError = false,
      this.isLoading = false,
      this.isSuccess = false,
      this.customWidget = const [],
      this.onTapForgotPassword,
      this.result});
}
