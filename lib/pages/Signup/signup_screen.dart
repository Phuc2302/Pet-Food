import 'package:flutter/material.dart';
import 'package:flutter_catalog/pages/Login/login_screen.dart';
import 'package:flutter_catalog/pages/Signup/components/or_divider.dart';
import 'package:flutter_catalog/pages/Signup/components/social_icon.dart';
import 'package:flutter_catalog/utils/routes.dart';
import 'package:flutter_catalog/widgets/login_widgets/already_have_an_account_acheck.dart';
import 'package:flutter_catalog/widgets/login_widgets/rounded_button.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_field_validator/form_field_validator.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpFormValidationState createState() => _SignUpFormValidationState();
}

class _SignUpFormValidationState extends State<SignUpScreen> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  String validatePassword(String value) {
    if (value.isEmpty) {
      return "* Required";
    } else if (value.length < 6) {
      return "Password should be at least 6 characters";
    } else if (value.length > 15) {
      return "Password should not be greater than 15 characters";
    } else
      return null;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Form(
          // ignore: deprecated_member_use
          autovalidate: true, //check for validation while typing
          key: formkey,
          child: Column(
            children: <Widget>[
              Text(
                "SIGNUP",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: size.height * 0.03),
              SvgPicture.asset(
                "assets/icons/signup.svg",
                height: size.height * 0.35,
              ),
              SizedBox(height: size.height * 0.03),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 45),
                child: TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                        hintText: 'Enter valid email as abc@gmail.com'),
                    validator: MultiValidator([
                      RequiredValidator(errorText: "* Required"),
                      EmailValidator(errorText: "Enter valid email"),
                    ])),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 45.0, right: 45.0, top: 15, bottom: 0),
                child: TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                        hintText: 'Enter secure password'),
                    validator: MultiValidator([
                      RequiredValidator(errorText: "* Required"),
                      MinLengthValidator(6,
                          errorText:
                              "Password should be at least 6 characters"),
                      MaxLengthValidator(15,
                          errorText:
                              "Password should not be greater than 15 characters")
                    ])
                    //validatePassword,        //Function to check validation
                    ),
              ),
              RoundedButton(
                text: "SIGNUP",
                press: () {
                  if (formkey.currentState.validate()) {
                    Navigator.pushNamed(context, MyRoutes.homeRoute);
                  } else {
                    print("Not Validated");
                  }
                },
              ),
              SizedBox(height: size.height * 0.03),
              AlreadyHaveAnAccountCheck(
                login: false,
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return LoginScreen();
                      },
                    ),
                  );
                },
              ),
              OrDivider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SocalIcon(
                    iconSrc: "assets/icons/facebook.svg",
                    press: () {},
                  ),
                  SocalIcon(
                    iconSrc: "assets/icons/twitter.svg",
                    press: () {},
                  ),
                  SocalIcon(
                    iconSrc: "assets/icons/google-plus.svg",
                    press: () {},
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
