import 'package:cha_rifa/controllers/addController.dart';
import 'package:mobx/mobx.dart';

part 'dashhboardStore.g.dart';

class DashhboardStore = _DashhboardStore with _$DashhboardStore;

abstract class _DashhboardStore with Store {
  @observable
  int peoplePay = 0;

  @observable
  int peopleNotPay = 0;

  @observable
  List<int> unsaved = [];

  final UsersRepositores usersRepository = UsersRepositores();

  @action
  Future<void> getTotalPayment() async {
    peoplePay = await usersRepository.getTotalPayment();
  }

  @action
  Future<void> getTotalNotPayment() async {
    peopleNotPay = await usersRepository.getTotalNotPayment();
  }

  @action
  void addToUnsaved() {
    unsaved.addAll([peoplePay, peopleNotPay, peoplePay + peopleNotPay, 100]);
  }

  @action
  double getTotalPay() {

    double po = (peoplePay + peopleNotPay).toDouble();
    return po;
  }
}
