import 'package:cook_cook/core/services/authentication_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'authentication_service_test.mocks.dart';

@GenerateMocks([
  FirebaseAuth,
  GoogleSignIn,
  User,
  GoogleSignInAccount,
  GoogleSignInAuthentication,
  UserCredential,
])
main() {
  late FirebaseAuth firebaseAuth;
  late GoogleSignIn googleSignIn;
  late MockUser mockUser;
  late UserCredential mockUserCredential;
  late AuthenticationService authenticationService;

  setUp(() {
    firebaseAuth = MockFirebaseAuth();
    googleSignIn = MockGoogleSignIn();
    mockUser = MockUser();
    mockUserCredential = MockUserCredential();

    authenticationService = AuthenticationService(
      firebaseAuth: firebaseAuth,
      googleSignIn: googleSignIn,
    );
  });

  group('AuthenticationService.authStateChanges', () {
    test('should changed user', () async {
      when(firebaseAuth.authStateChanges()).thenAnswer(
        (_) => Stream.fromIterable([mockUser, mockUser]),
      );

      authenticationService.authStateChanges.listen(expectAsync1(
        (event) {
          expect(event, isA<MockUser>());
        },
        count: 2,
      ));
    });
  });

  group('AuthenticationService.signInWithGoogle', () {
    test('should failure signIn', () async {
      expect(
        authenticationService.signInWithGoogle(),
        throwsA(isException),
      );
    });

    test('should success signIn', () async {
      final googleSignInAccount = MockGoogleSignInAccount();
      final googleSignInAuthentication = MockGoogleSignInAuthentication();

      when(googleSignIn.signIn()).thenAnswer(
        (_) => Future.value(googleSignInAccount),
      );
      when(googleSignInAccount.authentication).thenAnswer(
        (_) => Future.value(googleSignInAuthentication),
      );
      when(googleSignInAuthentication.idToken).thenReturn('googleIdToken');
      when(googleSignInAuthentication.accessToken)
          .thenReturn('googleAccessToken');

      when(firebaseAuth.signInWithCredential(any as AuthCredential))
          .thenAnswer((_) => Future.value(mockUserCredential));

      when(mockUser.uid).thenReturn('uid');
      when(mockUser.email).thenReturn('user_email');
      when(mockUser.displayName).thenReturn('displayName');
      when(mockUser.photoURL).thenReturn('photoURL');
      when(mockUser.phoneNumber).thenReturn('phoneNumber');
      when(mockUser.isAnonymous).thenReturn(false);
      when(mockUserCredential.user).thenReturn(mockUser);

      final result = await authenticationService.signInWithGoogle();

      expect(result?.uid, isNotNull);
      expect(result?.uid, isNotEmpty);
      expect(result?.email, 'user_email');
      expect(result?.displayName, 'displayName');
      expect(result?.photoURL, 'photoURL');
      expect(result?.phoneNumber, 'phoneNumber');
      expect(result?.isAnonymous, isFalse);
    });
  });

  group('AuthenticationService.signInWithEmailAndPassword', () {
    test('should success signIn with email and password', () async {
      when(firebaseAuth.signInWithEmailAndPassword(
        email: argThat(isNotNull, named: 'email') as String,
        password: argThat(isNotNull, named: 'password') as String,
      )).thenAnswer((_) => Future.value(mockUserCredential));
      when(mockUserCredential.user).thenReturn(mockUser);

      await authenticationService.signInWithEmailAndPassword(
        'dan@dan.ru',
        'dan1234',
      );

      verify(firebaseAuth.signInWithEmailAndPassword(
        email: 'dan@dan.ru',
        password: 'dan1234',
      )).called(1);
    });
  });

  group('AuthenticationService.createUserWithEmailAndPassword', () {
    test('should user be null', () async {
      when(firebaseAuth.createUserWithEmailAndPassword(
        email: argThat(isNotNull, named: 'email') as String,
        password: argThat(isNotNull, named: 'password') as String,
      )).thenAnswer((_) => Future.value(mockUserCredential));
      when(mockUserCredential.user).thenReturn(null);

      final result = await authenticationService.createUserWithEmailAndPassword(
        'dan@dan.ru',
        'dan1234',
      );

      verify(firebaseAuth.createUserWithEmailAndPassword(
        email: 'dan@dan.ru',
        password: 'dan1234',
      )).called(1);

      expect(result, null);
    });

    test('should success created user', () async {
      when(mockUser.uid).thenReturn('uid');
      when(mockUser.email).thenReturn('user_email');
      when(mockUser.displayName).thenReturn('displayName');
      when(mockUser.photoURL).thenReturn('photoURL');
      when(mockUser.phoneNumber).thenReturn('phoneNumber');
      when(mockUser.isAnonymous).thenReturn(false);
      when(mockUserCredential.user).thenReturn(mockUser);

      when(firebaseAuth.createUserWithEmailAndPassword(
        email: argThat(isNotNull, named: 'email') as String,
        password: argThat(isNotNull, named: 'password') as String,
      )).thenAnswer((_) => Future.value(mockUserCredential));

      final result = await authenticationService.createUserWithEmailAndPassword(
        'dan@dan.ru',
        'dan1234',
      );

      verify(firebaseAuth.createUserWithEmailAndPassword(
        email: 'dan@dan.ru',
        password: 'dan1234',
      )).called(1);

      expect(result?.uid, isNotNull);
      expect(result?.uid, isNotEmpty);
      expect(result?.email, 'user_email');
      expect(result?.displayName, 'displayName');
      expect(result?.photoURL, 'photoURL');
      expect(result?.phoneNumber, 'phoneNumber');
      expect(result?.isAnonymous, isFalse);
    });
  });

  group('AuthenticationService.signOut', () {
    test('should be success', () async {
      await authenticationService.signOut();

      verify(firebaseAuth.signOut()).called(1);
      verify(googleSignIn.signOut()).called(1);
    });

    test('should be firebaseAuth exception', () async {
      when(firebaseAuth.signOut()).thenThrow(Exception());

      await authenticationService.signOut();

      verify(firebaseAuth.signOut()).called(1);
      verifyNever(googleSignIn.signOut());
    });

    test('should be googleSignIn exception', () async {
      when(googleSignIn.signOut()).thenThrow(Exception());

      await authenticationService.signOut();

      verify(firebaseAuth.signOut()).called(1);
      verify(googleSignIn.signOut()).called(1);
    });
  });
}
