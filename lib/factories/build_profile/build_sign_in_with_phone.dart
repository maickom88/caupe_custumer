import 'package:caupe_custumer/factories/build_repositories/build_auth_repository.dart';

import '../../domain/usecases/usecases.dart';

SignInWithPhone buildSignInWithPhone() => SignInWithPhone(
      authRepository: buildAuth(),
    );
