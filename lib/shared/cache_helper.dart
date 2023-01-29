import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences _sharedPreferences;
  static const _language = 'LANGUAGE';
  static const _deviceToken = 'Device_Token';
  static const _userToken = 'USER_TOKEN';
  static const _userId = 'USER_ID';
  static const _userName = 'USER_NAME';
  static const _userImage = 'USER_IMAGE';
  static const _userPhone = 'USER_PHONE';
  static const _numOfNotifications = 'NUM_OF_NOTIFICATION';
  static const _defaultLocation = 'DEFAULT_LOCATION';
  static const _cityName = 'CITY_NAME';
  static const _cityId = 'CITY_ID';

  static init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static setLang(lang) async {
    await _sharedPreferences.setString(_language, lang);
  }

  static String getLang() {
    return _sharedPreferences.getString(_language) ?? '';
  }

  static setDeviceToken(String token) async {
    await _sharedPreferences.setString(_deviceToken, token);
  }

  static String getDeviceToken() {
    return _sharedPreferences.getString(_deviceToken) ?? '';
  }

  static setUserToken(String token) async {
    await _sharedPreferences.setString(_userToken, token);
  }

  static String getUserToken() {
    return _sharedPreferences.getString(_userToken) ?? '';
  }

  static setUserId(int id) async {
    await _sharedPreferences.setInt(_userId, id);
  }

  static int getUserId() {
    return _sharedPreferences.getInt(_userId) ?? 0;
  }

  static setName(String name) async {
    await _sharedPreferences.setString(_userName, name);
  }

  static String getName() {
    return _sharedPreferences.getString(_userName) ?? "";
  }

  static setImage(String image) async {
    await _sharedPreferences.setString(_userImage, image);
  }

  static String getImage() {
    return _sharedPreferences.getString(_userImage) ?? "";
  }

  static setPhone(String phone) async {
    await _sharedPreferences.setString(_userPhone, phone);
  }

  static String getPhone() {
    return _sharedPreferences.getString(_userPhone) ?? "";
  }

  static setCityName(String value) async {
    await _sharedPreferences.setString(_cityName, value);
  }

  static String getCityName() {
    return _sharedPreferences.getString(_cityName) ?? " ";
  }

  static setCityId(String value) async {
    await _sharedPreferences.setString(_cityId, value);
  }

  static String getCityId() {
    return _sharedPreferences.getString(_cityId) ?? " ";
  }

  static setNumOfUnReadNotifications(int number) async {
    await _sharedPreferences.setInt(_numOfNotifications, number);
  }

  static int getNumOfUnReadNotifications() {
    return _sharedPreferences.getInt(_numOfNotifications) ?? 0;
  }

  static setDefaultLocation(String location) async {
    await _sharedPreferences.setString(_defaultLocation, location);
  }

  // static getDefaultLocation() {
  //   String location = _sharedPreferences.getString(_defaultLocation) ??
  //       mapLocales.chooseLocation.tr();
  //   return location != LocaleKeys.chooseLocation.tr() && location.length > 20
  //       ? location.substring(0, 20)
  //       : location;
  // }

  static setDefaultLocationId(int id) async {
    await _sharedPreferences.setInt("DEFAULT_LOCATION_ID", id);
  }

  static int? getDefaultLocationId() {
    return _sharedPreferences.getInt("DEFAULT_LOCATION_ID");
  }

  static setDefaultLocationPrice(double price) async {
    await _sharedPreferences.setDouble("DEFAULT_LOCATION_Price", price);
  }

  static double getDefaultLocationPrice() {
    return _sharedPreferences.getDouble("DEFAULT_LOCATION_Price") ?? 0;
  }

  static setCartNumOfItems(int num) async {
    await _sharedPreferences.setInt("items_num", num);
  }

  static updateCartNumOfItems({bool isAdd = true}) async {
    await _sharedPreferences.setInt("items_num",
        isAdd ? (getCartNumOfItems() + 1) : (getCartNumOfItems() - 1));
  }

  static int getCartNumOfItems() {
    return _sharedPreferences.getInt("items_num") ?? 0;
  }

  static remove() async {
    await _sharedPreferences.clear();
  }

  static removeDefaultLocation() async {
    await _sharedPreferences.remove("DEFAULT_LOCATION_ID");
    await _sharedPreferences.remove("DEFAULT_LOCATION");
  }

  static removeId() async {
    await _sharedPreferences.remove(_userId);
  }

  static removeUserToken() async {
    await _sharedPreferences.remove(_userToken);
  }

  static Future setIfIsVisitor(bool isVisitor) async {
    await _sharedPreferences.setBool("isVisitor", isVisitor);
  }
}
