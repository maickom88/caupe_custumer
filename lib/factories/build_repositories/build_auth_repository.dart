import '../../data/repositories/auth.dart';
import '../build_datasource/build_auth_datasource.dart';

Auth buildAuth() => Auth(authDatasource: buildAuthFirebase());
