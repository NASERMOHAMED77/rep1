import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rep1/core/colors.dart';
import 'package:rep1/core/routing/app_router.dart';
import 'package:rep1/core/routing/routes.dart';
import 'package:rep1/generated/l10n.dart';

class RepApp extends StatelessWidget {
  const RepApp({super.key, required this.appRouter});
  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      designSize: const Size(430, 932),
      child: MaterialApp(
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        locale: const Locale("en"),
        title: 'Rep1',
        theme: ThemeData(
            useMaterial3: true,
            primaryColor: ColorManager.orangeAppColor,
            colorScheme: ColorScheme.fromSeed(
              primary: ColorManager.orangeAppColor,
              seedColor:
                  Colors.amber, // Replace with your desired primary color
            ),
            primaryColorLight: ColorManager.orangeAppColor),
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.onBoardingScreen,
        onGenerateRoute: appRouter.generateRoute,
      ),
    );
  }
}
