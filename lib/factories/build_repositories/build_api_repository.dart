import '../../data/repositories/api_repository.dart';
import '../build_datasource/build_api_datasource.dart';

Api buildApiRepository() => Api(apiDatasource: buildApi());
