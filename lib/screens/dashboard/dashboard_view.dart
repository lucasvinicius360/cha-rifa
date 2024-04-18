import 'package:cha_rifa/controllers/addController.dart';
import 'package:cha_rifa/screens/dashboard/dashhboardStore.dart';
import 'package:cha_rifa/widgets/drawer/drawer.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobx/mobx.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final DashhboardStore dashboardStore = DashhboardStore();

  final UsersRepositores usersRepository = UsersRepositores();

  int index = 0;

  @override
  void initState() {
    super.initState();
    dashboardStore.getTotalPayment();
    dashboardStore.getTotalNotPayment();
    dashboardStore.addToUnsaved();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xFF0D0F14),
      drawer: DrawerThree(initialSelectedDestination: 2),
      body: SingleChildScrollView(
          padding: EdgeInsets.only(top: 45),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Padding(
              padding: EdgeInsets.only(top: 48, bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Dashboard',
                    style: GoogleFonts.bebasNeue(
                      fontWeight: FontWeight.w500,
                      fontSize: 52,
                      color: Color(0xFF0D0F14),
                    ),
                  ),
                  // SizedBox(width: 15),
                  IconButton(
                    icon: Icon(CupertinoIcons.graph_square),
                    onPressed: () {},
                    color: Colors.grey,
                    iconSize: 40,
                  ),
                ],
              ),
            ),
            // Observer(
            //     builder: (_) => Row(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //           crossAxisAlignment: CrossAxisAlignment.center,
            //       children: [
            //         Text(
            //               'Total de pessoas ',
            //               style: TextStyle(
            //                   fontSize: 20,
            //                   fontWeight: FontWeight.w700,
            //                   letterSpacing: -1.5,
            //                   color: Color.fromARGB(255, 250, 250, 250),),
            //             ),
            //       ],
            //     )),
            Observer(builder: (_) => loadGrafico()),

            Observer(
                builder: (_) => Container(
                      width: 250,
                      padding: EdgeInsets.all(8.0),
                      margin: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        // color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(255, 1, 1, 1)
                                .withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 7,
                            offset: Offset(0, 3),
                          ),
                        ],
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.white,
                            Colors.white,
                          ],
                        ),
                      ),
                      child: Column(
                        children: [
                          Text(
                            'Total De Participantes' +
                                '   ' +
                                '${dashboardStore.peopleNotPay + dashboardStore.peoplePay}',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              letterSpacing: -1.5,
                              color: Color(0xFF0D0F14),
                            ),
                          ),
                          Divider(
                            height: 2,
                            thickness: 2,
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              IconButton(
                                icon: Icon(CupertinoIcons.clear_fill),
                                onPressed: () {},
                                color: Colors.red,
                                iconSize: 30,
                              ),
                              Text(
                                  'Fraldas Não Pagas: ${dashboardStore.peopleNotPay}',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: -1.5,
                                    color: Color(0xFF0D0F14),
                                  )),
                            ],
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                IconButton(
                                  icon: Icon(CupertinoIcons.clear_fill),
                                  onPressed: () {},
                                  color: Colors.green,
                                  iconSize: 30,
                                ),
                                Text(
                                    'Fraldas Pagas : ${dashboardStore.peoplePay}',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: -1.5,
                                      color: Color(0xFF0D0F14),
                                    ))
                              ]),
                        ],
                      ),
                    )),
          ])),
    );
  }

  loadGrafico() {
    while (dashboardStore.peoplePay == 0) {
      return Container(
        width: MediaQuery.of(context).size.width,
        height: 200,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return Stack(alignment: Alignment.center, children: [
      Observer(
          builder: (_) => AspectRatio(
              aspectRatio: 1,
              child: PieChart(PieChartData(
                sectionsSpace: 5,
                centerSpaceRadius: 110,
                sections: loadpayment(),
                pieTouchData: PieTouchData(
                    touchCallback: (FlTouchEvent event, pieTouchResponse) {
                  setState(() {
                    if (!event.isInterestedForInteractions ||
                        pieTouchResponse == null ||
                        pieTouchResponse.touchedSection == null) {
                      return;
                    }
                    index =
                        pieTouchResponse.touchedSection!.touchedSectionIndex;
                    setGraficoData(index);
                  });
                }),
              )))),
      // Column(
      //   children: [
      //     Observer(
      //         builder: (_) => Text(
      //               'Total de pessoas que não pagaram: ${dashboardStore.peopleNotPay}',
      //               style: TextStyle(
      //                   fontSize: 18,
      //                   fontWeight: FontWeight.w700,
      //                   letterSpacing: -1.5,
      //                   color: Colors.teal),
      //             )),
      //     Observer(
      //       builder: (_) {
      //         return Text(
      //           'Total de pessoas que  pagaram: ${dashboardStore.peoplePay}',
      //           style: TextStyle(
      //               fontSize: 18,
      //               fontWeight: FontWeight.w700,
      //               letterSpacing: -1.5,
      //               color: Colors.teal),
      //         );
      //       },
      //     )
      //   ],
      // )
    ]);
  }

  List<PieChartSectionData> loadpayment() {
    // Supondo que você tenha uma lista de dados para os pagamentos
    List<PieChartSectionData> sections = [];

    // Adicione os dados dos pagamentos à lista de seções do gráfico de pizza
    // Exemplo fictício:
    sections.add(PieChartSectionData(
        value: getTotalPay(),
        color: Color.fromARGB(255, 33, 243, 82),
        title: '${getTotalPay().toStringAsFixed(0)}%',
        titleStyle: TextStyle(
            fontSize: 20, fontWeight: FontWeight.w700, letterSpacing: -1.5)));
    sections.add(PieChartSectionData(
        value: getTotalNotPay(),
        color: Colors.red,
        title: '${getTotalNotPay().toStringAsFixed(0)}%',
        titleStyle: TextStyle(
            fontSize: 20, fontWeight: FontWeight.w700, letterSpacing: -1.5)));

    return sections;
  }

  void setGraficoData(int index) {}

  double getTotalPay() {
    double po = ((dashboardStore.peoplePay * 100) /
            (dashboardStore.peoplePay + dashboardStore.peopleNotPay))
        .toDouble();
    return po == null ? 0 : po;
  }

  double getTotalNotPay() {
    double po = ((dashboardStore.peopleNotPay * 100) /
            (dashboardStore.peoplePay + dashboardStore.peopleNotPay))
        .toDouble();
    return po == null ? 0 : po;
  }
}
