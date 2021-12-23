import 'package:get/get.dart';

import '../../../core/theme/theme.dart';
import '../../../core/usecases/usecases.dart';
import '../../../domain/entities/terms_entity.dart';
import '../../../domain/usecases/get_terms.dart';

class TermsOfConditionsController extends GetxController {
  final GetTerms getTerms;

  TermsOfConditionsController({
    required this.getTerms,
  });

  Rx<TermsEntity?> terms = Rx(null);

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> getTermsOfConditions() async {
    final result = await getTerms.call(NoParams());
    result.fold((left) async {
      AppDefault.showSnackBarError(
        title: 'Error ao tentar mostrar Termos de Uso!',
        message: left.message,
      );
    }, (right) {
      terms.value = right;
    });
  }
}
