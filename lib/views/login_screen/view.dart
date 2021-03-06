import 'package:flutter/material.dart';
import 'package:untitled/views/home_page/view.dart';
import 'package:untitled/views/login_screen/controller.dart';
import 'package:untitled/views/register/view.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  LoginController _loginController = LoginController();
  final formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: formKey,
        child: ListView(
          padding: EdgeInsets.all(20),
          children: [
            Icon(Icons.phone, size: 100),
            SizedBox(
              height: 30,
            ),
            TextFormField(
              validator: (value) {
                if (value.isEmpty)
                  return 'Empty field!';
                else if (!value.contains('@'))
                  return 'missing @!';
                else
                  return null;
              },
              controller: emailController,
              decoration: InputDecoration(hintText: 'Email'),
            ),
            TextFormField(
              validator: (value) {
                if (value.isEmpty)
                  return 'Empty field!';
                else if (value.length < 6)
                  return 'Length';
                else
                  return null;
              },
              controller: passwordController,
              decoration: InputDecoration(hintText: 'Password'),
            ),
            SizedBox(
              height: 30,
            ),
            _isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ElevatedButton(
                    onPressed: () async {
                      if (!formKey.currentState.validate()) return;
                      setState(() {
                        _isLoading = true;
                      });
                      final message = await _loginController.login(
                          emailController.text, passwordController.text);
                      if (message != 'ok') {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text(message)));
                      } else {
                        print(emailController.text * 9);
                        print(passwordController.text * 29);
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePage(),
                            ));
                        setState(() {
                          _isLoading = false;
                        });
                      }
                    },
                    child: Text('Login')),
            TextButton(
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (ctx) => RegisterScreen())),
                child: Text('Register'))
          ],
        ),
      ),
    );
  }
}
