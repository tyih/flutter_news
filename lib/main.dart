import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'global.dart';
import 'common/index.dart';

Future<void> main() async {
  await Global.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      builder: (context, child) {
        return RefreshConfiguration(
          headerBuilder: () => const ClassicHeader(),
          footerBuilder: () => const ClassicFooter(),
          hideFooterWhenNotFull: true,
          headerTriggerDistance: 80,
          maxOverScrollExtent: 100,
          footerTriggerDistance: 150,
          child: GetMaterialApp(
            title: 'app title',
            initialRoute: RouteNames.systemSplash,
            getPages: RoutePages.list,
            navigatorObservers: [RoutePages.observer],
            theme: ConfigService.to.isDarkModel ? AppTheme.dark : AppTheme.light,
            translations: Translation(),
            localizationsDelegates: Translation.localizationsDelegates,
            supportedLocales: Translation.supportedLocales,
            locale: ConfigService.to.locale,
            fallbackLocale: Translation.fallbackLocale,
            builder: (context, widget) {
              widget = EasyLoading.init()(context, widget);
              return MediaQuery(data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0), child: widget);
            },
          ),
        );
      },
    );
  }
}
