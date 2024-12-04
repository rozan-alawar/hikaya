import 'package:get/get.dart';

import '../../../models/intro_page_model.dart';

class IntroController extends GetxController {
  var selectedPageIndex = 0.obs;

  List<OnboardingPageModel> onboardingPages = [
    OnboardingPageModel(
      imageAsset: 'assets/images/first_image_on_boarding.png',
      title: 'ساعد أطفالك في فهم\nالحكاية الفلسطينية',
      subTitle:
          'من خلال إرشادات ونصائح مخصصة.\nدليل كامل لتسهيل تعليم أطفالك عن هويتهم.',
    ),
    OnboardingPageModel(
      imageAsset: 'assets/images/second_image_on_boarding.png',
      title: 'استمتع بقراءة قصص وكتب\nعن تاريخ فلسطين',
      subTitle:
          'قصص مليئة بالمعاني والتفاصيل، نصوص\nمشوقة، صور جميلة، وسرد صوتي يضيف\nللحكاية روحاً',
    ),
    OnboardingPageModel(
      imageAsset: 'assets/images/third_image_on_boarding.png',
      title: 'تعلم خطوة بخطوة مع\nالكورسات!',
      subTitle:
          'اكتشف رحلة تعليمية متكاملة عن فلسطين.\nمن الماضي الحاضر، تقدم الكورسات وحدات\nمتسلسلة تجعل التعلم ممتعاً وسهلاً للأطفال',
    ),
  ];

  void nextPage() {
    if (selectedPageIndex.value == onboardingPages.length - 1) {
      Get.offAllNamed('/auth');
    } else {
      selectedPageIndex.value++;
    }
  }
}
