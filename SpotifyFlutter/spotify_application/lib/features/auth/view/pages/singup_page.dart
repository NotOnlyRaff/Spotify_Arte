import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
<<<<<<< HEAD
import 'package:spotify_application/core/theme/app_pallete.dart';
import 'package:spotify_application/core/widgets/loader.dart';
=======
import 'package:fpdart/fpdart.dart';
import 'package:spotify_application/core/theme/app_pallete.dart';
import 'package:spotify_application/core/widgets/loader.dart';
import 'package:spotify_application/features/auth/repositories/auth_remote_repository.dart';
>>>>>>> 9fd35c0c4a2b4deb3ae87a1856808fa7d748a5cf
import 'package:spotify_application/features/auth/view/pages/login_page.dart'
    show LoginPage;
import 'package:spotify_application/features/auth/view/widgets/auth_gradient_button.dart';
import 'package:spotify_application/features/auth/view/widgets/custom_field.dart';
import 'package:spotify_application/features/auth/viewmodel/auth_viewmodel.dart';

class SingupPage extends ConsumerStatefulWidget {
  const SingupPage({super.key});

  @override
  ConsumerState<SingupPage> createState() => _SingupPageState();
}

class _SingupPageState extends ConsumerState<SingupPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
    formKey.currentState!.validate();
  }

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    final isLoading = ref.watch(authViewModelProvider.select((value) => value?.isLoading == true));
=======
    final isLoading = ref.watch(authViewModelProvider)?.isLoading == true;
>>>>>>> 9fd35c0c4a2b4deb3ae87a1856808fa7d748a5cf

    ref.listen(authViewModelProvider, (_, next) {
      next?.when(
        data: (data) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
<<<<<<< HEAD
            const SnackBar(content: Text("Account created successfully!")),
=======
              const SnackBar(content: Text('Account created successfully!')),
>>>>>>> 9fd35c0c4a2b4deb3ae87a1856808fa7d748a5cf
            );
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const LoginPage()),
          );
        },
        error: (error, st) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
<<<<<<< HEAD
            ..showSnackBar(
              SnackBar(content: Text(error.toString())),
            );
=======
            ..showSnackBar(SnackBar(content: Text(error.toString())));
>>>>>>> 9fd35c0c4a2b4deb3ae87a1856808fa7d748a5cf
        },
        loading: () {
          return const Loader();
        },
      );
    });

    return Scaffold(
      appBar: AppBar(),
<<<<<<< HEAD
      body: Padding(
=======
      body: isLoading
          ? const Loader()
          : Padding(
>>>>>>> 9fd35c0c4a2b4deb3ae87a1856808fa7d748a5cf
              padding: const EdgeInsets.all(15.0),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
<<<<<<< HEAD
                      'Sign Up',
=======
                      'Sign Up.',
>>>>>>> 9fd35c0c4a2b4deb3ae87a1856808fa7d748a5cf
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 30),
                    CustomField(hintText: 'name', controller: nameController),
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
                      buttonText: 'Sign Up',
                      onTap: () async {
<<<<<<< HEAD
                        await ref
                            .read(authViewModelProvider.notifier)
                            .signUpUser(
                              name: nameController.text,
                              email: emailController.text,
                              password: passwordController.text,
                            );
=======
                        if (formKey.currentState!.validate()) {
                          // If the form is valid, proceed with sign up
                          ref
                              .read(authViewModelProvider.notifier)
                              .signUpUser(
                                name: nameController.text.trim(),
                                email: emailController.text.trim(),
                                password: passwordController.text.trim(),
                              );
                        } else {
                          // If the form is not valid, show a message or handle accordingly
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Please fill in all fields correctly.',
                              ),
                            ),
                          );
                        }
>>>>>>> 9fd35c0c4a2b4deb3ae87a1856808fa7d748a5cf
                      },
                    ),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          ),
                        );
                      },
                      child: RichText(
                        text: TextSpan(
                          text: 'Already have an account? ',
                          style: Theme.of(context).textTheme.titleMedium,
                          children: [
                            TextSpan(
                              text: 'Sing In',
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
