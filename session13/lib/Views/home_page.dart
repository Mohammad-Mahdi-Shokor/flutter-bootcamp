// ===========================================================================
// home_page.dart  —  CHANGED IN SESSION 12
// ---------------------------------------------------------------------------
// WHAT CHANGED vs session 11:
//   1. StatelessWidget -> ConsumerStatefulWidget: it needs `ref` (to watch
//      the account) and a State (to keep the two TextEditingControllers).
//   2. One screen, two faces:
//        • signed out -> a login form (email, password, Sign in, Register)
//        • signed in  -> a small profile (email, View my tasks, Sign out)
//      ref.watch(accountProvider) rebuilds this screen whenever the account
//      changes, and isUserSignedIn picks which face to show.
//
// There is NO navigation for login: when sign-in finishes, the provider
// calls notifyListeners(), build() runs again, and the profile appears.
// ===========================================================================

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'; // NEW

import '../Controllers/app_controllers.dart'; // NEW

// CHANGED: was `class HomePage extends StatelessWidget`.
class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  // NEW: fields of the State (not inside build), so they keep what the user
  // typed when the screen rebuilds. dispose() cleans them up.
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // NEW: rebuild when the user signs in / out, or while it's busy.
    final account = ref.watch(accountProvider);

    // ---- signed in: the profile ---------------------------------------------
    if (account.isUserSignedIn) {
      final user = account.user!;
      return Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
          backgroundColor: Colors.yellow[200],
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.account_circle, size: 80),
              const SizedBox(height: 12),
              Text(
                user.email ?? "",
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 24),
              // Same button as session 11.
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/tasks");
                },
                child: const Text("View my tasks"),
              ),
              const SizedBox(height: 8),
              // NEW
              TextButton(
                onPressed: () {
                  ref.read(accountProvider).signOut();
                },
                child: const Text("Sign out"),
              ),
            ],
          ),
        ),
      );
    }

    // ---- signed out: the login form -----------------------------------------
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        backgroundColor: Colors.yellow[200],
      ),
      // SingleChildScrollView: the keyboard won't cause an overflow.
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 40),
            const Text(
              "Welcome!",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress, // keyboard with @
              decoration: const InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _passwordController,
              obscureText: true, // dots instead of the password
              decoration: const InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            // While signing in: a spinner instead of the buttons, so nobody
            // taps twice.
            if (account.isBusy)
              const CircularProgressIndicator()
            else
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        ref
                            .read(accountProvider)
                            .signIn(
                              context,
                              _emailController.text.trim(),
                              _passwordController.text,
                            );
                      },
                      child: const Text("Sign in"),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        ref
                            .read(accountProvider)
                            .register(
                              context,
                              _emailController.text.trim(),
                              _passwordController.text,
                            );
                      },
                      child: const Text("Register"),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
