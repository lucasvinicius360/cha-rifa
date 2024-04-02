import 'package:cha_rifa/controllers/addController.dart';
import 'package:cha_rifa/screens/home/home_page_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IconDelete extends StatelessWidget {
  final int id;

  IconDelete(int id, {super.key}) : this.id = id;

  final UsersRepositores usersRepository = UsersRepositores();

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.delete),
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: Colors.white,
              title: Container(
                  child: Text('Deletar',
                      style: GoogleFonts.bebasNeue(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: Color.fromARGB(255, 18, 18, 18),
                      ))),
              content: Text('Você deseja deletar esse item?',
                  style: GoogleFonts.bebasNeue(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: Color.fromARGB(255, 18, 18, 18),
                  )),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancelar',
                      style: GoogleFonts.bebasNeue(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: Color.fromARGB(255, 18, 18, 18),
                      )),
                ),
                TextButton(
                  onPressed: () {
                    usersRepository.deleteUsers(this.id);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ));
                  },
                  child: Text('Confirmar',
                      style: GoogleFonts.bebasNeue(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: Color.fromARGB(255, 18, 18, 18),
                      )),
                )
              ],
            );
          },
        );
      },
      color: Colors.red,
    );
  }
}
