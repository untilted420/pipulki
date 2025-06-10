import 'package:matule/layers/presentation/shared/store/product_store.dart';
import 'package:matule/layers/presentation/shared/store/profile_store.dart';
import 'package:matule/layers/data/local/shared_preferences/preferences_model.dart';
import 'package:mobx/mobx.dart';

class RootStore with Store {
  final profileDetails = ProfileStore();
  final productDetails = ProductStore();

  static final RootStore _singleton = RootStore._internal();

  factory RootStore() {
    return _singleton;
  }
  RootStore._internal();

  void main() {
    // profileDetails.main();
  }
}
