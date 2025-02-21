import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          HeaderLoginWidget(),
          Container(
            margin: EdgeInsets.only(right: 32.0, left: 32.0, top: 80),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    labelText: "Email",
                    icon: Icon(Icons.person),
                    hintText: "Escribir su email",
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                TextField(decoration: InputDecoration(labelText: "Contraseña")),
                FilledButton(
                  onPressed: () => {},
                  child: Text("Iniciar Sesion"),
                ),
              ],
            ),
          ),
        ],
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
