import 'package:flutter/material.dart';
import 'package:poc/view_models/login_viewmodel.dart';
import 'package:poc/view/signup_view.dart';
import 'package:stacked/stacked.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      viewModelBuilder: () => LoginViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(title: const Text("Login")),)
    );
  }

  buildLayout(LoginViewModel model) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  hintText: 'Enter EmailId',
                ),
                controller: model.conUsername,
              ),
              const SizedBox(height: 20.0),
              TextField(
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  hintText: 'Enter Password ',
                ),
                controller: model.conPassword,
                obscureText: true,
              ),
              const SizedBox(height: 30.0),
              Center(
                child: ElevatedButton(
                  child: const Text("login"),
                    onPressed: () {
                      if (model.validations()) {
                        model.authenticationLog(
                          model.conUsername.text,
                          model.conPassword.text
                        );
                      }
                    },
                  ),
              ),
              const SizedBox(height: 20.0,),
              signupBtn(),
            ],
          ),
      ),
    );
  }

  Widget signupBtn() {
    return GestureDetector(
      onTap: () => Navigator.of(context)
      .pushReplacement(
        MaterialPageRoute(builder: (context) => SignUpView())
      ),
      child: Column(
        children: [
          const Text('Do not have an Account?',
           style:  TextStyle(
             color: Colors.black87,
             fontWeight: FontWeight.w100,
             fontSize: 15,
           )),
          const Text('Sign Up',
           style: TextStyle(
             color: Colors.black87,
             fontWeight: FontWeight.w100,
             fontSize: 15,
           )),
        ]) 
    );
  }

}