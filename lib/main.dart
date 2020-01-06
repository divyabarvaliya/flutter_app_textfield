import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          accentColor: Colors.blueAccent, primaryColor: Colors.blueAccent),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  TextEditingController _usernameTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Column(children: <Widget>[
        Container(
            height: 400,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/background.png'),
                    fit: BoxFit.fill))),
        Expanded(
          child: SingleChildScrollView(
            child: Container(
              child: Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextField(
                      autocorrect: true,
                      controller: _usernameTextController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        labelText: 'UserName',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: TextField(
                        autocorrect: true,
                        controller: _passwordTextController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0)),
                          labelText: 'Password',
                        ),
                      ),
                    ),
                    Center(
                        child: Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: RaisedButton(
                        elevation: 10,
                        child: Text(
                          "Login",
                          style: TextStyle(fontSize: 20),
                        ),
                        onPressed: () {
                          if (_usernameTextController.text == "admin" &&
                              _passwordTextController.text == "123") {
                            _usernameTextController.clear();
                            _passwordTextController.clear();

                            //Navigator.push(context,
                            //MaterialPageRoute(builder: (context) => HomePage()));

                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()));
                          } else {
                            print("not");
                          }
                        },
                      ),
                    )),
                  ],
                ),
              ),
            ),
          ),
        ),
      ]),
    ));
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            height: 400,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/background.png'),
                    fit: BoxFit.fill)),
          ),
          Center(child: Text("Welcome")),
          Center(
            child: RaisedButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
              child: Center(child: Text("Logout")),
            ),
          )
        ],
      ),
    );
  }
}
