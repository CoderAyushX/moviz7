import 'package:crud/controller/movies_controller.dart';
import 'package:crud/controller/popular_today_controller.dart';
import 'package:crud/controller/search_movies_controller.dart';
import 'package:crud/controller/top_movies_controller.dart';
import 'package:crud/pages/home_tab/Bollywood.dart';
import 'package:crud/pages/home_tab/all_movies.dart';
import 'package:crud/utils/dimensions.dart';
import 'package:crud/widgets/home/appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  final TextEditingController _textController = TextEditingController();
  final TopMoviesController topMoviesController =
      Get.put(TopMoviesController());
  final MoviesController moviesController = Get.put(MoviesController());
  final SearchMoviesController searchMoviesController =
      Get.put(SearchMoviesController());
  final PopularTodayController popularTodayController =
      Get.put(PopularTodayController());

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 5, vsync: this);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: BaseAppBar(
          title: const Text("Iyu-Mov"),
          appBar: AppBar(),
          myMenuItems: const ["Home", "Post A Movie"]),
      body: Column(
        children: [
          SizedBox(
            height: Dimensions.height10,
          ),
          SizedBox(
            height: Dimensions.height45 * 1.5,
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
                        color: const Color.fromARGB(255, 56, 55, 55)),
                    child: TextFormField(
                        controller: _textController,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Search for a movie",
                          hintStyle: TextStyle(
                              color: Color.fromARGB(255, 143, 143, 143)),
                        )),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed("/search",
                        arguments: {"text": _textController.text});
                    searchMoviesController.fetchProduct(_textController.text);
                  },
                  child: Container(
                    height: Dimensions.height45 * 1.2,
                    width: Dimensions.height45 * 1.2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius15),
                      gradient: const LinearGradient(
                        colors: [Color(0xffffc3b1), Color(0xffff6a3b)],
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
          SizedBox(
            height: Dimensions.height20,
          ),
          //tabbar
          Container(
            height: Dimensions.height45 * 1.2,
            padding: EdgeInsets.only(bottom: Dimensions.height10),
            child: TabBar(
                padding: EdgeInsets.symmetric(horizontal: Dimensions.width20),
                controller: tabController,
                labelColor: Colors.white,
                isScrollable: true,
                indicator: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(Dimensions.radius10 * 0.5),
                  gradient: const LinearGradient(
                    colors: [Color(0xffffc3b1), Color(0xffff6a3b)],
                    begin: Alignment.bottomRight,
                    end: Alignment.topLeft,
                  ),
                ),
                tabs: const [
                  Tab(
                    text: "All",
                  ),
                  Tab(
                    text: "Bollywood",
                  ),
                  Tab(
                    text: "Hollywood",
                  ),
                  Tab(
                    text: "South",
                  ),
                  Tab(
                    text: "Anime",
                  )
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
                    AllMovies(),
                    Bollywood(
                        text: "Top Bollywood movies",
                        text2: "Bollywood movies",
                        controller: moviesController.bollymoviesList),
                    Bollywood(
                        text: "Top Hollywood movies",
                        text2: "Hollywood movies",
                        controller: moviesController.hollymoviesList),
                    Bollywood(
                        text: "Top South movies",
                        text2: "South movies",
                        controller: moviesController.southmoviesList),
                    Bollywood(
                        text: "Top Animes",
                        text2: "Animes",
                        controller: moviesController.animemoviesList),
                  ]),
            ),
          )
        ],
      ),
    );
  }
}
