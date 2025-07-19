import 'dart:math';
import 'package:flutter/material.dart';
import 'package:vivaheal/utils/dashboard_colors.dart';
import 'package:vivaheal/utils/dashboard_strings.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  DashboardStrings dashStrings = DashboardStrings();
  DashboardColors dashColors = DashboardColors();

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold();
  }
}
