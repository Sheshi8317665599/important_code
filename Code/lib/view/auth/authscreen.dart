import 'package:flutter/material.dart';

class Authscreen extends StatefulWidget {
  static const String routeName = '/auth-screen';
  const Authscreen({super.key});

  @override
  State<Authscreen> createState() => _AuthscreenState();
}

class _AuthscreenState extends State<Authscreen> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: screenwidth,
          height: screenheight,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                //Colors.blue.shade400,
                //Colors.green.shade400,
                Colors.white38,
                Colors.black38,
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Center(
                  child: RichText(
                    text: TextSpan(
                      text: '                            Hi,\n',
                      style:
                          TextStyle(fontSize: 20, color: Colors.grey.shade400),
                      children: [
                        TextSpan(
                          text: ' We are glad to assist you,\n',
                          style: TextStyle(
                              fontSize: 25, color: Colors.grey.shade400),
                        ),
                        TextSpan(
                          text: '     Signin or Signup,\n',
                          style: TextStyle(
                              fontSize: 30, color: Colors.grey.shade400),
                        ),
                      ],
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    width: 600,
                    height: 700,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          // Colors.blue.shade400,
                          // Colors.green.shade400,
                          Colors.white38,
                          Colors.black38,
                        ],
                      ),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        const BoxShadow(
                          blurRadius: 51,
                          color: Colors.blueGrey,
                          spreadRadius: 11,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        TabBar(
                          controller: _tabController,
                          tabs: [
                            const Tab(icon: Icon(Icons.person), text: 'Signin'),
                            const Tab(
                                icon: Icon(Icons.person_add), text: 'Signup'),
                          ],
                        ),
                        const SizedBox(height: 40),
                        Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                // Colors.blue.shade400,
                                // Colors.green.shade400,
                                Colors.white38,
                                Colors.black38,
                              ],
                            ),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              const BoxShadow(
                                blurRadius: 51,
                                color: Colors.blueGrey,
                                spreadRadius: 11,
                              ),
                            ],
                          ),
                          child: const Image(
                            image: AssetImage(
                                'assets/images/image/V_O_n_C_Logo.png'),
                          ),
                        ),
                        Expanded(
                          child: TabBarView(
                            controller: _tabController,
                            children: [
                              SignInForm(),
                              SignUpForm(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SignInForm extends StatefulWidget {
  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  bool _obscureText = true;
  bool _isChecked = false;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  var signInKey = GlobalKey<FormState>();
  void _SignInsubmit() {
    final isValid = signInKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    signInKey.currentState!.save();
  }

  bool isLoginEnabled = false;
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Form(
            key: signInKey,
            child: Column(
              children: [
                Container(
                  width: 400,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 51,
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 11,
                      ),
                    ],
                  ),
                  child: TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty ||
                          !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value)) {
                        return 'Enter a valid email!';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Email',
                      filled: true,
                      fillColor: Colors.transparent,
                      prefixIcon: const Icon(Icons.alternate_email_rounded),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.blueGrey),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  width: 400,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 51,
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 11,
                      ),
                    ],
                  ),
                  child: TextFormField(
                    controller: passwordController,
                    obscureText: _obscureText,
                    validator: (value) {
                      RegExp regex = RegExp(
                          r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                      if (value!.isEmpty) {
                        return 'Please enter password';
                      } else {
                        if (!regex.hasMatch(value)) {
                          return 'Enter valid password';
                        } else {
                          return null;
                        }
                      }
                    },
                    decoration: InputDecoration(
                      labelText: 'Password',
                      filled: true,
                      fillColor: Colors.transparent,
                      prefixIcon: const Icon(Icons.keyboard_alt_rounded),
                      suffixIcon: IconButton(
                        icon: Icon(_obscureText
                            ? Icons.visibility_off_rounded
                            : Icons.visibility_rounded),
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.blueGrey),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.center,
                  child: TextButton(
                    onPressed: () {
                      // Forgot password logic here
                    },
                    child: const Text('Forgot Password?'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 100.0, right: 100.0),
                  child: Center(
                    child: CheckboxListTile(
                      value:
                          _isChecked, // declare a boolean variable _isChecked
                      onChanged: (value) {
                        setState(() {
                          _isChecked =
                              value!; // update the value when checkbox is tapped
                        });
                      },
                      title: Text('Let Me SignIN'),
                      checkboxShape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(10), // add circular border
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                  ),
                  onPressed: () => _SignInsubmit(),
                  child: const Text('Sign In'),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      onPressed: () {
                        // Google sign in logic here
                      },
                      child: Row(
                        children: [
                          Container(
                            width: 24, // Set the width
                            height: 24, // Set the height
                            child: ImageIcon(
                              AssetImage(
                                  'assets/images/icons/google-removebg-preview.png'),
                            ),
                          ),
                          SizedBox(width: 10),
                          Text('Google'),
                        ],
                      ),
                    ),
                    const SizedBox(width: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                      ),
                      onPressed: () {
                        // Apple sign in logic here
                      },
                      child: const Row(
                        children: [
                          Icon(Icons.apple),
                          SizedBox(width: 10),
                          Text('Apple'),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SignUpForm extends StatefulWidget {
  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool _obscureConfirmText = true;
  bool _isChecked = false;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  var signUpKey = GlobalKey<FormState>();
  void _SignUpsubmit() {
    final isValid = signUpKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    signUpKey.currentState!.save();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  bool isLoginEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Form(
            key: signUpKey,
            child: Column(
              children: [
                Container(
                  width: 400, // Set the width
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 10,
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty ||
                          !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value)) {
                        return 'Enter a valid email!';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Email',
                      filled: true,
                      fillColor: Colors.transparent,
                      prefixIcon: const Icon(Icons.alternate_email_rounded),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.blueGrey),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  width: 400,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 51,
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 11,
                      ),
                    ],
                  ),
                  child: TextFormField(
                    controller: passwordController,
                    obscureText: _obscureConfirmText,
                    validator: (value) {
                      RegExp regex = RegExp(
                          r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                      if (value!.isEmpty) {
                        return 'Please enter  password';
                      } else {
                        if (!regex.hasMatch(value)) {
                          return 'Enter valid password';
                        } else {
                          return null;
                        }
                      }
                    },
                    decoration: InputDecoration(
                      labelText: 'Password',
                      filled: true,
                      fillColor: Colors.transparent,
                      prefixIcon: const Icon(Icons.keyboard_alt_rounded),
                      suffixIcon: IconButton(
                        icon: Icon(_obscureConfirmText
                            ? Icons.visibility_off_rounded
                            : Icons.visibility_rounded),
                        onPressed: () {
                          setState(() {
                            _obscureConfirmText = !_obscureConfirmText;
                          });
                        },
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.blueGrey),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  width: 400,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 51,
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 11,
                      ),
                    ],
                  ),
                  child: TextFormField(
                    controller: confirmPasswordController,
                    obscureText: _obscureConfirmText,
                    validator: (value) {
                      RegExp regex = RegExp(
                          r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                      if (value!.isEmpty) {
                        return 'Please enter Coniform password';
                      } else {
                        if (!regex.hasMatch(value)) {
                          return 'Enter valid password';
                        } else {
                          return null;
                        }
                      }
                    },
                    decoration: InputDecoration(
                      labelText: 'Confirm Password',
                      filled: true,
                      fillColor: Colors.transparent,
                      prefixIcon: const Icon(Icons.keyboard_alt_rounded),
                      suffixIcon: IconButton(
                        icon: Icon(_obscureConfirmText
                            ? Icons.visibility_off_rounded
                            : Icons.visibility_rounded),
                        onPressed: () {
                          setState(() {
                            _obscureConfirmText = !_obscureConfirmText;
                          });
                        },
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.blueGrey),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 100.0, right: 100.0),
                  child: Center(
                    child: CheckboxListTile(
                      value:
                          _isChecked, // declare a boolean variable _isChecked
                      onChanged: (value) {
                        setState(() {
                          _isChecked =
                              value!; // update the value when checkbox is tapped
                        });
                      },
                      title: Text('Let me SignIn'),
                      checkboxShape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(10), // add circular border
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                  ),
                  onPressed: () => _SignUpsubmit(),
                  child: const Text('Sign Up'),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      onPressed: () {
                        // Google sign in logic here
                      },
                      child: Row(
                        children: [
                          Container(
                            width: 24, // Set the width
                            height: 24, // Set the height
                            child: ImageIcon(
                              AssetImage(
                                  'assets/images/icons/google-removebg-preview.png'),
                            ),
                          ),
                          SizedBox(width: 10),
                          Text('Google'),
                        ],
                      ),
                    ),
                    const SizedBox(width: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                      ),
                      onPressed: () {
                        // Apple sign in logic here
                      },
                      child: const Row(
                        children: [
                          Icon(Icons.apple),
                          SizedBox(width: 10),
                          Text('Apple'),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
