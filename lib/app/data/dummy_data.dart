import 'package:hikaya/app/models/category_home_model.dart';
import 'package:hikaya/app/models/episode_model.dart';

import '../models/activity_model.dart';
import '../models/course_model.dart';
import '../models/home_model.dart';
import '../models/story_model.dart';

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
   HomeModel(imagePath: 'assets/images/art3.png', title:'طرق تنشئ بها طفلك على حب فلسطين',by: 'بقلم: ',date: '25 مايو, 2021',url: 'https://bit.ly/40UCScd'),

 ];

 static List<CourseModel> coursesData=[
   CourseModel(
     courseName: 'حكاية فلسطين',
     description:
     'سنتعرف معًا على تاريخ فلسطين العريق وأهم الأحداث التي مرت بها منذ آلاف السنين. ستتعلم عن أول من بنى المسجد الأقصى، والأنبياء الذين عاشوا ودفنوا في أرضها المباركة، وقصصهم مع بني إسرائيل. سنجيب أيضًا على أسئلة مهمة مثل: هل فلسطين أرض عربية؟ وما حقيقة هيكل سليمان الذي يدّعي اليهود وجوده؟',
     imageCoursePath: 'assets/images/course_image_1.png',
     episodeModel: [
       EpisodeModel(title: 'الحلقة الأولى ', image: 'https://i.ytimg.com/vi/HdoXDUQ38TA/hqdefault.jpg', url: 'https://www.youtube.com/watch?v=HdoXDUQ38TA&list=PLpQjDP6iQE7gw2Gik_jPl46yAw9_zha7X&index=1',duration: const Duration(minutes: 10, seconds: 31),),
       EpisodeModel(title: 'الحلقة الثانية ', image: 'https://i.ytimg.com/vi/3kOi618UyY8/hqdefault.jpg', url: 'https://www.youtube.com/watch?v=3kOi618UyY8&list=PLpQjDP6iQE7gw2Gik_jPl46yAw9_zha7X&index=2',duration:const Duration(minutes: 11, seconds: 58),),
       EpisodeModel(title: 'الحلقة الثالثة ', image: 'https://i.ytimg.com/vi/u103wV8uhEU/hqdefault.jpg', url: 'https://www.youtube.com/watch?v=u103wV8uhEU&list=PLpQjDP6iQE7gw2Gik_jPl46yAw9_zha7X&index=3',duration:const Duration(minutes: 11, seconds: 45),),
       EpisodeModel(title: 'الحلقة الرابعة ', image: 'https://i.ytimg.com/vi/WiWlMEGWhZY/hqdefault.jpg', url: 'https://www.youtube.com/watch?v=WiWlMEGWhZY&list=PLpQjDP6iQE7gw2Gik_jPl46yAw9_zha7X&index=5',duration:const Duration(minutes: 11, seconds: 48),),
     ]
     // imagePath: ,
   ),

 ];

 static List<StoryModel> storiesData=[
   StoryModel(url: 'https://www.youtube.com/watch?v=gnb756N6mXs&t=22s', title: 'الشيخ ياسر والضيف الغدار', imagePath: 'assets/images/story_image_1.png'),
   StoryModel(url: 'https://www.youtube.com/watch?v=kXLbMw-sT5o', title: 'قصة فلسطين للأطفال', imagePath: 'assets/images/story_image_2.png'),

 ];

 static List<ActivityModel> activitiesData=[
   ActivityModel(url: 'https://bit.ly/3UUOnMX', title: 'مذكرات تسالي وتلوين', imagePath: 'assets/images/activity_image_1.png'),
   ActivityModel(url: 'https://bit.ly/3ZbYm3c', title: 'تلوين الأقصى للأطفال', imagePath: 'assets/images/activity_image_2.png'),
   ActivityModel(url: 'https://bit.ly/4fQiGfO', title: 'حي الشيخ جراح', imagePath: 'assets/images/activity_image_3.png'),

 ];


}