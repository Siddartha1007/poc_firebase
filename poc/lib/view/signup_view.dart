import 'package:flutter/material.dart';
import 'package:poc/view_models/login_viewmodel.dart';
import 'package:poc/view/login_view.dart';
import 'package:stacked/stacked.dart';


class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  @override
  Widget build(BuildContext context) {
        return ViewModelBuilder<LoginViewModel>.reactive(
          viewModelBuilder: () => LoginViewModel(),
          builder: (context, model, child) => Scaffold(
              appBar: AppBar(title: const Text("SignUp")),)
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
                  child: const Text("signup"),
                    onPressed: () {
                      if (model.validations()) {
                        model.authenticationSignUp(
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
        MaterialPageRoute(builder: (context) => LoginView())
      ),
      child: Column(
        children: const [
           Text('Already have an Account?',
           style:  TextStyle(
             color: Colors.black87,
             fontWeight: FontWeight.w100,
             fontSize: 15,
           )),
          Text('Login',
           style: TextStyle(
             color: Colors.black87,
             fontWeight: FontWeight.w100,
             fontSize: 15,
           )),
        ]) 
    );
  }

}