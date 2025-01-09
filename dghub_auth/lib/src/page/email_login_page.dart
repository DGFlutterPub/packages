import 'package:dghub_auth/src/model/auth_language_data.dart';
import 'package:dghub_auth/src/model/email_login_config.dart';
import 'package:dghub_auth/src/model/result_email.dart';
import 'package:dghub_button/dghub_button.dart';
import 'package:dghub_edittext/dghub_edittext.dart';
import 'package:dghub_tab/dghub_tab.dart';
import 'package:flutter/material.dart';

class EmailLoginPage extends StatefulWidget {
  final EmailLoginConfig config;
  final AuthLanguageData languageData;
  final bool enabledAdminLogin;

  const EmailLoginPage(
      {this.enabledAdminLogin = false,
      required this.languageData,
      required this.config,
      super.key});

  @override
  State<EmailLoginPage> createState() => _EmailLoginPageState();
}

class _EmailLoginPageState extends State<EmailLoginPage> {
  bool isRegister = false;
  TextEditingController emailEC = TextEditingController();
  TextEditingController passwordEC = TextEditingController();
  TextEditingController nameEC = TextEditingController();
  TextEditingController purchaseCodeEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: theme.cardColor,
        ),
        backgroundColor: theme.cardColor,
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
                  if (!widget.enabledAdminLogin)
                    DGHubTab(
                        config: DGHubTabConfig(
                            changed: (index, controller) {
                              if (index == 0) {
                                isRegister = false;
                                setState(() {});
                              } else {
                                isRegister = true;
                                setState(() {});
                              }
                            },
                            tabs: [
                          DGHubTabBarItem(
                              icon: Icons.home,
                              label: widget.languageData.login),
                          DGHubTabBarItem(
                              icon: Icons.home,
                              label: widget.languageData.register),
                        ],
                            bodys: [])),
                  const SizedBox(height: 20),
                  Visibility(
                    visible: !isRegister && widget.enabledAdminLogin,
                    child: DGHubEditText(
                        config: EditTextConfig(
                            isPasswordMode: false,
                            margin: const EdgeInsets.only(bottom: 20),
                            label: widget.languageData.purchaseCode,
                            hint: widget.languageData.purchaseCodeHint,
                            controller: purchaseCodeEC)),
                  ),
                  Visibility(
                    visible: isRegister,
                    child: DGHubEditText(
                        config: EditTextConfig(
                            margin: const EdgeInsets.only(bottom: 20),
                            isPasswordMode: false,
                            label: widget.languageData.name,
                            hint: widget.languageData.nameHint,
                            controller: nameEC)),
                  ),
                  DGHubEditText(
                      config: EditTextConfig(
                          margin: const EdgeInsets.only(bottom: 20),
                          label: widget.languageData.email,
                          hint: widget.languageData.emailHint,
                          isPasswordMode: false,
                          controller: emailEC)),
                  DGHubEditText(
                      config: EditTextConfig(
                          margin: const EdgeInsets.only(bottom: 20),
                          isPasswordMode: true,
                          label: widget.languageData.password,
                          hint: widget.languageData.passwordHint,
                          controller: passwordEC)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                          onTap: widget.config.onTapForgotPassword,
                          child: Text(
                            widget.languageData.forgotPassword,
                            style: TextStyle(
                                fontSize: 12, color: theme.primaryColor),
                          )),
                      ...widget.config.customWidget,
                      DGHubButton(
                          key: UniqueKey(),
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
                                  await widget.config.result!(ResultEmail(
                                      purchaseCode: purchaseCodeEC.text,
                                      name: nameEC.text,
                                      email: emailEC.text,
                                      password: passwordEC.text,
                                      isRegister: isRegister));
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
