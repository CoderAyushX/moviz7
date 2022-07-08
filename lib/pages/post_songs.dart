import 'package:crud/services/remote_service.dart';
import 'package:crud/utils/colors.dart';
import 'package:crud/utils/dimensions.dart';
import 'package:crud/widgets/postmovies_textform.dart';
import 'package:crud/widgets/bigtext.dart';
import 'package:crud/widgets/smalltext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostASong extends StatefulWidget {
  const PostASong({Key? key}) : super(key: key);

  @override
  State<PostASong> createState() => _PostASongState();
}

class _PostASongState extends State<PostASong> {
  final _formKey = GlobalKey<FormState>();

  //? controllers
  final TextEditingController nameController = TextEditingController();

  final TextEditingController songUrlController = TextEditingController();

  final TextEditingController langController = TextEditingController();

  final TextEditingController catController = TextEditingController();

  final TextEditingController linkController = TextEditingController();

  final TextEditingController descController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    songUrlController.dispose();
    catController.dispose();
    linkController.dispose();
    descController.dispose();
  }

  _postData() async {
    Map data = {
      "name": nameController.text.toString(),
      "desc": descController.text.toString(),
      "link": linkController.text.toString(),
      "songImg": songUrlController.text.toString(),
      "lang": langController.text.toString(),
      "cat": catController.text.toString(),
      "rating": 1.toString()
    };
    await RemoteServices().postData(data, "postasongs");
    Get.snackbar("successfully posted", "Thanks for posting!",
        colorText: Colors.white,
        isDismissible: true,
        dismissDirection: DismissDirection.horizontal,
        borderRadius: 10);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.bg,
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
                      text: "Post a song",
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
                      labletext: "Song Image Url",
                      icon: const Icon(
                        Icons.image,
                        color: Colors.white,
                      ),
                      controller: songUrlController,
                      regExp: RegExp(
                          r"^((([A-Za-z]{3,9}:(?:\/\/)?)(?:[-;:&=\+\$,\w]+@)?[A-Za-z0-9.-]+|(?:www.|[-;:&=\+\$,\w]+@)[A-Za-z0-9.-]+)((?:\/[\+~%\/.\w-_]*)?\??(?:[-\+=&;%@.\w_]*)#?(?:[\w]*))?)"),
                    ),
                    SizedBox(
                      height: Dimensions.height30,
                    ),
                    PostMoviesTextField(
                      labletext: "Song Name",
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
                      labletext: "Song link",
                      icon: const Icon(
                        Icons.download,
                        color: Colors.white,
                      ),
                      controller: linkController,
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
                              primary: AppColors.orange,
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
                            side: BorderSide(color: AppColors.orange, width: 1),
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
