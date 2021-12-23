import 'package:either_dart/either.dart';

import '../../core/errors/failure.dart';
import '../../core/usecases/usecases.dart';
import '../entities/problem_entity.dart';
import '../repositories/repositories.dart';

class GetProblem implements Usecase<NoParams, List<ProblemEntity>> {
  final ApiRepository apiRepository;
  GetProblem({
    required this.apiRepository,
  });
  @override
  Future<Either<Failure, List<ProblemEntity>>> call(NoParams params) async {
    return await apiRepository.getProblem();
  }
}
