import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Mypackage extends StatelessWidget {
  const Mypackage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login dulu, yuk!',
          style: GoogleFonts.poppins(
              fontSize: 24, fontWeight: FontWeight.w500, color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 231, 186, 36),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                  // icon: Icon(Icons.email_outlined),
                  hintText: 'Masukkan Username',
                  prefixIcon: Icon(Icons.account_circle_outlined)),
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              obscureText: true,
              obscuringCharacter: '@',
              keyboardType: TextInputType.visiblePassword,
              decoration: const InputDecoration(
                  // icon: Icon(Icons.lock_outline_rounded),
                  hintText: 'Masukkan Password',
                  prefixIcon: Icon(Icons.lock_outline_rounded)),
            ),
            const SizedBox(
              height: 32,
            ),
            ElevatedButton(onPressed: () {}, child: const Text('Login'))
          ],
        ),
      ),
    );
  }
}