import 'package:flutter/material.dart';
import 'package:learn30/utils/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  final RegExp _regExp =
      RegExp(r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$");
  bool changeBtn = false;
  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeBtn = true;
      });
      await Future.delayed(
          const Duration(seconds: 1)); // render to homepage after 1 sec
      Navigator.pushNamed(context, MyRoutes.homeRoute);
      await Future.delayed(const Duration(milliseconds: 1030));
      setState(() {
        changeBtn = false;
      });
    }
  } //making nethod

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Page"),
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          color: Colors.white,
          child: Column(
            children: [
              Image.asset(
                "assets/images/login.png",
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 40,
              ),
              Text(
                "Sign in $name",
                style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 50),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        onChanged: (value) {
                          name = value;
                          setState(() {});
                        },
                        decoration: const InputDecoration(
                          hintText: "Enter Username",
                          labelText: "Username",
                          focusColor: Colors.black12,
                          labelStyle: TextStyle(
                            color: Colors.black45,
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Username cannot be empty";
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: "Enter Password",
                          labelText: "Password",
                          focusColor: Colors.black12,
                          labelStyle: TextStyle(
                            color: Colors.black45,
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Password is required";
                          } else if (value.length < 8) {
                            return "Password length must be greater than 8";
                          } else if (!_regExp.hasMatch(value)) {
                            return "Enter valid password,\n Should contain a-z\nShould contain A-Z\nshould contain special character ";
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      // ElevatedButton(onPressed: (){
                      //   Navigator.pushNamed(context, MyRoutes.homeRoute);
                      //   },
                      // child: const Text("Login"),
                      // style: ElevatedButton.styleFrom(
                      //   // primary: Colors.black,
                      //   padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 35),
                      //   textStyle: const TextStyle(
                      //     fontSize: 15,
                      //     fontWeight: FontWeight.normal,
                      //   ),
                      // ),
                      // ),
                      Material(
                        color: Colors.deepPurple,
                        borderRadius: changeBtn
                            ? BorderRadius.circular(50)
                            : BorderRadius.circular(10),
                        child: InkWell(
                          //ancester of InkWell should be material for appling respond  properties on touch
                          // splashColor: Colors.deepPurple,
                          onTap: () async {
                            moveToHome(context);
                          },
                          child: AnimatedContainer(
                            duration: const Duration(seconds: 1),
                            width: changeBtn ? 50 : 100,
                            height: 50,
                            alignment: Alignment.center,
                            child: changeBtn
                                ? const Icon(
                                    Icons.done,
                                    color: Colors.white,
                                  )
                                : const Text(
                                    'Login',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
