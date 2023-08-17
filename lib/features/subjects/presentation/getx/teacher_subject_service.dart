import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:path/path.dart';

import '../../data/models/get_subject.dart';
import '../../data/models/subject.dart';

class TeacherSubjectService {
  static const String baseUrl = 'https://youlearnt.akwade.net/api';
  static const token =
      'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIyIiwianRpIjoiNTEwNzk2NGVmNzM0MDE0YTBlZjg3MjgyMTQ4YmVjNWJiY2YzMWE0NzFkY2Y3ZjlmOTBjNjc4MDIyMDAwZTg3OGY0Yzc4ZWViMzY3ZmI5MTgiLCJpYXQiOjE2OTIyMjg4MzAuNzc5NTgyLCJuYmYiOjE2OTIyMjg4MzAuNzc5NTg0LCJleHAiOjE2OTM1MjQ4MzAuNzc0NjY3LCJzdWIiOiIxMTYyMTMyIiwic2NvcGVzIjpbIioiXX0.KupqnhyBu65Hy8ewDM5kdxHVu5PSARdmz35V6pdSBC_S7ku-oh0uQ4po_XUEMa30bC8FWWGrFbDIoAyuBnPG70buGHAGoBw63GCGXv7osVgCNWKatZMzgmwvg_jkjway28VU8yNi4nMPAQY79ydDca9TyShXINYUQf5v73oyWmTEEfbmRo-P2xlbw2ozTcAnDM7ZaJXORC7jR1LazpEw8W6Htp_EzyUTytKABy8xx8sPTx1j66V-2PvA7gX_dYG21PJqg5diwa9EKOJXsHpasoDW_fxubncTHYVnzE-8Xf5OS2NvzoE5tL_WbS33crJqmEUvm5kSz706x_48deA2rYDGLRXt6iSoIvHz0HDRTBrJoGdzJm1gQxqNx2g9b7q-YxLKEaJEZHEoNvngQ7FgpG3_9Y57IiWVUJpM2Ung6EDr_vsmUtWF5Bn6-NX8IUgJQl8nxC2-xQETMMYLtjyEVNK22yf0yhs4gunKkVKM60iwCzgjNild8SwGoOnyqsp_qj-QB0Qbx1dqpGQdw3umFcntzyNTPIAR_3fYRjU4a-Z3uTK2ddxApv6mJILE7R5uOW1YeVaox7sFFJSRqDSPCfZ2YKML7MUzOeNPz00Ht_Wl1q1ITsw_-d1WmS9kmwsWD-7ixQ71w-Pq7KNO1dYDDzHuJH2prCLBPLiXNeDt2pI';
  // 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIyIiwianRpIjoiZGUzZTQ0Y2JkNmY3ZGJlMWUyZmMxMTlhNWFmMGIxYmE1YjE3NjMxNjM3NmNjNDk3M2RlMmYwZjkxZTlmNTdlZWIxM2ZkYzk4ZmEwNTUxN2IiLCJpYXQiOjE2OTIxODczMjguODk3NTQ2LCJuYmYiOjE2OTIxODczMjguODk3NTQ4LCJleHAiOjE2OTM0ODMzMjguODk0MjAxLCJzdWIiOiIxMTYyMTYyIiwic2NvcGVzIjpbIioiXX0.ca267Ef65EeMj4hHJqPn4NmO-leZ_SistNZAa2s6l4wgmWugQLLIlUtyxr1rjV3vta8CH5PkOtqyowSUz4RjK8-fDWO9C_nj9tq5GCpXwUBalW79D0Qqe3gttnZbk3dpaxy9X6KGLOq6Wekc9GAWbRHFxKQ81VaSPKZWF0iAE0xm3MYIvPdhQ5fMRcUUD41sPlkRpKaGWOvu9ZS3wHUqb0yR7Xd4nEtAOIulbeSimV_7xn8BbwPD00f3EtBhgPCswicVK-g8IQGn-0h4WvaXNcKsRp8fY733X_Wz0eubGTGrJjWqOkk4HQSoFDz_NlOTkl-cDU3YI_jTJdfiPHiD02wlPwvBxmtLcPU00C2ZMjrTNNhsS36NRdlYFh3IwkUX1eg6fzgN19sjxM6xzjs-ME2QT4rhrLRxmsWLgtDOfxNa2QF7Jb48MlRBE945rTl2hPtLZlebIXvWrbyUD0Ws1RxOhMWpQXveKQ3_JPrKgCIBqHXh_JHVJ2zWRCypBd7gLJR2FCzWtS9HVxqWA6II9ixEZyMEA1cEi91IA_PzHpyyL6jdEE72-E_GecPGMvATJpl2DepiPFDu3KJ3MkGrL-U9bk4j6MwIQ2G8CGIZ5Q8jk3uRBwZtZi_F6vwRN9PlkY1GGDHVEAPp2uprO9Pq9DRUmbFCSKosCBVF0SFSLVI';
  //  'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIyIiwianRpIjoiYTY3MWZlNmJhZjE2NmRlYzIyMWQ1NGY3OGYxMzA4MTUxZTVjYjNkMzY5ZWVhODcxZGU3MzZmMDMyOWI5Njk5MjcyZjE1MjdmOWJjMmQ4MWIiLCJpYXQiOjE2OTIyMjI4OTIuNzc2NTg5LCJuYmYiOjE2OTIyMjI4OTIuNzc2NTkxLCJleHAiOjE2OTM1MTg4OTIuNzY4MjIzLCJzdWIiOiIxMTYyMTYyIiwic2NvcGVzIjpbIioiXX0.br2KeYfeCnc5C_uWgHt_6j7KB2It5n68UxVvKSX-YhRU12dpcn_hCJtMBwuo-IK3t8xSUVIqkSbURlEY0q6-cpuvZA6VTcvCvoM9DqjZSGjpgK-VRWrNKa8vtv_YOMnQmEAHtm3_-dVyGu7LLgR_CvEv9SRvx21S_87zjBkbrrrjCTHEMJtpyWopgHv-B01e7PSdU9S-QfXJxW_qJjT5vYyyRzDa27eirfbf2xYIETJherp2UBCxU7-HcYKziFEWQ6jwMBsAQwGCW4vVybpiyjdZjEb3DrjaVRpyqlaIDdwDKnjrthFX30XTXu5VEzN1AKNZpcmaeUeKkXZ4UXE5dtTqf16Dc7mz2JOpVndgCAcQ32SJlxEcd4ldUOc35ePtMdemcHi24ndwPrsTWrJhPTz9_D358DVrbVJDR5pfT43dMjsTbnyqXOJecxxntg6rXjgCw1ujFl6S7OSpeuVOhewI_4zbf9e8sztaqwsXW3TSPET2hDfzjJraDa2sUFCoIaBuiODPfiEraXC0A9Uz8x7GvTBaHMroiyWvAps91Z5oJUIyvhIaTBW6kJUK66eXAaXxZpfl7Ch9mLkWb1byHFEsPU7-zN2CtesB4GHTtMPyJcMrmVxBHBcezR5CT9_lks6XnuM9okzl_SxsWgTa6Wp8KqsmKK8k_d33M4laVL8';
  static const Map<String, String> headers = {
    'Authorization': token, // استبدل بالتوكن الخاص بك
  };

