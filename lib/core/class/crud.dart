import 'package:dartz/dartz.dart';
 import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:second/core/class/status_request.dart';
import '../../view/screen/language.dart';
import '../services/services.dart';

class Crud {
  MyServices myServices = Get.find();
  Future<Either<StatusRequest, Map>> getRequest(
      String url, Map data, @required dynamic token) async {
    try {
      var response = await http.get(
        Uri.parse(url),
        headers: {'Accept-Language': lang, 'Authorization': "Bearer$token"},
      );
      print("$token" + "TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTCRUD");
      myServices.sharedPreferences.setString("lang", lang);
      myServices.sharedPreferences.setString("step", "3");
      print("===============================================Language");
      print(myServices.sharedPreferences.setString("step", "3"));
      print("$response.................crud");
      if (response.statusCode == 200 || response.statusCode == 201) {
        print(response.statusCode);
        print("$response ..................................1");
        var responsebody = jsonDecode(response.body);
        print("$response ....................................2");

        return Right(responsebody);
      } else {
        print("$response............crud ");
        return const Left(StatusRequest.serverfailure);
      }
    } catch (_) {
      return const Left(StatusRequest.serverfailure);
    }
  }
/////////////////////////NEW
  Future<Either<StatusRequest, Map>> postData(String linkurl, Map data , dynamic token) async {
      var response = await http.post(Uri.parse(linkurl), body: data ,
        headers: {'Accept-Language': lang, 'Authorization': "Bearer$token"}, );
      print(response.statusCode) ;
      if (response.statusCode == 200 || response.statusCode == 201) {
        Map responsebody = jsonDecode(response.body);
        print(responsebody) ;

        return Right(responsebody);
      } else {
        return const Left(StatusRequest.serverfailure);
      }
    }

  ///////////////////////////////////////////////////////////////////////////////
  Future<Either<StatusRequest, Map>> postedData(
      {required String url,
      required Map<String, dynamic> body,
     // @required dynamic token
      }) async {
    try {
      print(url);
      print(body);
      //print(token);
      var response = await http.post(
        Uri.parse(url),
        body: body,
        // headers: {'Accept-Language': lang, 'Authorization': "Bearer$token"},
      );
      //   print("$token" + "TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTCRUD");
      print("$response.................crud tripssssssss");
      if (response.statusCode == 200 || response.statusCode == 201) {
        print('${response.statusCode}cruddddddddddddddddddddddddddddd');
        print("$response ..................................1");
        var responsebody = jsonDecode(response.body);
        print("$response ....................................2");

        return Right(responsebody);
      } else {
        print("$response............crud ");
        return const Left(StatusRequest.serverfailure);
      }
    } catch (_) {
      return const Left(StatusRequest.serverfailure);
    }
  }
/*
  //////////////////////////////////////////////////////////////////////
  Future<Either<StatusRequest, Map>> putData(
      {required String url,
      required Map<String, dynamic> body,
      @required dynamic token}) async {
    try {
      print(url);
      print(body);
      print(token);
      var response = await http.post(
        Uri.parse(url),
        body: body,
        headers: {'Accept-Language': lang, 'Authorization': "Bearer$token"},
      );

      print("$response.................crud tripssssssss");
      if (response.statusCode == 200 || response.statusCode == 201) {
        print('${response.statusCode}cruddddddddddddddddddddddddddddd');
        print("$response ..................................1");
        var responsebody = jsonDecode(response.body);
        print("$response ....................................2");

        return Right(responsebody);
      } else {
        print("$response............crud ");
        return const Left(StatusRequest.serverfailure);
      }
    } catch (_) {
      return const Left(StatusRequest.serverfailure);
    }
  }

//////////////////////////////////////////////////////////////////////////
  Future<Either<StatusRequest, Map>> delete({
    required String url,
    @required dynamic token,
  }) async {
    try {
      print(url);
      print(token);
      var response = await http.delete(
        Uri.parse(url),
        headers: {
          'Accept-Language': lang,
          'Authorization': "Bearer$token",
        },
      );
      print("$token" + "TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTCRUD");
      print("$response.................crud delete tripssssssss");
      if (response.statusCode == 200 || response.statusCode == 201) {
        print('${response.statusCode}crudddddddddddddddddddddddddddddelete');
        print("$response ..................................1");
        var responsebody = jsonDecode(response.body);
        print("$response ....................................2");

        return Right(responsebody);
      } else {
        print("$response............cruddelet ");
        return const Left(StatusRequest.serverfailure);
      }
    } catch (_) {
      return const Left(StatusRequest.serverfailure);
    }
  }

  // Future<Either<StatusRequest, List>> postData(String linkurl, Map data) async {
  //   try {
  //     //  if (await chackInternet()) {
  //     var response = await http.post(Uri.parse(linkurl));
  //     print("$response.................crud");
  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       print("crud.......................");
  //       print(response);
  //       Map responsebody = jsonDecode(response.body);
  //       print(response);
  //       return Right(responsebody as List);
  //     } else {
  //       print("$response............crud ");
  //       return const Left(StatusRequest.serverfailure);
  //     }
  //     // else {
  //     //   return const Left(StatusRequest.offlinefailure);
  //     // }
  //   } catch (_) {
  //     return const Left(StatusRequest.serverfailure);
  //   }
  // }

  // Future<dynamic> post(
  //     {required String url,
  //     required Map<String, dynamic> body,
  //     dynamic token}) async {
  //   Map<String, String> header = {};
  //   if (token != null) {
  //     header.addAll({'Authorization': "Bearer$token"});
  //     print("$token");
  //   }
  //   http.Response response =
  //       await http.post(Uri.parse(url), body: body, headers: header);
  //
  //   if (response.statusCode == 201 || response.statusCode == 200) {
  //     dynamic data = jsonDecode(response.body);
  //
  //     return data;
  //   } else {
  //     print(".....${response.statusCode}");
  //   }
  // }

  Future<Either<StatusRequest, Map>> get(String url, String language) async {
    try {
      var response = await http.get(
        Uri.parse(url),
        headers: {
          'Accept-Language': language,
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        var responseBody = jsonDecode(response.body);
        return Right(responseBody);
      } else {
        return const Left(StatusRequest.serverfailure);
      }
    } catch (_) {
      return const Left(StatusRequest.serverfailure);
    }
  }
  */
}
