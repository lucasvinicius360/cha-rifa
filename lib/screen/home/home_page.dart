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
      // appBar: AppBar(
      //     centerTitle: true,
      //     title: Text(
      //       'Cha Rifa Do Oliver',
      //       style: GoogleFonts.pacifico(
      //         fontWeight: FontWeight.w500,
      //         fontSize: 30,
      //         color: Color(0xFFF4B23C),
      //       ),
      //     ),
      //     // backgroundColor: Color(0xFF87CEFA),
      //     flexibleSpace: Container(
      //       decoration: BoxDecoration(
      //         image: DecorationImage(
      //           image: AssetImage("assets/images/background_appBar.png"),
      //           fit: BoxFit.cover,
      //         ),
      //       ),
      //     )),
      body: Material(
          child: Container(
            padding: EdgeInsets.only(top: 100, bottom: 40),
            decoration: BoxDecoration(
            // color: Colors.black,
            // ignore: prefer_const_constructors
            image: DecorationImage(
                image: AssetImage("assets/images/background.png"),
                fit: BoxFit.cover,
                opacity: 1.6)),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  "Chá Rifa Do Oliver",
                  style: GoogleFonts.pacifico(
                    color: const Color(0xFFF4B23C),
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                width: MediaQuery.of(context).size.width,
                height: 60,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Color(0xFF87CEFA),
                    borderRadius: BorderRadius.circular(20)),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Find Your Number",
                    hintStyle: GoogleFonts.pacifico(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ),
      )),
    );
  }
}
