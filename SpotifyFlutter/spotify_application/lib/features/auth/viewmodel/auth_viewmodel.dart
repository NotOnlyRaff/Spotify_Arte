import 'package:flutter_riverpod/flutter_riverpod.dart';

class Notifier extends StateNotifier<void> {
  Notifier() : super(null);

  void build() {
    // This method can be overridden by subclasses to implement specific build logic.
  }
}



class AuthViewmodel extends Notifier{
  @override
  build() {
  
    throw UnimplementedError();
  }
}