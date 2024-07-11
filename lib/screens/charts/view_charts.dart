import 'package:cha_rifa/screens/charts/charts.dart';
import 'package:cha_rifa/screens/charts/data.dart';
import 'package:cha_rifa/widgets/drawer/drawer.dart';
import 'package:circular_seek_bar/circular_seek_bar.dart';
import 'package:flutter/material.dart';

class ViewCharts extends StatelessWidget {
  const ViewCharts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerThree(initialSelectedDestination: 2),
      appBar: AppBar(
          title: const Text('Dashboard'),
          centerTitle: true,
          backgroundColor: Colors.blue),
      body: SingleChildScrollView(
          child: Column(children: [
        Container(
          margin: EdgeInsets.all(15),
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(255, 1, 1, 1).withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column(children: [
            Text('Texto de teste', style: TextStyle(fontSize: 20)),
            Charts(chartData),
          ]),
        ),
        Container(
          height: 309,
          margin: EdgeInsets.all(15),
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(255, 1, 1, 1).withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            children: [
              Text('Texto de teste', style: TextStyle(fontSize: 20)),
              CircularSeekBar(
                width: double.infinity,
                height: 250,
                progress: 64,
                barWidth: 8,
                startAngle: 45,
                sweepAngle: 270,
                strokeCap: StrokeCap.butt,
                progressGradientColors: const [
                  Colors.blueGrey,
                  Colors.blue,
                  Colors.lightBlue,
                  Colors.blueAccent
                ],
                innerThumbRadius: 5,
                innerThumbStrokeWidth: 3,
                innerThumbColor: Colors.blue,
                outerThumbRadius: 5,
                outerThumbStrokeWidth: 10,
                outerThumbColor: Colors.blueAccent,
                dashWidth: 1,
                dashGap: 2,
                animation: true,
                // valueNotifier: 5.0,
                // child: Center(
                //   child: ValueListenableBuilder(
                //       // valueListenable:5,
                //       builder: (_, double value, __) => Column(
                //             mainAxisSize: MainAxisSize.min,
                //             children: [
                //               Text('${value.round()}', style: kNotoSansBold16.copyWith(color: Colors.white)),
                //               Text('progress', style: kNotoSansRegular14.copyWith(color: Colors.grey)),
                //             ],
                //           )),
                // ),
              ),
            ],
          ),
        )
      ])),
    );
  }
}
