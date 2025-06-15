import 'package:flutter/material.dart';
import 'package:pretium/components/custom_text_field.dart';
import 'package:pretium/screens/dashboard_screen.dart';
import 'package:pretium/screens/sign_up_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool isObscured = true;
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 50),
            child: Column(
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    color: Theme.of(context).primaryColor.withAlpha(100),
                  ),
                  margin: EdgeInsets.only(top: 25),
                  padding: EdgeInsets.all(10),
                  child: Image.asset(
                    'assets/icons/credit-card.png',
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                const SizedBox(height: 25,),
                Text(
                  'Welcome Back!',
                  style: TextStyle(
                    fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
                    color: Theme.of(context).textTheme.bodyLarge?.color,
                  ),
                ),
                const SizedBox(height: 10,),
                Text(
                  'Sign in to continue',
                  style: TextStyle(
                    fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
                    color: Theme.of(context).textTheme.bodyMedium?.color,
                  ),
                ),
                const SizedBox(height: 50,),
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
                  hintText: 'Password',
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock_outline),
                  isPassword: true,
                ),
                const SizedBox(height: 40,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: false, 
                          onChanged: (value){}
                        ),
                        const SizedBox(width: 10,),
                        Text(
                          'Remember me',
                          style: TextStyle(
                            fontSize: Theme.of(context).textTheme.bodySmall?.fontSize,
                            color: Theme.of(context).textTheme.bodySmall?.color,
                          ),
                        )
                      ],
                    ),
            
                    Text(
                      'Forgot Password?',
                      style: TextStyle(
                        fontSize: Theme.of(context).textTheme.bodySmall?.fontSize,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 45,),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: (){
                      Navigator.pushReplacement(
                        context, 
                        MaterialPageRoute(builder: (context)=>const DashboardScreen())
                      );
                    }, 
                    style: Theme.of(context).elevatedButtonTheme.style,
                    child: Text(
                      'Login',
                    )
                  ),
                ),
                const SizedBox(height: 25,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? ",
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
                            builder: (context) => const SignUpScreen(),
                            )
                        );
                      },
                      child: Text(
                        "Sign Up",
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