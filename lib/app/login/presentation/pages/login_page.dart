import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [HeaderLoginWidget(), BodyLoginWidget(), FooterLoginWidget()],
      ),
    );
  }
}

class FooterLoginWidget extends StatelessWidget {
  const FooterLoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Column(
        children: [
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Aún no tiene cuenta"),
              SizedBox(width: 32),
              GestureDetector(
                onTap: () => {GoRouter.of(context).pushNamed("sign-up")},
                child: Text(
                  "Registrate acá",
                  style: TextStyle(
                    color: Colors.purple,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class BodyLoginWidget extends StatefulWidget {
  BodyLoginWidget({super.key});

  @override
  State<BodyLoginWidget> createState() => _BodyLoginWidgetState();
}

class _BodyLoginWidgetState extends State<BodyLoginWidget> {
  bool _showPassword = false;
  Timer? _autoShowTimer;

  final keyForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(right: 32.0, left: 32.0, top: 80),
        child: Form(
          key: keyForm,
          child: Column(
            children: [
              TextFormField(
                validator: (value) {
                  value ??= "";
                  value = value.replaceAll(" ", "");
                  final bool isValid = RegExp(
                    r"^[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?$",
                  ).hasMatch(value);
                  return !isValid ? "Email Invalido" : null;
                },
                decoration: InputDecoration(
                  labelText: "Email",
                  icon: Icon(Icons.person),
                  hintText: "Escribir su email",
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 16.0),
              TextFormField(
                validator: (value) {
                  value = value ?? "";
                  value = value.replaceAll(" ", "");
                  if (value.length < 8) {
                    return "Debe tener más de 8 caracteres";
                  }

                  return null;
                },
                obscureText: !_showPassword,
                decoration: InputDecoration(
                  labelText: "Password:",
                  icon: Icon(Icons.lock),
                  hintText: "Escribir su email",
                  suffixIcon: InkWell(
                    onTap: () {
                      _autoShowTimer?.cancel();
                      if (!_showPassword) {
                        _autoShowTimer = Timer(Duration(seconds: 3), () {
                          _showPassword = false;
                        });
                      }
                      setState(() {
                        _showPassword = !_showPassword;
                      });
                    },
                    child: Icon(
                      _showPassword ? Icons.visibility : Icons.visibility_off,
                    ),
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 16.0),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () => {keyForm.currentState?.validate()},
                  child: Text("Iniciar Sesion"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HeaderLoginWidget extends StatelessWidget {
  const HeaderLoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.network(
            width: double.infinity,
            height: 100.0,
            fit: BoxFit.fitWidth,
            "http://t0.gstatic.com/licensed-image?q=tbn:ANd9GcQYzNRvQ0rLqKSV7nJQ9WO0KhQisB-LiM3Wo6Q8oVDETQSBZu2MtjGr17ZNBOUzup9owz-G3oIG87PPzGsSr7s",
          ),
          Text(
            "Inicio de Sesión",
            style: TextStyle(fontSize: 24.0),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
