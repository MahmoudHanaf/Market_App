import 'package:firebase_auth/firebase_auth.dart';
import 'package:market_1_app/features/Auth/domain/repositry/auth_repo.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepoImpl extends AuthRepo
{
  @override
  Future completeInformation({required String ?namer, required String ?phone, required String ?address}) {
   
    throw UnimplementedError();
  }

  @override
  Future loginWithFacebook() {
   
    throw UnimplementedError();
  }

  @override
  Future loginWithGoogle() {
    Future<UserCredential> signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(credential);
}

    throw UnimplementedError();
  }

}