import 'package:caupe_custumer/domain/usecases/get_terms.dart';
import 'package:caupe_custumer/factories/build_repositories/build_api_repository.dart';

GetTerms buildGetTerms() => GetTerms(apiRepository: buildApiRepository());
