import 'package:caupe_custumer/factories/build_repositories/build_auth_repository.dart';

import '../../domain/usecases/usecases.dart';

Logout buildLogout() => Logout(authRepository: buildAuth());
