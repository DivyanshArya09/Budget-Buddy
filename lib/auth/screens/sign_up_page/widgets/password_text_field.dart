import 'package:cipherx_expense_tracker_app/auth/providers/password_toggler.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PassWordFormField extends StatelessWidget {
  final TextEditingController passwordController;
  const PassWordFormField({super.key, required this.passwordController});

  @override
  Widget build(BuildContext context) {
    return Consumer<PassWordToggler>(
        builder: (context, PassWordToggler passWordToggler, child) {
      print('--------------------> only password builds');
      return TextFormField(
        controller: passwordController,
        validator: (val) {
          if (val == null || val.isEmpty) {
            return 'Please enter password';
          }
          return null;
        },
        obscureText: passWordToggler.obscureText,
        decoration: InputDecoration(
          hintText: 'Password',
          suffixIcon: IconButton(
            onPressed: passWordToggler.toggleObscureText,
            icon: passWordToggler.obscureText
                ? const Icon(Icons.visibility_off)
                : const Icon(Icons.remove_red_eye),
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        ),
      );
    });
  }
}
