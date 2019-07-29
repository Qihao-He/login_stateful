import 'package:flutter/material.dart';
import '../mixins/validation_mixin.dart';

class LoginScreen extends StatefulWidget {
  createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> with ValidationMixin{
  final loginFormKey = GlobalKey<FormState>();
  String email = '';
  String password = '';

  Widget build(context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Form(
        key: loginFormKey,
        child: Column(
          children: <Widget>[
            space,
            emailField(),
            space,
            passwordField(),
            space,
            submitButton(),
          ],
        ),
      ),
    );
  }

  Widget space = Container(margin: EdgeInsets.only(top:25.0));

  Widget emailField(){
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'Email Address',
        hintText: 'you@example.com',
      ),
      validator: validateEmail,
      onSaved: (String value){
        email = value;
      },
    );
  }

  Widget passwordField(){
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'PassWord',
      ),
      validator: validatePassword,
      onSaved: (String value){
        password = value;
      },
    );
  }

  Widget submitButton(){
    return RaisedButton(
      child: Text('Submit'),
      color: Colors.blue,
      onPressed: (){
        if (loginFormKey.currentState.validate()) {
          loginFormKey.currentState.save();
          print('Time to post $email and $password to my API');
        }
      },
    );
  }
}