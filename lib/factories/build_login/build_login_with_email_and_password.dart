import '../../domain/usecases/usecases.dart';
import '../build_repositories/build_auth_repository.dart';

LoginWithEmailAndPassword buildLoginWithEmailAndPassword() =>
    LoginWithEmailAndPassword(authRepository: buildAuth());
