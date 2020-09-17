import 'package:firebase_auth/firebase_auth.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:inventory_app/login/firebase_auth_api.dart';

class UserBloc implements Bloc{

  final _firebaseAuthAPI = FireBaseAuthAPI();

  Stream<FirebaseUser> streamFirebase = FirebaseAuth.instance.onAuthStateChanged;
  Stream<FirebaseUser> get authStatus => streamFirebase;

  Future<FirebaseUser> signInFirebase() => _firebaseAuthAPI.signInGoogle();

  Future<FirebaseUser> signInEmailPassword(String email, String password){
    return _firebaseAuthAPI.emailAndPasswordSignIn(email, password);
  }

  Future<FirebaseUser> createWithEmailPassword(String email, String password){
    return _firebaseAuthAPI.emailAndPasswordCreate(email, password);
  }

  Future<FirebaseUser> signInGoogle(){
    return signInFirebase();
  }

  Future<FirebaseUser> signInWithEmailAndPassword(String email, String password){
    return signInEmailPassword(email, password);
  }

  Future<FirebaseUser> createWithEmail(String email, String password){
    return createWithEmailPassword(email, password);
  }

  signOut(){
    _firebaseAuthAPI.signOut();
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }

}




