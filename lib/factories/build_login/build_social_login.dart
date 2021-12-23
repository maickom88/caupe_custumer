import '../build_repositories/build_auth_repository.dart';

import '../../domain/usecases/usecases.dart';

LoginWithSocial builLoginWithSocial() =>
    LoginWithSocial(authRepository: buildAuth());