  // إنشاء TeacherSubject
/*
  static Future<void> createTeacherSubject(
      Map<String, dynamic> subjectData) async {
    final request = http.MultipartRequest('POST', Uri.parse(baseUrl));
    request.headers.addAll(headers);

    subjectData.forEach((key, value) async {
      if (value is List<String>) {
        for (var item in value) {
          request.files.add(await http.MultipartFile.fromPath(
            key,
            item,
            filename: item.split('/').last,
          ));
        }
      } else {
        request.fields[key] = value.toString();
      }
    });

    final response = await request.send();
    if (response.statusCode == 200) {
      // print(await response.stream.bytesToString());
      print("Create Successfully");
    } else {
      print(response.reasonPhrase);
    }
  }
*/

  // تحديث TeacherSubject
/*  static Future<void> updateTeacherSubject(
    Map<String, dynamic> subjectData,
    String teacherSubjectId,
  ) async {
    final request =
        http.MultipartRequest('POST', Uri.parse('$baseUrl/$teacherSubjectId'));
    request.headers.addAll(headers);

    subjectData.forEach((key, value) async {
      if (value is List<String>) {
        for (var item in value) {
          request.files.add(await http.MultipartFile.fromPath(
            key,
            item,
            filename: item.split('/').last,
          ));
        }
      } else {
        request.fields[key] = value.toString();
      }
    });

    final response = await request.send();
    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }*/

