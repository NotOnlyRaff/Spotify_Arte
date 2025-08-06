import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:spotify_application/features/auth/model/user_model.dart';

part 'current_user_notifier.g.dart';

@Riverpod(keepAlive: true)
class CurrentUserNotifier extends _$CurrentUserNotifier {
  @override
  UserModel? build() {
    // Initialize the current user state
    return null; // This can be replaced with actual user data retrieval logic
  }

  void addUser(UserModel user) {
    // Update the current user state with the provided user data
    state = user;
  }


}
