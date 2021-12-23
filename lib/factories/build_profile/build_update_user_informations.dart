import '../../domain/usecases/update_infomations_user.dart';
import '../build_repositories/build_api_repository.dart';

UpdateInformationUser buildUpdateUserInformation() => UpdateInformationUser(
      apiRepository: buildApiRepository(),
    );
