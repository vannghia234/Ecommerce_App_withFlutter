import 'dart:convert';

List<String> encodeListImages(String imagesList) {
  List<String> result = [];
  String encode = jsonEncode(imagesList);
  String str = encode
      .replaceAll('[', '')
      .replaceAll(']', '')
      .replaceAll('"', '')
      .replaceAll('\\', '');
  result = str.split(',');
  return result;
}
