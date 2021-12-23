import 'package:caupe_custumer/domain/entities/service_entity.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../../core/theme/theme.dart';
import '../../../core/usecases/usecases.dart';
import '../../../domain/entities/category_entity.dart';
import '../../../domain/usecases/get_categories.dart';

class ServiceController extends GetxController {
  final GetCategories getCategories;
  ServiceController({
    required this.getCategories,
  });

  Rx<CategoryEntity?> category = Rx<CategoryEntity?>(null);
  RxBool load = false.obs;
  RxList<CategoryEntity> categories = <CategoryEntity>[].obs;

  Future<void> getServices({ServiceEntity? service}) async {
    load.value = true;
    final result = await getCategories.call(NoParams());
    result.fold(
      (left) {
        Get.back();
        AppDefault.showSnackBarError(
          title: 'Error ao tentar listar categorias foto',
          message: left.message,
        );
      },
      (right) {
        categories.value = right;
        if (service != null) {
          category.value = service.typeService;
          categories.value = right
              .where((element) => element.guid == category.value!.guid)
              .toList();
        }
      },
    );
    load.value = false;
  }
}
