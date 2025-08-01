import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:production_app_client/controller/login_controller.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(builder: (logic) {
      return Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(color: Colors.blueGrey[50]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Register',
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
              SizedBox(height: 30),
              TextField(
                keyboardType: TextInputType.phone,
                controller: logic.registerNameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  prefixIcon: Icon(Icons.phone_android),
                  labelText: 'Name',
                  hintText: 'Enter your name',
                ),
              ),
              SizedBox(height: 20),
              TextField(
                keyboardType: TextInputType.text,
                controller: logic.registerNumberController,
                // obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  prefixIcon: Icon(Icons.phone_android),
                  labelText: 'Mobile Number',
                  hintText: 'Enter your mobile number',
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  logic.adduser();
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.deepPurple,
                ),
                child: Text('Register'),
              ),
            ],
          ),
        ),
      );
    });
  }
}
