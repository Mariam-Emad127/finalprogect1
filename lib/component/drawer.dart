import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../home/theme_cubit.dart';

class Drower extends StatefulWidget {
  const Drower({super.key});

  @override
  State<Drower> createState() => _DrowerState();
}

class _DrowerState extends State<Drower> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(padding: EdgeInsets.zero, children: [
      SizedBox(
        height: 40,
      ),
      const DrawerHeader(
        decoration: BoxDecoration(
          color: Colors.blue,
        ),
        child: Text(
          'leukemia application',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
      Column(
        children: [
          Container(
            height: 40,
          ),
          BlocBuilder<ThemeCubit, bool>(builder: (context, state) {
            return SwitchListTile(
              value: state,
              onChanged: (value) {
                BlocProvider.of<ThemeCubit>(context).toggleTheme(value: value);
              },
              title: Text("mode"),
            );
          }),
          ListTile(
            title: Text("help"),
            leading: Icon(Icons.help),
          ),
          ListTile(
            title: Text("about"),
            leading: Icon(Icons.help_center),
          ),

          ListTile(
            title: Text("alarm"),
            leading: Icon(Icons.alarm),
            onTap: () {
              Navigator.of(context).pushReplacementNamed("time");
            },
          ),
          ListTile(
            title: Text("Logout"),
            leading: Icon(Icons.logout),
            onTap: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.of(context).pushReplacementNamed("login");
            },
          ),

          // ListTile(
          //   title: Text("support"),
          //   leading: Icon(Icons.psychology),
          //   onTap:(){ Navigator.of(context).pushReplacementNamed("support");},
          // ),
          // ListTile(
          //   title: Text("Suggested doctors for you"),
          //   leading: Icon(Icons.contact_support),
          //   onTap:(){ Navigator.of(context).pushReplacementNamed("governorates");},
          // )
        ],
      )
    ]));
  }
}
