import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app_/pages/home.page.dart';
import 'package:recipe_app_/pages/login.page.dart';
import 'package:recipe_app_/services/prefrences.service.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  late GlobalKey<FormState> fromKey;

  bool obsecureText = true;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    fromKey = GlobalKey<FormState>();
    super.initState();
  }

  void toggleObsecure() {
    obsecureText = !obsecureText;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/img1.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 80.0),
            const Text(
              "Register",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Lemongrass Regular'),
            ),
            const SizedBox(
              height: 100,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Form(
                  key: fromKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: emailController,
                          decoration: InputDecoration(
                            label: Text(
                              'Full Name',
                              style: TextStyle(
                                  color: Color.fromARGB(130, 245, 245, 245)),
                            ),
                            prefixIcon: Icon(Icons.person),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'name is required';
                            }
                          }),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: emailController,
                          decoration: InputDecoration(
                            label: Text(
                              'Email Address',
                              style: TextStyle(
                                  color: Color.fromARGB(130, 245, 245, 245)),
                            ),
                            prefixIcon: Icon(Icons.email_outlined),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'email is required';
                            }

                            if (!EmailValidator.validate(value)) {
                              return 'Not Valid Email';
                            }
                            return null;
                          }),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                          obscureText: obsecureText,
                          controller: passwordController,
                          decoration: InputDecoration(
                              label: const Text(
                                'Password',
                                style: TextStyle(
                                    color: Color.fromARGB(130, 245, 245, 245)),
                              ),
                              prefixIcon: Icon(Icons.lock_outline),
                              suffixIcon: InkWell(
                                onTap: () => toggleObsecure(),
                                child: Icon(obsecureText
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                              )),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'password is required';
                            }

                            if (value.length < 6) {
                              return 'password too short';
                            }
                            return null;
                          }),
                      const SizedBox(
                        height: 40,
                      ),
                      ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        child: SizedBox(
                          width: 329,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () async {
                              if (fromKey.currentState?.validate() ?? false) {
                                await PrefrencesService.prefs
                                    ?.setBool('isLogin', true);

                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => HomePage()));
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepOrange,
                            ),
                            child: const Text(
                              'Register',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: 'Lemongrass Regular',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 150,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("Already have an account?",
                              style: TextStyle(color: Colors.white)),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => LoginPage()));
                            },
                            child: Text(
                              'Sign In',
                              style: TextStyle(color: Colors.deepOrange),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
