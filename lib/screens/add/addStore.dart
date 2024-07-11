import 'package:cha_rifa/model/user.dart';
import 'package:mobx/mobx.dart';
import 'package:cha_rifa/controllers/addController.dart';

part 'addStore.g.dart';

// flutter pub run build_runner build

class AddStore = _AddStore with _$AddStore;

abstract class _AddStore with Store {
  @observable
  String name = '';

  final UsersRepositores usersRepository = UsersRepositores();

  @observable
  ObservableFuture<List<Map<int, dynamic>>> dbNumbers =
      ObservableFuture.value([]);

  @observable
  ObservableFuture<List<Map<int, dynamic>>> unsavedNumbers =
      ObservableFuture.value([]);

  

  @observable
  List<int> unsaved = [];

  var allNumbers = List.generate(100, (index) => index + 1);

  @action
  Future<void> getNumbers() async {
  try {
    // Obtém os números salvos no banco de dados
    List<Map<String, dynamic>> result = await usersRepository.getNumbers();

    // Cria uma lista com todos os números possíveis
    List<int> allNumbers = List.generate(100, (index) => index + 1);

    // Filtra os números que não estão salvos no banco de dados
     unsaved = allNumbers.where((number) => !result.any((element) => element['number'] == number)).toList();
    
    // Atribui os números não salvos à lista unsavedNumbers
    // unsavedNumbers = ObservableList<int>.of(unsaved);
    print(unsaved);
    // // Atualiza a lista de números salvos
    // dbNumbers = ObservableFuture.value(result);
  } catch (e) {
    print("Erro ao obter os números: $e");
  }
}

}
