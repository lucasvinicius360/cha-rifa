import 'package:cha_rifa/screens/add/add.dart';
import 'package:cha_rifa/screens/charts/charts.dart';
import 'package:cha_rifa/screens/charts/data.dart';
import 'package:cha_rifa/screens/charts/view_charts.dart';
import 'package:cha_rifa/screens/home/home_page_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';


class DrawerThree extends StatefulWidget {
  // Atributo para armazenar o destino inicialmente selecionado
  final int initialSelectedDestination;

  // Construtor que aceita um valor opcional para initialSelectedDestination
  const DrawerThree({Key? key, this.initialSelectedDestination = 0})
      : super(key: key);

  @override
  State<DrawerThree> createState() => _DrawerThreeState();
}

class _DrawerThreeState extends State<DrawerThree> {
  // Variável para rastrear o destino atualmente selecionado
  int _selectedDestination = 0;

  @override
  void initState() {
    super.initState();
    // Inicializa _selectedDestination com o valor fornecido no construtor
    _selectedDestination = widget.initialSelectedDestination;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Container(
        child: ListView(
          // Importante: Remova qualquer preenchimento da ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/backDrawer1.jpg'),
                  fit: BoxFit.cover,
                )
              ),
              accountName: Text('Lucas Development',style: GoogleFonts.bebasNeue(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: Color.fromARGB(255, 253, 253, 253),
                        ),),
              accountEmail: null,
              currentAccountPicture: CircleAvatar(
                child: ClipOval(
                    child: Image.asset(
                  'assets/images/IMG1.jpg',
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                )),
              ),
            ),

            // Item de menu "Home"
            Stack(
              children: [
                // Destaca a barra lateral se o destino estiver selecionado
                _selectedDestination == 0
                    ? Positioned(
                        // width: 320,
                        height: 56,
                        left: 10,
                        right: 5,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                        ),
                      )
                    : SizedBox(),
                // O item real no Drawer
                ListTile(
                    leading: SizedBox(
                      child: Icon(CupertinoIcons.home),
                      height: 34,
                      width: 34,
                    ),
                    title: Text('Home',style: GoogleFonts.bebasNeue(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: Color.fromARGB(255, 18, 18, 18),
                        ),),
                    selected: _selectedDestination == 0,
                    onTap: () {
                      // Atualiza o destino selecionado e navega para a tela Home
                      selectDestination(0);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(),
                          ));
                    },
                    selectedColor:
                        _selectedDestination == 0 ? Colors.white : Colors.blue),
              ],
            ),

            // Item de menu "Forms"
            Stack(
              children: [
                // Destaca a barra lateral se o destino estiver selecionado
                _selectedDestination == 1
                    ? Positioned(
                        // width: 320,
                        height: 56,
                        left: 10,
                        right: 5,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                        ),
                      )
                    : SizedBox(),
                // O item real no Drawer
                ListTile(
                    leading: SizedBox(
                      child: Icon(CupertinoIcons.person_add_solid),
                      height: 34,
                      width: 34,
                    ),
                    title: Text('Adicionar Rifa',style: GoogleFonts.bebasNeue(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: Color.fromARGB(255, 18, 18, 18),
                        ),),
                    selected: _selectedDestination == 1,
                    onTap: () {
                      // Atualiza o destino selecionado e navega para a tela de Forms
                      selectDestination(1);
                      Navigator.push(
                          context,
                          PageTransition(
                            child:  AddUserScreen(),
                            type: PageTransitionType.size,
                            alignment: Alignment.center,
                            duration: const Duration(milliseconds: 700),
                          ));
                    },
                    selectedColor:
                        _selectedDestination == 1 ? Colors.white : Colors.blue),
              ],
            ),

            // Item de menu "Item 3"
            Stack(
              children: [
                _selectedDestination == 2
                    ? Positioned(
                        // width: 320,
                        height: 56,
                        left: 10,
                        right: 5,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                        ),
                      )
                    : SizedBox(),
                ListTile(
                    leading:
                        SizedBox(child: Icon(CupertinoIcons.settings_solid)),
                    title: Text('Settings',style: GoogleFonts.bebasNeue(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: Color.fromARGB(255, 18, 18, 18),
                        ),),
                    selected: _selectedDestination == 2,
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                            child:  ViewCharts(),
                            type: PageTransitionType.size,
                            alignment: Alignment.center,
                            duration: const Duration(milliseconds: 700),
                          ));
                      selectDestination(2);
                    },
                    selectedColor:
                        _selectedDestination == 2 ? Colors.white : Colors.blue),
              ],
            ),

            // Divisor e rótulo
            SizedBox(height: 10),
            Divider(
              height: 1,
              thickness: 1,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Label',style: GoogleFonts.bebasNeue(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: Color.fromARGB(255, 18, 18, 18),
                        ),
              ),
            ),

            // Item de menu "Item A"
            Stack(
              children: [
                _selectedDestination == 3
                    ? Positioned(
                        // width: 320,
                        height: 56,
                        left: 10,
                        right: 5,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                        ),
                      )
                    : SizedBox(),
                ListTile(
                    leading: Icon(CupertinoIcons.camera_circle_fill),
                    title: Text('Back to Home',style: GoogleFonts.bebasNeue(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: Color.fromARGB(255, 18, 18, 18),
                        ),),
                    selected: _selectedDestination == 3,
                    onTap: () {
                      selectDestination(3);
                      Navigator.pop(context);
                    },
                    selectedColor:
                        _selectedDestination == 3 ? Colors.white : Colors.blue),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Função para atualizar o destino selecionado
  void selectDestination(int index) {
    setState(() {
      _selectedDestination = index;
    });
  }
}
