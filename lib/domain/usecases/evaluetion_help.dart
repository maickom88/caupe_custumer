import 'package:either_dart/either.dart';

import '../../core/enums/type_evaluetion.dart';
import '../../core/errors/failure.dart';
import '../../core/usecases/usecases.dart';
import '../entities/evaluetion_help_entity.dart';
import '../repositories/repositories.dart';

class EvaluetionHelp
    implements Usecase<EvaluetionHelpParams, EvaluetionHelpEntity> {
  final ApiRepository apiRepository;
  EvaluetionHelp({
    required this.apiRepository,
  });
  @override
  Future<Either<Failure, EvaluetionHelpEntity>> call(
      EvaluetionHelpParams params) async {
    return await apiRepository.evaluetionHelp(params);
  }
}

class EvaluetionHelpParams {
  final String? guid;
  final String email;
  final TypeEvaluetion isGood;
  final String helpGuid;
  EvaluetionHelpParams({
    this.guid,
    required this.email,
    required this.isGood,
    required this.helpGuid,
  });

  Map<String, dynamic> toMap() {
    return {
      'guid': guid,
      'email': email,
      'is_good': isGood.convertEvaluetion(),
      'help_guid': helpGuid,
    };
  }
}
