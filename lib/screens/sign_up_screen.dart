import 'package:flutter/material.dart';
import 'package:pretium/components/custom_text_field.dart';
import 'package:pretium/screens/login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _fNameController = TextEditingController();
  final _sNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: (){
                    Navigator.pop(context);
                  }, 
                  icon: Icon(
                    Icons.arrow_back, 
                    // color:  Colors.black,
                  ),
                ),
                const SizedBox(height: 25,),
                Text(
                  'Create Account',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
                    color: Theme.of(context).textTheme.bodyLarge?.color,
                  ),
                ),
                const SizedBox(height: 10,),
                Text(
                  'Simplify your crypto payments with us',
                  style: TextStyle(
                    fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
                    color: Theme.of(context).textTheme.bodyMedium?.color,
                  ),
                ),
                const SizedBox(height: 25,),
                CustomTextField(
                  controller: _fNameController, 
                  hintText: 'Enter your first name', 
                  labelText: 'First Name', 
                  prefixIcon: Icon(Icons.person_outline),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 25,),
                CustomTextField(
                  controller: _sNameController, 
                  hintText: 'Enter your last name', 
                  labelText: 'Last Name', 
                  prefixIcon: Icon(Icons.person_outline),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 25,),
                CustomTextField(
                  controller: _emailController, 
                  hintText: 'Enter your email', 
                  labelText: 'Email', 
                  prefixIcon: Icon(Icons.email_outlined),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 25,),
                CustomTextField(
                  controller: _passwordController,
                  hintText: 'Create a password',
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock_outline),
                  isPassword: true,
                ),
                const SizedBox(height: 25,),
                Row(
                  children: [
                    Checkbox(
                      value: false, 
                      onChanged: (value){}
                    ),
                    const SizedBox(width: 10,),
                    Text(
                      'Accept Terms and Conditions',
                      style: TextStyle(
                        fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
                        color: Theme.of(context).primaryColor,
                        decoration: TextDecoration.underline,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 25,),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: (){}, 
                    style: Theme.of(context).elevatedButtonTheme.style,
                    child: Text(
                      'Create Account',
                    )
                  ),
                ),
                const SizedBox(height: 25,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account? ",
                      style: TextStyle(
                        fontSize: Theme.of(context).textTheme.bodySmall?.fontSize,
                        color: Theme.of(context).textTheme.bodySmall?.color,
                      ), 
                    ),
                    const SizedBox(height: 25,),

                    GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                            )
                        );
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(
                          fontSize: Theme.of(context).textTheme.bodySmall?.fontSize,
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                        ), 
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ), 
      ),
    );
  }
}