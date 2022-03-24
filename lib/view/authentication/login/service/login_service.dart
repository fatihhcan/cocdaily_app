/*import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
final FirebaseAuth _auth = FirebaseAuth.instance;
Future<User?> signIn(String email, String password) async {
try {
   UserCredential result = await _auth.signInWithEmailAndPassword(
email: email, password: password);
   User? user = result.user;
   return user;
 } catch (e) {
   print(e.toString());
 }
 return null;
}
signOut() async {
 return await _auth.signOut();
 }
}*/