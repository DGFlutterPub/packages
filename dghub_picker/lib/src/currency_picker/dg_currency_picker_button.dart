import 'package:currency_picker/currency_picker.dart';
import 'package:dghub_picker/src/tools/tools.dart';
import 'package:flutter/material.dart';

class DGHubCurrencyPickerButton extends StatefulWidget {
  final Currency? input;
  final Function(Currency) result;
  const DGHubCurrencyPickerButton(
      {this.input, required this.result, super.key});

  @override
  State<DGHubCurrencyPickerButton> createState() =>
      _DGHubCurrencyPickerButtonState();
}

class _DGHubCurrencyPickerButtonState extends State<DGHubCurrencyPickerButton> {
  late Currency c;

  @override
  void didChangeDependencies() {
    Currency input = widget.input ??
        CurrencyService()
            .getAll()
            .where((element) => element.code == 'USD')
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
        showCurrencyPicker(
          context: context,
          theme: CurrencyPickerThemeData(
            flagSize: 25,
            titleTextStyle: TextStyle(
                fontSize: 14,
                color:
                    Tools.isDarkTheme(context) ? Colors.white : Colors.black),
            subtitleTextStyle:
                const TextStyle(fontSize: 12, color: Colors.grey),
            currencySignTextStyle:
                const TextStyle(fontSize: 14, color: Colors.grey),
            bottomSheetHeight: MediaQuery.of(context).size.height / 2,
          ),
          showFlag: true,
          showCurrencyName: true,
          showCurrencyCode: true,
          onSelect: (Currency currency) {
            c = currency;
            widget.result(c);
            setState(() {});
          },
        );
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 0.3, color: Colors.grey),
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
                  child: Text(c.symbol,
                      style:
                          const TextStyle(fontSize: 12, color: Colors.white))),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Currency',
                    style: TextStyle(fontSize: 10, color: Colors.grey),
                  ),
                  Text(
                    '${c.name} [${c.code}]',
                    style: const TextStyle(
                      fontSize: 12,
                    ),
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
