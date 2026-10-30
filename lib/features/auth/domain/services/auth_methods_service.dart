import '../models/auth_methods.dart';

/// Which sign-in methods this build offers.
abstract interface class AuthMethodsService {
  EnabledAuthMethods get enabled;
}
