import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home_screen.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isLogin = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Arka plan resmi
          Positioned.fill(
            child: Image.asset(
              'assets/background.png',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 80),

                // ÜSTTEKİ "TEDCOM YAZISI"
                Text(
                  'Tedcom',
                  style: GoogleFonts.rosario(
                    fontSize: 50,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        blurRadius: 10,
                        color: Colors.black.withOpacity(0.5),
                        offset: Offset(4, 4),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20),

                // Beyaz kutu içinde form
                Container(
                  padding: EdgeInsets.all(20),
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [

                      // Log In ve Sign Up düğmelerinin bulunduğu alan
                      Stack(
                        children: [
                          // Üstteki kırmızı ve beyaz çubuklar
                          Container(
                            width: 320,
                            height: 54,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(146, 236, 187, 187),
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(
                                color: Colors.red,
                                width: 2,
                              )
                            ),

                            child: Stack(
                              children: [
                                AnimatedPositioned(
                                  duration: const Duration(milliseconds: 300),
                                  left: isLogin
                                      ? -2
                                      : 150,
                                  child: Container(
                                    width: 160,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.red.shade900,
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Log In ve Sign Up düğmeleri
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    isLogin = true;
                                  });
                                },
                                child: Text(
                                  'Log In',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: isLogin
                                        ? Colors.white
                                        : Colors.red.shade600,
                                  ),
                                ),
                              ),

                              SizedBox(width: 70,height: 50),

                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    isLogin = false;
                                  });
                                },
                                child: Text(
                                  'Sign Up',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: isLogin
                                        ? Colors.red.shade700
                                        : Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      // Formu gösteren widget
                      SizedBox(height: 20),

                      AnimatedSwitcher(
                        duration: Duration(milliseconds: 300),
                        child: isLogin ? LoginForm() : SignUpForm(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// LOGİN FORMU
class LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      key: ValueKey(1),
      children: [
        const TextField(
          decoration: InputDecoration(
            labelText: 'E-mail',
          ),
        ),
        SizedBox(height: 10),
        const TextField(
          decoration: InputDecoration(
            labelText: 'Şifre',
          ),
          obscureText: true,
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            'Şifrenizi mi unuttunuz?',
            style: TextStyle(color: Colors.black),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            // HomeScreen'e geçiş işlemi eklendi
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red.shade800, // Düğme rengi
          ),
          child: const Text(
            'Log In',
            style: TextStyle(color: Colors.white),
          ),
        ),
        SizedBox(height: 15),
        Text("OR"),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Image.network(
                  "https://cdn1.iconfinder.com/data/icons/google-s-logo/150/Google_Icons-09-512.png",
                  scale: 10),
              onPressed: () {},
            ),
            IconButton(
              icon: Image.network(
                  "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b8/2021_Facebook_icon.svg/2048px-2021_Facebook_icon.svg.png",
                  scale: 60),
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }
}

// SIGNUP FORMU
class SignUpForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      key: ValueKey(2),
      children: [
        const TextField(
          decoration: InputDecoration(
            labelText: 'E-mail',
          ),
        ),
        SizedBox(height: 10),
        const TextField(
          decoration: InputDecoration(
            labelText: 'İsim Soyisim',
          ),
        ),
        SizedBox(height: 10),
        const TextField(
          decoration: InputDecoration(
            labelText: 'Şifre',
          ),
          obscureText: true,
        ),
        SizedBox(height: 10),
        const TextField(
          decoration: InputDecoration(
            labelText: 'Şifre Tekrar',
          ),
          obscureText: true,
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            // HomeScreen'e geçiş işlemi eklendi
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red.shade800, // Düğme rengi
          ),
          child: const Text(
            'Sign Up',
            style: TextStyle(color: Colors.white),
          ),
        ),
        SizedBox(height: 15),
        Text("OR"),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Image.network(
                  "https://cdn1.iconfinder.com/data/icons/google-s-logo/150/Google_Icons-09-512.png",
                  scale: 10),
              onPressed: () {},
            ),
            IconButton(
              icon: Image.network(
                  "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b8/2021_Facebook_icon.svg/2048px-2021_Facebook_icon.svg.png",
                  scale: 60),
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }
}
