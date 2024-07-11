// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'addStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AddStore on _AddStore, Store {
  late final _$nameAtom = Atom(name: '_AddStore.name', context: context);

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  late final _$dbNumbersAtom =
      Atom(name: '_AddStore.dbNumbers', context: context);

  @override
  ObservableFuture<List<Map<int, dynamic>>> get dbNumbers {
    _$dbNumbersAtom.reportRead();
    return super.dbNumbers;
  }

  @override
  set dbNumbers(ObservableFuture<List<Map<int, dynamic>>> value) {
    _$dbNumbersAtom.reportWrite(value, super.dbNumbers, () {
      super.dbNumbers = value;
    });
  }

  late final _$unsavedNumbersAtom =
      Atom(name: '_AddStore.unsavedNumbers', context: context);

  @override
  ObservableFuture<List<Map<int, dynamic>>> get unsavedNumbers {
    _$unsavedNumbersAtom.reportRead();
    return super.unsavedNumbers;
  }

  @override
  set unsavedNumbers(ObservableFuture<List<Map<int, dynamic>>> value) {
    _$unsavedNumbersAtom.reportWrite(value, super.unsavedNumbers, () {
      super.unsavedNumbers = value;
    });
  }

  late final _$unsavedAtom = Atom(name: '_AddStore.unsaved', context: context);

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

  late final _$getNumbersAsyncAction =
      AsyncAction('_AddStore.getNumbers', context: context);

  @override
  Future<void> getNumbers() {
    return _$getNumbersAsyncAction.run(() => super.getNumbers());
  }

  @override
  String toString() {
    return '''
name: ${name},
dbNumbers: ${dbNumbers},
unsavedNumbers: ${unsavedNumbers},
unsaved: ${unsaved}
    ''';
  }
}
