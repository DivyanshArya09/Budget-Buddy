import 'package:cipherx_expense_tracker_app/auth/providers/auth_provider.dart';
import 'package:cipherx_expense_tracker_app/auth/screens/login_page/widgets/login_form.dart';
import 'package:cipherx_expense_tracker_app/auth/screens/sign_up_page/sign_up_page.dart';
import 'package:cipherx_expense_tracker_app/auth/screens/sign_up_page/widgets/sign_up_form.dart';
import 'package:cipherx_expense_tracker_app/auth/screens/sign_up_page/widgets/sign_up_with_google_button.dart';
import 'package:cipherx_expense_tracker_app/auth/screens/sign_up_page/widgets/term_and_conditions.dart';
import 'package:cipherx_expense_tracker_app/home/pages/home_page.dart';
import 'package:cipherx_expense_tracker_app/settings/sample.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final GlobalKey<FormState> formKey;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    formKey = GlobalKey<FormState>();
    context.read<FireBaseAuthProvider>().success = false;
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
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
          'Login',
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
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const Logout(),
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
                    LoginForm(
                      formKey: formKey,
                      emailController: emailController,
                      passwordController: passwordController,
                    ),
                    SizedBox(
                      height: 18.h,
                    ),
                    // const TermsAndConditions(),
                    SizedBox(
                      height: 20.h,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          authProvider.signInWithEmail(
                            emailController.text,
                            passwordController.text,
                          );
                        }
                      },
                      child: const Text('Login'),
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
                    SignUpWithGoogleButton(
                      onTap: () {
                        authProvider.signInWithGoogle();
                      },
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don\'t have an account?',
                          style: GoogleFonts.inter(
                              textStyle: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: const Color.fromRGBO(145, 145, 159, 1),
                          )),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const SignUpPage(),
                              ),
                            );
                          },
                          child: Text(
                            'Sign Up',
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
