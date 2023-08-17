import 'package:flutter/cupertino.dart';

import '../../data/models/get_subject.dart';

class SubjectWidgetData {
  Item? selectedSubject;
  int? widgetIndex;
  TextEditingController? certificationController = TextEditingController();
  TextEditingController? hourlyRateController = TextEditingController();
  TextEditingController? urlVideosController = TextEditingController();
  // وأي متغيرات أخرى تحتاجها لكل ودجت

  SubjectWidgetData({
    this.selectedSubject,
    this.certificationController,
    this.hourlyRateController,
    this.urlVideosController,
    this.widgetIndex,
  });
}
