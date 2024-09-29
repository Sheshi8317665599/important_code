import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: Column(
        children: [
          Container(
            color: Colors.black87,
            width: double.infinity,
            child: Row(
              children: [
                Container(
                  constraints: BoxConstraints(
                    maxWidth: 1232.0,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            child: ImageIcon(
                              AssetImage(
                                  'assets/images/image/V_O_n_C_Logo.png'),
                              color: Colors.black87,
                            ),
                          ),
                          Spacer(),
                          
                        ],
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
