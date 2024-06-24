import 'package:dghub_auth/src/model/result_phone.dart';

class PhoneLoginConfig {
  bool isLoading;
  bool isSuccess;
  bool isError;
  Function(ResultPhone phone)? result;
  PhoneLoginConfig(
      {this.isError = false,
      this.isLoading = false,
      this.isSuccess = false,
      this.result});
}
