import 'package:flutter/cupertino.dart';

class SearchNotifier {
  static ValueNotifier<String> searchValue = ValueNotifier<String>('');

  void newSearchValue({required String newValue}) {
    searchValue.value = newValue;
  }
}
