import 'package:bootcamp/pages/home_page.dart';
import 'package:bootcamp/theme.dart';
import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/error.png',
                width: 300,
              ),
              SizedBox(
                height: 70,
              ),
              Text(
                'Where are your going?',
                style: blackTextStyle.copyWith(
                  fontSize: 24
                ),
              ),
              SizedBox(
                height: 14,
              ),
              Text(
                'Halamannya error, silahkan coba\nlagi minggu depan',
                style: greyTextStyle.copyWith(
                  fontSize: 16
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                width: 210,
                height: 50,
                child: RaisedButton(
                  color: purpleColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(17)
                  ),
                  child: Text(
                    'Back to home',
                    style: whiteTextStyle.copyWith(
                      fontSize: 18
                    ),
                  ),
                  onPressed: (){
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                      builder: (context) => HomePage()
                    ), (route) => false);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}