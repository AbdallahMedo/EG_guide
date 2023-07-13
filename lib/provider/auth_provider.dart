import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

enum AuthStatus{unAuthenticated,authenticating,authenticated}
class AuthProvider with ChangeNotifier{
  FirebaseAuth? _auth ;
  User?     _user ;
  AuthStatus? _authStatus = AuthStatus.unAuthenticated;
  String? errorMessage ;

  AuthProvider(){
    _auth = FirebaseAuth.instance;
     _auth?.authStateChanges().listen((User? user) {
      if(user== null){
        _authStatus = AuthStatus.unAuthenticated;
      }else{
        _user = user;
        _authStatus = AuthStatus.authenticated;

      }
      notifyListeners();
    });


  }

  AuthStatus? get authStatus => _authStatus ;
  User? get user => _user;



  Future<bool?> login(String? email , String? password) async{
    try {
      UserCredential? credential =
      await _auth?.signInWithEmailAndPassword(
          email: email!,
          password: password!,

      );
      _authStatus = AuthStatus.authenticating;
      notifyListeners();
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        Fluttertoast.showToast(
            msg: 'User Not Found',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            textColor: Colors.white,
            fontSize: 16.0,
          backgroundColor: Colors.lightBlueAccent,
        );
      } else if (e.code == 'wrong-password') {
        Fluttertoast.showToast(
            msg: 'Wrong Password!!',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            textColor: Colors.white,
            backgroundColor: Colors.lightBlueAccent,
            fontSize: 16.0);
      }
      notifyListeners();
      return false;

    }


  }

  logout() async{
    await _auth?.signOut();
    _authStatus = AuthStatus.unAuthenticated;
    notifyListeners();
  }
 Future <bool?> signup(String? email ,String? password,String? name)async{
  try{
    UserCredential? credential=
    await _auth?.createUserWithEmailAndPassword(
      email: email!,
      password: password!,
    );
    _authStatus = AuthStatus.authenticated;
    notifyListeners();

   // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
    Fluttertoast.showToast(
        msg: 'Registered Successfully',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        textColor: Colors.white,
        backgroundColor: Colors.lightBlueAccent,
        fontSize: 16.0
    );
    notifyListeners();
    return true;
  }on FirebaseAuthException catch(e){
    if(e.code=="weak-password"){
      Fluttertoast.showToast(
          msg: 'Password shoud be at least 6 digits',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          textColor: Colors.white,
          backgroundColor: Colors.lightBlueAccent,
          fontSize: 16.0
      );
    }else if(e.code=='email-already-in-use'){
      Fluttertoast.showToast(
          msg: 'Email already exists',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          textColor: Colors.white,
          backgroundColor: Colors.lightBlueAccent,
          fontSize: 16.0
      );
    }else if(e.code=='invalid-email'){
      Fluttertoast.showToast(
          msg: 'Invalid Email',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          textColor: Colors.white,
          backgroundColor: Colors.lightBlueAccent,
          fontSize: 16.0
      );
      notifyListeners();
      return false;
    }
  }
}

}