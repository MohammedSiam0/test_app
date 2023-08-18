import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../data/models/get_subject.dart';

class SubjectWidgetData {
  int id;
  TextEditingController certificationController;
  TextEditingController hourlyRateController;
  TextEditingController urlVideosController;
  List<File?> selectedImages =
      List.generate(4, (_) => null); // Assuming 6 positions
  List<File?> selectedVideos = List.generate(4, (_) => null);
  int? widgetCount = 0;
  List<TextFormField> textFieldDataList = [];
  // وأي متغيرات أخرى تحتاجها لكل ودجت
  Item? selectedDropdownValue;
  int number = 1;
  int numberVideo = 1;

  SubjectWidgetData({
    required this.selectedDropdownValue,
    required this.id,
    this.widgetCount,
    required this.selectedImages,
    required this.selectedVideos,
    required this.certificationController,
    required this.hourlyRateController,
    required this.urlVideosController,
  });
}
