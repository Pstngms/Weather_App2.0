import 'package:flutter/material.dart';


class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Color(0xffE2EBFF),
          ),
          Column(
            children: const [
              Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 125),
                  child: Text(
                    "Luka's Weather",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 35
                    ),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 125),
                  child: CircularProgressIndicator(
                    color: Colors.black,

                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}