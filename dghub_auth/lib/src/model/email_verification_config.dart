class EmailVerificationConfig {
  bool isLoadingResendCode;
  bool isSuccessResendCode;
  bool isErrorResendCode;
  bool isLoadingVerification;
  bool isSuccessVerification;
  bool isErrorVerification;
  Function()? onTapResendCode;
  Function(String code)? resultVerification;
  EmailVerificationConfig({
    this.isErrorResendCode = false,
    this.isLoadingResendCode = false,
    this.isSuccessResendCode = false,
    this.resultVerification,
    this.isErrorVerification = false,
    this.isLoadingVerification = false,
    this.isSuccessVerification = false,
  });
}
