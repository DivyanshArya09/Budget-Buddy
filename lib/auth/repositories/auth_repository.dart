import 'package:cipherx_expense_tracker_app/auth/models/user_model.dart';
import 'package:cipherx_expense_tracker_app/auth/services/local/local_data_sources.dart';
import 'package:cipherx_expense_tracker_app/auth/services/remote/remote_data_sources.dart';
import 'package:cipherx_expense_tracker_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;
  final LocalDataSource localDataSource;

  AuthRepository({
    required this.authRemoteDataSource,
    required this.localDataSource,
  });
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Stream<User?> authStateChanges() {
    return firebaseAuth.authStateChanges();
  }

  //! Sign up
  Future<Either<Failure, UserModel>> signUp(
      String email, String password, String name) async {
    try {
      //! Signing in the user
      final userCredential = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      //! Checking if user is null
      if (userCredential.user == null) {
        throw Exception();
      }

      //! Saving user
      UserModel userModel = UserModel(
        name: name,
        email: userCredential.user!.email!,
        uid: userCredential.user!.uid,
      );

      //! Saving user to fireStore
      await authRemoteDataSource.saveUser(userModel, userCredential.user!.uid);

      //! adding initial income values
      await authRemoteDataSource.addInitialIncome(userCredential.user!.uid);

      //! Saving user to local storage
      await localDataSource.saveUser(userModel);

      //! Saving user to local storage
      await localDataSource.setIsNewUser();

      //! Returning user
      return Right(userModel);

      //! Exception handling
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print(
            '----------------------------------------------------#######----> error weak password ${e.toString()}');
        return Left(
          WeekPasswordFailure(
            message: 'The password provided is too weak.',
          ),
        );
      } else if (e.code == 'email-already-in-use') {
        print(
            '----------------------------------------------------#######----> error alredy userd ${e.toString()}');

        return Left(
          EmailAlreadyInUseFailure(
            message: 'The account already exists for that email.',
          ),
        );
      } else {
        return Left(
          UnknownFailure(
            message: e.toString(),
          ),
        );
      }
    } catch (e) {
      print(
          '----------------------------------------------------#######----> error sjdbabufibeaufbajfb ${e.toString()}');
      return Left(
        UnknownFailure(
          message: e.toString(),
        ),
      );
    }

    //! In case nothing runs then it will return this
  }

  //* Sign in
  Future<Either<Failure, UserModel>> signIn(
      String email, String password) async {
    //! Signing in the user
    try {
      final userCredential = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      //! Checking if user is null
      if (userCredential.user == null) {
        throw Exception();
      }
      final uid = userCredential.user?.uid;

      if (uid == null) {
        throw Exception();
      }

      //! getting user from the firestore
      UserModel userModel = await authRemoteDataSource.getUser(uid.toString());

      //! Saving user to local storage
      await localDataSource.saveUser(userModel);

      await localDataSource.setIsNewUser();

      //! Returning user
      return Right(userModel);

      //! Exception handling
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return Left(
          UnknownFailure(
            message: 'No user found for that email.',
          ),
        );
      } else if (e.code == 'wrong-password') {
        return Left(
          UnknownFailure(
            message: 'Wrong password provided for that user.',
          ),
        );
      }
    } catch (e) {
      return Left(
        UnknownFailure(
          message: e.toString(),
        ),
      );
    }

    //! In case nothing runs then it will return this
    return Left(
      UnknownFailure(
        message: 'Something went wrong. Please try again later.',
      ),
    );
  }

  Future<void> signOut() async {
    await firebaseAuth.signOut();
    await localDataSource.deleteUser();
  }

  Future<Either<Failure, UserModel>> signUpInWithGoogle() async {
    try {
      final googleAccount = await GoogleSignIn().signIn();
      final googleAuth = await googleAccount!.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userCredential =
          await firebaseAuth.signInWithCredential(credential);

      if (userCredential.user == null) {
        throw Exception('User is null');
      }

      final uid = userCredential.user!.uid;

      UserModel userModel = UserModel(
          email: userCredential.user!.email!,
          uid: uid,
          name: userCredential.user!.displayName!);

      await authRemoteDataSource.saveUser(userModel, uid);
      await localDataSource.saveUser(userModel);
      return Right(userModel);
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }
}
