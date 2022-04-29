import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:food_app/src/screens/home.dart';
import 'package:food_app/src/screens/forget_Password.dart';
import 'package:food_app/src/widgets/helper.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/shape/gf_button_shape.dart';
import 'package:hive_flutter/adapters.dart';
import '../helpers/style.dart';
import 'registration.dart';

class Login extends StatefulWidget {
  static const routeName = "/login";

  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  var email = "";
  var password = "";

  final emailController1 = TextEditingController();
  final passwordController1 = TextEditingController();
  final _signBox = Hive.box('SignUp');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("User Login"),
      // ),
      body: DoubleBackToCloseApp(
        snackBar: const SnackBar(
          content: Text('Tap back again to leave'),
        ),
        child: Form(
          key: _formKey,
          child: SizedBox(
            child: SafeArea(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
                child: Column(
                  children: [
                    Text(
                      "Login",
                      style: Helper.getTheme(context).headline6,
                    ),
                    const Spacer(),
                    const Text("Add your detail to Login"),
                    const Spacer(),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: const [
                    // Image.asset(
                    //   "images/logo.png",
                    //   scale: 3,
                    //   height: 300,
                    //   width: 300,
                    // ),
                    //   ],
                    // ),
                    Container(
                      width: double.infinity,
                      height: 50,
                      decoration: const ShapeDecoration(
                          shape: StadiumBorder(),
                          color: AppColor.placeholderBg),
                      // margin: const EdgeInsets.symmetric(vertical: 20),
                      child: TextFormField(
                        autofocus: false,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.only(left: 30),
                          labelText: 'Email: ',
                          labelStyle: TextStyle(fontSize: 20),
                          border: InputBorder.none,
                          errorStyle:
                              TextStyle(color: Colors.redAccent, fontSize: 15),
                        ),
                        controller: emailController1,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Email';
                          } else if (!value.contains('@')) {
                            return 'Please Enter Valid Email';
                          }
                          return null;
                        },
                      ),
                    ),
                    const Spacer(),
                    Container(
                        width: double.infinity,
                        height: 50,
                        decoration: const ShapeDecoration(
                            shape: StadiumBorder(),
                            color: AppColor.placeholderBg),
                        // margin: const EdgeInsets.symmetric(vertical: 20),
                        child: TextFormField(
                          autofocus: false,
                          obscureText: true,
                          decoration: const InputDecoration(
                            labelText: 'Password: ',
                            labelStyle: TextStyle(fontSize: 20),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(left: 30),
                            errorStyle: TextStyle(
                                color: Colors.redAccent, fontSize: 15),
                          ),
                          controller: passwordController1,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Password';
                            }
                            // else if (!value.contains('@')) {
                            //   return 'Please Enter Valid Email';
                            // }
                            return null;
                          },
                        )),
                    const Spacer(),
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      // margin: const EdgeInsets.only(left: 60),
                      child: ElevatedButton(
                          onPressed: () {
                            if (emailController1.text ==
                                    _signBox.get("Email") &&
                                (passwordController1.text ==
                                    _signBox.get("Password"))) {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Home()));
                            }
                          },
                          child: const Text(
                            'Login',
                            style: TextStyle(fontSize: 18),
                          )),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ForgotPassword(),
                          ),
                        );
                      },
                      child: const Text(
                        "Forget Your Password? ",
                        style: TextStyle(color: AppColor.orange),
                      ),
                    ),
                    const Spacer(
                      flex: 2,
                    ),
                    const Text("Or Login with"),
                    const Spacer(),
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: GFButton(
                        onPressed: () {},
                        text: "Login with Facebook",
                        icon: const Icon(Icons.facebook),
                        shape: GFButtonShape.pills,
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(const Color(
                              0xFFDD4B39,
                            ))),
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "images/google.png",
                                  // scale: 3,
                                  // height: 300,
                                  // width: 300,
                                ),
                                const SizedBox(
                                  width: 30,
                                ),
                                const Text("Login with Google")
                              ],
                            ))),
                    const Spacer(
                      flex: 4,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account? "),
                        TextButton(
                          onPressed: () => {
                            Navigator.pushAndRemoveUntil(
                                context,
                                PageRouteBuilder(
                                  pageBuilder: (context, a, b) =>
                                      const Signup(),
                                  transitionDuration:
                                      const Duration(seconds: 0),
                                ),
                                (route) => false)
                          },
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(
                              color: AppColor.orange,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
