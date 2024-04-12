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

  @override
  String toString() {
    return '''
peoplePay: ${peoplePay},
peopleNotPay: ${peopleNotPay}
    ''';
  }
}
