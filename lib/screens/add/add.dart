import 'package:cha_rifa/controllers/addController.dart';
import 'package:cha_rifa/widgets/drawer/drawer.dart';
import 'package:cha_rifa/widgets/dropDown/drop_page.dart';
import 'package:cha_rifa/widgets/fields/fields.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cha_rifa/screens/home/home_page_view.dart';

class AddUserScreen extends StatefulWidget {
  @override
  State<AddUserScreen> createState() => _AddUserScreenState();
}

class _AddUserScreenState extends State<AddUserScreen> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController numberController = TextEditingController();

  final UsersRepositores usersRepository = UsersRepositores();

  final ValueNotifier<String> valueListenable = ValueNotifier('');

  final List<int> items = List<int>.generate(100, (index) => index + 1);

  bool checkValue = true;

  String selectedItem = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerThree(initialSelectedDestination : 1),
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
            // buldFieldName(),
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
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                        activeColor: Colors.blue),
                  ),
                ])
              ],
            ),
            SizedBox(height: 30),
            buidSaveBottom(context),
          ],
        ),
      ),
    );
  }

  BuildDropDown1() {
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
                  padding:
                      EdgeInsets.all(3.5), // Definindo padding de 16 pixels
                  child: DropdownButtonFormField(
                      borderRadius: BorderRadius.circular(15),
                      iconEnabledColor: Colors.blue,
                      decoration: getFieldName(''),
                      // icon: Icon(CupertinoIcons.list_number),
                      isExpanded: true,
                      hint: Text('Selecione...'),
                      value: (value.isEmpty) ? null : value,
                      onChanged: (value) => {
                            valueListenable.value = value.toString(),
                            setState(() {
                              selectedItem = value.toString();
                            })
                          },
                      items: items
                          .map(
                            (e) => DropdownMenuItem(
                              child: Text('Numero: ' + e.toString()),
                              value: e.toString(),
                            ),
                          )
                          .toList()),
                ),
              ),
            ),
          );
        });
  }

  DropPage buildDropDown() => DropPage();

  ElevatedButton buidSaveBottom(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.greenAccent, elevation: 10),
      onPressed: () {
        int numbers = int.parse(selectedItem);

        usersRepository.addUsers(nameController.text, numbers, checkValue);

        Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        )); // Retorna à tela anterior após adicionar o usuário
      },
      child: Text(
        'Adicionar Usuário',
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }

  Column buildFieldEmail() {
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
              border: Border.all(
                  color: Colors.transparent), // Remove a borda do Card
            ),
            child: TextFormField(
              controller: nameController,
              decoration: getFieldName('Qual o nome do comprador?'),
              onSaved: (String? value) {
                // This optional block of code can be used to run
                // code when the user saves the form.
              },
              validator: (String? value) {
                return (value != null && value.contains('@'))
                    ? 'Do not use the @ char.'
                    : null;
              },
            ),
          ),
        ),
      ],
    );
  }
}
