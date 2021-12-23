import 'package:either_dart/either.dart';

import '../../core/errors/failure.dart';
import '../../core/usecases/usecases.dart';
import '../entities/category_entity.dart';
import '../repositories/repositories.dart';

class GetCategories implements Usecase<NoParams, List<CategoryEntity>> {
  final ApiRepository apiRepository;
  GetCategories({
    required this.apiRepository,
  });
  @override
  Future<Either<Failure, List<CategoryEntity>>> call(NoParams params) async {
    return await apiRepository.getCategories();
  }
}
