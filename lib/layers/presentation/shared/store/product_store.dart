import 'package:matule/layers/domain/entity/product_entity.dart';
import 'package:matule/layers/presentation/shared/store/root_store.dart';
import 'package:mobx/mobx.dart';

part 'product_store.g.dart';

class ProductStore = _ProductStore with _$ProductStore;

abstract class _ProductStore with Store {
  @observable
  late ProductEntity _productEntity;

  @action
  void main() {
    _productEntity = ProductEntity(name: '', price: 0, id: 0, category: 1);
  }

  @observable
  List<ProductEntity> listCard= [];

  @observable
  List<ProductEntity> listFavotite = [];

  @observable
  List<ProductEntity> toRemove = [];

  @observable
  int priceAll = 0;

  @action
  void addCard(String name, int price, int id, int category) {
    listCard.add(ProductEntity(name: name, price: price, id: id, category: category));
  }
  @action
  void addFavorite(String name, int price, int id, int category) {
    listFavotite.add(ProductEntity(name: name, price: price, id: id, category: category));
  }

  @action
  void addPriceCard(int price) {
    priceAll = priceAll + price;
    print(priceAll);
  }

  @action
  void delCard(int id) {
    listCard.forEach((e) {
      if (e.id == id) {
        toRemove.add(e);
        priceAll = priceAll - e.price;
      }
    });
    listCard.removeWhere((e) => toRemove.contains(e));
  }
}
