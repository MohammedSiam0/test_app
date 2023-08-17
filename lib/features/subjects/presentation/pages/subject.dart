import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:test_app/core/utils/app_colors.dart';
import '../../data/models/get_subject.dart';
import '../../data/models/subject.dart';
import '../getx/teacher_subject_service.dart';
import '../widgets/custom_text_filed.dart';

class SubjectScreen extends StatefulWidget {
  const SubjectScreen({Key? key}) : super(key: key);

  @override
  State<SubjectScreen> createState() => _SubjectScreenState();
}

class _SubjectScreenState extends State<SubjectScreen> {
  late Future<List<Item>> futureItems;
  final TeacherSubjectService _dataManager =
      TeacherSubjectService(); // إنشاء كائن لإدارة البيانات
  TextEditingController customValueController = TextEditingController();
  Item? selectedSubject; // تعريف المتغير هنا
  void addCustomValue(String newValue) async {
    setState(() {
      futureItems = _dataManager.addCustomItem(newValue);
      customValueController.clear();
    });
  }

  @override
  void initState() {
    super.initState();
    futureItems = _dataManager.fetchSubjectFromServer();
  }

  @override
  void dispose() {
    customValueController.dispose();
    super.dispose();
  }

  List<TextFormField> textFieldDataList = [];
  int number = 1;
  int numberVideo = 1;
  int widgetIndex = 0;
  Map<int, TextEditingController> certificationControllers = {};
  Map<int, TextEditingController> hourlyRateControllers = {};
  Map<int, TextEditingController> urlVideosControllers = {};
  List<Map<String, dynamic>> subjectWidgets = [];

  void reset() {
    int number = 1;
    int numberVideo = 1;
    int widgetIndex = 0;
    certificationControllers.clear();
    hourlyRateControllers.clear();
    urlVideosControllers.clear();
    subjectWidgets.clear();
  }

//****  Image Picker

  List<File?> selectedImages =
      List.generate(4, (_) => null); // Assuming 6 positions
  List<File?> selectedVideos =
      List.generate(4, (_) => null); // Assuming 6 positions

  // Future<void> pickImage(int index) async {
  //   final pickedImage =
  //       await ImagePicker().pickImage(source: ImageSource.gallery);
  //
  //   if (pickedImage != null) {
  //     File imageFile = File(pickedImage.path);
  //
  //     String imagePath = 'file://${imageFile.path}';
  //
  //     setState(() {
  //       selectedImages[index] = File(imagePath); // استخدم المسار الصحيح
  //     });
  //   } else {
  //     print("No Image selected.");
  //   }
  // }

