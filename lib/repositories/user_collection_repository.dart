import 'package:b_ball/constants/db_constants.dart';
import 'package:b_ball/models/custom_error.dart';
import 'package:b_ball/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserCollectionRepository {
  Future<User> getProfile({required String uid}) async {
    try {
      final DocumentSnapshot userDoc = await usersCollection.doc(uid).get();

      if (userDoc.exists) {
        final currentUser = User.fromDoc(userDoc);
        return currentUser;
      }
      throw 'User not found';
    } on FirebaseException catch (e) {
      throw CustomError(
        code: e.code,
        message: e.message ?? 'customMessage',
        plugin: e.plugin,
      );
    } catch (e) {
      throw CustomError(
        code: 'Exception',
        message: e.toString(),
        plugin: 'flutter_error/server_error',
      );
    }
  }

  Future<User> editProfileData({required String uid}) async {
    final DocumentSnapshot userDoc = await usersCollection.doc(uid).get();
    final currentUser = User.fromDoc(userDoc);
    await usersCollection.doc(userDoc.id).set({
      'name': 'test',
      'email': 'test',
      'profileImage': 'https://picsum.photos/300',
      'point': 0,
      'rank': 'bronze',
    });
    return currentUser;
  }
}
