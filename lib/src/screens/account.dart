import 'package:flutter/material.dart';
import 'package:food_app/src/screens/login.dart';
import 'package:hive_flutter/adapters.dart';

import '../helpers/style.dart';
import '../widgets/helper.dart';

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  final _signBox = Hive.box('SignUp');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: SizedBox(
              height: Helper.getScreenHeight(context),
              width: Helper.getScreenWidth(context),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: const Icon(
                              Icons.arrow_back_ios_rounded,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              "Profile",
                              style: Helper.getTheme(context).headline5,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ClipOval(
                        child: Stack(
                          children: [
                            SizedBox(
                              height: 80,
                              width: 80,
                              child: Image.asset(
                                "images/no_image.jpg",
                                //   scale: 3,
                                //   height: 300,
                                //   width: 300,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              child: Container(
                                height: 20,
                                width: 80,
                                color: Colors.black.withOpacity(0.3),
                                child: Image.asset(
                                  "images/no_image.jpg",
                                  //   scale: 3,
                                  //   height: 300,
                                  //   width: 300,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "images/edit_filled.png",
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text(
                            "Edit Profile",
                            style: TextStyle(color: AppColor.orange),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Hi ",
                            style: Helper.getTheme(context).headline4?.copyWith(
                                  color: AppColor.secondary,
                                ),
                          ),
                          Text(
                            _signBox.get("Name"),
                            style: Helper.getTheme(context).headline4?.copyWith(
                                  color: AppColor.primary,
                                ),
                          )
                        ],
                      ),
                      // const SizedBox(
                      //   height: 3,
                      // ),
                      TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Login()));
                          },
                          child: const Text("Sign Out")),
                      const SizedBox(
                        height: 40,
                      ),
                      CustomFormImput(
                        label: "Name",
                        value: _signBox.get("Name"),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomFormImput(
                        label: "Email",
                        value: _signBox.get("Email"),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomFormImput(
                        label: "Mobile No",
                        value: _signBox.get("mobile"),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomFormImput(
                        label: "Address",
                        value: _signBox.get("Address"),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomFormImput(
                        label: "Password",
                        value: _signBox.get("Password"),
                        isPassword: true,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomFormImput(
                        label: "Confirm Password",
                        value: _signBox.get("Confirm_password"),
                        isPassword: true,
                      ),
                      // const SizedBox(
                      //   height: 20,
                      // ),
                      // SizedBox(
                      //   height: 50,
                      //   width: double.infinity,
                      //   child: ElevatedButton(
                      //     onPressed: () {},
                      //     child: const Text("Save"),
                      //   ),
                      // )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomFormImput extends StatelessWidget {
  const CustomFormImput({
    Key? key,
    required String label,
    required String value,
    bool isPassword = false,
  })  : _label = label,
        _value = value,
        _isPassword = isPassword,
        super(key: key);

  final String _label;
  final String _value;
  final bool _isPassword;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      padding: const EdgeInsets.only(left: 40),
      decoration: const ShapeDecoration(
        shape: const StadiumBorder(),
        color: AppColor.placeholderBg,
      ),
      child: TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: _label,
          contentPadding: const EdgeInsets.only(
            top: 10,
            bottom: 10,
          ),
        ),
        obscureText: _isPassword,
        initialValue: _value,
        style: const TextStyle(
          fontSize: 14,
        ),
      ),
    );
  }
}
