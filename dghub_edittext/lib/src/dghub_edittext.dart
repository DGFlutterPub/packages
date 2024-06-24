import 'package:dghub_edittext/dghub_edittext.dart';
import 'package:dghub_edittext/src/edittexts/default_edittext.dart';
import 'package:flutter/material.dart';

import 'edittexts/card_edittext.dart';

enum DGHubEditTextDesign { simple, card }

class DGHubEditText extends StatelessWidget {
  final DGHubEditTextDesign design;
  final EditTextConfig config;
  const DGHubEditText(
      {required this.config,
      this.design = DGHubEditTextDesign.simple,
      super.key});

  @override
  Widget build(BuildContext context) {
    return switch (design) {
      DGHubEditTextDesign.card => CardEditText(
          config: config,
        ),
      DGHubEditTextDesign.simple => DefaultEditText(
          config: config,
        )
    };
  }
}
