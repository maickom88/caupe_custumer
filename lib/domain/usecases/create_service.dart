// import 'package:either_dart/either.dart';

// import '../../core/errors/failure.dart';
// import '../../core/usecases/usecases.dart';
// import '../entities/portfolio_entity.dart';
// import '../repositories/repositories.dart';

// class CreateService implements Usecase<DeletePortfolioParams, PortfolioEntity> {
//   final ApiRepository apiRepository;
//   CreateService({
//     required this.apiRepository,
//   });
//   @override
//   Future<Either<Failure, PortfolioEntity>> call(
//       DeletePortfolioParams params) async {
//     return await apiRepository.createService(params);
//   }
// }

// class DeletePortfolioParams {
//   final PortfolioEntity portfolio;
//   final String email;
//   DeletePortfolioParams({
//     required this.portfolio,
//     required this.email,
//   });
// }
