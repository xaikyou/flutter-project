// ignore_for_file: constant_identifier_names

enum CmdCode {
  LOGIN_OK,
  DATA_READY,
  ERR01,
  ERR02,
  ERR03,
  ERR04,
  ERR05,
  ERR06,
  ERR99,
}

const String _ERR01 = "ERROR 01";
const String _ERR02 = "ERROR 02";
const String _ERR03 = "ERROR 03";
const String _ERR04 = "ERROR 04";
const String _ERR05 = "ERROR 05";
const String _ERR06 = "ERROR 06";
const String _ERR99 = "ERROR 99";
const String _LOGIN_OK = "LOGIN OK";
const String _DATA_READY = "DATA READY";

extension CmdCodeExt on CmdCode {
  /// To value
  String toRawValue() {
    switch (this) {
      case CmdCode.LOGIN_OK:
        return _LOGIN_OK;
      case CmdCode.DATA_READY:
        return _DATA_READY;
      case CmdCode.ERR01:
        return _ERR01;
      case CmdCode.ERR02:
        return _ERR02;
      case CmdCode.ERR03:
        return _ERR03;
      case CmdCode.ERR04:
        return _ERR04;
      case CmdCode.ERR05:
        return _ERR05;
      case CmdCode.ERR06:
        return _ERR06;
      case CmdCode.ERR99:
        return _ERR99;
      default:
        return _ERR99;
    }
  }

  /// Parser Order State
  static CmdCode parseOrderState({required String rawValue}) {
    switch (rawValue) {
      case _LOGIN_OK:
        return CmdCode.LOGIN_OK;
      case _DATA_READY:
        return CmdCode.DATA_READY;
      case _ERR01:
        return CmdCode.ERR01;
      case _ERR02:
        return CmdCode.ERR02;
      case _ERR03:
        return CmdCode.ERR03;
      case _ERR04:
        return CmdCode.ERR04;
      case _ERR05:
        return CmdCode.ERR05;
      case _ERR06:
        return CmdCode.ERR06;
      case _ERR99:
        return CmdCode.ERR99;
      default:
        return CmdCode.ERR99;
    }
  }
}
