import 'package:flutter/material.dart';
import 'package:spotify_application/features/auth/view/widgets/custom_field.dart';

class SingupPage extends StatefulWidget {
  const SingupPage({super.key});

  @override
  State<SingupPage> createState() => _SingupPageState();
}

class _SingupPageState extends State<SingupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              const Text(
                'Sign Up Page.',
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              CustomField(hintText: 'name'),
              const SizedBox(height: 20),
              CustomField(hintText: 'email'),
              const SizedBox(height: 20),
              CustomField(hintText: 'password'),
            ],
          ),
        ),
      ),
    );
  }
}
