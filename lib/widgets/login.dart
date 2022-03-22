import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/auth.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _email;
  String? _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('start to login'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            const SizedBox(
              height: 40,
            ),
            TextFormField(
              onSaved: (value) => _email = value,
              decoration: InputDecoration(
                hintText: 'Enter your Email',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0)),
              ),
              validator: (value) {
                if (!EmailValidator.validate(value!)) {
                  return 'pleases check your email';
                } else {
                  return null;
                }
              },
            ),
            const SizedBox(
              height: 40,
            ),
            TextFormField(
              obscureText: true,
              onSaved: (value) => _password = value,
              validator: (value) =>
                  value!.isEmpty ? 'pleases enter password' : null,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                  hintText: 'Enter your Password'),
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
                onPressed: () async {
                  final form = _formKey.currentState;
                  if (form!.validate()) {
                    // await Provider.of<Authprovider>(context)
                    //     .login(_email!, _password!);
                     print('login is true');
                  }
                },
                child: const Text('Login')
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
             mainAxisAlignment: MainAxisAlignment.center,
              children:  [
                const Text('do not have account? '),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: (){
                    Navigator.pushReplacementNamed(context, '/singUp');

                  },
                    child: const Text('Register '),
                )

              ],
            )
          ],
        ),
      ),
    );
  }
}
