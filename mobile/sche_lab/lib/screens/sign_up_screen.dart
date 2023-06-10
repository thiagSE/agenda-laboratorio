import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController matriculaController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController nomeController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  TextEditingController confirmarSenhaController = TextEditingController();

  void handleSignUp() {
    print(matriculaController.text);
    print(emailController.text);
    print(nomeController.text);
    print(senhaController.text);
    print(confirmarSenhaController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Color.fromRGBO(28, 28, 28, 1),
          ),
          onPressed: () => Navigator.pop(context),
        ),
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
                  height: 24,
                ),
                Text('Criar Conta',
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        color: Color.fromRGBO(64, 123, 255, 1),
                        fontSize: 36)),
                SizedBox(
                  height: 32,
                ),
                TextField(
                  controller: matriculaController,
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(
                      color: Colors.black87, fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide:
                            BorderSide(width: 0, style: BorderStyle.none)),
                    hintText: 'Matrícula',
                    hintStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87),
                    filled: true,
                    fillColor: Color.fromRGBO(243, 243, 243, 1),
                    prefixIcon: Icon(
                      Icons.tag,
                      color: Colors.black87,
                    ),
                  ),
                  readOnly: false,
                ),
                SizedBox(
                  height: 16,
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
                  controller: nomeController,
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(
                      color: Colors.black87, fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide:
                            BorderSide(width: 0, style: BorderStyle.none)),
                    hintText: 'Nome',
                    hintStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87),
                    filled: true,
                    fillColor: Color.fromRGBO(243, 243, 243, 1),
                    prefixIcon: Icon(
                      Icons.person_outline_rounded,
                      color: Colors.black87,
                    ),
                  ),
                  readOnly: false,
                ),
                SizedBox(
                  height: 16,
                ),
                TextField(
                  controller: senhaController,
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
                  height: 16,
                ),
                TextField(
                  controller: confirmarSenhaController,
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  style: TextStyle(
                      color: Colors.black87, fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide:
                              BorderSide(width: 0, style: BorderStyle.none)),
                      hintText: 'Confirmar senha',
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
                  height: 40,
                ),
                ElevatedButton(
                  onPressed: () => {handleSignUp()},
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
                    "Cadastrar",
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
                      text: 'Já possui uma conta?',
                      style: TextStyle(
                          color: Color.fromRGBO(120, 120, 120, 1),
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pop(context);
                        },
                    ),
                    TextSpan(
                      text: ' Entrar',
                      style: TextStyle(
                          color: Color.fromRGBO(64, 123, 255, 1),
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pop(context);
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
