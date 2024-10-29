import 'dart:convert';

import 'package:ble_connection/constants/dl_config_constant.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/foundation.dart';

class FormatDlValue {
  static String getEncodeValue(List<int> value) {
    final encode = String.fromCharCodes(value);

    debugPrint('Encode: $encode');
    return encode;
  }

  static String getReadEncodeValue(List<int> value) {
    final rawList = value.isEmpty
        ? value
        : value.sublist(
            DlConfigConstant.stx.length +
                DlConfigConstant.cmd_code_read_001.length,
            value.length -
                (DlConfigConstant.stx.length + DlConfigConstant.bccLength));

    final encode = String.fromCharCodes(rawList);

    debugPrint('Encode: $encode');
    return encode;
  }

  static Uint8List formatWriteValue(String value) {
    String bcc = bccCheck(value, value.length);
    String writeData = appendToData(value: "$value$bcc");
    debugPrint("Raw write value: $writeData");

    debugPrint("Write value: ${utf8.encode(writeData)}");

    return utf8.encode(writeData);
  }

  static String bccCheck(String bccData, int bccSize) {
    Uint8List uint8List = utf8.encode(bccData);
    int bcc = 0;

    for (int i = 0; i < bccSize; i++) {
      bcc ^= uint8List[i];
    }

    debugPrint("BCC: ${bcc.toRadixString(16).padLeft(2, '0').toUpperCase()}");

    return bcc.toRadixString(16).padLeft(2, '0').toUpperCase();
  }

  static String appendToData({required String value}) {
    return "${DlConfigConstant.stx}$value${DlConfigConstant.etx}";
  }

  static String getHashValue(String input) {
    final byte = utf8.encode(input);
    debugPrint("Hash value: ${sha256.convert(byte).toString().toUpperCase()}");

    return sha256.convert(byte).toString().toUpperCase();
  }

  static String getReadData({required String rawValue}) {
    return '';
  }
}
