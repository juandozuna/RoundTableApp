import 'response_validation.dart';

/// Thrown when a submission breaks the answer rules (score 5, empty text).
class InvalidResponseException implements Exception {
  const InvalidResponseException(this.errors);

  final ResponseErrors errors;

  @override
  String toString() => 'InvalidResponseException($errors)';
}
