import '../dghub_picker.dart';

class DGhubPicker {
  static countryButton(
      {bool showPhoneCode = true,
      Country? input,
      required Function(Country) result}) {
    return DGHubCountryPickerButton(
        showPhoneCode: showPhoneCode, input: input, result: result);
  }
}
