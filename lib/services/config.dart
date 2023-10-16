import 'dart:convert';
import 'package:crypto/crypto.dart';

const PUBLIC_KEY = '8e525ce4f676e8432d7f186a2bcd8a08';
const PRIVATE_KEY = '4ee4a6fee1b81814ccc094511f7603ead739366e';

String generateMd5(String input) {
  return md5.convert(utf8.encode(input)).toString();
}