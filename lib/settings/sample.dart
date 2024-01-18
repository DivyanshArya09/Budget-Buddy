import 'package:cipherx_expense_tracker_app/auth/repositories/auth_repository.dart';
import 'package:cipherx_expense_tracker_app/auth/screens/login_page/login_page.dart';
import 'package:cipherx_expense_tracker_app/auth/screens/sign_up_page/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class Logout extends StatelessWidget {
  const Logout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () async {
              await GetIt.I
                  .get<AuthRepository>()
                  .signOut()
                  .then((value) => Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                      (_) => false));
            },
            child: const Text('Logout')),
      ),
    );
  }
}
