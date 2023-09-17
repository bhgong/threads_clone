import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  bool get isLoggedIn => user != null;

  User? get user => _firebaseAuth.currentUser;
}

final authRepo = Provider((ref) => AuthenticationRepository());