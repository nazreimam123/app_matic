import 'package:app_matic/src/views/shop/shop.dart';
import 'package:app_matic/src/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectLanguage extends StatefulWidget {
  const SelectLanguage({super.key});

  @override
  State<SelectLanguage> createState() => _SelectLanguageState();
}

class _SelectLanguageState extends State<SelectLanguage> {
  static const backgroundColor = Color(0xFF171221);

  List language_cnt = ['English', 'Hindi', 'Spanish', 'French', 'German'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: Text(
          'Select Language',
          style: TextStyle(
            color: Colors.white,
            // fontSize: 12,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: language_cnt.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {},
            child: ListTile(
              leading: Image.asset('assets/images/world_copy.png'),
              title: Text(
                language_cnt[index],
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: CustomButton(
        text: 'Continue',
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Shop()),
          );
        },
      ),
    );
  }
}
