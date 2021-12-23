import '../../domain/usecases/register_account.dart';
import '../build_repositories/build_auth_repository.dart';

RegisterAccount buildRegisterAccount() =>
    RegisterAccount(authRepository: buildAuth());
