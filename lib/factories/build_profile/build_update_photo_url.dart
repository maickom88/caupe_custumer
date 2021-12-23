import 'package:caupe_custumer/domain/usecases/update_photo_avatar.dart';
import 'package:caupe_custumer/factories/build_repositories/build_api_repository.dart';

UpdatePhotoAvatar buildUpdatePhotoAvatar() =>
    UpdatePhotoAvatar(apiRepository: buildApiRepository());
