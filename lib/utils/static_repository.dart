import 'package:flutter/material.dart';

class StaticRepository {
  ///////////////////////
  /// Initialization
  ///////////////////////
  static final StaticRepository _staticRepository =
      StaticRepository._internal();

  factory StaticRepository() {
    return _staticRepository;
  }

  StaticRepository._internal();

  ///////////////////////
  /// Properties
  ///////////////////////

  // loginCount of child
  @protected
  bool _isRegister = false;
  bool get isRegister => _isRegister;
  void setRegistered({required bool register}) {
    this._isRegister = register;
  }
}
