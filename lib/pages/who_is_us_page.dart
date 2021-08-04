import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:seventh_art_app/constants.dart';

class WhoIsUsPage extends StatelessWidget {
  static const routeName = '/who_is_us_page';

  Widget buildText1(String text) {
    return Text(
      text,
      style: kTitle2TextStyle.copyWith(
          color: kThirdColor, fontWeight: FontWeight.bold),
    );
  }

  Widget buildText2(String text, TextAlign textAlign) {
    return Text(
      text,
      softWrap: true,
      overflow: TextOverflow.fade,
      textAlign: textAlign,
      style:
          kTitle2TextStyle.copyWith(color: kPrimaryColor, fontSize: 16),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Seventh Art'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 2,
            child: Image.asset(
              'assets/art7.png',
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            flex: 3,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: buildText2(
                      'الفن السابع هو مكتبة أفلام ضخمة، تضم أكبر أرشيف في سوريا، يحتوي الأرشيف على الكثير من الأفلام الأجنبية والعربية، القديمة والحديثة، زورنا لتعرفو المزيد.',
                      TextAlign.right,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  buildText1('العنوان:'),
                  const SizedBox(
                    height: 10,
                  ),
                  buildText2('اللاذقية - مشروع الزراعة - جانب حلويات الأفندي.', TextAlign.center),
                  const SizedBox(
                    height: 10,
                  ),
                  buildText1('هاتف:'),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    '041 - 2422572',
                    textDirection: TextDirection.ltr,
                    softWrap: true,
                    overflow: TextOverflow.fade,
                    style: kTitle2TextStyle.copyWith(
                        color: kPrimaryColor, fontSize: 16),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  buildText2('إذا كان لديك أي اقتراح أو فكرة، راسلنا على الايميل التالي :',TextAlign.center),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'somareee@gmail.com',
                    textDirection: TextDirection.ltr,
                    softWrap: true,
                    overflow: TextOverflow.fade,
                    textAlign: TextAlign.center,
                    style: kEmailTextStyle,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
