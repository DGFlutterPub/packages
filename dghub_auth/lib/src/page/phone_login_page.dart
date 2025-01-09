import 'package:dghub_auth/dghub_auth.dart';
import 'package:dghub_button/dghub_button.dart';
import 'package:dghub_edittext/dghub_edittext.dart';
import 'package:dghub_picker/dghub_picker.dart';
import 'package:flutter/material.dart';

class PhoneLoginPage extends StatefulWidget {
  final PhoneLoginConfig config;
  final AuthLanguageData languageData;

  const PhoneLoginPage(
      {required this.config, required this.languageData, super.key});

  @override
  State<PhoneLoginPage> createState() => _PhoneLoginPageState();
}

class _PhoneLoginPageState extends State<PhoneLoginPage> {
  Country? country;
  TextEditingController phoneEC = TextEditingController();
  String phoneCode = '95';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.cardColor,
        appBar: AppBar(
          backgroundColor: theme.cardColor,
        ),
        //  backgroundColor: theme.colorScheme.background,
        body: SafeArea(
          child: Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(30),
              physics: const BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                      alignment: Alignment.center,
                      child: Text(
                        widget.languageData.pleaseSignIn,
                        style: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      )),
                  Align(
                      alignment: Alignment.center,
                      child: Text(
                        widget.languageData.pleaseRegisterOrLoginYourAccount,
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                        textAlign: TextAlign.center,
                      )),
                  const SizedBox(height: 20),
                  DGhubPicker.countryButton(
                      input: country,
                      result: (pc) {
                        phoneCode = pc.phoneCode;
                        country = pc;
                        setState(() {});
                      }),
                  const SizedBox(height: 20),
                  DGHubEditText(
                      config: EditTextConfig(
                          countryCode: '+$phoneCode',
                          isPhoneMode: true,
                          margin: const EdgeInsets.only(bottom: 20),
                          label: widget.languageData.phone,
                          hint: widget.languageData.phoneHint,
                          controller: phoneEC)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      DGHubButton(
                          design: DGHubButtonDesigns.circle,
                          config: ButtonConfig(
                              isSuccess: widget.config.isSuccess,
                              isLoading: widget.config.isLoading,
                              isError: widget.config.isError,
                              icon: const Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                                size: 25,
                              ),
                              width: 60,
                              height: 60,
                              onTap: () async {
                                if (widget.config.result != null) {
                                  await widget.config.result!(ResultPhone(
                                      phone: phoneEC.text,
                                      phoneCode: phoneCode));
                                }
                              })),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
