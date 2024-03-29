import 'package:cha_rifa/controllers/addController.dart';
import 'package:cha_rifa/widgets/drawer/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final UsersRepositores usersRepository = UsersRepositores();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerThree(),
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Chá Rifa Do Oliver',
            style: GoogleFonts.pacifico(
              fontWeight: FontWeight.w500,
              fontSize: 30,
              color: Color(0xFFF4B23C),
            ),
          ),
          // backgroundColor: Color(0xFF87CEFA),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/background_appBar.png"),
                fit: BoxFit.cover,
              ),
            ),
          )),
      body: FutureBuilder(
        future: usersRepository.getUsers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro: ${snapshot.error}'));
          } else {
            List<Map<String, dynamic>> users =
                snapshot.data as List<Map<String, dynamic>>;

            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                return Container(
                  height: 150,
                  margin: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color:
                            const Color.fromARGB(255, 1, 1, 1).withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: ListTile(
                    // Ajuste o valor conforme necessário
                    contentPadding: EdgeInsets.all(25.0),
                    leading: Container(
                      width: 70,
                      height: 90,
                      child: CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/images/perfil.jpeg'),
                      ),
                    ),
                    title: Text(
                      users[index]['name'],
                      style: GoogleFonts.bebasNeue(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: Color.fromARGB(255, 18, 18, 18),
                      ),
                    ),
                    subtitle: Text('N°: ' + users[index]['number'].toString(),
                        style: TextStyle(fontSize: 28)),
                    trailing: Container(
                      // width: 100,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(users[index]['payment'] == 1
                                ? Icons.verified_rounded
                                : Icons.cancel_sharp),
                            onPressed: () {},
                            color: users[index]['payment'] == 1
                                ? const Color.fromARGB(255, 44, 243, 33)
                                : Colors.red,
                          ),
                          IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () {},
                            color: Colors.blue,
                          ),
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              usersRepository.deleteUsers(users[index]['id']);
                              Navigator.pop(context);
                            },
                            color: Colors.red,
                          ),
                        ],
                      ),
                    ),
                    selectedTileColor: Colors.blue,
                    // Adicione botões ou ações aqui para editar ou excluir usuários
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
