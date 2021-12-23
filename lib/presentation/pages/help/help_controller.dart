import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';

import '../../../core/enums/type_evaluetion.dart';
import '../../../core/theme/theme.dart';
import '../../../core/usecases/usecases.dart';
import '../../../data/models/models.dart';
import '../../../domain/entities/entities.dart';
import '../../../domain/entities/helps_entity.dart';
import '../../../domain/entities/problem_entity.dart';
import '../../../domain/usecases/evaluetion_help.dart';
import '../../../domain/usecases/get_helps.dart';
import '../../../domain/usecases/get_problem.dart';
import '../../../domain/usecases/get_user.dart';

class HelpController extends GetxController {
  final GetHelps getHelps;
  final GetOrCreateUser getOrCreateUser;
  final GetProblem getProblem;
  final EvaluetionHelp evaluetionHelp;
  HelpController({
    required this.getHelps,
    required this.getProblem,
    required this.evaluetionHelp,
    required this.getOrCreateUser,
  });

  Rx<UserEntity?> user = Rx(null);
  late AuthResponseModel authResponseModel;
  RxList<HelpsEntity> helps = <HelpsEntity>[].obs;
  RxList<ProblemEntity> problems = <ProblemEntity>[].obs;

  Future<void> sendReportProblem() async {
    await Future.delayed(Duration(seconds: 3));
    AppDefault.showSnackBarSuccess(
        message: "Enviado com sucesso!",
        title: "Obrigado por reportar iremos analisar seu caso!");
  }

  Future<void> getUser(AuthResponseModel authResponse) async {
    final result = await getOrCreateUser.call(authResponse);
    result.fold((left) async {
      Get.back();
    }, (right) {
      user.value = right;
    });
  }

  AuthResponseModel getUserInformation() {
    final basicInformation =
        GetStorage().read<Map<String, dynamic>>('userInformation');
    if (basicInformation == null) {
      Get.back();
    }
    return AuthResponseModel.fromMap(basicInformation!);
  }

  Future<void> getAllHelps(AuthResponseModel authResponse) async {
    await getUser(authResponse);
    final result = await getHelps.call(authResponse.email!);
    result.fold((left) async {
      AppDefault.showSnackBarError(
        title: 'Error ao recuperar perguntas frequentes!',
        message: left.message,
      );
    }, (right) {
      helps.value = right;
    });
  }

  Future<void> getAllProblems() async {
    final result = await getProblem.call(NoParams());
    result.fold((left) async {
      AppDefault.showSnackBarError(
        title: 'Error ao recuperar problemas!',
        message: left.message,
      );
    }, (right) {
      problems.value = right;
    });
  }

  Future<void> saveEvaluetion(
      bool isGood, String helpGuid, String? guid) async {
    final evaluetion = EvaluetionHelpParams(
        email: authResponseModel.email!,
        isGood: isGood ? TypeEvaluetion.liked : TypeEvaluetion.unliked,
        helpGuid: helpGuid,
        guid: guid);
    final result = await evaluetionHelp.call(evaluetion);
    result.fold((left) async {
      AppDefault.showSnackBarError(
        title: 'Error ao salvar avaliação',
        message: left.message,
      );
    }, (right) {
      getAllHelps(authResponseModel);
    });
  }
}
