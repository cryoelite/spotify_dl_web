import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:spotify_dl_web/app/InitializeApp/viewmodels/KeyStateViewModel.dart';
import 'package:spotify_dl_web/constants/AppColors.dart';
import 'package:spotify_dl_web/routing/AppRouter.dart';

class MainApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final watchKeyState = watch(keyStateProvider);
  
    return KeyedSubtree(
      key: watchKeyState,
      child: MaterialApp(
        title: 'spotify_dl_web',
        locale: context.locale,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: (settings) => AppRouter.onGenerateRoute(settings),
        builder: (context, widget) {
          return ResponsiveWrapper.builder(
            BouncingScrollWrapper.builder(context, widget!),
            minWidth: 480,
            defaultScale: true,
            breakpoints: [
              ResponsiveBreakpoint.autoScale(480, name: MOBILE),
              ResponsiveBreakpoint.resize(600, name: MOBILE),
              ResponsiveBreakpoint.resize(850, name: TABLET),
              ResponsiveBreakpoint.autoScale(1080, name: DESKTOP),
            ],
          );
        },
        theme: ThemeData(
          backgroundColor: AppColors.colorWhite,
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: AppColors.colorDarkGrey,
            selectionColor: AppColors.colorPink,
          ),
          textTheme: TextTheme(
            headline3: TextStyle(
              color: AppColors.colorMediumDarkGrey,
              fontFamily: GoogleFonts.nunito().fontFamily,
              fontWeight: FontWeight.bold,
            ),
            headline2: TextStyle(
              color: AppColors.colorMediumDarkGrey,
              fontFamily: GoogleFonts.nunito().fontFamily,
              fontWeight: FontWeight.w600,
            ),
            headline1: TextStyle(
              color: AppColors.colorDarkGrey,
              fontFamily: GoogleFonts.nunito().fontFamily,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
            ),
            bodyText2: TextStyle(
              color: AppColors.colorDarkGrey,
              fontFamily: GoogleFonts.roboto().fontFamily,
              fontWeight: FontWeight.bold,
            ),
            bodyText1: TextStyle(
              color: AppColors.colorDarkGrey,
              fontFamily: GoogleFonts.roboto().fontFamily,
            ),
            button: TextStyle(
              color: AppColors.colorGrey,
              fontFamily: GoogleFonts.roboto().fontFamily,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
      ),
    );
  }
}
