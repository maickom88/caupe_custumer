import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../../core/theme/theme.dart';
import '../../components/components.dart';
import '../validators/validators.dart';
import 'register.dart';

class RegisterPage extends GetView<RegisterController> {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: CustomScrollView(
          shrinkWrap: true,
          slivers: [
            SliverAppBar(
              pinned: true,
              centerTitle: true,
              expandedHeight: 130,
              backgroundColor: Colors.white,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: CaupeHeader(
                  heightImage: 35,
                ),
              ),
            ),
            SliverFillRemaining(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColor.lightColor,
                  borderRadius: AppDefault.defaultBorderRadiusOnly(),
                ),
                child: Obx(
                  () => ListView(
                    physics: ClampingScrollPhysics(),
                    children: [
                      TextFormField(
                        onChanged: (value) {
                          controller.startValidateName = true;
                          controller.name.value = value;
                        },
                        decoration: InputDecoration(
                          hintText: 'Name',
                          prefixIcon: Icon(Icons.person),
                          errorText: Validators.validateName(
                            controller.name.value,
                            controller.startValidateName,
                          ),
                        ),
                      ).withBottomPadding(bottomPadding: 20),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          controller.startValidateDocument = true;
                          controller.document.value = value;
                        },
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          CpfOuCnpjFormatter(),
                        ],
                        decoration: InputDecoration(
                          hintText: 'CPF/CNPJ',
                          prefixIcon: Icon(Icons.perm_identity),
                          errorText: Validators.validateDocument(
                            controller.document.value,
                            controller.startValidateDocument,
                          ),
                        ),
                      ).withBottomPadding(bottomPadding: 20),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (value) {
                          controller.startValidateEmail = true;
                          controller.email.value = value;
                        },
                        decoration: InputDecoration(
                          hintText: 'Email',
                          prefixIcon: Icon(Icons.email),
                          errorText: Validators.validateEmail(
                            controller.email.value,
                            controller.startValidateEmail,
                          ),
                        ),
                      ).withBottomPadding(bottomPadding: 20),
                      TextFormField(
                        onChanged: (value) {
                          controller.startValidatePassword = true;
                          controller.password.value = value;
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          prefixIcon: Icon(Icons.lock),
                          errorText: Validators.validatePassword(
                            controller.password.value,
                            controller.startValidatePassword,
                          ),
                        ),
                      ).withBottomPadding(bottomPadding: 30),
                      ElevatedButton(
                        onPressed: () => controller.register(),
                        child: Text(
                          'SING UP',
                        ).withSymPadding(hPadding: 70, vPadding: 15),
                      ),
                    ],
                  ).withTopPadding(topPadding: 40).withSymPadding(),
                ),
              ).withTopPadding(topPadding: 20),
            ),
          ],
        ),
      ),
    );
  }
}
