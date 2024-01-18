import 'package:cipherx_expense_tracker_app/auth/providers/auth_provider.dart';
import 'package:cipherx_expense_tracker_app/auth/screens/login_page/login_page.dart';
import 'package:cipherx_expense_tracker_app/auth/screens/sign_up_page/widgets/sign_up_form.dart';
import 'package:cipherx_expense_tracker_app/auth/screens/sign_up_page/widgets/sign_up_with_google_button.dart';
import 'package:cipherx_expense_tracker_app/auth/screens/sign_up_page/widgets/term_and_conditions.dart';
import 'package:cipherx_expense_tracker_app/home/pages/home_page.dart';
import 'package:cipherx_expense_tracker_app/settings/sample.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late final TextEditingController nameController;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final GlobalKey<FormState> formKey;

  @override
  void initState() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    context.read<FireBaseAuthProvider>().error ? showError() : null;
  }

  void showError() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(context.read<FireBaseAuthProvider>().errorMessage),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back),
        ),
        elevation: 0,
        title: Text(
          'Sign Up',
          style: GoogleFonts.inter(
            textStyle: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: const Color.fromRGBO(33, 35, 37, 1),
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Consumer<FireBaseAuthProvider>(
          builder: (context, authProvider, child) {
            if (authProvider.success) {
              Future.delayed(
                Duration.zero,
                () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const Logout(),
                      // builder: (context) => HomePage(
                      //   name: nameController.text,
                      //   email: emailController.text,
                      // ),
                    ),
                  );
                },
              );
            }

            if (authProvider.error) {
              WidgetsBinding.instance.addPostFrameCallback(
                (_) => ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(authProvider.errorMessage),
                  ),
                ),
              );
            }

            if (authProvider.isAuthLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (!authProvider.success) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 56.h,
                    ),
                    SignUpForm(
                      formKey: formKey,
                      nameController: nameController,
                      emailController: emailController,
                      passwordController: passwordController,
                    ),
                    SizedBox(
                      height: 18.h,
                    ),
                    const TermsAndConditions(),
                    SizedBox(
                      height: 20.h,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          authProvider.signUpWithEmail(
                            emailController.text,
                            passwordController.text,
                            nameController.text,
                          );
                        }
                      },
                      child: const Text('Sign Up'),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      'Or with',
                      style: GoogleFonts.inter(
                        textStyle: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                          color: const Color.fromRGBO(145, 145, 159, 1),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    SignUpWithGoogleButton(onTap: () {
                      authProvider.signInWithGoogle();
                    }),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account?',
                          style: GoogleFonts.inter(
                            textStyle: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: const Color.fromRGBO(145, 145, 159, 1),
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const LoginPage(),
                              ),
                            );
                          },
                          child: Text(
                            'Login',
                            style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                decoration: TextDecoration.underline,
                                decorationColor:
                                    const Color.fromRGBO(127, 61, 255, 1),
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                color: const Color.fromRGBO(127, 61, 255, 1),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
