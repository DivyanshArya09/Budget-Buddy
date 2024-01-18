import 'package:cipherx_expense_tracker_app/auth/screens/login_page/login_page.dart';
import 'package:cipherx_expense_tracker_app/auth/services/local/local_data_sources.dart';
import 'package:cipherx_expense_tracker_app/auth_gate/auth_provider/auth_provider.dart';
import 'package:cipherx_expense_tracker_app/getStarted/get_started_page.dart';
import 'package:cipherx_expense_tracker_app/settings/sample.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

class AuthGate extends StatefulWidget {
  const AuthGate({super.key});

  @override
  State<AuthGate> createState() => _AuthGateState();
}

class _AuthGateState extends State<AuthGate> {
  @override
  void initState() {
    final authGateProvider =
        Provider.of<AuthGateProvider>(context, listen: false);
    authGateProvider.setFirstTime();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthGateProvider>(
      builder: (_, ref, __) {
        print(
            '--------------------------------------------------------------->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> ${ref.isFirstTime}');
        if (ref.isFirstTime) {
          return const GetStartedPage();
        } else {
          return FutureBuilder(
            future: GetIt.I.get<LocalDataSource>().getUser(),
            builder: (_, snapshot) {
              if (snapshot.hasData) {
                return const Logout();
              } else if (snapshot.data == null) {
                return const LoginPage();
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          );
        }
      },
    );
  }
}
