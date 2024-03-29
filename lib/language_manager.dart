class LanguageManager {
  static final LanguageManager _instance = LanguageManager._internal();

  factory LanguageManager() {
    return _instance;
  }

  LanguageManager._internal();

  String currentLanguage = 'en';

  void setLanguage(String languageCode) {
    currentLanguage = languageCode;
  }

  String getLanguage() {
    return currentLanguage;
  }
}
