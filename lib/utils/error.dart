import 'package:exaa_2/utils/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Error {
  static String message(dynamic error) {
    String? errorMsg;

    if (error is FirebaseException) {
      FirebaseException firebaseError = error;
      errorMsg = Constants.firebaseErrorMsgs[firebaseError.code];
    }

    return errorMsg ?? error.toString();
  }
}