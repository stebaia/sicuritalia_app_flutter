import 'package:mobx/mobx.dart';

part 'bottom_bar_store.g.dart';

class BottomBarStore = BottomBarBase with _$BottomBarStore;

abstract class BottomBarBase with Store {
  @observable
  int selectedIndex = 0;

  @action
  void change(int index) {
    selectedIndex = index;
  }
}