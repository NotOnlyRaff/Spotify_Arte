import 'package:flutter/material.dart';
import 'package:spotify_application/core/theme/app_pallete.dart';
import 'package:spotify_application/features/auth/repositories/auth_remote_repository.dart';
import 'package:spotify_application/features/auth/view/pages/singup_page.dart';
import 'package:spotify_application/features/auth/view/widgets/auth_gradient_button.dart';
import 'package:spotify_application/features/auth/view/widgets/custom_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
    formKey.currentState!.validate();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Sign In.',
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                CustomField(hintText: 'email', controller: emailController),
                const SizedBox(height: 20),
                CustomField(hintText: 'password', controller: passwordController, obscureText: true),
                const SizedBox(height: 20),
                AuthGradientButton(
                  buttonText: 'Sign In',
                  onTap: () {
                    AuthRemoteRepository().login(
                      email: emailController.text,
                      password: passwordController.text,
                    ).then((value) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Login Successful')),
                      );
                    }).catchError((error) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Error: $error')),
                      );
                    });
                  },
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const SingupPage()));
                  },
                  child: RichText(
                    text: TextSpan(
                      text: 'Don\'t have an account? ',
                      style: Theme.of(context).textTheme.titleMedium,
                      children: [
                        TextSpan(
                          text: 'Sign Up',
                          style: TextStyle(
                            color: Pallete.gradient2,
                            fontWeight: FontWeight.bold,
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
      ),
    );
  }
}
