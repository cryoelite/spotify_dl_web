import 'dart:developer' as dev;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:spotify_dl_web/app/home/widgets/MobileLayoutWidget.dart';
import 'package:spotify_dl_web/app/home/widgets/PCLayoutWidget.dart';
import 'package:spotify_dl_web/services/ScreenConstraintService.dart';

class HomeRoute extends StatelessWidget {
  HomeRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return PCLayoutWidget();
//TODO:
            /*  if (constraints.maxWidth <= 480) {
              dev.log("Switching to Mobile Layout ${constraints.maxWidth}");

              return MobileLayoutWidget();
            } else {
              dev.log("Switching to PC Layout  ${constraints.maxWidth}");

              return PCLayoutWidget();
            } */
          },
        ),
      ),
    );
  }
}
