import 'package:dghub_auth/dghub_auth.dart';
import 'package:dghub_button/dghub_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:otp_autofill/otp_autofill.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

import '../tools/assets_path.dart';
import '../tools/tools.dart';

class PhoneVerificationPage extends StatefulWidget {
  final AuthLanguageData languageData;
  final PhoneVerificationConfig config;
  const PhoneVerificationPage({
    required this.languageData,
    required this.config,
    Key? key,
  }) : super(key: key);

  @override
  State<PhoneVerificationPage> createState() => _PhoneVerificationPageState();
}

class _PhoneVerificationPageState extends State<PhoneVerificationPage> {
  final OtpFieldController _controller = OtpFieldController();
  late OTPTextEditController controller;
  late OTPInteractor _otpInteractor;

  @override
  void initState() {
    _otpInteractor = OTPInteractor();
    _otpInteractor
        .getAppSignature()
        //ignore: avoid_print
        .then((value) => print('signature - $value'));
    controller = OTPTextEditController(
      codeLength: 6,
      //ignore: avoid_print
      onCodeReceive: (code) {
        _controller.set(code.split(''));
      },
      otpInteractor: _otpInteractor,
    )..startListenUserConsent(
        (code) {
          final exp = RegExp(r'(\d{6})');
          return exp.stringMatch(code ?? '') ?? '';
        },
      );
    super.initState();
  }

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
            padding: const EdgeInsets.all(40),
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
                      AssetsPath.otpLottie,
                      // height: 200,
                    )),
                Align(
                    alignment: Alignment.center,
                    child: Text(
                      widget.languageData.otpVerification,
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold),
                    )),
                Align(
                    alignment: Alignment.center,
                    child: Text(
                      widget.languageData.checkYourMessage,
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                      textAlign: TextAlign.center,
                    )),
                const SizedBox(height: 30),
                OTPTextField(
                  controller: _controller,
                  length: 6,
                  fieldWidth: 40,
                  width: MediaQuery.of(context).size.width,
                  style: TextStyle(
                      color: Tools.isDarkTheme(context)
                          ? Colors.white
                          : Colors.black,
                      fontSize: 17),
                  textFieldAlignment: MainAxisAlignment.spaceAround,
                  otpFieldStyle: OtpFieldStyle(
                      borderColor: Colors.grey.withOpacity(0.5),
                      enabledBorderColor: Colors.grey.withOpacity(0.5),
                      focusBorderColor: Theme.of(context).primaryColor),
                  fieldStyle: FieldStyle.box,
                  onCompleted: (pin) {
                    if (kDebugMode) {
                      print("Completed: $pin");
                    }
                  },
                ),
                const SizedBox(height: 20),
                DGHubButton(
                    design: DGHubButtonDesigns.circle,
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
                          if (widget.config.resultVerification != null) {
                            await widget
                                .config.resultVerification!(controller.text);
                          }
                        })),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
