import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.blueGrey[50],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome Back!',
            style: TextStyle(
              fontSize: 38,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
            ),
            ),
            SizedBox(height: 10,),
            TextField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                prefixIcon: Icon(Icons.phone_android),
                labelText: 'Mobile Number',
                hintText: 'Enter your mobile number',
              ),
            ),
            SizedBox(height: 10,),
            ElevatedButton(onPressed: (){},
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.deepPurple,
                ),
                child: Text('Login')
            ),
            SizedBox(height: 10,),
            TextButton(onPressed: (){},
                child: Text('Register new account')
            )
          ],
        ),
      ),
    );
  }
}
