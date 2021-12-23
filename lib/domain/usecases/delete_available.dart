import 'package:either_dart/either.dart';

import '../../core/errors/failure.dart';
import '../../core/usecases/usecases.dart';
import '../repositories/repositories.dart';

class DeleteAvailable implements Usecase<String, void> {
  final ApiRepository apiRepository;

  DeleteAvailable({
    required this.apiRepository,
  });

  @override
  Future<Either<Failure, void>> call(String params) async {
    return await apiRepository.deleteAvailable(params);
  }
}
