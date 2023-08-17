// import 'dart:convert';
//
// /*
// class SubjectTests {
//   bool? status;
//   String? message;
//   Object? object;
//   int? code;
//
//   SubjectTests({
//     this.status,
//     this.message,
//     this.object,
//     this.code,
//   });
//
//   SubjectTests.fromJson(Map<String, dynamic> json) {
//     status = json['status'] as dynamic?;
//     message = json['message'] as String?;
//     object = (json['object'] as Map<String, dynamic>?) != null
//         ? Object.fromJson(json['object'] as Map<String, dynamic>)
//         : null;
//     code = json['code'] as int?;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> json = <String, dynamic>{};
//     json['status'] = status;
//     json['message'] = message;
//     json['object'] = object?.toJson();
//     json['code'] = code;
//     return json;
//   }
// }
//
// class Object {
//   int? id;
//   String? firstName;
//   String? lastName;
//   String? email;
//   String? emailVerifiedAt;
//   String? defaultLang;
//   String? slug;
//   int? amount;
//   double? amountCanDrow;
//   dynamic referrerId;
//   String? mobile;
//   String? gender;
//   dynamic identetyVerifiedAt;
//   String? type;
//   dynamic status;
//   int? notificationSound;
//   int? notificationSend;
//   dynamic deletedAt;
//   Profile? profile;
//   String? fullName;
//   String? referralLink;
//   String? imageUrl;
//   VerifideIdentity? verifideIdentity;
//   String? langGender;
//   String? userLevel;
//   StudentLevelColor? studentLevelColor;
//   double? wallet;
//   List<dynamic>? videos;
//   List<TeacherSubject>? teacherSubject;
//   List<UserLanguage>? userLanguage;
//   List<TeacherHours>? teacherHours;
//
//   Object({
//     this.id,
//     this.firstName,
//     this.lastName,
//     this.email,
//     this.emailVerifiedAt,
//     this.defaultLang,
//     this.slug,
//     this.amount,
//     this.amountCanDrow,
//     this.referrerId,
//     this.mobile,
//     this.gender,
//     this.identetyVerifiedAt,
//     this.type,
//     this.status,
//     this.notificationSound,
//     this.notificationSend,
//     this.deletedAt,
//     this.profile,
//     this.fullName,
//     this.referralLink,
//     this.imageUrl,
//     this.verifideIdentity,
//     this.langGender,
//     this.userLevel,
//     this.studentLevelColor,
//     this.wallet,
//     this.videos,
//     this.teacherSubject,
//     this.userLanguage,
//     this.teacherHours,
//   });
//
//   Object.fromJson(Map<String, dynamic> json) {
//     id = json['id'] as int?;
//     firstName = json['first_name'] as String?;
//     lastName = json['last_name'] as String?;
//     email = json['email'] as String?;
//     emailVerifiedAt = json['email_verified_at'] as String?;
//     defaultLang = json['default_lang'] as String?;
//     slug = json['slug'] as String?;
//     amount = json['amount'] as int?;
//     amountCanDrow = json['amount_can_drow'] as double?;
//     referrerId = json['referrer_id'];
//     mobile = json['mobile'] as String?;
//     gender = json['gender'] as String?;
//     identetyVerifiedAt = json['identety_verified_at'];
//     type = json['type'] as String?;
//     status = json['status'] as dynamic;
//     notificationSound = json['notification_sound'] as int?;
//     notificationSend = json['notification_send'] as int?;
//     deletedAt = json['deleted_at'];
//     profile = (json['profile'] as Map<String, dynamic>?) != null
//         ? Profile.fromJson(json['profile'] as Map<String, dynamic>)
//         : null;
//     fullName = json['full_name'] as String?;
//     referralLink = json['referral_link'] as String?;
//     imageUrl = json['image_url'] as String?;
//     verifideIdentity =
//         (json['verifide_identity'] as Map<String, dynamic>?) != null
//             ? VerifideIdentity.fromJson(
//                 json['verifide_identity'] as Map<String, dynamic>)
//             : null;
//     langGender = json['lang_gender'] as String?;
//     userLevel = json['user_level'] as String?;
//     studentLevelColor =
//         (json['student_level_color'] as Map<String, dynamic>?) != null
//             ? StudentLevelColor.fromJson(
//                 json['student_level_color'] as Map<String, dynamic>)
//             : null;
//     wallet = json['wallet'] as double?;
//     videos = json['videos'] as List?;
//     teacherSubject = (json['teacher_subject'] as List?)
//         ?.map((dynamic e) => TeacherSubject.fromJson(e as Map<String, dynamic>))
//         .toList();
//     userLanguage = (json['user_language'] as List?)
//         ?.map((dynamic e) => UserLanguage.fromJson(e as Map<String, dynamic>))
//         .toList();
//     teacherHours = (json['teacher_hours'] as List?)
//         ?.map((dynamic e) => TeacherHours.fromJson(e as Map<String, dynamic>))
//         .toList();
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> json = <String, dynamic>{};
//     json['id'] = id;
//     json['first_name'] = firstName;
//     json['last_name'] = lastName;
//     json['email'] = email;
//     json['email_verified_at'] = emailVerifiedAt;
//     json['default_lang'] = defaultLang;
//     json['slug'] = slug;
//     json['amount'] = amount;
//     json['amount_can_drow'] = amountCanDrow;
//     json['referrer_id'] = referrerId;
//     json['mobile'] = mobile;
//     json['gender'] = gender;
//     json['identety_verified_at'] = identetyVerifiedAt;
//     json['type'] = type;
//     json['status'] = status;
//     json['notification_sound'] = notificationSound;
//     json['notification_send'] = notificationSend;
//     json['deleted_at'] = deletedAt;
//     json['profile'] = profile?.toJson();
//     json['full_name'] = fullName;
//     json['referral_link'] = referralLink;
//     json['image_url'] = imageUrl;
//     json['verifide_identity'] = verifideIdentity?.toJson();
//     json['lang_gender'] = langGender;
//     json['user_level'] = userLevel;
//     json['student_level_color'] = studentLevelColor?.toJson();
//     json['wallet'] = wallet;
//     json['videos'] = videos;
//     json['teacher_subject'] = teacherSubject?.map((e) => e.toJson()).toList();
//     json['user_language'] = userLanguage?.map((e) => e.toJson()).toList();
//     json['teacher_hours'] = teacherHours?.map((e) => e.toJson()).toList();
//     return json;
//   }
// }
//
// class Profile {
//   int? userId;
//   dynamic originCountryId;
//   int? profileScore;
//   int? studentCount;
//   String? level;
//   int? canceledLessons;
//   int? absencesStudents;
//   int? absences;
//   String? bio;
//   dynamic customLink;
//   dynamic publicLink;
//   String? introduceYourSelf;
//   String? introduceYourSelfOtherLanguage;
//   dynamic introduceVideoLink;
//   String? rating;
//   int? reviews;
//   dynamic timezone;
//   dynamic birthday;
//   dynamic gender;
//   dynamic countryId;
//   dynamic cityName;
//   String? createdAt;
//   String? updatedAt;
//   dynamic deletedAt;
//
//   Profile({
//     this.userId,
//     this.originCountryId,
//     this.profileScore,
//     this.studentCount,
//     this.level,
//     this.canceledLessons,
//     this.absencesStudents,
//     this.absences,
//     this.bio,
//     this.customLink,
//     this.publicLink,
//     this.introduceYourSelf,
//     this.introduceYourSelfOtherLanguage,
//     this.introduceVideoLink,
//     this.rating,
//     this.reviews,
//     this.timezone,
//     this.birthday,
//     this.gender,
//     this.countryId,
//     this.cityName,
//     this.createdAt,
//     this.updatedAt,
//     this.deletedAt,
//   });
//
//   Profile.fromJson(Map<String, dynamic> json) {
//     userId = json['user_id'] as int?;
//     originCountryId = json['origin_country_id'];
//     profileScore = json['profile_score'] as int?;
//     studentCount = json['student_count'] as int?;
//     level = json['level'] as String?;
//     canceledLessons = json['canceled_lessons'] as int?;
//     absencesStudents = json['absences_students'] as int?;
//     absences = json['absences'] as int?;
//     bio = json['bio'] as String?;
//     customLink = json['customLink'];
//     publicLink = json['publicLink'];
//     introduceYourSelf = json['introduceYourSelf'] as String?;
//     introduceYourSelfOtherLanguage =
//         json['introduceYourSelfOtherLanguage'] as String?;
//     introduceVideoLink = json['introduce_video_link'];
//     rating = json['rating'] as String?;
//     reviews = json['reviews'] as int?;
//     timezone = json['timezone'];
//     birthday = json['birthday'];
//     gender = json['gender'];
//     countryId = json['country_id'];
//     cityName = json['city_name'];
//     createdAt = json['created_at'] as String?;
//     updatedAt = json['updated_at'] as String?;
//     deletedAt = json['deleted_at'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> json = <String, dynamic>{};
//     json['user_id'] = userId;
//     json['origin_country_id'] = originCountryId;
//     json['profile_score'] = profileScore;
//     json['student_count'] = studentCount;
//     json['level'] = level;
//     json['canceled_lessons'] = canceledLessons;
//     json['absences_students'] = absencesStudents;
//     json['absences'] = absences;
//     json['bio'] = bio;
//     json['customLink'] = customLink;
//     json['publicLink'] = publicLink;
//     json['introduceYourSelf'] = introduceYourSelf;
//     json['introduceYourSelfOtherLanguage'] = introduceYourSelfOtherLanguage;
//     json['introduce_video_link'] = introduceVideoLink;
//     json['rating'] = rating;
//     json['reviews'] = reviews;
//     json['timezone'] = timezone;
//     json['birthday'] = birthday;
//     json['gender'] = gender;
//     json['country_id'] = countryId;
//     json['city_name'] = cityName;
//     json['created_at'] = createdAt;
//     json['updated_at'] = updatedAt;
//     json['deleted_at'] = deletedAt;
//     return json;
//   }
// }
//
// class VerifideIdentity {
//   bool? verify;
//   bool? isUploadPhoto;
//
//   VerifideIdentity({
//     this.verify,
//     this.isUploadPhoto,
//   });
//
//   VerifideIdentity.fromJson(Map<String, dynamic> json) {
//     verify = json['verify'] as bool?;
//     isUploadPhoto = json['is_upload_photo'] as bool?;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> json = <String, dynamic>{};
//     json['verify'] = verify;
//     json['is_upload_photo'] = isUploadPhoto;
//     return json;
//   }
// }
//
// class StudentLevelColor {
//   String? color;
//   String? level;
//
//   StudentLevelColor({
//     this.color,
//     this.level,
//   });
//
//   StudentLevelColor.fromJson(Map<String, dynamic> json) {
//     color = json['color'] as String?;
//     level = json['level'] as String?;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> json = <String, dynamic>{};
//     json['color'] = color;
//     json['level'] = level;
//     return json;
//   }
// }
//
// class TeacherSubject {
//   final int id;
//   final int subjectId;
//   final int userId;
//   dynamic hourlyRate;
//   final int certificationHour;
//   final String? youtubeUrl;
//   final String? videos;
//   final String? teacherSubjectImage;
//   final List<String> imageList;
//   final int rating;
//   final int totalReviews;
//   final String? deletedAt;
//   final String imageUrl;
//   final List<String> listImageUrl;
//   final List<String> gallery;
//   final List<String> videosUrl;
//   final List<String> youtubeVideos;
//   final Subject subject;
//
//   TeacherSubject({
//     required this.id,
//     required this.subjectId,
//     required this.userId,
//     required this.hourlyRate,
//     required this.certificationHour,
//     this.youtubeUrl,
//     this.videos,
//     this.teacherSubjectImage,
//     required this.imageList,
//     required this.rating,
//     required this.totalReviews,
//     this.deletedAt,
//     required this.imageUrl,
//     required this.listImageUrl,
//     required this.gallery,
//     required this.videosUrl,
//     required this.youtubeVideos,
//     required this.subject,
//   });
//
//   factory TeacherSubject.fromJson(Map<String, dynamic> json) {
//     return TeacherSubject(
//       id: json['id'],
//       subjectId: json['subject_id'],
//       userId: json['user_id'],
//       hourlyRate: json['hourlyRate'],
//       certificationHour: json['certification_hour'],
//       youtubeUrl: json['youtubeUrl'],
//       videos: json['videos'],
//       teacherSubjectImage: json['teacherSubjectImage'],
//       imageList: List<String>.from(jsonDecode(json['imageList'])),
//       rating: json['rating'],
//       totalReviews: json['total_reviews'],
//       deletedAt: json['deleted_at'],
//       imageUrl: json['image_url'],
//       listImageUrl: List<String>.from(json['list_image_url']),
//       gallery: List<String>.from(json['gallery']),
//       videosUrl: List<String>.from(json['videos_url']),
//       youtubeVideos: List<String>.from(json['youtube_videos']),
//       subject: Subject.fromJson(json['subject']),
//     );
//   }
//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'subject_id': subjectId,
//       'user_id': userId,
//       'hourlyRate': hourlyRate,
//       'certification_hour': certificationHour,
//       'youtubeUrl': youtubeUrl,
//       'videos': videos,
//       'teacherSubjectImage': teacherSubjectImage,
//       'imageList': imageList,
//       'rating': rating,
//       'total_reviews': totalReviews,
//       'deleted_at': deletedAt,
//       'image_url': imageUrl,
//       'list_image_url': listImageUrl,
//       'gallery': gallery,
//       'videos_url': videosUrl,
//       'youtube_videos': youtubeVideos,
//       'subject': subject.toJson(),
//     };
//   }
// }
//
// class Subject {
//   final int id;
//   final Map<String, String> name;
//   final String subjectsImage;
//   final String slug;
//   final String status;
//   final String createdAt;
//   final String updatedAt;
//   final String? deletedAt;
//   final String imageUrl;
//   final int visibleCategoryCount;
//   final String langName;
//
//   Subject({
//     required this.id,
//     required this.name,
//     required this.subjectsImage,
//     required this.slug,
//     required this.status,
//     required this.createdAt,
//     required this.updatedAt,
//     this.deletedAt,
//     required this.imageUrl,
//     required this.visibleCategoryCount,
//     required this.langName,
//   });
//
//   factory Subject.fromJson(Map<String, dynamic> json) {
//     Map<String, String> parsedName = {};
//
//     // حالة موضوع الـ name على شكل نص عادي
//     if (json['name'] is String) {
//       final nameJson = json['name'] as String;
//       final Map<String, dynamic> nameMap = jsonDecode(nameJson);
//
//       for (final language in nameMap.keys) {
//         parsedName[language] = nameMap[language];
//       }
//     }
//     // حالة موضوع الـ name على شكل Map
//     else if (json['name'] is Map) {
//       final nameMap = json['name'] as Map<String, dynamic>;
//
//       for (final language in nameMap.keys) {
//         parsedName[language] = nameMap[language] as String;
//       }
//     }
//     return Subject(
//       id: json['id'],
//       name: parsedName, // تحويل name إلى Map<String, String>
//       subjectsImage: json['subjects_image'],
//       slug: json['slug'],
//       status: json['status'],
//       createdAt: json['created_at'],
//       updatedAt: json['updated_at'],
//       deletedAt: json['deleted_at'],
//       imageUrl: json['image_url'],
//       visibleCategoryCount: json['visible_category_count'],
//       langName: json['lang_name'],
//     );
//   }
//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'name': name,
//       'subjects_image': subjectsImage,
//       'slug': slug,
//       'status': status,
//       'created_at': createdAt,
//       'updated_at': updatedAt,
//       'deleted_at': deletedAt,
//       'image_url': imageUrl,
//       'visible_category_count': visibleCategoryCount,
//       'lang_name': langName,
//     };
//   }
// }
//
// class Name {
//   String? ar;
//   String? en;
//   String? es;
//   String? fr;
//   String? de;
//   String? it;
//   String? pt;
//   String? zh;
//   String? ro;
//   String? tr;
//
//   Name({
//     this.ar,
//     this.en,
//     this.es,
//     this.fr,
//     this.de,
//     this.it,
//     this.pt,
//     this.zh,
//     this.ro,
//     this.tr,
//   });
//
//   Name.fromJson(Map<String, dynamic> json) {
//     ar = json['ar'] as String?;
//     en = json['en'] as String?;
//     es = json['es'] as String?;
//     fr = json['fr'] as String?;
//     de = json['de'] as String?;
//     it = json['it'] as String?;
//     pt = json['pt'] as String?;
//     zh = json['zh'] as String?;
//     ro = json['ro'] as String?;
//     tr = json['tr'] as String?;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> json = <String, dynamic>{};
//     json['ar'] = ar;
//     json['en'] = en;
//     json['es'] = es;
//     json['fr'] = fr;
//     json['de'] = de;
//     json['it'] = it;
//     json['pt'] = pt;
//     json['zh'] = zh;
//     json['ro'] = ro;
//     json['tr'] = tr;
//     return json;
//   }
// }
//
// class UserLanguage {
//   int? id;
//   int? userId;
//   int? languageId;
//   String? level;
//   String? createdAt;
//   String? updatedAt;
//   dynamic deletedAt;
//   Language? language;
//
//   UserLanguage({
//     this.id,
//     this.userId,
//     this.languageId,
//     this.level,
//     this.createdAt,
//     this.updatedAt,
//     this.deletedAt,
//     this.language,
//   });
//
//   UserLanguage.fromJson(Map<String, dynamic> json) {
//     id = json['id'] as int?;
//     userId = json['user_id'] as int?;
//     languageId = json['language_id'] as int?;
//     level = json['level'] as String?;
//     createdAt = json['created_at'] as String?;
//     updatedAt = json['updated_at'] as String?;
//     deletedAt = json['deleted_at'];
//     language = (json['language'] as Map<String, dynamic>?) != null
//         ? Language.fromJson(json['language'] as Map<String, dynamic>)
//         : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> json = <String, dynamic>{};
//     json['id'] = id;
//     json['user_id'] = userId;
//     json['language_id'] = languageId;
//     json['level'] = level;
//     json['created_at'] = createdAt;
//     json['updated_at'] = updatedAt;
//     json['deleted_at'] = deletedAt;
//     json['language'] = language?.toJson();
//     return json;
//   }
// }
//
// class Language {
//   int? id;
//   String? languageName;
//   String? code;
//   String? native;
//   int? active;
//   int? website;
//   String? flag;
//   dynamic createdAt;
//   String? updatedAt;
//
//   Language({
//     this.id,
//     this.languageName,
//     this.code,
//     this.native,
//     this.active,
//     this.website,
//     this.flag,
//     this.createdAt,
//     this.updatedAt,
//   });
//
//   Language.fromJson(Map<String, dynamic> json) {
//     id = json['id'] as int?;
//     languageName = json['language_name'] as String?;
//     code = json['code'] as String?;
//     native = json['native'] as String?;
//     active = json['active'] as int?;
//     website = json['website'] as int?;
//     flag = json['flag'] as String?;
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'] as String?;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> json = <String, dynamic>{};
//     json['id'] = id;
//     json['language_name'] = languageName;
//     json['code'] = code;
//     json['native'] = native;
//     json['active'] = active;
//     json['website'] = website;
//     json['flag'] = flag;
//     json['created_at'] = createdAt;
//     json['updated_at'] = updatedAt;
//     return json;
//   }
// }
//
// class TeacherHours {
//   int? id;
//   int? teacherId;
//   int? studentId;
//   int? teacherSubjectId;
//   int? hours;
//   int? totalAmount;
//   String? createdAt;
//   String? updatedAt;
//   dynamic deletedAt;
//
//   TeacherHours({
//     this.id,
//     this.teacherId,
//     this.studentId,
//     this.teacherSubjectId,
//     this.hours,
//     this.totalAmount,
//     this.createdAt,
//     this.updatedAt,
//     this.deletedAt,
//   });
//
//   TeacherHours.fromJson(Map<String, dynamic> json) {
//     id = json['id'] as int?;
//     teacherId = json['teacher_id'] as int?;
//     studentId = json['student_id'] as int?;
//     teacherSubjectId = json['teacher_subject_id'] as int?;
//     hours = json['hours'] as int?;
//     totalAmount = json['total_amount'] as int?;
//     createdAt = json['created_at'] as String?;
//     updatedAt = json['updated_at'] as String?;
//     deletedAt = json['deleted_at'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> json = <String, dynamic>{};
//     json['id'] = id;
//     json['teacher_id'] = teacherId;
//     json['student_id'] = studentId;
//     json['teacher_subject_id'] = teacherSubjectId;
//     json['hours'] = hours;
//     json['total_amount'] = totalAmount;
//     json['created_at'] = createdAt;
//     json['updated_at'] = updatedAt;
//     json['deleted_at'] = deletedAt;
//     return json;
//   }
// }
// */
// class TeacherSubject {
//   final int? id;
//   final int? subjectId;
//   final int? userId;
//   dynamic hourlyRate;
//   final int? certificationHour;
//   final List<String>? youtubeUrl;
//   final List<String>? videos;
//   final String? teacherSubjectImage;
//   final List<String>? imageList;
//   final int? rating;
//   final int? totalReviews;
//   final String? deletedAt;
//   final String? imageUrl;
//   final List<String>? listImageUrl;
//   final List<String>? gallery;
//   final List<String>? videosUrl;
//   final List<String>? youtubeVideos;
//
//   TeacherSubject({
//     this.id,
//     this.subjectId,
//     this.userId,
//     this.hourlyRate,
//     this.certificationHour,
//     this.youtubeUrl,
//     this.videos,
//     this.teacherSubjectImage,
//     this.imageList,
//     this.rating,
//     this.totalReviews,
//     this.deletedAt,
//     this.imageUrl,
//     this.listImageUrl,
//     this.gallery,
//     this.videosUrl,
//     this.youtubeVideos,
//   });
//
//   factory TeacherSubject.fromJson(Map<String, dynamic> json) {
//     return TeacherSubject(
//       id: json['id'],
//       subjectId: json['subject_id'],
//       userId: json['user_id'],
//       hourlyRate: json['hourlyRate'],
//       certificationHour: json['certification_hour'],
//       youtubeUrl: List<String>.from(json['youtubeUrl']),
//       videos: List<String>.from(json['videos']),
//       teacherSubjectImage: json['teacherSubjectImage'],
//       imageList: List<String>.from(jsonDecode(json['imageList'])),
//       rating: json['rating'],
//       totalReviews: json['total_reviews'],
//       deletedAt: json['deleted_at'],
//       imageUrl: json['image_url'],
//       listImageUrl: List<String>.from(json['list_image_url']),
//       gallery: List<String>.from(json['gallery']),
//       videosUrl: List<String>.from(json['videos_url']),
//       youtubeVideos: List<String>.from(json['youtube_videos']),
//     );
//   }
//   Map<String, dynamic> toJson() {
//     return {
//       'subject_id': subjectId,
//       'user_id': userId,
//       'hourlyRate': hourlyRate,
//       'certification_hour': certificationHour,
//       'youtubeUrl': youtubeUrl,
//       'videos': videos,
//       'teacherSubjectImage': teacherSubjectImage,
//       'imageList': imageList,
//       'rating': rating,
//       'total_reviews': totalReviews,
//       'deleted_at': deletedAt,
//       'image_url': imageUrl,
//       'list_image_url': listImageUrl,
//       'gallery': gallery,
//       'videos_url': videosUrl,
//       'youtube_videos': youtubeVideos,
//     };
//   }
// }

