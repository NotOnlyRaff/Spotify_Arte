// ignore_for_file: public_member_api_docs, sort_constructors_first
class AppFailure {
  final String message;
  AppFailure([this.message = 'SORRY, AN UNEXPECTED ERROR OCCURRED']);

  @override
  String toString() => 'AppFailure(message: $message)';
}
