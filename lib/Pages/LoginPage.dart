import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final TextEditingController controller = TextEditingController();
  String? _errorText;
  String? _secondErrorText;

  bool isFormValid(){
    return _errorText == null && _secondErrorText == null && controller.text.isNotEmpty;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
            Padding(padding: EdgeInsets.symmetric(horizontal: 20),
              child:
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: controller,
                    onChanged: (value){
                      setState(() {
                        _errorText = value.length < 8
                            ? "Matnda 8 ta dan kam belgi bo'lmasligi kerak!!!"
                            : null;
                        _secondErrorText = !value.contains(RegExp(r'[A-Z]'))
                            ? "Matnda hec bo'lmaganda bitta katta harf bo'lishi kerak !!!"
                            : null;
                      });

                    },
                    decoration: InputDecoration(
                      labelText: "write everything you want",
                      border: OutlineInputBorder()
                    ),
                  ),
                  SizedBox(height: 10,),
                  if(_errorText!= null)
                    Text(
                      _errorText!, style: TextStyle(color: Colors.red),
                    ),
                  SizedBox(height: 10,),
                  if (_secondErrorText!=null)
                    Text(
                      _secondErrorText!, style: TextStyle(color: Colors.red),
                    ),
                  SizedBox(height: 10,),
                  ElevatedButton(child: Text("Sign UP"),
                    onPressed: isFormValid() ? (){
                    setState(() {
                     controller.clear();
                     _errorText = null;
                     _secondErrorText = null;
                    });
                        Fluttertoast.showToast(
                          msg: "Successfully signed up!!!",
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.BOTTOM,
                          backgroundColor: Colors.teal,
                          textColor: Colors.tealAccent,
                          fontSize: 15
                        );
                  } : null
                  ),
                  SizedBox(height: 10,),
                  Text.rich(
                    TextSpan(
                      text: "Don't have an account? ",
                      style: TextStyle(color: Colors.grey),
                      children: [
                        TextSpan(
                          text: "Sign Up",
                          style: TextStyle(
                            color: Colors.teal,
                            fontWeight: FontWeight.bold,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              print("Sign Up bosildi!");
                              // Navigator.push(...);
                            },
                        ),
                      ],
                    ),
                  )
                ],
            )
      )
    );
  }
}
