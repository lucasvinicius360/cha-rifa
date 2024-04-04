import 'package:mobx/mobx.dart';
import 'package:cha_rifa/controllers/addController.dart';

part 'addStore.g.dart';

// flutter pub run build_runner build

class AddStore = _AddStore with _$AddStore;

abstract class _AddStore with Store {
  @observable
  String name = '';

  final UsersRepositores usersRepository = UsersRepositores();

}
