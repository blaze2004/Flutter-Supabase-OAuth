import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'auth_state.dart';
import 'constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends AuthState<LoginScreen> {
  bool _isloading = false;

  Future<void> _signIn() async {

    setState(() {
      _isloading = true;
    });

    final response = await supabase.auth.signInWithProvider(
      Provider.google,
    );

    if (response) {
      setState(() {
        _isloading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: _isloading ? null : _signIn,
          child: Text(
            "Sign In With Google",
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
      ),
    );
  }
}