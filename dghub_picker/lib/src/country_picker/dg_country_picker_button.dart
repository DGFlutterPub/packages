import 'package:country_picker/country_picker.dart';
import 'package:dghub_picker/src/country_picker/dg_country_picker.dart';
import 'package:flutter/material.dart';

class DGHubCountryPickerButton extends StatefulWidget {
  final bool showPhoneCode;
  final Country? input;
  final Function(Country) result;
  const DGHubCountryPickerButton(
      {this.showPhoneCode = false,
      this.input,
      required this.result,
      super.key});

  @override
  State<DGHubCountryPickerButton> createState() =>
      _DGHubCountryPickerButtonState();
}

class _DGHubCountryPickerButtonState extends State<DGHubCountryPickerButton> {
  late Country c;

  @override
  void didChangeDependencies() {
    Country input = widget.input ??
        CountryService()
            .getAll()
            .where((element) => element.phoneCode == '95')
            .first;
    c = input;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.result(input);
    });

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: () {
        countryPicker(
            context: context,
            onResult: (country) {
              c = country;
              widget.result(country);
            });
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 1.2, color: Colors.grey.shade400),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: theme.primaryColor),
              child: Center(
                  child: Text(
                      widget.showPhoneCode ? '+${c.phoneCode}' : c.countryCode,
                      style:
                          const TextStyle(color: Colors.white, fontSize: 12))),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    c.displayName,
                    style: const TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
