abstract class AuthRepo
{
  Future loginWithGoogle ();
  Future loginWithFacebook ();
  Future completeInformation({
    required String namer ,
    required String phone,
    required String address
  });
}