import 'package:cha_rifa/model/user.dart';
import 'package:cha_rifa/screens/add/add.dart';
import 'package:cha_rifa/screens/add/editUser.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class IconEdit extends StatelessWidget {
  final User user;
   IconEdit(this.user);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.edit),
      iconSize: 30,
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Editar'),
              content: Text('Você deseja editar isso?',
                  style: GoogleFonts.bebasNeue(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: Color.fromARGB(255, 18, 18, 18),
                  )),
              actions: <Widget>[
                TextButton(
                  onPressed: () {},
                  child: Text('Cancelar'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditUser(user: user,),
                        ));
                    // Navigator.pop(context);
                  },
                  child: Text('Confirmar'),
                )
              ],
            );
          },
        );
      },
      color: Colors.white,
    );
  }
}
