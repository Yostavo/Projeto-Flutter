import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screens/home_screen.dart';
import '../screens/register_screen.dart';

Widget Menu(BuildContext context) {
  return Drawer(
    child: ListView(
      children: <Widget>[
        UserAccountsDrawerHeader(
          decoration: BoxDecoration(color: Colors.black),
          margin: EdgeInsets.only(bottom: 50.0),
          currentAccountPicture: Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
            ),
          ),
          accountName: new Container(
              child: Text('João Gustavo', style: TextStyle(color: Colors.blue),
              )),
          accountEmail: new Container(
              child: Text('joao_gb_vieira@estudante.sesisenai.org.br', style: TextStyle(color: Colors.blue),
              )),
        ),
        ListTile(
          title: const Text('Home'),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(
                    builder: (context) => MyHomePage(title: 'Home'))
            );
          },
        ),
        ListTile(
          title: const Text('Cadastrar'),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => RegisterPage(title: 'Cadastro'))
            );
          },
        )
      ],
    ),
  );
}