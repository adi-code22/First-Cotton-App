import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static String userToken = "USERTOKENKEY";
  static String fcmToken = "FCMTOKENKEY";
  static String userNumberKey = "USERNUMBER";
  static String userNameKey = "USERNAME";
  static String userEmailKey = "USEREMAIL";
  static String counterKey = "COUNTERKEY";
  static String userIdKey = "USERIDKEY";

  /// save data
  Future<bool> saveUserToken(String getToken) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(userToken, getToken);
  }

  Future<bool> saveFcmToken(String getToken) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(fcmToken, getToken);
  }

  Future<bool> saveUserNumber(String userNumbers) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(userNumberKey, userNumbers);
  }

  Future<bool> saveUserName(String userNames) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(userNameKey, userNames);
  }
  Future<bool> saveUserId(String userId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(userIdKey, userId);
  }
  Future<bool> saveUserEmail(String userEmail) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(userEmailKey, userEmail);
  }

  Future<bool> saveCounter(int counterNumber) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setInt(counterKey, counterNumber);
  }


  // Future<bool> saveUserName(String getToken) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   return prefs.setString(userName, getToken);
  // }

  /// retrieve data
  Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userToken);
  }

  Future<String?> getFcmToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(fcmToken);
  }

  Future<String?> getUserNumber() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userNumberKey);
  }

  Future<String?> getUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userNameKey);
  }
  Future<String?> getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userIdKey);
  }
  Future<String?> getUserEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userEmailKey);
  }

  Future<int?> getCounterNumber() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(counterKey);
  }


  // Future<String?> getUserName() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   return prefs.getString(userName);
  // }

  ///remove data
  Future<bool> removeToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove(userToken);
  }
}
