import 'dart:io';

import 'package:either_dart/either.dart';

import '../../core/errors/failure.dart';
import '../../core/usecases/usecases.dart';
import '../repositories/repositories.dart';

class UpdatePhotoAvatar implements Usecase<AvatarParams, String> {
  final ApiRepository apiRepository;
  UpdatePhotoAvatar({
    required this.apiRepository,
  });
  @override
  Future<Either<Failure, String>> call(AvatarParams params) async {
    return await apiRepository.updatePhotoAvatar(params);
  }
}

class AvatarParams {
  final File file;
  final String email;
  AvatarParams({
    required this.file,
    required this.email,
  });
}
