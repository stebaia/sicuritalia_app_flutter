// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bottom_bar_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BottomBarStore on BottomBarBase, Store {
  late final _$selectedIndexAtom =
      Atom(name: 'BottomBarBase.selectedIndex', context: context);

  @override
  int get selectedIndex {
    _$selectedIndexAtom.reportRead();
    return super.selectedIndex;
  }

  @override
  set selectedIndex(int value) {
    _$selectedIndexAtom.reportWrite(value, super.selectedIndex, () {
      super.selectedIndex = value;
    });
  }

  late final _$BottomBarBaseActionController =
      ActionController(name: 'BottomBarBase', context: context);

  @override
  void change(int index) {
    final _$actionInfo = _$BottomBarBaseActionController.startAction(
        name: 'BottomBarBase.change');
    try {
      return super.change(index);
    } finally {
      _$BottomBarBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedIndex: ${selectedIndex}
    ''';
  }
}
