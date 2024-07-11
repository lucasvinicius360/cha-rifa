// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashhboardStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DashhboardStore on _DashhboardStore, Store {
  late final _$peoplePayAtom =
      Atom(name: '_DashhboardStore.peoplePay', context: context);

  @override
  int get peoplePay {
    _$peoplePayAtom.reportRead();
    return super.peoplePay;
  }

  @override
  set peoplePay(int value) {
    _$peoplePayAtom.reportWrite(value, super.peoplePay, () {
      super.peoplePay = value;
    });
  }

  late final _$peopleNotPayAtom =
      Atom(name: '_DashhboardStore.peopleNotPay', context: context);

  @override
  int get peopleNotPay {
    _$peopleNotPayAtom.reportRead();
    return super.peopleNotPay;
  }

  @override
  set peopleNotPay(int value) {
    _$peopleNotPayAtom.reportWrite(value, super.peopleNotPay, () {
      super.peopleNotPay = value;
    });
  }

  late final _$unsavedAtom =
      Atom(name: '_DashhboardStore.unsaved', context: context);

  @override
  List<int> get unsaved {
    _$unsavedAtom.reportRead();
    return super.unsaved;
  }

  @override
  set unsaved(List<int> value) {
    _$unsavedAtom.reportWrite(value, super.unsaved, () {
      super.unsaved = value;
    });
  }

  late final _$getTotalPaymentAsyncAction =
      AsyncAction('_DashhboardStore.getTotalPayment', context: context);

  @override
  Future<void> getTotalPayment() {
    return _$getTotalPaymentAsyncAction.run(() => super.getTotalPayment());
  }

  late final _$getTotalNotPaymentAsyncAction =
      AsyncAction('_DashhboardStore.getTotalNotPayment', context: context);

  @override
  Future<void> getTotalNotPayment() {
    return _$getTotalNotPaymentAsyncAction
        .run(() => super.getTotalNotPayment());
  }

  late final _$_DashhboardStoreActionController =
      ActionController(name: '_DashhboardStore', context: context);

  @override
  void addToUnsaved() {
    final _$actionInfo = _$_DashhboardStoreActionController.startAction(
        name: '_DashhboardStore.addToUnsaved');
    try {
      return super.addToUnsaved();
    } finally {
      _$_DashhboardStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  double getTotalPay() {
    final _$actionInfo = _$_DashhboardStoreActionController.startAction(
        name: '_DashhboardStore.getTotalPay');
    try {
      return super.getTotalPay();
    } finally {
      _$_DashhboardStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
peoplePay: ${peoplePay},
peopleNotPay: ${peopleNotPay},
unsaved: ${unsaved}
    ''';
  }
}
