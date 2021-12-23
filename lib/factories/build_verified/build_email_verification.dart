import 'package:caupe_custumer/domain/usecases/send_email_verification.dart';
import 'package:caupe_custumer/factories/build_repositories/build_auth_repository.dart';

SendEmailVerification buildSendEmailVerification() =>
    SendEmailVerification(authRepository: buildAuth());
