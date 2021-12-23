import '../../domain/usecases/send_phone_auth.dart';
import '../build_repositories/build_auth_repository.dart';

SendPhoneAuth buildSendPhoneAuth() =>
    SendPhoneAuth(authRepository: buildAuth());
