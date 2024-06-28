import 'package:calculator/components/drawer.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      drawer: const DrawerSection(),
      body: Stack(
          children: <Widget>[
            Positioned.fill(
              child: Image.asset(
                'assets/image/background.jpg',
                fit: BoxFit.cover,
              ),
            ),

            // Overlay with color and opacity
            Positioned.fill(
              child: Container(
                color: const Color.fromRGBO(2, 28, 49, 0.75),
              ),
            ),
        Column(
          children: [
            //login profile pic and name
            Container(
              margin: const EdgeInsets.only(top: 50),
              width: 80,
              height: 80,
               child: const CircleAvatar(
                backgroundImage: AssetImage('assets/image/avatarone.jpg'),
               ),
              ),
               
              const SizedBox(height: 12),

             const  Center(
                child: Text("LOGIN",style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
                ),
              ),
              
              const SizedBox(height: 22),

              const  Center(
                child: Text("Enter your Email and Password",style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                ),
              ),

               const SizedBox(height: 12),

            //email
            Container(
              width: 340,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              margin: const EdgeInsets.only(left: 5, right: 5),
              child:  TextField(
                 
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                     
                  ),
                  hintText: 'Email',
                  hintStyle: const TextStyle(
                    color:  Color.fromARGB(190, 1, 17, 31),
                  ),
                ),
                style: const TextStyle(
                  color:  Color.fromARGB(190, 1, 17, 31),
                  fontSize: 24,
                ),
              ),
            ),
             
             const  SizedBox(height: 22),

            //password
            Container(
              width: 340,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              margin: const EdgeInsets.only(left: 5, right: 5),
              child:  TextField(
                 
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                     
                  ),
                  hintText: 'Enter Your Password',
                  //icon:
                  hintStyle: const TextStyle(
                    color:  Color.fromARGB(190, 1, 17, 31),
                  ),
                ),
                style: const TextStyle(
                  color:  Color.fromARGB(190, 1, 17, 31),
                  fontSize: 24,
                ),
              ),
            ),
        
            const SizedBox(height: 12),
              
                const Text("forgot password!",style: TextStyle(
                          color:  Color.fromARGB(253, 134, 15, 170),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                 ),


             const SizedBox(height: 30),

            //signin
            Container(
               width: 340,
              height: 50,
              decoration: BoxDecoration(
                color: const Color.fromARGB(253, 134, 15, 170),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child:   Text("SIGN IN",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                ),
                ),
              ),  
            ),

            const  SizedBox(height: 15), 
            
           const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                  Text("Don't have an account?",
                style: TextStyle(
                 color:  Colors.white,
                 letterSpacing: 1,
                 fontSize: 20,
                 fontWeight: FontWeight.bold,
                 ),
                 ),
                  SizedBox(width: 5),

                  Text("Sign Up",style: TextStyle(
                   color:  Color.fromARGB(253, 134, 15, 170),
                   fontSize: 20,
                   fontWeight: FontWeight.bold,
                   ), 
                   )
                   
                   
              ],
            ),
          ],
        ),
        ],
      ),

    );
  }
}