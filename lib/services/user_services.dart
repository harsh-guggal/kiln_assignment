import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:guggal_social/utils/global_variables.dart';
import 'package:http/http.dart' as http;
import 'package:guggal_social/models/user_model.dart';
import 'package:guggal_social/services/base_services.dart';
import 'package:guggal_social/widgets/progress_dailog.dart';

class UserServices {
  static Future<UserModel?> fetchUserByEmail(String email) async {
    http.Response response = await BaseService.makeUnauthenticatedRequest(
      "${BaseService.BASE_URL}/users/?filter[email][_eq]=$email&filter[role][_eq]=$customerRole",
    );

    if (response.statusCode == 200) {
      var responseBody = json.decode(response.body);
      if (responseBody['data'].length > 0) {
        if (kDebugMode) {
          print("Fetched user: ${responseBody['data'][0]}");
        }
        try {
          return UserModel.fromJson(responseBody['data'][0]);
        } catch (e) {
          if (kDebugMode) {
            print("Error fetching user: $e");
          }
          return null;
        }
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  static Future<bool> checkUserExists(String email) async {
    http.Response response = await BaseService.makeUnauthenticatedRequest(
      "${BaseService.BASE_URL}/users/?filter[email][_eq]=$email",
    );
    if (response.statusCode == 200) {
      var responseBody = json.decode(response.body);
      if (responseBody['data'].length > 0) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  static Future<dynamic> uploadImage(File image, context) async {
    showDialog(
      context: context,
      builder: (context) => const ProgressDailog(
        status: 'Uplaoding...',
      ),
    );
    if (kDebugMode) {
      print(
          "------------------------uploadImage called---------------------------");
    }
    var url = Uri.parse('${BaseService.BASE_URL}/files');
    var req = http.MultipartRequest('POST', url);
    req.files.add(await http.MultipartFile.fromPath(
      'file',
      image.path,
    ));

    var res = await req.send();
    final resBody = await res.stream.bytesToString();
    var response = json.decode(resBody);
    var avatar = response['data']['id'];

    String img = "";

    if (res.statusCode >= 200 && res.statusCode < 300) {
      if (kDebugMode) {
        print('image uploaded $resBody');
      }
      img = avatar;
    } else {
      if (kDebugMode) {
        print('image upload failed${res.reasonPhrase}');
      }
    }
    Navigator.pop(context);
    return img;
  }

  static Future<int> updateUserData(
      Map<String, dynamic> data, context, bool show) async {
    if (kDebugMode) {
      print(
          '----------------------------updateUserData called--------------------------------');
    }

    http.Response res = await BaseService.makeAuthenticatedRequest(
      '${BaseService.BASE_URL}/users/me',
      method: 'PATCH',
      body: json.encode(data),
    );
    if (res.statusCode >= 200 && res.statusCode < 300) {
      var resBody = json.decode(res.body);

      await BaseService.updateUser(UserModel.fromJson(resBody['data']));
      if (show) {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            duration: const Duration(seconds: 2),
            elevation: 6,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            // backgroundColor: BrandColors.primaryColor,
            content: const Center(
              child: Text(
                'Profile updated Successfully',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        );
      }
    } else {
      if (kDebugMode) {
        print('updateUserData error: ${res.reasonPhrase}');
      }
      if (show) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            duration: const Duration(seconds: 2),
            elevation: 6,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            // backgroundColor: Colors.red,
            content: const Center(
              child: Text(
                'Something went wrong, Please try again',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        );
      }
    }
    return res.statusCode;
  }
}
