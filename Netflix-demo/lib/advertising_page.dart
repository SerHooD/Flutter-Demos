import 'package:flutter/material.dart';

class AdvertisingPage extends StatefulWidget {
  const AdvertisingPage({super.key});

  @override
  State<AdvertisingPage> createState() => _AdvertisingPageState();
}

class _AdvertisingPageState extends State<AdvertisingPage> {
  final String firstPageSubtitle = "İstediğiniz her yerde izleyin";
  final String firstPageTitle1 =
      "Telefonda ,tablette, dizüstü bilgisayarda ve TV'de izleyin.";
  final String suggestTitle =
      "netflix.com/more adresine giderek bir Netflix hesabı oluşturabilir ve diğer işlemleri yapabilirsiniz";
  final String secondPageSubtitle = "Tüm hayranlara uygun plan seçenekleri";
  final String secondPageTitle1 = "Küçük ücret. Büyük Eğlence";
  final String thirdPageSubtitle = "Çevrimiçi olarak iptal edin";
  final String thirdPageTitle1 = "Bugün katılın,beklemenize gerek yok.";

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: Image.asset("images/netflixLogo.png", fit: BoxFit.cover),
          leadingWidth: 120,
          actions: [
            AppBarTextButton(title: "Gizlilik"),
            AppBarTextButton(title: "Yardım"),
          ],
        ),
        backgroundColor: AppColors.netflixBackGround,
        floatingActionButton: Padding(
          padding: UtilityPadding.horizontalBottomButtonPadding,
          child: SizedBox(
            width: double.infinity,
            child: LoginRedButton(title: "OTURUM AÇ"),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: TabBarView(
          children: [
            SuggestionPage(
              subtitle: firstPageSubtitle,
              title1: firstPageTitle1,
              title2: suggestTitle,
              path: "images/suggestion1.png",
            ),
            SuggestionPage(
              subtitle: secondPageSubtitle,
              title1: secondPageTitle1,
              title2: suggestTitle,
              path: "images/suggestion2.png",
            ),
            SuggestionPage(
              subtitle: thirdPageSubtitle,
              title1: thirdPageTitle1,
              title2: suggestTitle,
              path: "images/suggestion3.png",
            ),
          ],
        ),
      ),
    );
  }
}

class SuggestionPage extends StatelessWidget {
  const SuggestionPage({
    super.key,
    required this.subtitle,
    required this.title1,
    required this.title2,
    required this.path,
  });

  final String subtitle;
  final String title1;
  final String title2;
  final String path;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40),
      child: Column(
        children: [
          SizedBox(
            height: 250,
            child: Image.asset(path, fit: BoxFit.fill),
          ),
          SubtitleLarge(title: subtitle),
          SubtitleMedium(title: title1),
          SubtitleMedium(title: title2),
        ],
      ),
    );
  }
}

class SubtitleMedium extends StatelessWidget {
  const SubtitleMedium({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w400,
            ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class SubtitleLarge extends StatelessWidget {
  const SubtitleLarge({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 32,
            ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class AppBarTextButton extends StatelessWidget {
  const AppBarTextButton({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text(
        title,
        style: TextThemeS.mediumButtonText,
      ),
    );
  }
}

class LoginRedButton extends StatelessWidget {
  const LoginRedButton({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        backgroundColor: AppColors.netflixRed,
      ),
      onPressed: () {},
      child: Text(
        title,
        style: TextThemeS.bigButtonText,
      ),
    );
  }
}

class UtilityPadding {
  static const EdgeInsets horizontalBottomButtonPadding =
      EdgeInsets.symmetric(horizontal: 20);
}

class AppColors {
  static const Color netflixRed = Color(0xFFE20914);
  static const Color netflixBackGround = Color(0xFF010101);
}

class TextThemeS {
  static const TextStyle bigButtonText = TextStyle(
    fontSize: 16,
    color: Colors.white,
  );
  static const TextStyle mediumButtonText = TextStyle(
    fontSize: 14,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );
}
