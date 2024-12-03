import 'package:get/get.dart';

import '../../../models/intro_page_model.dart';

class IntroController extends GetxController {
  //TODO: Implement IntroController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  var selectedPageIndex = 0.obs;
  bool get isLastPage => selectedPageIndex.value == onboardingPages.length - 1;

  var onboardingPages = [
    OnboardingPageModel(
      imageAsset: 'assets/images/first_image_on_boarding.png',
      title: 'ساعد اطفالك في فهم\nالحكاية الفلسطينية',
      subTitle: 'من خلال إرشادات ونصائح مبسطة\nلجعل أطفالك يفهمون تاريخ فلسطين',
      buttonText: 'انطلق',
    ),
    OnboardingPageModel(
      imageAsset: 'assets/images/second_image_on_boarding.png',
      title: 'استمتع بقراءة قصص وكتب\nعن تاريخ فلسطين',
      subTitle: 'قصص تناسب الصغار والكبار\nسهولة حفظ معرفة تاريخ فلسطين\nللحفاظ عليها',
      buttonText: 'التالي',
    ),
    OnboardingPageModel(
      imageAsset: 'assets/images/third_image_on_boarding.png',
      title: 'تعلم خطوة بخطوة مع\nالكورسات!',
      subTitle: 'اكتسب ثقافة تاريخية سياسية عن فلسطين\nمن اكثر المناهج تقدم المعرفة وسهلة\nمبسوطة لجعل التعلم متعة وتربية الأطفال',
      buttonText: 'ابدأ',
    ),
  ];

  void nextPage() {
    if (isLastPage) {
      // Navigate to home page or main app
      Get.offAllNamed('/home');
    } else {
      selectedPageIndex.value++;
    }
  }

  void skipToEnd() {
    selectedPageIndex.value = onboardingPages.length - 1;
  }
}
