import 'package:flutter/material.dart';

import 'package:cha_rifa/model/user.dart';
import 'package:cha_rifa/screens/home/home_page_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cha_rifa/controllers/addController.dart';
import 'package:cha_rifa/widgets/drawer/drawer.dart';
import 'package:cha_rifa/widgets/dropDown/drop_page.dart';
import 'package:cha_rifa/widgets/fields/fields.dart';

class EditUser extends StatefulWidget {
  final User? user;

  EditUser({this.user});

  @override
  State<EditUser> createState() => _EditUserState(user!);
}

class _EditUserState extends State<EditUser> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final UsersRepositores usersRepository = UsersRepositores();
  final ValueNotifier<String> valueListenable = ValueNotifier('');
  final List<int> items = List<int>.generate(100, (index) => index + 1);
  bool checkValue = true;
  String selectedItem = '';

  // User singleUser = usersRepository.getUserById(0);

  _EditUserState(User user) {
    // Você pode inicializar seus controladores aqui com os valores do usuário passado
    nameController.text = user.name;
    numberController.text = user.number.toString();
    checkValue = user.payment;
    // Você também pode fazer o mesmo para outros campos conforme necessário
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerThree(),
      appBar: AppBar(
        title: Text(
          'Adicionar Chá Rifa',
          style: GoogleFonts.pacifico(
            fontWeight: FontWeight.w500,
            fontSize: 30,
            color: Color(0xFFF4B23C),
          ),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 10),
            buildFieldEmail(),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      'Selecione um numero',
                      style: GoogleFonts.pacifico(
                        fontWeight: FontWeight.w500,
                        fontSize: 17,
                        color: Color.fromARGB(255, 18, 18, 18),
                      ),
                    ),
                    BuildDropDown1(),
                  ],
                ),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Fralda recebida ?',
                      style: GoogleFonts.pacifico(
                        fontWeight: FontWeight.w500,
                        fontSize: 17,
                        color: Color.fromARGB(255, 18, 18, 18),
                      ),
                    ),
                    Container(
                      width: 100,
                      child: CheckboxListTile(
                        value: checkValue,
                        onChanged: (bool? newValue) {
                          setState(() {
                            if (newValue != null) {
                              checkValue = newValue;
                            }
                          });
                        },
                        activeColor: Colors.blue,
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(height: 30),
            buildSaveButton(context),
          ],
        ),
      ),
    );
  }

  Widget buildDropDown() => DropPage();

  Widget buildSaveButton(BuildContext context) {
  return ElevatedButton( // Retorna um botão elevado.
    style: ElevatedButton.styleFrom( // Estilo do botão elevado.
      backgroundColor: Colors.greenAccent, // Cor de fundo do botão.
      elevation: 10, // Elevação do botão.
    ),
    onPressed: () { // Função de callback quando o botão é pressionado.
      int numbers = int.parse(selectedItem); // Converte o valor selecionado para inteiro.

      // Atualiza os dados do usuário com os valores fornecidos.
      usersRepository.updateUsers(
        widget.user!.id, // ID do usuário.
        widget.user!.name, // Nome do usuário.
        numbers, // Número selecionado.
        checkValue, // Valor booleano indicando se a fralda foi recebida ou não.
      );

      // Navega de volta para a página inicial (HomePage).
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(), // Constrói a página inicial (HomePage).
        ),
      );
    },
    child: Text( // Texto exibido no botão.
      'Adicionar Usuário', // Texto do botão.
      style: TextStyle(color: Colors.white, fontSize: 16), // Estilo do texto.
    ),
  );
}


  Widget buildFieldEmail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Nome do Comprador',
          style: GoogleFonts.pacifico(
            fontWeight: FontWeight.w500,
            fontSize: 20,
            color: Color.fromARGB(255, 18, 18, 18),
          ),
        ),
        Card(
          color: Colors.grey[100],
          elevation: 8,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.transparent),
            ),
            child: TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: 'Qual o nome do comprador?',
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(16),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, insira o nome do comprador';
                }
                return null;
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget BuildDropDown1() {
    return ValueListenableBuilder(
      valueListenable: valueListenable,
      builder: (context, value, child) {
        return Card(
          color: Colors.grey[100],
          elevation: 8,
          child: Container(
            child: SizedBox(
              width: 150,
              height: 50,
              child: Padding(
                padding: EdgeInsets.all(3.5),
                child: DropdownButtonFormField(
                  borderRadius: BorderRadius.circular(15),
                  iconEnabledColor: Colors.blue,
                  decoration: getFieldName(''),
                  isExpanded: true,
                  hint: Text('Selecione...',),
                  value: (value.isEmpty) ? null : value,
                  onChanged: (value) {
                    valueListenable.value = value.toString();
                    setState(() {
                      selectedItem = value.toString();
                    });
                  },
                  items: items.map(
                    (e) {
                      return DropdownMenuItem(
                        child: Text('Numero: ' + e.toString()),
                        value: e.toString(),
                      );
                    },
                  ).toList(),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
