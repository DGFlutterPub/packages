import 'package:dghub_edittext/src/model/edittext_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DefaultEditText extends StatefulWidget {
  final EditTextConfig config;
  const DefaultEditText({required this.config, super.key});

  @override
  State<DefaultEditText> createState() => _DefaultEditTextState();
}

class _DefaultEditTextState extends State<DefaultEditText> {
  late bool isPasswordModeChanger;

  @override
  void initState() {
    isPasswordModeChanger = widget.config.isPasswordMode;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: widget.config.margin,
      child: InkWell(
        onTap: widget.config.onTap,
        child: TextField(
          obscureText: isPasswordModeChanger,
          enabled: widget.config.enabled,
          maxLength: widget.config.maxLength,
          keyboardType: widget.config.isDoubleMode
              ? const TextInputType.numberWithOptions(decimal: true)
              : widget.config.textInputType,
          inputFormatters: [
            if (widget.config.isDoubleMode)
              FilteringTextInputFormatter.allow(RegExp(r'^(\d+)?\.?\d{0,2}')),
            if (widget.config.isDigitMode)
              FilteringTextInputFormatter.digitsOnly,
            if (widget.config.isPhoneMode)
              FilteringTextInputFormatter.allow(RegExp('[0-9]')),
            if (widget.config.isPhoneMode)
              FilteringTextInputFormatter.deny(RegExp(r'^0+'))
          ],

          maxLines: widget.config.maxLine ?? 1,
          obscuringCharacter: "*",
          controller: widget.config.controller,
          style: const TextStyle(fontSize: 12),
          // obscureText: true,
          decoration: InputDecoration(
              prefixIconConstraints: const BoxConstraints(),
              prefixStyle: const TextStyle(
                fontSize: 12,
              ),
              contentPadding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
              prefix: widget.config.countryCode == null
                  ? null
                  : Wrap(
                      direction: Axis.vertical,
                      children: [
                        Container(
                            margin: const EdgeInsets.only(right: 5),
                            child: Row(
                              children: [
                                Text(widget.config.countryCode!),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Text(
                                  '|',
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            )),
                      ],
                    ),
              errorStyle: TextStyle(
                color: Colors.red[400],
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: theme.primaryColor, width: 1.2),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1.2, color: Colors.grey.shade400),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1.2, color: Colors.grey.shade400),
              ),
              border: OutlineInputBorder(
                  borderSide:
                      BorderSide(width: 1.2, color: Colors.grey.shade400)),
              prefixIcon: widget.config.leftWidget,
              suffixIcon: widget.config.isPasswordMode
                  ? GestureDetector(
                      onTap: widget.config.isPasswordMode
                          ? () => setState(() {
                                isPasswordModeChanger = !isPasswordModeChanger;
                              })
                          : null,
                      child: Container(
                          padding: const EdgeInsets.only(left: 5),
                          child: isPasswordModeChanger
                              ? const Icon(Icons.visibility,
                                  color: Colors.grey, size: 15)
                              : const Icon(Icons.visibility_off,
                                  color: Colors.grey, size: 15)))
                  : widget.config.rightWidget,
              labelText: widget.config.label ?? widget.config.hint,
              floatingLabelStyle: TextStyle(color: theme.primaryColor),
              labelStyle: const TextStyle(fontSize: 12, color: Colors.grey),
              hintStyle: const TextStyle(fontSize: 12.0, color: Colors.grey),
              hintText: widget.config.hint),
        ),
      ),
    );
  }
}
