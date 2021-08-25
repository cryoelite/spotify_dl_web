import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spotify_dl_web/app/InitializeApp/MainApp.dart';
import 'package:spotify_dl_web/constants/LocalAssets.dart';
import 'package:spotify_dl_web/constants/SupportedLocales.dart';
import 'package:spotify_dl_web/localization/codegen_loader.g.dart';

class InitializeApp {
  Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await EasyLocalization.ensureInitialized();

    runApp(
      ProviderScope(
        child: EasyLocalization(
          path: LocalAssets.localizationFolder,
          supportedLocales: [
            SupportedLocales.englishLocale,
            SupportedLocales.hindiLocale,
            SupportedLocales.spanishLocale,
          ],
          assetLoader: CodegenLoader(),
          fallbackLocale: SupportedLocales.englishLocale,
          startLocale: SupportedLocales.englishLocale,
          child: MainApp(),
        ),
      ),
    );
  }
}
