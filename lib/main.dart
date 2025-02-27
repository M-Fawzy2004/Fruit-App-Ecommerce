import 'package:device_preview/device_preview.dart';
import 'package:e_commerce_app/constant.dart';
import 'package:e_commerce_app/core/helper/function/custom_bloc_observer.dart';
import 'package:e_commerce_app/core/helper/on_generate.dart';
import 'package:e_commerce_app/core/services/get_it_service.dart';
import 'package:e_commerce_app/core/services/shared_preference_singleton.dart';
import 'package:e_commerce_app/feature/splash/presentation/view/splash_view.dart';
import 'package:e_commerce_app/firebase_options.dart';
import 'package:e_commerce_app/generated/codegen_loader.g.dart';
import 'package:e_commerce_app/theme/dark_mode.dart';
import 'package:e_commerce_app/theme/theme_app_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Supabase.initialize(
    url: kSupabaseUrl,
    anonKey: kSupabaseKey,
  );
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = CustomBlocObserver();
  await Prefs.init();
  setupGetit();
  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => EasyLocalization(
        supportedLocales: [Locale('en'), Locale('ar')],
        path: 'assets/translations',
        fallbackLocale: Locale('ar', 'EN'),
        assetLoader: CodegenLoader(),
        startLocale: Locale('ar'),
        child: ChangeNotifierProvider(
          create: (_) => ThemeAppProvider(),
          child: FruitHub(),
        ),
      ),
    ),
  );
}

class FruitHub extends StatelessWidget {
  const FruitHub({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoute,
      initialRoute: SplashView.routeName,
      // theme: context.watch<ThemeAppProvider>().themeData,
      theme: darkMode.copyWith(
        textTheme: ThemeData.dark().textTheme.apply(
              fontFamily: 'Cairo',
            ),
      ),
    );
  }
}
