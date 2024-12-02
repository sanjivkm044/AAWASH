import 'package:aawash/core/internet_status/internet_bloc.dart';
import 'package:aawash/core/internet_status/internet_state.dart';
import 'package:aawash/core/locator/locator.dart';
import 'package:aawash/core/route/aawash_route.dart';
import 'package:aawash/core/theme/aawash_text_color.dart';
import 'package:aawash/core/theme/aawash_theme.dart';
import 'package:aawash/core/utils/toast/toast_message.dart';
import 'package:aawash/core/widget/unfocus.dart';
import 'package:aawash/flavors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AawashApp extends StatelessWidget {
  const AawashApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<InternetBloc>(),
        ),
      ],
      child: UnFocus(
        child: MaterialApp.router(
          builder: (context, child) {
            return BlocListener<InternetBloc, InternetState>(
              listener: (context, state) {
                if (state is InternetConnected && state.showMessage) {
                  ToastMessage().toast(
                    context: context,
                    message: "Internet Connection Established",
                    bgColor: AawashColor.green,
                  );
                } else if (state is InternetDisconnected) {
                  ToastMessage().toast(
                    context: context,
                    message: "No Internet Connection !!!",
                    bgColor: AawashColor.red,
                  );
                }
              },
              child: child,
            );
          },
          debugShowCheckedModeBanner: F.title == Flavor.dev ? true : false,
          routerConfig: AawashRoute.router,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate
          ],
          locale: const Locale("en"),
          supportedLocales: AppLocalizations.supportedLocales,
          themeMode: ThemeMode.light,
          theme: AawashTheme.lightTheme(context),
          darkTheme: AawashTheme.darkTheme(context),
        ),
      ),
    );
  }
}

// import 'dart:developer';

// import 'package:aawash/core/internet_status/internet_bloc.dart';
// import 'package:aawash/core/internet_status/internet_state.dart';
// import 'package:aawash/core/locator/locator.dart';
// import 'package:aawash/core/route/aawash_route.dart';
// import 'package:aawash/core/theme/aawash_text_color.dart';
// import 'package:aawash/core/theme/aawash_theme.dart';
// import 'package:aawash/core/utils/toast/toast_message.dart';
// import 'package:aawash/core/widget/unfocus.dart';
// import 'package:aawash/flavors.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// class AawashApp extends StatelessWidget {
//   const AawashApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider(
//           create: (_) => getIt<InternetBloc>(),
//         ),
//       ],
//       child: UnFocus(
//         child: MaterialApp.router(
//           builder: (context, child) {
//             log("here");
//             return BlocBuilder<InternetBloc, InternetState>(
//               builder: (context, state) {
//                 log("here 3 ${state.toString()}");
//                 if (state is InternetLoading) {
//                   return const Scaffold(
//                     body: Center(
//                       child: CircularProgressIndicator(),
//                     ),
//                   );
//                 }
//                 if (state is InternetConnected) {
//                   return const Scaffold(
//                     body: Center(
//                       child: Text("Internet Connected"),
//                     ),
//                   );
//                 } else {
//                   return const Scaffold(
//                     body: Center(
//                       child: Text("Internet Disconnected"),
//                     ),
//                   );
//                 }

//                 // if (state is InternetConnected && state.showMessage) {
//                 //    log("here 1");
//                 //   ToastMessage().toast(
//                 //     context: context,
//                 //     message: "Internet Connection Established",
//                 //     bgColor: AawashColor.green,
//                 //   );
//                 // } else if (state is InternetDisconnected) {
//                 //    log("here 2");
//                 //   ToastMessage().toast(
//                 //     context: context,
//                 //     message: "No Internet Connection !!!",
//                 //     bgColor: AawashColor.red,
//                 //   );
//                 // }
//               },
//               // child: child,
//             );
//           },
//           // debugShowCheckedModeBanner: F.title == Flavor.dev ? true : false,
//           routerConfig: AawashRoute.router,
//           localizationsDelegates: const [
//             AppLocalizations.delegate,
//             GlobalCupertinoLocalizations.delegate,
//             GlobalMaterialLocalizations.delegate,
//             GlobalWidgetsLocalizations.delegate
//           ],
//           locale: const Locale("en"),
//           supportedLocales: AppLocalizations.supportedLocales,
//           themeMode: ThemeMode.light,
//           theme: AawashTheme.lightTheme(context),
//           darkTheme: AawashTheme.darkTheme(context),
//         ),
//       ),
//     );
//   }
// }
