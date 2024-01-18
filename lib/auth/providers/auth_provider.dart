import 'package:cipherx_expense_tracker_app/auth/models/user_model.dart';
import 'package:cipherx_expense_tracker_app/auth/repositories/auth_repository.dart';
import 'package:cipherx_expense_tracker_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class FireBaseAuthProvider with ChangeNotifier {
  final AuthRepository authRepository = GetIt.I.get<AuthRepository>();
  bool isAuthLoading = false;
  bool success = false;
  bool error = false;
  String errorMessage = '';
  String name = '', email = '', uid = '';

  Stream<User?> authStateChanges() {
    return authRepository.authStateChanges();
  }

  Future<void> signInWithGoogle() async {
    isAuthLoading = true;
    notifyListeners();
    final result = await authRepository.signUpInWithGoogle();
    isAuthLoading = false;

    result.fold(
      (l) {
        success = false;
        error = true;

        notifyListeners();
      },
      (r) {
        success = true;
        // notifyListeners();
        name = r.name;
        // notifyListeners();
        email = r.email;
        // notifyListeners();
        uid = r.uid;
        notifyListeners();
      },
    );
  }

  Future<Either<Failure, UserModel>> signInWithEmail(
      String email, String password) async {
    isAuthLoading = true;
    notifyListeners();
    final result = await authRepository.signIn(email, password);
    isAuthLoading = false;
    result.fold((l) {
      success = false;
      error = true;
      if (l is EmailAlreadyInUseFailure) {
        errorMessage = l.message;
      }

      if (l is WeekPasswordFailure) {
        errorMessage = l.message;
      }

      if (l is ServerFailure) {
        errorMessage = l.message;
      }

      if (l is UnknownFailure) {
        errorMessage = l.message;
      }

      if (l is NetworkFailure) {
        errorMessage = l.message;
      }

      notifyListeners();
    }, (r) {
      success = true;
      // notifyListeners();
      name = r.name;
      // notifyListeners();
      email = r.email;
      // notifyListeners();
      uid = r.uid;
      notifyListeners();
    });
    return result;
  }

  Future<void> signUpWithEmail(
      String email, String password, String name) async {
    error = false;
    isAuthLoading = true;
    notifyListeners();

    final result = await authRepository.signUp(email, password, name);

    isAuthLoading = false;

    notifyListeners();

    // success = true;
    // notifyListeners();

    result.fold(
      (l) {
        success = false;
        error = true;
        if (l is EmailAlreadyInUseFailure) {
          errorMessage = l.message;
        }

        if (l is WeekPasswordFailure) {
          errorMessage = l.message;
        }

        if (l is ServerFailure) {
          errorMessage = l.message;
        }

        if (l is UnknownFailure) {
          errorMessage = l.message;
        }

        if (l is NetworkFailure) {
          errorMessage = l.message;
        }

        notifyListeners();
      },
      (r) {
        print(
            '------------------------------------------------<>>>>>>>>>>> right');
        success = true;
        // name = r.name;
        // email = r.email;
        // uid = r.uid;
        notifyListeners();
      },
    );
  }
}
