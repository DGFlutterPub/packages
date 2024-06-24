import 'package:dghub_auth/src/model/result_guest.dart';
import 'package:flutter/widgets.dart';

class GuestLoginConfig {
  bool isLoading;
  bool isSuccess;
  bool isError;
  Function(ResultGuest data)? result;
  Function()? onTapForgotPassword;
  List<Widget> customWidget;
  GuestLoginConfig(
      {this.isError = false,
      this.isLoading = false,
      this.isSuccess = false,
      this.customWidget = const [],
      this.onTapForgotPassword,
      this.result});
}
