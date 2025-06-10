// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProductStore on _ProductStore, Store {
  late final _$_productEntityAtom =
      Atom(name: '_ProductStore._productEntity', context: context);

  @override
  ProductEntity get _productEntity {
    _$_productEntityAtom.reportRead();
    return super._productEntity;
  }

  bool __productEntityIsInitialized = false;

  @override
  set _productEntity(ProductEntity value) {
    _$_productEntityAtom.reportWrite(
        value, __productEntityIsInitialized ? super._productEntity : null, () {
      super._productEntity = value;
      __productEntityIsInitialized = true;
    });
  }

  late final _$_ProductStoreActionController =
      ActionController(name: '_ProductStore', context: context);

  @override
  void main() {
    final _$actionInfo =
        _$_ProductStoreActionController.startAction(name: '_ProductStore.main');
    try {
      return super.main();
    } finally {
      _$_ProductStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
