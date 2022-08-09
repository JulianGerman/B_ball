import 'package:b_ball/constants/db_constants.dart';
import 'package:b_ball/firebase_options.dart';
import 'package:b_ball/models/custom_error.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb_auth;
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepository {
  final FirebaseFirestore firebaseFirestore;
  final fb_auth.FirebaseAuth firebaseAuth;

  AuthRepository({
    required this.firebaseFirestore,
    required this.firebaseAuth,
  });

  Stream<fb_auth.User?> get user => firebaseAuth.idTokenChanges();

  Future<void> signUpWithEmail({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      fb_auth.UserCredential userCredential =
          await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final signedInUser = userCredential.user!;

      await usersCollection.doc(signedInUser.uid).set({
        'name': name,
        'email': email,
        'profileImage': 'https://picsum.photos/300',
        'point': 0,
        'rank': 'bronze',
      });
    } on fb_auth.FirebaseAuthException catch (e) {
      throw CustomError(
        code: e.code,
        message: e.message ?? ' custom error msg!',
        plugin: e.plugin,
      );
    } catch (e) {
      throw CustomError(
        code: 'Exception',
        message: e.toString(),
        plugin: '/flutter_error',
      );
    }
  }

  Future<fb_auth.UserCredential> signInWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn(
      clientId: DefaultFirebaseOptions.currentPlatform.iosClientId,
    );
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final fb_auth.AuthCredential credential =
          fb_auth.GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      return await fb_auth.FirebaseAuth.instance
          .signInWithCredential(credential);
    } on fb_auth.FirebaseAuthException catch (e) {
      throw CustomError(
        code: e.code,
        message: e.message ?? ' custom error msg!',
        plugin: e.plugin,
      );
    } catch (e) {
      throw const CustomError(message: 'Try again!');
    }
  }

  Future<void> signInWithFacebook() async {
    //TODO: signUp with facebook
  }

  Future<void> signInWithGitHub() async {
    //TODO: signUp with GitHub
  }

  Future<void> signInWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on fb_auth.FirebaseAuthException catch (e) {
      throw CustomError(
        code: e.code,
        message: e.message ?? ' custom error msg!',
        plugin: e.plugin,
      );
    } catch (e) {
      throw CustomError(
        code: 'Exception',
        message: e.toString(),
        plugin: '/flutter_error',
      );
    }
  }

  Future<void> resetPassword({required String email}) async {
    try {
      await firebaseAuth.sendPasswordResetEmail(email: email);
    } on fb_auth.FirebaseAuthException catch (e) {
      throw CustomError(
        code: e.code,
        message: e.message ?? ' custom error msg!',
        plugin: e.plugin,
      );
    } catch (e) {
      throw CustomError(
        code: 'Exception',
        message: e.toString(),
        plugin: '/flutter_error',
      );
    }
  }

  Future<void> signOut() async {
    firebaseAuth.signOut();
  }
}
