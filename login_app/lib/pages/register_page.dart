import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:konnect/constant.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:konnect/services/navigation_service.dart';

class RegisPage extends StatefulWidget {
  @override
  _RegisPageState createState() => _RegisPageState();
}

class _RegisPageState extends State<RegisPage> {
  double _deviceHeight;
  double _deviceWidth;

  GlobalKey<FormState> _formKey;

  bool _hidePass = true;

  _RegisPageState() {
    _formKey = GlobalKey<FormState>();
  }

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: regisPageUI(),
      backgroundColor: backgroundColor,
    );
  }

  Widget regisPageUI() {
    return Container(
      height: 800,
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            btnBackWidget(),
            SizedBox(
              height: 10,
            ),
            titleRegisWidget(),
            SizedBox(
              height: 10,
            ),
            inputForm(),
            Spacer(),
            textSignInWidget(),
            SizedBox(
              height: 10,
            ),
            signUpButtonWidget()
          ],
        ),
      ),
    );
  }

  Widget btnBackWidget() {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 12, 0, 0),
      height: 30,
      width: 30,
      child: GestureDetector(
          onTap: () {
            NavigationService.instance.goBack();
          },
          child: SvgPicture.asset(
            "images/back.svg",
            color: Colors.white54,
          )),
    );
  }

  Widget titleRegisWidget() {
    return Container(
      height: 90,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "Sign Up to Konnect",
                style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(
                width: 8,
              ),
              Container(
                margin: EdgeInsets.only(top: 2),
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                    color: dotColor, borderRadius: BorderRadius.circular(100)),
              )
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            'Please enter your details',
            style: TextStyle(
                fontFamily: 'Roboto', fontSize: 25, color: Colors.white54),
          )
        ],
      ),
    );
  }

  Widget inputForm() {
    return Container(
      height: 400,
      child: Form(
        key: _formKey,
        onChanged: () {
          _formKey.currentState.save();
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            imageSelectorWidget(),
            SizedBox(
              height: 35,
            ),
            nameTextFieldWidget(),
            SizedBox(
              height: 20,
            ),
            emailTextFieldWidget(),
            SizedBox(
              height: 20,
            ),
            passwordTextFieldWidget(),
          ],
        ),
      ),
    );
  }

  Widget imageSelectorWidget() {
    return Container(
      child: Align(
        alignment: Alignment.center,
        child: Container(
          height: _deviceHeight * 0.1,
          width: _deviceHeight * 0.1,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/avt.png"), fit: BoxFit.cover),
              color: Colors.white,
              borderRadius: BorderRadius.circular(100)),
        ),
      ),
    );
  }

  Widget emailTextFieldWidget() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      style: TextStyle(color: Colors.white, fontSize: 15),
      decoration: InputDecoration(
        fillColor: Colors.grey[900],
        filled: true,
        hintStyle: TextStyle(color: Colors.white38, fontSize: 15),
        hintText: "Email Address",
        contentPadding: EdgeInsets.all(20),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(12)),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none),
      ),
    );
  }

  Widget nameTextFieldWidget() {
    return TextFormField(
      style: TextStyle(color: Colors.white, fontSize: 15),
      decoration: InputDecoration(
        fillColor: Colors.grey[900],
        filled: true,
        hintStyle: TextStyle(color: Colors.white38, fontSize: 15),
        hintText: "Name",
        contentPadding: EdgeInsets.all(20),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(12)),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none),
      ),
    );
  }

  Widget passwordTextFieldWidget() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              keyboardType: TextInputType.text,
              style: TextStyle(color: Colors.white, fontSize: 15),
              obscureText: _hidePass,
              decoration: InputDecoration(
                fillColor: Colors.grey[900],
                filled: true,
                hintStyle: TextStyle(color: Colors.white38),
                hintText: "Password",
                contentPadding: EdgeInsets.all(20),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(12)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none),
              ),
            ),
          ),
          SizedBox(
            width: 30,
          ),
          Container(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _hidePass = !_hidePass;
                });
              },
              child: Icon(
                Icons.vpn_key,
                color: Colors.white38,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          )
        ],
      ),
    );
  }

  Widget textSignInWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Already have an account ?",
          style: TextStyle(
            color: Colors.white38,
            fontSize: 18,
          ),
        ),
        SizedBox(
          width: 5,
        ),
        GestureDetector(
          onTap: () {
            NavigationService.instance.navigateToReplacement("login");
          },
          child: Text(
            "Sign in",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }

  Widget signUpButtonWidget() {
    return Container(
      height: _deviceHeight * 0.087,
      width: _deviceWidth,
      child: SizedBox(
        height: 70,
        width: double.infinity,
        child: FlatButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          onPressed: () {},
          color: Colors.white,
          textColor: Colors.black,
          child: Text("Sign Up",
              style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 22,
                  fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