class TeacherSubject {
  final int id;
  final int subjectId;
  final int userId;
  final double hourlyRate;
  final int certificationHour;
  final List<String> youtubeUrl;
  final List<String>? videos;
  final List<String>? teacherSubjectImage;
  final List<String>? imageList;
  final double rating;
  final int totalReviews;
  final String? deletedAt;
  final String imageUrl;
  final List<String> listImageUrl;
  final List<String> gallery;
  final List<String> videosUrl;
  final Map<String, String>? youtubeVideos;

  TeacherSubject({
    required this.id,
    required this.subjectId,
    required this.userId,
    required this.hourlyRate,
    required this.certificationHour,
    required this.youtubeUrl,
    this.videos,
    this.teacherSubjectImage,
    this.imageList,
    required this.rating,
    required this.totalReviews,
    required this.deletedAt,
    required this.imageUrl,
    required this.listImageUrl,
    required this.gallery,
    required this.videosUrl,
    this.youtubeVideos,
  });

  factory TeacherSubject.fromJson(Map<String, dynamic> json) {
    return TeacherSubject(
      id: json['id'],
      subjectId: json['subject_id'],
      userId: json['user_id'],
      hourlyRate: json['hourlyRate'].toDouble(),
      certificationHour: json['certification_hour'],
      youtubeUrl: List<String>.from(json['youtubeUrl']),
      videos: json['videos'] != null ? List<String>.from(json['videos']) : null,
      teacherSubjectImage: json['teacherSubjectImage'] != null
          ? List<String>.from(json['teacherSubjectImage'])
          : null,
      imageList: json['imageList'] != null
          ? List<String>.from(json['imageList'])
          : null,
      rating: json['rating'].toDouble(),
      totalReviews: json['total_reviews'],
      deletedAt: json['deleted_at'],
      imageUrl: json['image_url'],
      listImageUrl: List<String>.from(json['list_image_url']),
      gallery: List<String>.from(json['gallery']),
      videosUrl: List<String>.from(json['videos_url']),
      youtubeVideos: json['youtube_videos'] != null
          ? Map<String, String>.from(json['youtube_videos'])
          : null,
    );
  }
}
