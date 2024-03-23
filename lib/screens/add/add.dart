import 'package:cha_rifa/controllers/addController.dart';
import 'package:cha_rifa/widgets/drawer/drawer.dart';
import 'package:cha_rifa/widgets/fields/fields.dart';
import 'package:flutter/material.dart';


class AddUserScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final UsersRepositores usersRepository = UsersRepositores();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerThree(),
      appBar: AppBar(
        title: Text('Adicionar Usuário'),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            buldFieldName(),
            SizedBox(height: 20),
            buildFieldEmail(),
            SizedBox(height: 10),
            builFieldPassword(),
            SizedBox(height: 20),
            buidSaveBottom(context),
          ],
        ),
      ),
    );
  }

  ElevatedButton buidSaveBottom(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.greenAccent, elevation: 10),
      onPressed: () {
        usersRepository.addUsers(
          nameController.text,
          emailController.text,
          passwordController.text,
        );
        Navigator.pop(
            context); // Retorna à tela anterior após adicionar o usuário
      },
      child: Text(
        'Adicionar Usuário',
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }

  Column builFieldPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Senha', style: TextStyle(fontSize: 14.0)),
        Card(
          color: Colors.grey[100],
          elevation: 8,
          child: Container(
            decoration: BoxDecoration(
              border:
                  Border.all(color: Colors.transparent), // Remove a borda do Card
            ),
            child: TextFormField(
              controller: passwordController,
              decoration: getFieldName('Qual a sua senha?'),
              onSaved: (String? value) {
                // This optional block of code can be used to run
                // code when the user saves the form.
              },
              validator: (String? value) {
                return (value != null && value.contains('@'))
                    ? 'Do not use the @ char.'
                    : null;
              },
              obscureText: true,
            ),
          ),
        ),
      ],
    );
  }

  Column buildFieldEmail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Email', style: TextStyle(fontSize: 14.0)),
        Card(
          color: Colors.grey[100],
          elevation: 8,
          child: Container(
            decoration: BoxDecoration(
              border:
                  Border.all(color: Colors.transparent), // Remove a borda do Card
            ),
            child: TextFormField(
              controller: emailController,
              decoration: getFieldName('Qual o seu e-mail?'),
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

  Column buldFieldName() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Name', style: TextStyle(fontSize: 14.0)),
        Card(
          color: Colors.grey[100],
          elevation: 8,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                  color: Colors.transparent), // Remove a borda do Card
            ),
            child: TextField(
              controller: nameController,
              decoration: InputDecoration(
                border: InputBorder.none, // Remove a borda do TextField
                focusedBorder: InputBorder
                    .none, // Remove a linha quando o TextField está focado
              ),
              
            ),
          ),
        ),
      ],
    );
  }
}
