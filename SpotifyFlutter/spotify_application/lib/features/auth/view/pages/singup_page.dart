import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spotify_application/core/theme/app_pallete.dart';
import 'package:spotify_application/core/widgets/loader.dart';
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
    final isLoading = ref.watch(authViewModelProvider.select((value) => value?.isLoading == true));

    ref.listen(authViewModelProvider, (_, next) {
      next?.when(
        data: (data) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
            const SnackBar(content: Text("Account created successfully!")),
            );
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const LoginPage()),
          );
        },
        error: (error, st) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text(error.toString())),
            );
        },
        loading: () {
          return const Loader();
        },
      );
    });

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Sign Up',
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
                        await ref
                            .read(authViewModelProvider.notifier)
                            .signUpUser(
                              name: nameController.text,
                              email: emailController.text,
                              password: passwordController.text,
                            );
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
