import 'package:cook_cook/core/errors/error_exceprions.dart';
import 'package:cook_cook/core/services/logger.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@LazySingleton()
class AuthenticationService {
  late Logger _logger;
  late FirebaseAuth _firebaseAuth;
  late GoogleSignIn _googleSignIn;

  AuthenticationService({
    Logger? logger,
    FirebaseAuth? firebaseAuth,
    GoogleSignIn? googleSignIn,
  })  : _logger =
            logger ?? LoggerService().createLogger('AuthenticationService'),
        _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
        _googleSignIn = googleSignIn ?? GoogleSignIn();

  /// needed for check auth state (sign-in or sign-out)
  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<User?> signInWithGoogle() {
    return _getGoogleSignInCredential.then(_signInWithAuthCredential);
  }

  Future<OAuthCredential> get _getGoogleSignInCredential async {
    try {
      final googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        throw AuthAbortException('auth-abort-exception');
      }

      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      return credential;
    } catch (e) {
      throw AuthErrorException('getGoogleSignInCredential', e);
    }
  }

  Future<User?> signInWithEmailAndPassword(String email, String password) {
    return _handleCredentials(
      _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      ),
    );
  }

  Future<User?> createUserWithEmailAndPassword(String email, String password) {
    return _handleCredentials(
      _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      ),
    );
  }

  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
      await _googleSignIn.signOut();
    } catch (e, stack) {
      _logger.e('signOut failed', e, stack);
    }
  }

  // helpers
  Future<User?> _signInWithAuthCredential(AuthCredential credential) {
    return _handleCredentials(_firebaseAuth.signInWithCredential(credential));
  }

  Future<User?> _handleCredentials(Future<UserCredential> future) async {
    try {
      final userCredential = await future;

      return userCredential.user;
    } on FirebaseException catch (e) {
      if (e.code == 'user-not-found') {
        throw UserNotFoundException(e.message);
      } else if (e.code == 'email-already-in-use') {
        throw EmailInUseException(e.message);
      } else if (e.code == 'invalid-email') {
        throw InvalidEmailException(e.message);
      } else if (e.code == 'wrong-password') {
        throw WrongPasswordException(e.message);
      } else {
        throw AuthErrorException(e.message, e);
      }
    } catch (e) {
      throw AuthErrorException('handleUserCredentials failed', e);
    }
  }
}
