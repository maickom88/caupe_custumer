import 'package:caupe_custumer/domain/usecases/evaluetion_help.dart';
import 'package:caupe_custumer/factories/build_repositories/build_api_repository.dart';

EvaluetionHelp buildEvaluetionHelp() =>
    EvaluetionHelp(apiRepository: buildApiRepository());
