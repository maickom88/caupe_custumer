import 'package:caupe_custumer/domain/usecases/get_problem.dart';
import 'package:caupe_custumer/factories/build_repositories/build_api_repository.dart';

GetProblem buildGetProblem() => GetProblem(apiRepository: buildApiRepository());
