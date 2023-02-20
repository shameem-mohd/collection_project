import 'package:flutter/material.dart';
import 'package:project/ui/home/CreateCustomer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mHeight = MediaQuery.of(context).size.height;
    final mWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              height: mHeight * .07,
              width: mWidth * .8,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (ctx) => const CreateCustomer()));
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    primary:
                        const Color(0xff264050), //background color of button
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text(
                    "CREATE CUSTOMER",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
