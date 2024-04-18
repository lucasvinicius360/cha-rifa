import 'package:cha_rifa/screens/dashboard/dashhboardStore.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final DashhboardStore dashboardStore = DashhboardStore();

  int index = 0;

  double total = 0.0;

  void initState() {
    super.initState();
    dashboardStore.getTotalPayment();
    dashboardStore.getTotalNotPayment();
    dashboardStore.addToUnsaved();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          padding: EdgeInsets.only(top: 45),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Padding(
              padding: EdgeInsets.only(top: 48, bottom: 8),
              child: Text(
                'Dashboard',
                style: GoogleFonts.bebasNeue(
                  fontWeight: FontWeight.w500,
                  fontSize: 30,
                  color: Color.fromARGB(255, 18, 18, 18),
                ),
              ),
            ),
            Observer(
                builder: (_) => Text(
                      'Total de pessoas que pagaram: ${dashboardStore.peoplePay}',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          letterSpacing: -1.5),
                    )),
            Observer(
                builder: (_) => Text(
                      'Total de pessoas que não pagaram: ${dashboardStore.peopleNotPay}',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          letterSpacing: -1.5),
                    )),
            Observer(builder: (_) => loadGrafico())
          ])),
    );
  }

  loadGrafico() {
    return (1 == 0)
        ? Container(
            width: MediaQuery.of(context).size.width,
            height: 200,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : Stack(alignment: Alignment.center, children: [
            Observer(
                builder: (_) => AspectRatio(
                    aspectRatio: 1,
                    child: PieChart(PieChartData(
                      sectionsSpace: 5,
                      centerSpaceRadius: 110,
                      sections: loadpayment(),
                      pieTouchData: PieTouchData(touchCallback:
                          (FlTouchEvent event, pieTouchResponse) {
                        setState(() {
                          if (!event.isInterestedForInteractions ||
                              pieTouchResponse == null ||
                              pieTouchResponse.touchedSection == null) {
                            return;
                          }
                          index = pieTouchResponse
                              .touchedSection!.touchedSectionIndex;
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
        color: Colors.green,
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
    return po;
  }

  double getTotalNotPay() {
    double po = ((dashboardStore.peopleNotPay * 100) /
            (dashboardStore.peoplePay + dashboardStore.peopleNotPay))
        .toDouble();
    return po;
  }
}