  Future<void> pickImage(int index) async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      File? imageFile = File(pickedImage.path);
      setState(() {
        selectedImages[index] = imageFile;
      });
    } else {
      print("No Image selected.");
    }
  }

  Future<void> pickVideo(int index) async {
    final pickedVideo =
        await ImagePicker().pickVideo(source: ImageSource.gallery);

    if (pickedVideo != null) {
      File videoFile = File(pickedVideo.path);

      setState(() {
        selectedVideos[index] = videoFile;
      });
    } else {
      print("No video selected.");
    }
  }

  //*****
  @override
  Widget build(BuildContext context) {
    int widgetIndex = subjectWidgets.length;
    return Scaffold(
      backgroundColor: AppColors.blueO,
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      bottomNavigationBar: actionButtonWidget(),
      appBar: AppBar(
        leadingWidth: 15,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back_ios_outlined,
            color: AppColors.red,
            size: 20,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(height: 55),
                Text(
                  'Profile',
                  style: TextStyle(
                    fontSize: 18,
                    height: 2,
                    fontWeight: FontWeight.normal,
                    color: AppColors.white,
                  ),
                ),
                Text(
                  'Subjects',
                  style: TextStyle(
                    fontSize: 20,
                    height: 1,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
          ),
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(25),
              topLeft: Radius.circular(25),
            ),
            child: Container(
              padding: const EdgeInsets.only(left: 5, right: 5, top: 0),
              color: Colors.white,
              width: double.infinity,
              height: MediaQuery.of(context).size.height - 180,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildContent(widgetIndex), // تمرير معرّف الويدجت هنا
                    Column(
                      children: List<Widget>.of(
                        subjectWidgets
                            .map((widgetData) => widgetData["widget"]),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.blue10O,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            minimumSize: const Size(100, 40)),
                        onPressed: () {
                          setState(() {
                            subjectWidgets.add({
                              "id": widgetIndex,
                              "widget": _buildContent(widgetIndex),
                            });
                          });
                        },
                        child: const Text(
                          "+ Add another subject",
                          style: TextStyle(color: AppColors.blue),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent(int widgetIndex) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      padding: const EdgeInsets.only(left: 5, right: 5, top: 0),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 1,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Subject title",
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      subjectWidgets.removeWhere(
                          (element) => element["id"] == widgetIndex);
                    });
                  },
                  icon: const Icon(
                    Icons.highlight_remove_outlined,
                    color: Colors.black,
                    size: 20,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(10), // تعيين زوايا دائرية
                      border:
                          Border.all(color: Colors.grey.shade300), // إضافة حدود
                    ),
                    child: FutureBuilder<List<Item>>(
                      future: futureItems,
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else if (snapshot.hasData &&
                            snapshot.data!.isNotEmpty) {
                          return DropdownButtonHideUnderline(
                            child: DropdownButton<Item>(
                              hint: const Text(" Select Subject"),
                              isExpanded: true,
                              value: selectedSubject,
                              onChanged: (Item? newValue) {
                                setState(() {
                                  selectedSubject = newValue;
                                });
                              },
                              items: snapshot.data!.map<DropdownMenuItem<Item>>(
                                (Item item) {
                                  return DropdownMenuItem<Item>(
                                    value: item,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0),
                                      child: Text(
                                        item.name,
                                        style: const TextStyle(
                                            color: Colors.black),
                                      ),
                                    ),
                                  );
                                },
                              ).toList(),
                            ),
                          );
                        } else {
                          return const Text('No data available');
                        }
                      },
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () => _showLangSheet(widgetIndex),
                  icon: const Icon(Icons.add_box_outlined),
                ),
              ],
            ),
            CustomTextFiled(
              customValueController: certificationControllers[widgetIndex] ??=
                  TextEditingController(),
              title: 'Certification Hour',
              lable: '',
            ),
            CustomTextFiled(
              customValueController: hourlyRateControllers[widgetIndex] ??=
                  TextEditingController(),
              title: 'Hourly Rate',
              lable: '\$',
              prefixIcon: Icons.attach_money_outlined,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Subject Videos",
                  style:
                      TextStyle(height: 2, fontSize: 16, color: Colors.black),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.question_mark_outlined,
                    color: Colors.black,
                    size: 20,
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: CustomTextFiled(
                    customValueController: urlVideosControllers[widgetIndex] ??=
                        TextEditingController(),
                    title: 'Url Videos',
                    lable: 'Insert your video Url here',
                  ),
                ),
                Center(
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        urlVideosControllers[widgetIndex]?.clear();
                      });
                    },
                    icon: const Icon(
                      Icons.highlight_remove,
                      size: 28,
                      color: AppColors.red,
                    ),
                  ),
                ),
              ],
            ),
            for (int i = 1; i < textFieldDataList.length; i++)
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: CustomTextFiled(
                      customValueController: textFieldDataList[i].controller!,
                      title: 'Url Videos',
                      lable: 'Insert your video Url here',
                    ),
                  ),
                  Center(
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          textFieldDataList.removeAt(i);
                        });
                      },
                      icon: const Icon(
                        Icons.highlight_remove,
                        size: 28,
                        color: AppColors.red,
                      ),
                    ),
                  ),
                ],
              ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "(MUST be related to the subject you are teaching)",
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  textFieldDataList.add(TextFormField(
                    controller: TextEditingController(),
                  ));
                });
              },
              child: const Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "+ Add another video url",
                  textAlign: TextAlign.end,
                  style: TextStyle(
                      height: 2,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
              ),
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Uploaded videos",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            GridView.builder(
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: numberVideo,
              itemBuilder: (context, index) {
                File? videoFile = selectedVideos[index];
                return Stack(
                  children: [
                    if (videoFile == null)
                      Center(
                        child: Text(
                          "No Uploaded videos",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      )
                    else
                      AspectRatio(
                        aspectRatio: 3,
                        child: Container(
                          color: Colors.black,
                          child: const Center(
                            child: Icon(
                              Icons.play_arrow,
                              color: Colors.white,
                              size: 40,
                            ),
                          ),
                        ),
                      ),
                    InkWell(
                      onTap: () {
                        pickVideo(index);
                      },
                      child: Image.asset(
                        'image/boxImage.png',
                        height: 120,
                        width: double.infinity,
                        color: Colors.black,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            if (videoFile != null) {
                              selectedVideos[index] = null;
                              // Update the number of videos accordingly

                              if (numberVideo == 1) {
                                numberVideo;
                              } else {
                                // هنا سيقوم بتخفيض قيمة number إذا لم تكن 1
                                numberVideo--;
                                // عرض SnackBar لإعلام المستخدم بحذف الصورة
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content:
                                        Text('Video removed. :$numberVideo'),
                                    duration: const Duration(seconds: 2),
                                  ),
                                );
                              }
                            }
                          });
                        },
                        icon: const Icon(
                          Icons.highlight_remove_outlined,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ],
                );
              },
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                childAspectRatio: 1.0,
                crossAxisSpacing: 1,
                mainAxisExtent: 140,
                mainAxisSpacing: 1,
              ),
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "(MUST be related to the subject you are teaching)",
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  if (numberVideo >= 3) {
                  } else {
                    numberVideo++;
                  }
                });
              },
              child: const Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "+ upload another video",
                  textAlign: TextAlign.end,
                  style: TextStyle(
                      height: 2,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Subject Pictures",
                  style:
                      TextStyle(height: 2, fontSize: 16, color: Colors.black),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.question_mark_outlined,
                    color: Colors.black,
                    size: 20,
                  ),
                ),
              ],
            ),
            GridView.builder(
              padding: EdgeInsets.zero,
              // علشان التحكم تبع السكرول فقط من الابو , اذا الابن اتحكم لما اوصل الابن بقدرش اتحكم غير فيه ما بقدر ارجع لغيره
              physics: const NeverScrollableScrollPhysics(),
              // هاي مهمة الفكرة فيها انه احجز قيمتك من قيمة الابو مدام اتجاهك غير اتجاه الابو
              shrinkWrap: true,
              itemCount: number,
              itemBuilder: (context, index) {
                File? itemImage = selectedImages[index];
                return Stack(
                  children: [
                    itemImage == null
                        ? const Center(
                            child: Text(
                              "Add Picture",
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          )
                        : Image.file(
                            File(itemImage.path).absolute,
                            height: 120,
                            width: 120,
                            fit: BoxFit.cover,
                          ),
                    InkWell(
                      onTap: () {
                        pickImage(
                            index); // Pass the index to identify which position is tapped
                      },
                      child: Image.asset(
                        'image/boxImage.png',
                        height: 120,
                        width: 120,
                        color: Colors.black,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            if (selectedImages[index] != null) {
                              selectedImages[index] = null;
                            }
                            if (number == 1) {
                              number;
                            } else {
                              // هنا سيقوم بتخفيض قيمة number إذا لم تكن 1
                              number--;
                            }
                          });
                        },
                        icon: const Icon(
                          Icons.highlight_remove_outlined,
                          color: AppColors.red,
                        ),
                      ),
                    ),
                  ],
                );
              },
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "(MUST be related to the subject you are teaching)",
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  if (number >= 3) {
                  } else {
                    number++;
                  }
                });
              },
              child: const Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "+ Add another picture",
                  textAlign: TextAlign.end,
                  style: TextStyle(
                      height: 2,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
              ),
            ),
          ]),
    );
  }

  Widget actionButtonWidget() {
    return BottomAppBar(
      elevation: 0,
      child: Container(
        height: 65,
        color: Colors.grey.shade50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.white,
                  shadowColor: AppColors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  minimumSize: const Size(150, 50)),
              onPressed: () {
                // إضافة العمليات المرتبطة بالزر هنا
              },
              child: const Text(
                "Cancel",
                style: TextStyle(color: AppColors.red),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.red,
                  shadowColor: AppColors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  minimumSize: const Size(150, 50)),
              onPressed: () async {
                // Map<String, String> dataSubject = {
                //   'subject[0][id]': "${selectedSubject?.id}",
                //   'subject[0][hourlyRate]': "${hourlyRateControllers[0]?.text}",
                //   'subject[0][youtubeLink][0]':
                //       "${[urlVideosControllers[widgetIndex]?.text]}",
                //   'subject[0][certification_hour]':
                //       "${certificationControllers[0]?.text}",
                // };
                // try {
                //   await TeacherSubjectService.createTeacherSubject(
                //       dataSubject, selectedVideos, selectedVideos);
                //   reset();
                // } catch (error) {
                //   print('Failed to create Teacher Subject: $error');
                // }
                try {
                  // تحضير البيانات للإرسال
                  // 2 / 212 / 199 /200 / 211 /212 /224 / 18
                  //   2 / 212  / 20  / 16 / 29 / 122 / 18 / 90 / 24
                  // Map<String, String> data = {
                  //   'subject[0][id]': '139',
                  //   'subject[0][hourlyRate]': '139',
                  //   'subject[0][youtubeLink][0]':
                  //       'https://www.youtube.com/watch?v=gIGGhFlGgLI',
                  //   'subject[0][certification_hour]': '10',
                  // };
                  // List<File?> imageFiles = selectedImages;
                  // List<File?> videoFiles = selectedVideos;
                  // TeacherSubject data = TeacherSubject(
                  //   subjectId: 200,
                  //   hourlyRate: 656,
                  //   certificationHour: 656,
                  //   youtubeUrl: ['https://www.youtube.com/gfg'],
                  //   videos: [
                  //     '/data/user/0/com.example.test_app/cache/b70c733d-956a-47c7-be64-2154a8e117c7/121706933_969323164271168_8312074245074881614_n.mp4'
                  //   ],
                  //   imageList: [
                  //     '/data/user/0/com.example.test_app/cache/9762fcb9-559c-4419-b397-70d872140b72/20230816_053749.jpg'
                  //   ],
                  // );
                  // List<String> imagePaths = selectedImages.map((file) {
                  //   if (file != null) {
                  //     return file.path;
                  //   } else {
                  //     return ''; // You can choose how to handle null values in the list
                  //   }
                  // }).toList();
                  // List<String> videoPaths = selectedVideos.map((file) {
                  //   if (file != null) {
                  //     return file.path;
                  //   } else {
                  //     return ''; // You can choose how to handle null values in the list
                  //   }
                  // }).toList();

                  // TeacherSubject data = TeacherSubject(
                  //   subjectId: 224,
                  //   hourlyRate: 50,
                  //   certificationHour: 10,
                  //   youtubeUrl: ['https://www.youtube.com/watch?v=abc123'],
                  //   videos: [
                  //     '/data/user/0/com.example.test_app/cache/b70c733d-956a-47c7-be64-2154a8e117c7/121706933_969323164271168_8312074245074881614_n.mp4'
                  //   ],
                  //   imageList: [
                  //     '/data/user/0/com.example.test_app/cache/9762fcb9-559c-4419-b397-70d872140b72/20230816_053749.jpg'
                  //   ],
                  //   videosUrl: [
                  //     '/data/user/0/com.example.test_app/cache/b70c733d-956a-47c7-be64-2154a8e117c7/121706933_969323164271168_8312074245074881614_n.mp4'
                  //   ],
                  //   youtubeVideos: ['https://www.youtube.com/watch?v=xyz789'],
                  // );

                  // إنشاء الموضوع ورفع البيانات
                  // await TeacherSubjectService.createTeacherSubject(
                  //     /*, imageFiles, videoFiles*/);
                  // List<String> imagePaths = selectedImages.map((file) {
                  //   if (file != null) {
                  //     return file.path;
                  //   } else {
                  //     return ''; // You can choose how to handle null values in the list
                  //   }
                  // }).toList();
                  // List<String> videoPaths = selectedVideos.map((file) {
                  //   if (file != null) {
                  //     return file.path;
                  //   } else {
                  //     return ''; // You can choose how to handle null values in the list
                  //   }
                  // }).toList();
                  // 138  /  32  /26 / 28  / 13
                  await TeacherSubjectService.createTeacherSubject(
                    selectedImages: selectedImages,
                    // selectedVideos: selectedVideos,
                    subjectId: selectedSubject!.id.toString(),
                    hourlyRate: '13',
                    youtubeLink: 'https://www.youtube.com/watch?13',
                    certificationHour: '10', /*, imageFiles, videoFiles*/
                  );

                  // إعادة تعيين الحالة
                  //  reset();
                } catch (error) {
                  print('Failed to create Teacher Subject: $error');
                }
              },
              child: const Text(
                "Save",
                style: TextStyle(color: AppColors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showLangSheet(int widgetIndex) async {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(10), topLeft: Radius.circular(10))),
      context: context,
      backgroundColor: Colors.white,
      // بتعمل قص لكل الخارج عن الابو
      clipBehavior: Clip.antiAlias,
      builder: (context) {
        return BottomSheet(
            onClosing: () {},
            builder: (context) {
              return StatefulBuilder(builder: (context, setState) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    // هذا السطر حلوو بخلي كل الكولم ارتفاعه بأرتفاع حجم العناصر كلها على قد العناصر
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero,
                            backgroundColor: Colors.transparent,
                            elevation: 0),
                        onPressed: () {
                          // تعقب الضغط على زر العودة
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios_outlined,
                          color: Colors.black,
                          size: 20,
                        ),
                        label: const Text(
                          "Back",
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                      ),
                      const Center(
                        child: Text(
                          'Add a new subject',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 22),
                        ),
                      ),
                      const SizedBox(height: 15),
                      const Text(
                        'You can suggest new subject and it will be public after admin review',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.black26,
                            fontSize: 16),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Subject Name',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 22),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        controller: customValueController,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal: 15), // تحديد التباعد الداخلي
                          hintText: 'Name',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)),
                        ),
                      ),
                      const SizedBox(height: 15),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            backgroundColor: AppColors.red,
                            minimumSize: const Size(double.infinity, 50)),
                        onPressed: () {
                          addCustomValue(customValueController.text);
                        },
                        child: const Text(
                          'Add',
                          style: TextStyle(color: AppColors.white),
                        ),
                      ),
                    ],
                  ),
                );
              });
            });
      },
    );
  }
}
