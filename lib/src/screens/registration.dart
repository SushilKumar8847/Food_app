import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:food_app/src/screens/login.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:password_strength/password_strength.dart';

import '../helpers/style.dart';
import '../widgets/helper.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();

  var email = "";
  var password = "";
  var confirmPassword = "";
  bool isObscured = true;
  bool isObscured1 = true;
  final _signBox = Hive.box('SignUp');
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final mobileController = TextEditingController();
  final addressController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    mobileController.dispose();
    addressController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  // registration() async {
  //   if (password == confirmPassword) {
  //     try {
  //       UserCredential userCredential = await FirebaseAuth.instance
  //           .createUserWithEmailAndPassword(email: email, password: password);

  //       ScaffoldMessenger.of(context).showSnackBar(
  //         const SnackBar(
  //           backgroundColor: Colors.greenAccent,
  //           content: Text(
  //             "Sucessfully Register. PLease LogIn..",
  //             style: TextStyle(fontSize: 18),
  //           ),
  //         ),
  //       );
  //       Navigator.pushReplacement(
  //         context,
  //         MaterialPageRoute(
  //           builder: (context) => const Login(),
  //         ),
  //       );
  //     } on FirebaseAuthException catch (e) {
  //       if (e.code == 'weak-password') {
  //         print("too weak password");
  //         ScaffoldMessenger.of(context).showSnackBar(
  //           const SnackBar(
  //             backgroundColor: Colors.orangeAccent,
  //             content: const Text(
  //               "too weak password",
  //               style: TextStyle(fontSize: 18),
  //             ),
  //           ),
  //         );
  //       } else if (e.code == 'email-already-in-use') {
  //         print("email already register");
  //         ScaffoldMessenger.of(context).showSnackBar(
  //           const SnackBar(
  //             backgroundColor: Colors.orangeAccent,
  //             content: const Text(
  //               "email already register",
  //               style: const TextStyle(fontSize: 18),
  //             ),
  //           ),
  //         );
  //       }
  //     }
  //   } else {
  //     print("Password and confirm password doesn't match");
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(
  //         backgroundColor: Colors.redAccent,
  //         content: const Text(
  //           "Password and confirm password doesn't match",
  //           style: const TextStyle(fontSize: 18),
  //         ),
  //       ),
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("User Signup"),
      // ),
      body: Form(
          key: _formKey,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: SafeArea(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
                child: Column(
                  children: [
                    Text(
                      "Sign Up",
                      style: Helper.getTheme(context).headline6,
                    ),
                    const Spacer(),
                    const Text(
                      "Add your details to sign up",
                    ),
                    const Spacer(),
                    Container(
                      width: double.infinity,
                      height: 50,
                      decoration: const ShapeDecoration(
                          shape: StadiumBorder(),
                          color: AppColor.placeholderBg),
                      child: TextFormField(
                        // autofocus: false,
                        decoration: const InputDecoration(
                          hintText: 'Name',
                          contentPadding: EdgeInsets.only(left: 30),
                          hintStyle: TextStyle(
                            color: AppColor.placeholder,
                          ),
                          labelStyle: TextStyle(fontSize: 20),
                          border: InputBorder.none,
                          errorStyle:
                              TextStyle(color: Colors.redAccent, fontSize: 15),
                        ),
                        controller: nameController,
                        validator: (text) {
                          if (text == null ||
                              text.isEmpty ||
                              text.replaceAll(" ", "").isEmpty) {
                            return "Required";
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
                      child: TextFormField(
                        // autofocus: false,
                        decoration: const InputDecoration(
                          hintText: "Email",
                          hintStyle: TextStyle(color: AppColor.placeholder),
                          contentPadding: EdgeInsets.only(left: 30),
                          labelStyle: TextStyle(fontSize: 20),
                          border: InputBorder.none,
                          errorStyle:
                              TextStyle(color: Colors.redAccent, fontSize: 15),
                        ),
                        controller: emailController,
                        validator: (text) {
                          if (text == null ||
                              text.isEmpty ||
                              text.replaceAll(" ", "").isEmpty) {
                            return "Required";
                          } else if (text.length < 4) {
                            return "Too short";
                          } else if (!EmailValidator.validate(text)) {
                            return "Enter valid email";
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
                      child: TextFormField(
                        // autofocus: false,
                        decoration: const InputDecoration(
                          hintText: "Address",
                          contentPadding: EdgeInsets.only(left: 30),
                          hintStyle: TextStyle(color: AppColor.placeholder),
                          labelStyle: TextStyle(fontSize: 20),
                          border: InputBorder.none,
                          errorStyle:
                              TextStyle(color: Colors.redAccent, fontSize: 15),
                        ),
                        controller: addressController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Address';
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
                      child: TextFormField(
                        // autofocus: false,
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(
                          hintText: "Mobile No.",
                          hintStyle: TextStyle(color: AppColor.placeholder),
                          contentPadding: EdgeInsets.only(left: 30),
                          labelStyle: TextStyle(fontSize: 20),
                          border: InputBorder.none,
                          errorStyle:
                              TextStyle(color: Colors.redAccent, fontSize: 15),
                        ),
                        controller: mobileController,
                        // validator: (value) {
                        //   if (value == null || value.isEmpty) {
                        //     return 'Please Enter Email';
                        //   } else if (!value.contains('@')) {
                        //     return 'Please Enter Valid Email';
                        //   }
                        //   return null;
                        // },
                      ),
                    ),
                    const Spacer(),
                    Container(
                      width: double.infinity,
                      height: 50,
                      decoration: const ShapeDecoration(
                          shape: StadiumBorder(),
                          color: AppColor.placeholderBg),
                      child: TextFormField(
                        // autofocus: false,
                        obscureText: isObscured,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          hintStyle: const TextStyle(
                            color: AppColor.placeholder,
                          ),
                          errorStyle: const TextStyle(
                              color: Colors.redAccent, fontSize: 15),
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  isObscured = !isObscured;
                                });
                              },
                              icon: Icon(isObscured
                                  ? Icons.visibility
                                  : Icons.visibility_off)),
                          contentPadding: const EdgeInsets.only(left: 30),
                          border: InputBorder.none,
                        ),
                        controller: passwordController,
                        validator: (text) {
                          if (text != null) {
                            final strength = estimatePasswordStrength(text);
                            if (strength < 0.3) return 'This password is weak!';
                          } else {
                            return "Enter your password";
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
                        color: AppColor.placeholderBg,
                        shape: StadiumBorder(),
                      ),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Confirm Password",
                          hintStyle: TextStyle(
                            color: AppColor.placeholder,
                          ),
                          // suffixIcon: IconButton(
                          //     onPressed: () {
                          //       setState(() {
                          //         isObscured1 = !isObscured1;
                          //       });
                          //     },
                          //     icon: Icon(isObscured1
                          //         ? Icons.visibility
                          //         : Icons.visibility_off)),
                          contentPadding: EdgeInsets.only(left: 30),
                        ),
                        controller: confirmPasswordController,
                        validator: (text) {
                          if (text != null) {
                            if (text != passwordController.text) {
                              return 'This password is not matched';
                            }
                          } else {
                            return "Enter confirm password";
                          }

                          return null;
                        },
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _signBox.put("Name", nameController.text);
                            _signBox.put("Email", emailController.text);
                            _signBox.put("Address", addressController.text);
                            _signBox.put("mobile", mobileController.text);
                            _signBox.put("Password", passwordController.text);
                            _signBox.put("Confirm_password",
                                confirmPasswordController.text);

                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Login()));
                          }
                        },
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Login()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text("Already have an Account? "),
                          Text(
                            "Login",
                            style: TextStyle(
                              color: AppColor.orange,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          // TextButton(
                          //     onPressed: () => {
                          //           Navigator.pushAndRemoveUntil(
                          //               context,
                          //               PageRouteBuilder(
                          //                 pageBuilder: (context, anaimation1,
                          //                         animation2) =>
                          //                     const Login(),
                          //                 transitionDuration:
                          //                     const Duration(seconds: 0),
                          //               ),
                          //               (route) => false)
                          //         },
                          //     child: const Text('Login',
                          //         style: TextStyle(
                          //           color: AppColor.orange,
                          //           fontWeight: FontWeight.bold,
                          //         ))),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
