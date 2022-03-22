import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
class SignUP extends StatefulWidget {
  const SignUP({Key? key}) : super(key: key);

  @override
  State<SignUP> createState() => _SignUPState();
}

class _SignUPState extends State<SignUP> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  var _name;
  var _email;
  var _password;
  var _passwordConfirm;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register Account'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children:   [
           const SizedBox(height: 60,),
            TextFormField(
              onSaved: (value)=>_email=value,
                validator: (value) =>
                value!.isEmpty ? 'pleases enter your name' : null,
              decoration: InputDecoration(
                hintText: "enter your name",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0)),
              ),
            ),
            const SizedBox(height: 20,),
            TextFormField(
              onSaved: (value)=>_email=value,
              validator: (value) {
                if (!EmailValidator.validate(value!)) {
                  return 'pleases check your email';
                } else {
                  return null;
                }
              },
              decoration: InputDecoration(
                hintText: "enter your email",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0)),
              ),
            ),
           const SizedBox(height: 20,),
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
            const SizedBox(height: 20,),
            TextFormField(
              obscureText: true,
              onSaved: (value) => _passwordConfirm= value,
              validator: (value) =>
              value!.isEmpty ? 'required confirm password' : null,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                  hintText: 'confirm your Password'),
            ),
            const SizedBox(height: 40,),
            ElevatedButton(
                onPressed: (){
                  final form = _formKey.currentState;
                  if (form!.validate()) {
                    // await Provider.of<Authprovider>(context)
                    //     .login(_email!, _password!);
                    print('sigh is true');
                  }
                },
                child: const Text('SignUp')
            )

          ],
        ),
      ),
    );
  }
}
