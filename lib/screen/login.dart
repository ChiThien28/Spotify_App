import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify/screen/home_spotify.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Spotify',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: LoginPage(),
      routes: {
        '/register': (context) => RegisterPage(),
      },
    );
  }
}

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void login(BuildContext context) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      User? user = userCredential.user;
      if (user != null) {
       Navigator.push(context, MaterialPageRoute(
                              builder: (build) => Spotify()));
      }
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Invalid email or password.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      body: Center(
        child: Container(
          color: Colors.black,
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Welcome to',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 8.0),
              Image.asset(
                'assets/images/logo.png',
                height: 120.0,
                width: 120.0,
              ),
              SizedBox(height: 32.0),
              Text(
                'Login to continue',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 16.0),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.email, color: Colors.white),
                    labelStyle: TextStyle(color: Colors.white),
                    border: InputBorder.none,
                  ),
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 8.0),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.lock, color: Colors.white),
                    labelStyle: TextStyle(color: Colors.white),
                    border: InputBorder.none,
                  ),
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
              
              onPressed: () => login(context),
              style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                ),
              child: Text('Login'),
            ),
              SizedBox(height: 8.0),
               TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                              builder: (build) => RegisterPage()));
              },
              child: Text('Create an account'),
            ),
            ],
          ),
        ),
      ),
    );
  }
}

class RegisterPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void register(BuildContext context) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      // Xử lý đăng ký thành công
      User? user = userCredential.user;
      if (user != null) {
         Navigator.push(context, MaterialPageRoute(
                              builder: (build) => LoginPage()));
      }
    } catch (e) {
      // Xử lý đăng ký thất bại
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Registration failed. Please try again.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        
        child: Container(
            color: Colors.black,
          padding: EdgeInsets.all(16.0),
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
                'assets/images/logo.png',
                height: 160.0,
                width: 160.0,
              ),
             SizedBox(height: 10.0),
            Text(
              'Create an account',
              style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
            ),
            SizedBox(height: 16.0),
            Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.email, color: Colors.white),
                    labelStyle: TextStyle(color: Colors.white),
                    border: InputBorder.none,
                  ),
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 8.0),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.lock, color: Colors.white),
                    labelStyle: TextStyle(color: Colors.white),
                    border: InputBorder.none,
                  ),
                  style: TextStyle(color: Colors.white),
                ),
              ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () => register(context),
              child: Text('Register'),
            ),
            
          ],
          ),
        ),
      ),
    );
  }
}
