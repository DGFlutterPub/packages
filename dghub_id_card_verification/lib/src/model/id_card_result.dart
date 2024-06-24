import 'dart:io';

class IDCardResult {
  File? frontPhoto;
  File? backPhoto;
  File? kycPhoto;
  String idNumber;
  IDCardResult(
      {required this.backPhoto,
      required this.frontPhoto,
      required this.idNumber,
      required this.kycPhoto});
}
