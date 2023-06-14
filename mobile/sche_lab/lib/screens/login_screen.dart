import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sche_lab/screens/sign_up_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void handleSignIn() {
    print(emailController.text);
    print(passwordController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
          child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 4.0, horizontal: 28.0),
            child: Column(
              children: [
                SizedBox(
                  height: 36,
                ),
                Text('Schelab',
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        color: Color.fromRGBO(64, 123, 255, 1),
                        fontSize: 36)),
                SizedBox(
                  height: 140,
                ),
                TextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(
                      color: Colors.black87, fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide:
                            BorderSide(width: 0, style: BorderStyle.none)),
                    hintText: 'Email',
                    hintStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87),
                    filled: true,
                    fillColor: Color.fromRGBO(243, 243, 243, 1),
                    prefixIcon: Icon(
                      Icons.email_outlined,
                      color: Colors.black87,
                    ),
                  ),
                  readOnly: false,
                ),
                SizedBox(
                  height: 16,
                ),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  style: TextStyle(
                      color: Colors.black87, fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide:
                              BorderSide(width: 0, style: BorderStyle.none)),
                      hintText: 'Senha',
                      hintStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87),
                      filled: true,
                      fillColor: Color.fromRGBO(243, 243, 243, 1),
                      prefixIcon: Icon(
                        Icons.lock_outline_rounded,
                        color: Colors.black87,
                      ),
                      suffixIcon: Icon(Icons.remove_red_eye_outlined,
                          color: Colors.black87)),
                  onTap: () => {print("Clicou no olho")},
                  readOnly: false,
                ),
                SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    RichText(
                        text: TextSpan(
                      text: 'Esqueceu a senha',
                      style: TextStyle(
                          color: Color.fromRGBO(120, 120, 120, 1),
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    )),
                  ],
                ),
                SizedBox(
                  height: 120,
                ),
                ElevatedButton(
                  onPressed: () => {handleSignIn()},
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(40),
                    padding: const EdgeInsets.symmetric(
                        vertical: 18, horizontal: 0.0),
                    backgroundColor: Color.fromRGBO(64, 123, 255, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                  ),
                  child: Text(
                    "Entrar",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                RichText(
                    text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Não possui conta?',
                      style: TextStyle(
                          color: Color.fromRGBO(120, 120, 120, 1),
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => SignUpScreen())));
                        },
                    ),
                    TextSpan(
                      text: ' Criar agora',
                      style: TextStyle(
                          color: Color.fromRGBO(64, 123, 255, 1),
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => SignUpScreen())));
                        },
                    )
                  ],
                )),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
