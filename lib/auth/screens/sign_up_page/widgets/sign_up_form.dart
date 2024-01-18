import 'package:cipherx_expense_tracker_app/auth/screens/sign_up_page/widgets/password_text_field.dart';
import 'package:flutter/material.dart';

class SignUpForm extends StatelessWidget {
  final TextEditingController nameController,
      emailController,
      passwordController;
  final GlobalKey<FormState> formKey;
  const SignUpForm(
      {super.key,
      required this.formKey,
      required this.nameController,
      required this.emailController,
      required this.passwordController});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFormField(
            controller: nameController,
            validator: (val) {
              if (val == null || val.isEmpty) {
                return 'Please enter name';
              }
              return null;
            },
            decoration: const InputDecoration(
              hintText: 'Name',
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          TextFormField(
            controller: emailController,
            validator: (val) {
              if (val == null || val.isEmpty) {
                return 'Please enter email';
              }
              return null;
            },
            decoration: const InputDecoration(
              hintText: 'Email',
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          PassWordFormField(passwordController: passwordController),
        ],
      ),
    );
  }
}
