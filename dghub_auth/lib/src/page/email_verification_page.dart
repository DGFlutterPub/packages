import 'package:dghub_auth/dghub_auth.dart';
import 'package:dghub_auth/src/tools/assets_path.dart';
import 'package:dghub_button/dghub_button.dart';
import 'package:dghub_edittext/dghub_edittext.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class EmailVerificationPage extends StatefulWidget {
  final EmailVerificationConfig config;
  final AuthLanguageData languageData;
  const EmailVerificationPage(
      {required this.config, required this.languageData, super.key});

  @override
  State<EmailVerificationPage> createState() => _EmailVerificationPageState();
}

class _EmailVerificationPageState extends State<EmailVerificationPage> {
  TextEditingController codeEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SafeArea(
        child: Scaffold(
            backgroundColor: theme.cardColor,
            appBar: AppBar(),
            body: SafeArea(
                child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(30),
                physics: const BouncingScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ColorFiltered(
                        colorFilter: ColorFilter.mode(
                          theme.primaryColor,
                          BlendMode.modulate,
                        ),
                        child: LottieBuilder.asset(
                          AssetsPath.forgotLottie,
                          // height: 200,
                        )),
                    Align(
                        alignment: Alignment.center,
                        child: Text(
                          widget.languageData.emailVerification,
                          style: const TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        )),
                    Align(
                        alignment: Alignment.center,
                        child: Text(
                          widget.languageData.pleaseCheckYourEmailInbox,
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          textAlign: TextAlign.center,
                        )),
                    const SizedBox(height: 20),
                    DGHubEditText(
                        config: EditTextConfig(
                            margin: const EdgeInsets.only(bottom: 20),
                            label: widget.languageData.code,
                            hint: widget.languageData.codeHint,
                            controller: codeEC)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                            onTap: widget.config.isLoadingResendCode
                                ? null
                                : () {
                                    if (widget.config.onTapResendCode != null) {
                                      widget.config.onTapResendCode!();
                                    }
                                  },
                            child: Text(
                              widget.config.isLoadingResendCode
                                  ? widget.languageData.sending
                                  : widget.languageData.resendCode,
                              style: TextStyle(
                                  fontSize: 12, color: theme.primaryColor),
                            )),
                        DGHubButton(
                            type: DGHubButtonType.circle,
                            config: ButtonConfig(
                                isSuccess: widget.config.isSuccessVerification,
                                isLoading: widget.config.isLoadingVerification,
                                isError: widget.config.isErrorVerification,
                                icon: const Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                  size: 25,
                                ),
                                width: 60,
                                height: 60,
                                onTap: () async {
                                  if (widget.config.resultVerification !=
                                      null) {
                                    await widget.config
                                        .resultVerification!(codeEC.text);
                                  }
                                })),
                      ],
                    ),
                  ],
                ),
              ),
            ))));
  }
}
