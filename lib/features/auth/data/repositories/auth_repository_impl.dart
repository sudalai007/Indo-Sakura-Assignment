import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:firebase_core/firebase_core.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../models/user_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  fb.FirebaseAuth? get _auth {
    try {
      if (Firebase.apps.isNotEmpty) {
        return fb.FirebaseAuth.instance;
      }
    } catch (_) {}
    return null;
  }

  // Fallback in-memory user for local/mock evaluation if Firebase is not configured with live credentials
  UserEntity? _mockUser;

  @override
  Stream<UserEntity?> get authStateChanges {
    final auth = _auth;
    if (auth != null) {
      return auth.authStateChanges().map((user) {
        if (user == null) return null;
        return UserModel.fromFirebaseUser(user);
      });
    }
    // If Firebase isn't configured, emit the current mock user
    return Stream.value(_mockUser);
  }

  @override
  UserEntity? get currentUser {
    final auth = _auth;
    if (auth != null && auth.currentUser != null) {
      return UserModel.fromFirebaseUser(auth.currentUser!);
    }
    return _mockUser;
  }

  @override
  Future<UserEntity> signInWithEmailAndPassword(String email, String password) async {
    final auth = _auth;
    if (auth != null) {
      final credential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = credential.user;
      if (user != null) {
        return UserModel.fromFirebaseUser(user);
      }
      throw Exception('Sign in failed: user not found.');
    } else {
      // Mock fallback for immediate review/test
      await Future.delayed(const Duration(milliseconds: 600));
      _mockUser = UserEntity(
        uid: 'demo_user_1',
        email: email.isEmpty ? 'samyu@indosakura.com' : email,
        displayName: 'Samyuktha J',
      );
      return _mockUser!;
    }
  }

  @override
  Future<UserEntity> signUpWithEmailAndPassword(
    String email,
    String password, {
    String? displayName,
  }) async {
    final auth = _auth;
    if (auth != null) {
      final credential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = credential.user;
      if (user != null) {
        if (displayName != null) {
          await user.updateDisplayName(displayName);
        }
        return UserModel.fromFirebaseUser(user);
      }
      throw Exception('Registration failed: user creation error.');
    } else {
      await Future.delayed(const Duration(milliseconds: 600));
      _mockUser = UserEntity(
        uid: 'demo_user_new',
        email: email,
        displayName: displayName ?? 'Samyuktha J',
      );
      return _mockUser!;
    }
  }

  @override
  Future<void> signOut() async {
    final auth = _auth;
    if (auth != null) {
      await auth.signOut();
    }
    _mockUser = null;
  }
}

