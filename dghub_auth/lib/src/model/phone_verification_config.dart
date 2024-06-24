
class PhoneVerificationConfig {
  bool isLoadingResendCode;
  bool isSuccessResendCode;
  bool isErrorResendCode;

  bool isLoadingVerification;
  bool isSuccessVerification;
  bool isErrorVerification;

  Function(String email)? onTapResendCode;
  Function(String code)? resultVerification;
  PhoneVerificationConfig({
    this.isErrorResendCode = false,
    this.isLoadingResendCode = false,
    this.isSuccessResendCode = false,
    this.resultVerification,
    this.isErrorVerification = false,
    this.isLoadingVerification = false,
    this.isSuccessVerification = false,
    this.onTapResendCode,
  });
}
