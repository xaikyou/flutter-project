// ignore_for_file: constant_identifier_names

class DlConfigConstant {
  /// Constant
  static const String generalCode = "PCDLv2x@BLEP\$k!";
  static const String serviceId = "53534e01-6868-5043-444c-8dea40a0fd9e";

  /// STX and ETX
  static const String stx = "\x02";
  static const String etx = "\x03";

  /// BCC length
  static const int bccLength = 2;

  /// Command
  static const String cmd_code_read_001 = "001?";
  static const String cmd_tag_read_001 = "1234";
  static const String cmd_code_write_001 = "001=";
  static const String cmd_code_write_002 = "002=";
}
