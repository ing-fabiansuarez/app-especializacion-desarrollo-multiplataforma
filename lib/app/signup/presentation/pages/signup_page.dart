import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Página de registro", style: TextStyle(fontSize: 48.0)),
          FilledButton(
            onPressed: () => {GoRouter.of(context).pop()},
            child: Text("Ir a login"),
          ),
        ],
      ),
    );
  }
}
