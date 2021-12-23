import 'package:either_dart/either.dart';

import '../../core/errors/failure.dart';
import '../../core/usecases/usecases.dart';
import '../entities/terms_entity.dart';
import '../repositories/repositories.dart';

class GetTerms implements Usecase<NoParams, TermsEntity> {
  final ApiRepository apiRepository;
  GetTerms({
    required this.apiRepository,
  });
  @override
  Future<Either<Failure, TermsEntity>> call(NoParams params) async {
    return await apiRepository.getTerms();
  }
}
