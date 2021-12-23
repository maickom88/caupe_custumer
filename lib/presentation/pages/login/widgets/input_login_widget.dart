import 'package:flutter/material.dart';

import '../../../../core/theme/theme.dart';

class InputLogin extends StatelessWidget {
  final Function(String, String) onValues;
  const InputLogin({
    Key? key,
    required this.onValues,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    return Column(
      children: [
        TextFormField(
          keyboardType: TextInputType.emailAddress,
          controller: emailController,
          decoration: InputDecoration(
            hintText: 'Email',
            prefixIcon: Icon(Icons.email),
          ),
        ).withBottomPadding(bottomPadding: 20),
        TextFormField(
          controller: passwordController,
          obscureText: true,
          decoration: InputDecoration(
            hintText: 'Password',
            prefixIcon: Icon(Icons.lock),
          ),
        ).withBottomPadding(bottomPadding: 30),
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(Theme.of(context).primaryColor),
          ),
          onPressed: () {
            if (emailController.text.isNotEmpty &&
                passwordController.text.isNotEmpty) {
              onValues(emailController.text, passwordController.text);
            }
          },
          child: Text(
            'LOGIN',
          ).withSymPadding(hPadding: 70, vPadding: 10),
        ),
      ],
    );
  }
}
