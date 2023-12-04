// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info_capture_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$InfoCaptureStore on InfoCaptureStoreBase, Store {
  late final _$dataAtom =
      Atom(name: 'InfoCaptureStoreBase.data', context: context);

  @override
  List<String> get data {
    _$dataAtom.reportRead();
    return super.data;
  }

  @override
  set data(List<String> value) {
    _$dataAtom.reportWrite(value, super.data, () {
      super.data = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: 'InfoCaptureStoreBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$fetchAsyncAction =
      AsyncAction('InfoCaptureStoreBase.fetch', context: context);

  @override
  Future<void> fetch() {
    return _$fetchAsyncAction.run(() => super.fetch());
  }

  late final _$deleteByIndexAsyncAction =
      AsyncAction('InfoCaptureStoreBase.deleteByIndex', context: context);

  @override
  Future<bool> deleteByIndex(int index) {
    return _$deleteByIndexAsyncAction.run(() => super.deleteByIndex(index));
  }

  late final _$addAsyncAction =
      AsyncAction('InfoCaptureStoreBase.add', context: context);

  @override
  Future<bool> add(String value) {
    return _$addAsyncAction.run(() => super.add(value));
  }

  @override
  String toString() {
    return '''
data: ${data},
isLoading: ${isLoading}
    ''';
  }
}
