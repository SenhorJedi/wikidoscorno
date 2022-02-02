import 'package:flutter/cupertino.dart';

class SearchNotifier {
  static ValueNotifier<String> searchValue = ValueNotifier<String>('');
  static ValueNotifier<int> searchPage = ValueNotifier<int>(1);

  void newSearchValue({required String newValue, required int page}) {
    searchValue.value = newValue;
    searchPage.value = page;
  }
}
