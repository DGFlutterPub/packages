class EmailForgotConfig {
  bool isLoadingForgotPassword;
  bool isSuccessForgotPassword;
  bool isErrorForgotPassword;
  Function(String email)? resultForgotPassword;
  EmailForgotConfig({
    this.resultForgotPassword,
    this.isErrorForgotPassword = false,
    this.isLoadingForgotPassword = false,
    this.isSuccessForgotPassword = false,
  });
}
