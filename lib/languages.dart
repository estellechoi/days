import 'package:get/get.dart';

enum TranslationKey<String> {
  greeting
}

// how to restrict the type of the key?
class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'ko_KR': {
      TranslationKey.greeting.toString(): '안녕하세요',
    },
    'ja_JP': {
      TranslationKey.greeting.toString(): 'こんにちは',
    },
    'en_US': {
      TranslationKey.greeting.toString(): 'Hello',
    },
  };
}