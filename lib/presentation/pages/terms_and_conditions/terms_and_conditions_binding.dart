import 'package:get/get.dart';

import '../../../factories/buid_terms_of_conditions/build_get_terms.dart';
import 'terms_and_conditions_controller.dart';

class TermsOfConditionsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => TermsOfConditionsController(getTerms: buildGetTerms()),
    );
  }
}
