import 'package:crud/services/remote_service.dart';
import 'package:crud/utils/dimensions.dart';
import 'package:crud/widgets/postmovies_textform.dart';
import 'package:crud/widgets/bigtext.dart';
import 'package:crud/widgets/smalltext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostAMovie extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  PostAMovie({Key? key}) : super(key: key);

  //? controllers
  final TextEditingController nameController = TextEditingController();
  final TextEditingController movieUrlController = TextEditingController();
  final TextEditingController langController = TextEditingController();
  final TextEditingController catController = TextEditingController();
  final TextEditingController dlinkController = TextEditingController();
  final TextEditingController descController = TextEditingController();

  _postData() async {
    Map data = {
      "name": nameController.text.toString(),
      "desc": descController.text.toString(),
      "dlink": dlinkController.text.toString(),
      "movieImg": movieUrlController.text.toString(),
      "lang": langController.text.toString(),
      "cat": catController.text.toString(),
      "rating": 1.toString()
    };
    await RemoteServices().postData(data, "postamovie");
    Get.snackbar("successfully posted", "Thanks for posting!",
        colorText: Colors.white,
        isDismissible: true,
        dismissDirection: DismissDirection.horizontal,
        borderRadius: 10);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          margin: EdgeInsets.only(top: Dimensions.height35),
          child: SingleChildScrollView(
            // physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: Dimensions.width30),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: Dimensions.height150 / 4,
                    ),
                    BigText(
                      text: "Post a movie link",
                      size: Dimensions.font26,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(
                      height: Dimensions.height10 / 2,
                    ),
                    const SmallText(text: "Help us to grow!"),
                    SizedBox(
                      height: Dimensions.height45,
                    ),
                    PostMoviesTextField(
                      labletext: "Movie Image Url",
                      icon: const Icon(
                        Icons.image,
                        color: Colors.white,
                      ),
                      controller: movieUrlController,
                      regExp: RegExp(
                          r"^((([A-Za-z]{3,9}:(?:\/\/)?)(?:[-;:&=\+\$,\w]+@)?[A-Za-z0-9.-]+|(?:www.|[-;:&=\+\$,\w]+@)[A-Za-z0-9.-]+)((?:\/[\+~%\/.\w-_]*)?\??(?:[-\+=&;%@.\w_]*)#?(?:[\w]*))?)"),
                    ),
                    SizedBox(
                      height: Dimensions.height30,
                    ),
                    PostMoviesTextField(
                      labletext: "Movie Name",
                      icon: const Icon(
                        Icons.text_fields_rounded,
                        color: Colors.white,
                      ),
                      controller: nameController,
                      regExp: RegExp(r"^(.|\s)*[a-zA-Z]+(.|\s)*$"),
                    ),
                    SizedBox(
                      height: Dimensions.height30,
                    ),
                    TextFormField(
                      minLines: 2,
                      maxLines: 5,
                      controller: descController,
                      validator: (value) {
                        if (value!.isEmpty ||
                            !RegExp(r"^(.|\s)*[a-zA-Z]+(.|\s)*$")
                                .hasMatch(value)) {
                          return "Enter Something!";
                        } else {
                          return null;
                        }
                      },
                      style: const TextStyle(color: Colors.white),
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        icon: const Icon(
                          Icons.description,
                          color: Colors.white,
                        ),
                        label: const Text("description"),
                        labelStyle: const TextStyle(color: Colors.grey),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 143, 143, 143)),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius10),
                        ),
                      ),
                    ),
                    PostMoviesTextField(
                      labletext: "langauge",
                      icon: const Icon(
                        Icons.language_outlined,
                        color: Colors.white,
                      ),
                      controller: langController,
                      regExp: RegExp(r"^(.|\s)*[a-zA-Z]+(.|\s)*$"),
                    ),
                    SizedBox(
                      height: Dimensions.height30,
                    ),
                    PostMoviesTextField(
                      labletext: "category",
                      icon: const Icon(
                        Icons.category,
                        color: Colors.white,
                      ),
                      controller: catController,
                      regExp: RegExp(r"^(.|\s)*[a-zA-Z]+(.|\s)*$"),
                    ),
                    SizedBox(
                      height: Dimensions.height30,
                    ),
                    PostMoviesTextField(
                      labletext: "download link",
                      icon: const Icon(
                        Icons.download,
                        color: Colors.white,
                      ),
                      controller: dlinkController,
                      regExp: RegExp(
                          r"^((([A-Za-z]{3,9}:(?:\/\/)?)(?:[-;:&=\+\$,\w]+@)?[A-Za-z0-9.-]+|(?:www.|[-;:&=\+\$,\w]+@)[A-Za-z0-9.-]+)((?:\/[\+~%\/.\w-_]*)?\??(?:[-\+=&;%@.\w_]*)#?(?:[\w]*))?)"),
                    ),
                    SizedBox(
                      height: Dimensions.height30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: (() {
                            if (_formKey.currentState!.validate()) {
                              _postData();
                              Get.back();
                            }
                          }),
                          style: ElevatedButton.styleFrom(
                              primary: const Color(0xffff6a3b),
                              textStyle: TextStyle(
                                fontSize: Dimensions.font22,
                                fontWeight: FontWeight.bold,
                              )),
                          child: const Text(
                            "Submit",
                          ),
                        ),
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(
                                color: Color(0xffff6a3b), width: 1),
                          ),
                          onPressed: () {
                            Get.back();
                          },
                          child: Text(
                            "Cancel",
                            style: TextStyle(
                              fontSize: Dimensions.font22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
