import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spotify_application/core/theme/app_pallete.dart';
<<<<<<< HEAD
=======
import 'package:spotify_application/core/widgets/loader.dart';
import 'package:spotify_application/features/auth/repositories/auth_remote_repository.dart';
>>>>>>> 9fd35c0c4a2b4deb3ae87a1856808fa7d748a5cf
import 'package:spotify_application/features/auth/view/pages/singup_page.dart';
import 'package:spotify_application/features/auth/view/widgets/auth_gradient_button.dart';
import 'package:spotify_application/features/auth/view/widgets/custom_field.dart';
import 'package:spotify_application/features/auth/viewmodel/auth_viewmodel.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
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
<<<<<<< HEAD

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
                  'Sign In',
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                CustomField(hintText: 'email', controller: emailController),
                const SizedBox(height: 20),
                CustomField(hintText: 'password', controller: passwordController, obscureText: true),
                const SizedBox(height: 20),
                AuthGradientButton(
                  buttonText: 'Sign In',
                  onTap: () async {
                        if (formKey.currentState!.validate()) {
                          await ref.read(authViewModelProvider.notifier)
                              .loginUser(
                                email: emailController.text,
                                password: passwordController.text,
                              );
                        } else {
                          showSnackBar(context, 'Missing fields!');
                        }
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
=======
    final isLoading = ref.watch(authViewModelProvider)?.isLoading == true;

    ref.listen(authViewModelProvider, (_, next) {
      next?.when(
        data: (data) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const LoginPage()),
          );
        },
        error: (error, st) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(content: Text(error.toString())));
        },
        loading: () {
          return const Loader();
        },
      );
    });

    return Scaffold(
      appBar: AppBar(),
      body: isLoading
          ? const Loader()
          : Padding(
              padding: const EdgeInsets.all(15.0),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Sign In.',
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
>>>>>>> 9fd35c0c4a2b4deb3ae87a1856808fa7d748a5cf
                    ),
                    const SizedBox(height: 20),
                    CustomField(hintText: 'email', controller: emailController),
                    const SizedBox(height: 20),
                    CustomField(
                      hintText: 'password',
                      controller: passwordController,
                      obscureText: true,
                    ),
                    const SizedBox(height: 20),
                    AuthGradientButton(
                      buttonText: 'Sign In',
                      onTap: () async {
                        final res = await AuthRemoteRepository().login(
                          email: emailController.text,
                          password: passwordController.text,
                        );
                        final val = switch (res) {
                          Left(value: final l) => l,
                          Right(value: final r) => r.name,
                          _ => null, // Handles any other type
                        };
                        print(val);
                      },
                    ),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SingupPage(),
                          ),
                        );
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
    );
  }
}