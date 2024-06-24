import 'dart:io';

import 'package:dghub_button/dghub_button.dart';
import 'package:dghub_edittext/dghub_edittext.dart';
import 'package:dghub_id_card_verification/src/camera/id_camera_page.dart';
import 'package:dghub_id_card_verification/src/icon_button/dg_icon_button.dart';
import 'package:dghub_id_card_verification/src/id_back_card.dart';
import 'package:dghub_id_card_verification/src/id_front_card.dart';
import 'package:dghub_id_card_verification/src/id_kyc_card.dart';
import 'package:dghub_id_card_verification/src/model/id_card_result.dart';
import 'package:flutter/material.dart';

class DGHubIDCardVerification extends StatefulWidget {
  final String? frontPhoto;
  final String? backPhoto;
  final String? kycPhoto;
  final String? idNumber;
  final bool isLoading;
  final Function(IDCardResult) result;
  const DGHubIDCardVerification(
      {this.backPhoto,
      this.frontPhoto,
      this.idNumber,
      this.kycPhoto,
      this.isLoading = false,
      required this.result,
      super.key});

  @override
  State<DGHubIDCardVerification> createState() =>
      _DGHubIDCardVerificationState();
}

class _DGHubIDCardVerificationState extends State<DGHubIDCardVerification> {
  File? frontPhotoFile;
  File? backPhotoFile;
  File? kycPhotoFile;
  TextEditingController numberEC = TextEditingController();

  @override
  void initState() {
    if (widget.idNumber != null) {
      numberEC.text = widget.idNumber!;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DGIconButton(
                          icon: Icons.arrow_back,
                          onTap: () {
                            Navigator.pop(context);
                          }),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text('KYC verification center',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                      const SizedBox(
                        height: 20,
                      ),
                      IDFrontCard(
                        photoUrl: widget.frontPhoto,
                        photo: frontPhotoFile,
                        onTap: () async {
                          await Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (c) => IDCameraPage(
                                        enabledIdFrame: true,
                                        result: (p0) {
                                          frontPhotoFile = p0;
                                        },
                                      )));
                          setState(() {});
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      IDBackCard(
                        photoUrl: widget.backPhoto,
                        photo: backPhotoFile,
                        onTap: () async {
                          await Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (c) => IDCameraPage(
                                        enabledIdFrame: true,
                                        result: (p0) {
                                          backPhotoFile = p0;
                                        },
                                      )));
                          setState(() {});
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      IDKycCard(
                        photoUrl: widget.kycPhoto,
                        photo: kycPhotoFile,
                        onTap: () async {
                          await Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (c) => IDCameraPage(
                                        enabledIdFrame: false,
                                        result: (p0) {
                                          kycPhotoFile = p0;
                                        },
                                      )));
                          setState(() {});
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      DGHubEditText(
                        config: EditTextConfig(
                            controller: numberEC,
                            hint: 'Write ID number',
                            label: 'ID Number'),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      DGHubButton(
                        config: ButtonConfig(
                            isLoading: widget.isLoading,
                            color: theme.primaryColor,
                            onTap: () {
                              widget.result(IDCardResult(
                                  backPhoto: backPhotoFile,
                                  frontPhoto: frontPhotoFile,
                                  idNumber: numberEC.text,
                                  kycPhoto: kycPhotoFile));
                            },
                            label: 'Verify now'),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
