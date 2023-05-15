import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  StateMachineController? controller;

  SMIInput<bool>? isChecking;
  SMIInput<bool>? isHandsUp;
  SMIInput<bool>? trigSuccess;
  SMIInput<bool>? trigFail;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    'assets/images/login_bg.jpg',
                  ),
                  fit: BoxFit.fill)),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(

                  children: [


                    SizedBox(height: 50,),





                    Container(
                      height: 200,
                      width: size.width,
                      child: Center(
                        child: Container(
                          width: 250,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Color(0xFFEFF3F6),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: RiveAnimation.asset(
                              'assets/animations/teddyPolar.riv',
                              fit: BoxFit.fitHeight,
                              stateMachines: const ['Login Machine'],
                              onInit: (artboard) {
                                controller =
                                    StateMachineController.fromArtboard(
                                        artboard, 'Login Machine');
                                if (controller == null) return;
                                artboard.addController(controller!);
                                isChecking =
                                    controller?.findInput('isChecking');
                                isHandsUp = controller?.findInput('isHandsUp');
                                trigSuccess =
                                    controller?.findInput('trigSuccess');
                                trigFail = controller?.findInput('trigFail');
                              },
                            ),
                          ),
                        ),
                      ),
                    ),














                    SizedBox(
                      height: 100,
                    ),
                    Container(
                      width: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),

                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: TextField(
                          onChanged: (value) {
                            if (isHandsUp != null) {
                              isHandsUp!.change(false);
                            }
                            if (isChecking == null) return;
                            isChecking!.change(true);
                          },
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            label: Text('E-mail'),
                            hintText: 'E-mail',
                            prefixIcon: Icon(Icons.mail),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),

                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: TextField(
                          onChanged: (value) {
                            if (isChecking != null) {
                              isChecking!.change(false);
                            }

                            if (isHandsUp == null) return;
                            isHandsUp!.change(true);
                          },
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: 'Password',
                            label: Text('Password'),
                            prefixIcon: Icon(Icons.lock),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),

                    InkWell(
                      onTap: () {
                        if (isHandsUp != null) {
                          isHandsUp!.change(false);
                        }
                        if (trigSuccess != null) {
                          trigSuccess!.change(true);
                        }
                        /*  if (isHandsUp != null) {
                          isHandsUp!.change(false);
                        }
                        if (trigFail != null) {
                          trigFail!.change(true);
                        }
                         */
                      },
                      child: Container(
                        width: 200,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xFFEFF3F6),
                        ),
                        child: Center(
                            child: Text(
                              'SignIn',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                            )),
                      ),
                    ),

                    SizedBox(height: 40,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [TextButton(onPressed: () {

                      }, child: Text('Signup')),TextButton(onPressed: () {

                      }, child: Text('Forgot Passwords'))],
                    )
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
