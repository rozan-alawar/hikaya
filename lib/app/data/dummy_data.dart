import 'package:hikaya/app/models/category_home_model.dart';

import '../models/home_model.dart';

class AppDummyData{
  static final List<CategoryModel> categoryHomeData = [
    CategoryModel(
      title: 'كورسات توعية',
      image: 'assets/images/courses.png',
    ),
    CategoryModel(
      title: 'قصص وأنشطة متنوعة',
      image: 'assets/images/stories.png',
    ),
    CategoryModel(
      title: 'لعبة التغريبة',
      image: 'assets/images/game.png',
    ),
  ];

 static List<HomeModel> HomeData=[
   HomeModel(imagePath: 'assets/images/art1.png', title:'كيف أتحدث لطفلي عن فلسطين؟',by: 'بقلم: ',date: '25 مايو, 2021',url: 'https://bit.ly/3YWMmRL'),
   HomeModel(imagePath: 'assets/images/art2.png', title:'كيف نرسخ عقيدة أبنائنا حول فلسطين؟',by: 'بقلم: ',date: '25 مايو, 2021',url: 'https://bit.ly/4fQ5doo'),
   HomeModel(imagePath: 'assets/images/art3.png', title:'طرق تنشئ بها طفلك على حب فلسطين',by: 'بقلم: ',date: '25 مايو, 2021',url: 'http://bit.ly/40UCScd'),

 ];


}