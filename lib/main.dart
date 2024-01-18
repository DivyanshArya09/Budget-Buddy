import 'package:cipherx_expense_tracker_app/auth/providers/auth_provider.dart';
import 'package:cipherx_expense_tracker_app/auth/providers/check_box_toggler.dart';
import 'package:cipherx_expense_tracker_app/auth/providers/password_toggler.dart';
import 'package:cipherx_expense_tracker_app/auth/screens/login_page/login_page.dart';
import 'package:cipherx_expense_tracker_app/auth/screens/sign_up_page/sign_up_page.dart';
import 'package:cipherx_expense_tracker_app/auth_gate/auth_provider/auth_provider.dart';
import 'package:cipherx_expense_tracker_app/firebase_options.dart';
import 'package:cipherx_expense_tracker_app/home/pages/expense_page.dart';
import 'package:cipherx_expense_tracker_app/home/pages/home_page.dart';
import 'package:cipherx_expense_tracker_app/home/providers/category_drop_down_menu_provider.dart';
import 'package:cipherx_expense_tracker_app/home/providers/home_provider.dart';
import 'package:cipherx_expense_tracker_app/home/providers/wallet_drop_down_menu_provider.dart';
import 'package:cipherx_expense_tracker_app/splash_screen/splash_screen.dart';
import 'package:cipherx_expense_tracker_app/utils/themes/app_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PassWordToggler()),
        ChangeNotifierProvider(create: (_) => CheckBoxToggler()),
        ChangeNotifierProvider(create: (_) => FireBaseAuthProvider()),
        ChangeNotifierProvider(create: (_) => AuthGateProvider()),
        ChangeNotifierProvider(create: (_) => CategoryDropDownProvider()),
        ChangeNotifierProvider(create: (_) => WalletDropDownProvider()),
        ChangeNotifierProvider(create: (_) => HomeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 824),
      minTextAdapt: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: AppTheme.lightTheme,
          home: const HomePage(
            name: '',
            email: '',
          ),
          // home: const SignUpPage(),
        );
      },
    );
  }
}
