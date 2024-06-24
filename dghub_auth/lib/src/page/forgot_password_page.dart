import 'package:dghub_auth/dghub_auth.dart';
import 'package:dghub_auth/src/tools/assets_path.dart';
import 'package:dghub_button/dghub_button.dart';
import 'package:dghub_edittext/dghub_edittext.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ForgotPasswordPage extends StatefulWidget {
  final EmailForgotConfig config;
  final AuthLanguageData languageData;
  const ForgotPasswordPage(
      {required this.config, required this.languageData, super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  TextEditingController emailEC = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SafeArea(
        child: Scaffold(
            backgroundColor: theme.cardColor,
            appBar: AppBar(
              backgroundColor: theme.cardColor,
            ),
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
                          widget.languageData.forgotPassword,
                          style: const TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        )),
                    Align(
                        alignment: Alignment.center,
                        child: Text(
                          widget.languageData.pleaseSendEmail,
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
                            label: widget.languageData.email,
                            hint: widget.languageData.emailHint,
                            controller: emailEC)),
                    DGHubButton(
                        key: UniqueKey(),
                        type: DGHubButtonType.circle,
                        config: ButtonConfig(
                            isSuccess: widget.config.isSuccessForgotPassword,
                            isLoading: widget.config.isLoadingForgotPassword,
                            isError: widget.config.isErrorForgotPassword,
                            icon: const Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                              size: 25,
                            ),
                            width: 60,
                            height: 60,
                            onTap: () async {
                              if (widget.config.resultForgotPassword != null) {
                                await widget
                                    .config.resultForgotPassword!(emailEC.text);
                              }
                            })),
                  ],
                ),
              ),
            ))));
  }
}
