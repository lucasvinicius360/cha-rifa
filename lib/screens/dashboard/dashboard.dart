import 'package:cha_rifa/screens/dashboard/dashhboardStore.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final DashhboardStore dashboardStore = DashhboardStore();

  int index = 0;

  double total = 0.0;

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
                ))
          ])),
    );
  }
}
