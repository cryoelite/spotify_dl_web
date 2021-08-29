import 'dart:async';
import 'dart:developer' as dev;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:spotify_dl_web/app/home/Layouts/MobileLayoutWidget.dart';
import 'package:spotify_dl_web/app/home/Layouts/PCLayoutWidget.dart';
import 'package:spotify_dl_web/services/ScreenConstraintService.dart';

class HomeRoute extends ConsumerWidget {
  HomeRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            /* scheduleMicrotask(() {
              watch(screenConstraintProvider.notifier).init(
                aspectRatioHeight: 21,
                aspectRatioWidth: 9,
                maxHeight: constraints.maxHeight,
                maxWidth: constraints.maxWidth,
              );
            }); */
            return PCLayoutWidget(
              width: constraints.maxWidth,
              height: constraints.maxHeight,
            );
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
