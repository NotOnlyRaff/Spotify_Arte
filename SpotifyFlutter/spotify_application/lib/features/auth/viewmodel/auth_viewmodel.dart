<<<<<<< HEAD
import 'package:spotify_application/core/constants/server_constant.dart';
import 'package:spotify_application/core/failure/failure.dart';
import 'package:spotify_application/core/provider/current_user_notifier.dart';
import 'package:spotify_application/features/auth/model/user_model.dart';
import 'dart:convert';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:spotify_application/features/auth/repositories/auth_local_repository.dart';
=======
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:spotify_application/features/auth/model/user_model.dart';
>>>>>>> 9fd35c0c4a2b4deb3ae87a1856808fa7d748a5cf
import 'package:spotify_application/features/auth/repositories/auth_remote_repository.dart';

part 'auth_viewmodel.g.dart';

@riverpod
class AuthViewModel extends _$AuthViewModel {
<<<<<<< HEAD
  late AuthRemoteRepository _authRemoteRepository;
  late AuthLocalRepository _authLocalRepository;
  late CurrentUserNotifier _currentUserNotifier;

  
  @override
  AsyncValue<UserModel>? build() {
    _authRemoteRepository = ref.watch(authRemoteRepositoryProvider);
    _authLocalRepository = ref.watch(authLocalRepositoryProvider);
    _currentUserNotifier = ref.watch(currentUserNotifierProvider.notifier);
    return null;
  }

  Future<void> initSharedPreferences() async {
    await _authLocalRepository.init();
=======
  final AuthRemoteRepository _authRemoteRepository = AuthRemoteRepository();

  @override
  AsyncValue<UserModel> build() {
    return const AsyncValue.loading();
>>>>>>> 9fd35c0c4a2b4deb3ae87a1856808fa7d748a5cf
  }

  Future<void> signUpUser({
    required String name,
    required String email,
    required String password,
  }) async {
    state = const AsyncValue.loading();
    final res = await _authRemoteRepository.signup(
      name: name,
      email: email,
      password: password,
    );
<<<<<<< HEAD

    final val = switch (res) {
      Left(value: final l) => state = AsyncValue.error(
          l.message,
          StackTrace.current,
        ),
      Right(value: final r) => state = AsyncValue.data(r),
=======
    final val = switch (res) {
      Left(value: final l) => state = AsyncValue.error(
        l.message,
        StackTrace.current,
      ), //Error case

      Right(value: final r) => state = AsyncValue.data(r), //Success case
      _ => null, // Handles any other type
>>>>>>> 9fd35c0c4a2b4deb3ae87a1856808fa7d748a5cf
    };
    print(val);
  }

  Future<void> loginUser({
<<<<<<< HEAD
=======
    required String name,
>>>>>>> 9fd35c0c4a2b4deb3ae87a1856808fa7d748a5cf
    required String email,
    required String password,
  }) async {
    state = const AsyncValue.loading();
    final res = await _authRemoteRepository.login(
      email: email,
      password: password,
    );
<<<<<<< HEAD

    final val = switch (res) {
      Left(value: final l) => state = AsyncValue.error(
          l.message,
          StackTrace.current,
        ),
      Right(value: final r) => _loginSuccess(r),
    };
    print(val);
  }

  AsyncValue<UserModel>? _loginSuccess(UserModel user) {
    _authLocalRepository.setToken(user.token);
    _currentUserNotifier.addUser(user);
    return state = AsyncValue.data(user);
  }

  Future<UserModel?> getData() async {
    state = const AsyncValue.loading();
    final token = _authLocalRepository.getToken();

    if (token != null) {
      final res = await _authRemoteRepository.getCurrentUserData(token);
      final val = switch (res) {
        Left(value: final l) => state = AsyncValue.error(
            l.message,
            StackTrace.current,
          ),
        Right(value: final r) => _getDataSuccess(r),
      };

      return val.value;
    }

    return null;
  }

  AsyncValue<UserModel> _getDataSuccess(UserModel user) {
    return state = AsyncValue.data(user);
=======
    final val = switch (res) {
      Left(value: final l) => state = AsyncValue.error(
        l.message,
        StackTrace.current,
      ), //Error case

      Right(value: final r) => state = AsyncValue.data(r), //Success case
      _ => null, // Handles any other type
    };
    print(val);
>>>>>>> 9fd35c0c4a2b4deb3ae87a1856808fa7d748a5cf
  }
}
