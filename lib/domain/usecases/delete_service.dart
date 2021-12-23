import 'package:either_dart/either.dart';

import '../../core/errors/failure.dart';
import '../../core/usecases/usecases.dart';
import '../repositories/repositories.dart';

class DeleteService implements Usecase<String, void> {
  final ApiRepository apiRepository;
  DeleteService({
    required this.apiRepository,
  });
  @override
  Future<Either<Failure, void>> call(String params) async {
    return await apiRepository.deleteService(params);
  }
}
