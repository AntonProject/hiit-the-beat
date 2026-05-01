import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDmm8yKdpF2b67JbdymsxuRKw_GSqDE1Mo",
            authDomain: "breakletics-9245d.firebaseapp.com",
            projectId: "breakletics-9245d",
            storageBucket: "breakletics-9245d.appspot.com",
            messagingSenderId: "667560922120",
            appId: "1:667560922120:web:fbad381e26f76b5c5d95bd",
            measurementId: "G-G88PM5M4C4"));
  } else {
    await Firebase.initializeApp();
  }
}
