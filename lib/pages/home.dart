import 'package:crud/controller/songs_controller.dart';
import 'package:crud/controller/popular_today_controller.dart';
import 'package:crud/controller/search_songs_controller.dart';
import 'package:crud/controller/top_songs_controller.dart';
import 'package:crud/notificationservice/local_notification_service.dart';
import 'package:crud/pages/home_tab/all_songs.dart';
import 'package:crud/pages/home_tab/other_pages.dart';
import 'package:crud/utils/colors.dart';
import 'package:crud/utils/dimensions.dart';
import 'package:crud/widgets/home/appbar.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _textController = TextEditingController();
  final TopSongsController topSongsController = Get.put(TopSongsController());
  final SongsController songsController = Get.put(SongsController());
  final SearchSongsController searchMoviesController =
      Get.put(SearchSongsController());
  final PopularTodayController popularTodayController =
      Get.put(PopularTodayController());

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

//* firebase notification
  @override
  void initState() {
    super.initState();

    //? 1. This method call when app in terminated state and you get a notification
    //? when you click on notification app open from terminated state and you can get notification data in this method

    FirebaseMessaging.instance.getInitialMessage().then(
      (message) {
        if (message != null) {
          // if (message.data['_id'] != null) {
          //   Navigator.of(context).push(
          //     MaterialPageRoute(
          //       builder: (context) => DemoScreen(
          //         id: message.data['_id'],
          //       ),
          //     ),
          //   );
          // }
        }
      },
    );

    //? 2. This method only call when App in forground it mean app must be opened
    FirebaseMessaging.onMessage.listen(
      (message) {
        if (message.notification != null) {
          LocalNotificationService.createanddisplaynotification(message);
        }
      },
    );

    //? 3. This method only call when App in background and not terminated(not closed)
    FirebaseMessaging.onMessageOpenedApp.listen(
      (message) {
        if (message.notification != null) {
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 5, vsync: this);
    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: BaseAppBar(
          title: const Text("YEPHOW7"),
          appBar: AppBar(),
          myMenuItems: const ["Home", "Post A Song"]),
      body: Column(
        children: [
          SizedBox(
            height: Dimensions.height10,
          ),

          SizedBox(
            height: Dimensions.height45 * 1.5,
            child: Form(
              key: _formKey,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: Dimensions.width30, vertical: 0.0),
                      margin:
                          EdgeInsets.symmetric(horizontal: Dimensions.width20),
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius15),
                        color: AppColors.primary,
                      ),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        controller: _textController,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          errorStyle: TextStyle(
                              fontSize: Dimensions.font16, height: 0.3),
                          border: InputBorder.none,
                          hintText: "Search for a song",
                          hintStyle: const TextStyle(
                              color: Color.fromARGB(255, 143, 143, 143)),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        Get.toNamed("/search",
                            arguments: {"text": _textController.text});
                        searchMoviesController
                            .fetchProduct(_textController.text);
                      }
                    },
                    child: Container(
                      height: Dimensions.height45 * 1.2,
                      width: Dimensions.height45 * 1.2,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius15),
                        gradient: LinearGradient(
                          colors: [const Color(0xffffc3b1), AppColors.orange],
                          begin: Alignment.bottomRight,
                          end: Alignment.topLeft,
                        ),
                      ),
                      margin:
                          EdgeInsets.symmetric(horizontal: Dimensions.width20),
                      child: const Center(
                        child: Icon(
                          CupertinoIcons.search,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: Dimensions.height20,
          ),
          //tabbar
          Container(
            height: Dimensions.height45 * 1.2,
            padding: EdgeInsets.only(bottom: Dimensions.height10),
            child: TabBar(
                controller: tabController,
                labelColor: Colors.white,
                isScrollable: true,
                indicator: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(Dimensions.radius10 * 0.5),
                  gradient: LinearGradient(
                    colors: [const Color(0xffffc3b1), AppColors.orange],
                    begin: Alignment.bottomRight,
                    end: Alignment.topLeft,
                  ),
                ),
                tabs: const [
                  Tab(
                    text: "All",
                  ),
                  Tab(
                    text: "English",
                  ),
                  Tab(
                    text: "Hindi",
                  ),
                  Tab(
                    text: "Kpop",
                  ),
                  Tab(
                    text: "Others",
                  ),
                ]),
          ),
          //tabbar view
          Expanded(
            child: SizedBox(
              width: double.maxFinite,
              child: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: tabController,
                  children: [
                    AllSongs(),
                    OtherPages(
                        text: "Trending english songs",
                        text2: "English songs",
                        topcontroller: topSongsController.engTopSongsList,
                        controller: songsController.engSongsList),
                    OtherPages(
                        text: "Trending Hindi songs",
                        text2: "Hindi songs",
                        topcontroller: topSongsController.hindiTopSongsList,
                        controller: songsController.hindiSongsList),
                    OtherPages(
                        text: "Trending Kpop songs",
                        text2: "Kpop songs",
                        topcontroller: topSongsController.kpopTopSongsList,
                        controller: songsController.kpopSongsList),
                    OtherPages(
                        text: "Trending Others songs",
                        text2: "You may like",
                        topcontroller: topSongsController.otherTopSongsList,
                        controller: songsController.othersSongsList),
                  ]),
            ),
          )
        ],
      ),
    );
  }
}