  // جلب  GetSubject
  Future<List<Item>> fetchSubjectFromServer() async {
    final response = await http
        .get(Uri.parse('https://youlearnt.akwade.net/api/get/subject'));

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final responseObj = GetSubject.fromJson(jsonResponse);
      return responseObj.object;
    } else {
      throw Exception('Failed to load items');
    }
  }

  // CreateSubject  انشاء item
  Future<List<Item>> addCustomItem(String newValue) async {
    final List<Item> currentItems = await fetchSubjectFromServer();
    currentItems.add(Item(id: currentItems.length + 1, name: newValue));
    return currentItems;
  }

  static Future<void> createTeacherSubject({
    required List<File?> selectedImages,
    // required List<File?> selectedVideos,
    required String subjectId,
    required String hourlyRate,
    required String youtubeLink,
    required String certificationHour,
  }) async {
    var headers = {
      'Authorization':
          'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIyIiwianRpIjoiNTEwNzk2NGVmNzM0MDE0YTBlZjg3MjgyMTQ4YmVjNWJiY2YzMWE0NzFkY2Y3ZjlmOTBjNjc4MDIyMDAwZTg3OGY0Yzc4ZWViMzY3ZmI5MTgiLCJpYXQiOjE2OTIyMjg4MzAuNzc5NTgyLCJuYmYiOjE2OTIyMjg4MzAuNzc5NTg0LCJleHAiOjE2OTM1MjQ4MzAuNzc0NjY3LCJzdWIiOiIxMTYyMTMyIiwic2NvcGVzIjpbIioiXX0.KupqnhyBu65Hy8ewDM5kdxHVu5PSARdmz35V6pdSBC_S7ku-oh0uQ4po_XUEMa30bC8FWWGrFbDIoAyuBnPG70buGHAGoBw63GCGXv7osVgCNWKatZMzgmwvg_jkjway28VU8yNi4nMPAQY79ydDca9TyShXINYUQf5v73oyWmTEEfbmRo-P2xlbw2ozTcAnDM7ZaJXORC7jR1LazpEw8W6Htp_EzyUTytKABy8xx8sPTx1j66V-2PvA7gX_dYG21PJqg5diwa9EKOJXsHpasoDW_fxubncTHYVnzE-8Xf5OS2NvzoE5tL_WbS33crJqmEUvm5kSz706x_48deA2rYDGLRXt6iSoIvHz0HDRTBrJoGdzJm1gQxqNx2g9b7q-YxLKEaJEZHEoNvngQ7FgpG3_9Y57IiWVUJpM2Ung6EDr_vsmUtWF5Bn6-NX8IUgJQl8nxC2-xQETMMYLtjyEVNK22yf0yhs4gunKkVKM60iwCzgjNild8SwGoOnyqsp_qj-QB0Qbx1dqpGQdw3umFcntzyNTPIAR_3fYRjU4a-Z3uTK2ddxApv6mJILE7R5uOW1YeVaox7sFFJSRqDSPCfZ2YKML7MUzOeNPz00Ht_Wl1q1ITsw_-d1WmS9kmwsWD-7ixQ71w-Pq7KNO1dYDDzHuJH2prCLBPLiXNeDt2pI',
      'Content-Type': 'multipart/form-data',
    };

    var request = http.MultipartRequest(
      'POST',
      Uri.parse('https://youlearnt.akwade.net/api/teacher/profile'),
    );

    request.fields.addAll({
      'subject[0][id]': subjectId,
      'subject[0][hourlyRate]': hourlyRate,
      'subject[0][youtubeLink][0]': youtubeLink,
      'subject[0][certification_hour]': certificationHour,
    });

    // for (int i = 0; i < selectedImages.length; i++) {
    //   request.fields['subject[0][imagelist][$i]'] = selectedImages[i];
    // }

    // for (int i = 0; i < selectedImages.length; i++) {
    //   File? imageFile = selectedImages[i];
    //   if (imageFile != null) {
    //     request.files.add(await http.MultipartFile.fromBytes(
    //       'subject[0][imagelist][$i]',
    //       File(selectedImages[i]!.path).readAsBytesSync(),
    //       filename: imageFile.path,
    //     ));
    //   }
    // }
    for (int i = 0; i < selectedImages.length; i++) {
      File? imageFile = selectedImages[i];
      if (imageFile != null) {
        String filename = 'image_$i'; // Unique filename for each image
        request.files.add(await http.MultipartFile.fromBytes(
          'subject[0][list_image_url][$i]',
          await imageFile.readAsBytes(),
          filename: filename,
        ));
      }
    }

    request.headers.addAll(headers);

    try {
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        print('Upload successful');

        // Save your data or perform other actions here
      } else {
        print('Upload failed: ${response.reasonPhrase}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }
}
