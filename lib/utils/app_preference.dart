import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class AppPreferences {
  //------------------------------------------------------------- Preference Constants ------------------------------------------------------------

  // Constants for Preference-Value's data-type
  static const String PREF_TYPE_BOOL = "boolValue";
  static const String PREF_TYPE_INTEGER = "intValue";
  static const String PREF_TYPE_DOUBLE = "doubleValue";
  static const String PREF_TYPE_STRING = "stringValue";

  // Constants for Preference-Name
  static const String PREF_IS_LOGGED_IN = "IS_LOGGED_IN";
  static const String PREF_FCM_TOKEN = "FCM_TOKEN";
  static const String PREF_LAST_LOGIN_CALL = "LAST_LOGIN_CALL";

  static const String PREF_FULL_NAME = "FULL_NAME";
  static const String PREF_MOBILE_NO = "MOBILE_NO";
  static const String PREF_DOB = "USER_DOB";
  static const String PREF_AGE = "USER_AGE";
  static const String PREF_GENDER = "USER_GENDER";
  static const String PREF_USER_ID = "USER_ID";
  static const String PREF_IS_WELCOMEBACK_SHOWN = "IS_WELCOMEBACK_SHOWN";
  static const String PREF_NOTIFICATION = "NOTIFICATION_ENABLE";

  //-------------------------------------------------------------------- Variables -------------------------------------------------------------------
  // Future variable to check SharedPreference Instance is ready
  // This is actually a hack. As constructor is not allowed to have 'async' we cant 'await' for future value
  // SharedPreference.getInstance() returns Future<SharedPreference> object and we want to assign its value to our private _preference variable
  // In case if we don't 'await' for SharedPreference.getInstance() method, and in mean time if we access preferences using _preference variable we will get
  // NullPointerException for _preference variable, as it isn't yet initialized.
  // We need to 'await' _isPreferenceReady value for only once when preferences are first time requested in application lifecycle because in further
  // future requests, preference instance is already ready as we are using Singleton-Instance.
  late Future _isPreferenceInstanceReady;

  // Private variable for SharedPreferences
  late SharedPreferences _preferences;

  //-------------------------------------------------------------------- Singleton ----------------------------------------------------------------------
  // Final static instance of class initialized by private constructor
  static final AppPreferences _instance = AppPreferences._internal();
  // Factory Constructor
  factory AppPreferences() => _instance;

  /// AppPreference Private Internal Constructor -> AppPreference
  /// @param->_
  /// @usage-> Initialize SharedPreference object and notify when operation is complete to future variable.
  AppPreferences._internal() {
    _isPreferenceInstanceReady = SharedPreferences.getInstance()
        .then((preferences) => _preferences = preferences);
  }

  //------------------------------------------------------- Getter Methods -----------------------------------------------------------
  // GETTER for isPreferenceReady future
  Future get isPreferenceReady => _isPreferenceInstanceReady;

  //--------------------------------------------------- Public Preference Methods -------------------------------------------------------------

  /// Set Logged-In Method -> void
  /// @param -> @required isLoggedIn -> bool
  /// @usage -> Set value of IS_LOGGED_IN in preferences
  void setLoggedIn({required bool isLogin}) => _setPreference(
      prefName: PREF_IS_LOGGED_IN,
      prefValue: isLogin,
      prefType: PREF_TYPE_BOOL);

  /// Get Logged-In Method -> Future<bool>
  /// @param -> _
  /// @usage -> Get value of IS_LOGGED_IN from preferences
  Future<bool> isLoggedIn() async =>
      await _getPreference(prefName: PREF_IS_LOGGED_IN) ??
      false; // Check value for NULL. If NULL provide default value as FALSE.

  /// Set Welcome back Method -> void
  /// @param -> @required welcomeBackShown -> bool
  /// @usage -> Set value of IS_WELCOMEBACK_SHOWN in preferences
  void setWelcomebackShown({required bool welcomeBackShown}) => _setPreference(
      prefName: PREF_IS_WELCOMEBACK_SHOWN,
      prefValue: welcomeBackShown,
      prefType: PREF_TYPE_BOOL);

  /// Get Welcome back Method -> Future<bool>
  /// @param -> _
  /// @usage -> Get value of IS_WELCOMEBACK_SHOWN from preferences
  Future<bool> isWelcomeBackShown() async =>
      await _getPreference(prefName: PREF_IS_WELCOMEBACK_SHOWN) ??
      false; // Check value for NULL. If NULL provide default value as FALSE.

  /// Set NotificationEnabled Method -> void
  /// @param -> @required notificationEnabled -> bool
  /// @usage -> Set value of PREF_NOTIFICATION in preferences
  void setNotificationEnabled({required bool notificationEnabled}) =>
      _setPreference(
          prefName: PREF_NOTIFICATION,
          prefValue: notificationEnabled,
          prefType: PREF_TYPE_BOOL);

  /// Get isNotificationEnabled Method -> Future<bool>
  /// @param -> _
  /// @usage -> Get value of PREF_NOTIFICATION from preferences
  Future<bool> isNotificationEnabled() async =>
      await _getPreference(prefName: PREF_NOTIFICATION) ??
      false; // Check value for NULL. If NULL provide default value as FALSE.

  void saveFullName({required String name}) => _setPreference(
      prefName: PREF_FULL_NAME, prefValue: name, prefType: PREF_TYPE_STRING);

  Future<String> getFullName() async =>
      await _getPreference(prefName: PREF_FULL_NAME) ?? '';

  void saveLastLoginCallTime({required String time}) => _setPreference(
      prefName: PREF_LAST_LOGIN_CALL,
      prefValue: time,
      prefType: PREF_TYPE_STRING);

  Future<String> getLastLoginCallTime() async =>
      await _getPreference(prefName: PREF_LAST_LOGIN_CALL);

  void saveUserId({required String userId}) => _setPreference(
      prefName: PREF_USER_ID, prefValue: userId, prefType: PREF_TYPE_STRING);

  Future<String> getUserId() async =>
      await _getPreference(prefName: PREF_USER_ID);

  void saveDob({required String dob}) => _setPreference(
      prefName: PREF_DOB, prefValue: dob, prefType: PREF_TYPE_STRING);

  Future<String> getDob() async => await _getPreference(prefName: PREF_DOB) ?? '';

  void saveAGE({required String age}) => _setPreference(
      prefName: PREF_AGE, prefValue: age, prefType: PREF_TYPE_STRING);

  Future<String> getAGE() async => await _getPreference(prefName: PREF_AGE) ?? '';

  void saveGender({required String gender}) => _setPreference(
      prefName: PREF_GENDER, prefValue: gender, prefType: PREF_TYPE_STRING);

  Future<String> getGender() async =>
      await _getPreference(prefName: PREF_GENDER) ?? '';

  void setMobileNumber({required String number}) => _setPreference(
      prefName: PREF_MOBILE_NO, prefValue: number, prefType: PREF_TYPE_STRING);

  Future<String> getMobileNumber() async =>
      await _getPreference(prefName: PREF_MOBILE_NO) ?? '';

  void setFcmToken({required String fcmToken}) => _setPreference(
      prefName: PREF_FCM_TOKEN,
      prefValue: fcmToken,
      prefType: PREF_TYPE_STRING);

  Future<String> getFcmToken() async =>
      await _getPreference(prefName: PREF_FCM_TOKEN);

  //--------------------------------------------------- Private Preference Methods ----------------------------------------------------
  /// Set Preference Method -> void
  /// @param -> @required prefName -> String
  ///        -> @required prefValue -> dynamic
  ///        -> @required prefType -> String
  /// @usage -> This is a generalized method to set preferences with required Preference-Name(Key) with Preference-Value(Value) and Preference-Value's data-type.
  void _setPreference(
      {required String prefName,
      required dynamic prefValue,
      required String prefType}) {
    // Make switch for Preference Type i.e. Preference-Value's data-type
    switch (prefType) {
      // prefType is bool
      case PREF_TYPE_BOOL:
        {
          _preferences.setBool(prefName, prefValue);
          break;
        }
      // prefType is int
      case PREF_TYPE_INTEGER:
        {
          _preferences.setInt(prefName, prefValue);
          break;
        }
      // prefType is double
      case PREF_TYPE_DOUBLE:
        {
          _preferences.setDouble(prefName, prefValue);
          break;
        }
      // prefType is String
      case PREF_TYPE_STRING:
        {
          _preferences.setString(prefName, prefValue);
          break;
        }
    }
  }

  /// Get Preference Method -> Future<dynamic>
  /// @param -> @required prefName -> String
  /// @usage -> Returns Preference-Value for given Preference-Name
  Future<dynamic> _getPreference({@required prefName}) async =>
      _preferences.get(prefName);

  /// Clear preferences
  clearAll() async => _preferences.clear();
}
