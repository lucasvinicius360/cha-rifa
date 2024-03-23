import 'package:cha_rifa/widget/drawer/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerThree(),
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Cha Rifa Do Oliver',
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
      body: Container(
        
      )
    );
  }
}
