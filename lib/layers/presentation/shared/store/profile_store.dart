import 'package:flutter/physics.dart';
import 'package:matule/layers/domain/entity/item_entity.dart';
import 'package:matule/layers/domain/entity/user_entity.dart';
import 'package:matule/layers/data/local/shared_preferences/preferences_model.dart';
import 'package:mobx/mobx.dart';

part 'profile_store.g.dart';

class ProfileStore = _ProfileStore with _$ProfileStore;

abstract class _ProfileStore with Store {
  @observable
  late UserEntity _userEntity;

  @observable
  late ItemEntity _itemEntity;

  @action
  void main() async {
    _userEntity = UserEntity(
      name: '',
      lastname: '',
      address: '',
      number: 123,
      item: item,
      items: [],
      basket: [],
    );
    print(_userEntity.name);
    changeName();
    print(_userEntity.name);
  }

  @action
  changeName() {
    _userEntity.name = 'qwe';
  }
}
