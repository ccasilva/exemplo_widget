import 'package:flutter/material.dart';

class DrawerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Carlos Silva"),
              accountEmail: Text("carlos-csilva@hotmail.com"),
              currentAccountPicture: CircleAvatar(
                //backgroundImage: AssetImage("assets/images/dog1.png"),
                backgroundImage: NetworkImage("https://img.quizur.com/f/img5d55abd941ba34.22872612.jpg?lastEdited=1565895646"),
              ),
            ),
            ListTile(
              leading: Icon(Icons.star),
              title: Text("Favoritos"),
              subtitle: Text("Mais informações..."),
              trailing: Icon(Icons.arrow_forward),
              onTap: (){
                print("Item 1");
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text("Ajuda"),
              subtitle: Text("Mais informações..."),
              trailing: Icon(Icons.arrow_forward),
              onTap: (){
                print("Item 1");
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text("Saie"),
              subtitle: Text("Mais informações..."),
              trailing: Icon(Icons.arrow_forward),
              onTap: (){
                print("Item 1");
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
