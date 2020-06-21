import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/pages/hello_listview.dart';
import 'package:flutterapp/pages/hello_page1.dart';
import 'package:flutterapp/pages/hello_page2.dart';
import 'package:flutterapp/pages/hello_page3.dart';
import 'package:flutterapp/utils/nav.dart';
import 'package:flutterapp/widgets/blue_button.dart';
import 'package:flutterapp/widgets/drawer_list.dart';
import 'package:fluttertoast/fluttertoast.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Hello Flutter"),
          centerTitle: true,
          bottom: TabBar(
            tabs: <Widget>[
              Tab(text: "TAB1"),
              Tab(text: "TAB2"),
              Tab(text: "TAB3"),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            _body(context),
            Container(color: Colors.green),
            Container(color: Colors.yellow),
          ],
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FloatingActionButton(
                   child: Icon(Icons.add),
                   onPressed: () {
                      _onClickFab();
                   },
              ),
              SizedBox(
                width: 8,
              ),
              FloatingActionButton(
                child: Icon(Icons.favorite),
                onPressed: () {
                  _onClickFab();
                },
              ),
            ],
          ),
       drawer: DrawerList(),
      ),
    );
  }

  _body(BuildContext context) {
    return Container(
      //padding: EdgeInsets.only(top: 1),
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          _text(),
          _pageView(),
          _buttons(),
        ],
      ),
    );
  }

  _pageView() {
    return Container(
      margin: EdgeInsets.only(top: 0, bottom: 20),
      height: 280,
      child: PageView(
        children: <Widget>[
          _img("assets/images/dog1.png"),
          _img("assets/images/dog2.png"),
          _img("assets/images/dog3.png"),
          _img("assets/images/dog4.png"),
          _img("assets/images/dog5.png"),
        ],
      ),
    );
  }

  _buttons() {
    return Builder(
      builder: (BuildContext context) {
        return Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                BlueButton("ListView",
                    onPressed: () =>
                        _onClickNavigator(context, HelloListView())),
                BlueButton("Page 2",
                    onPressed: () => _onClickNavigator(context, HelloPage2())),
                BlueButton("Page 3",
                    onPressed: () => _onClickNavigator(context, HelloPage3())),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                BlueButton("Snack", onPressed: () => _onClickSnack(context)),
                BlueButton("Dialog", onPressed: () => _onClickDialog(context)),
                BlueButton("Toast", onPressed: _onClickToast),
              ],
            )
          ],
        );
      },
    );
  }

  void _onClickNavigator(BuildContext context, Widget page) async{
    String s = await push(context, page);
    print("Recupera o parametro futuro >> $s");
  }

  _text() {
    return Text(
      "Hello Word",
      style: TextStyle(
        fontSize: 30,
        color: Colors.blue,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        decoration: TextDecoration.underline,
        decorationColor: Colors.red,
        decorationStyle: TextDecorationStyle.wavy,
      ),
    );
  }

  _img(String img) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Image.asset(
        img,
        fit: BoxFit.cover,
      ),
    );
  }

  _onClickSnack(BuildContext context) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text("Olá Flutter!"),
      action: SnackBarAction(
          textColor: Colors.yellow,
          label: "OK",
          onPressed: () {
            print("OK");
          }),
    ));
  }

  _onClickDialog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return WillPopScope(
            onWillPop: () async => false, // Nem utilizando o voltar do celular muda de tela.
            child: AlertDialog(
              title: Text("Flutter é muito legal."),
              actions: <Widget>[
                FlatButton(
                  child: Text("Cancelar"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                FlatButton(
                  child: Text("Ok"),
                  onPressed: () {
                    Navigator.pop(context);
                    print("OK!!!");
                  },
                )
              ],
            ),
          );
        });
  }

  _onClickToast() {
    Fluttertoast.showToast(
        msg: "Flutter é muito legal!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

  void _onClickFab() {
    print("Adicionar");
  }
}
