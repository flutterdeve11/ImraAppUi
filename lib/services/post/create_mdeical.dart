import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';

import '../../modules/dio_service.dart';

class CreateMedical {
  var _dioService = DioService.getInstance();

  Future medical(String userId, String procedure,  String reason,String medCenter,
      String date,) async {
    var medicalJson = {
      "userId":userId,
      "procedure": procedure,
      "reason": reason,
      "medCenter": medCenter,
      "date": date,
      
    };
    try {
      final response = await _dioService.post(
        'create-medicalhistory',
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        }),
        data: jsonEncode(medicalJson),
      );
      if (response.statusCode == 201) {
 
      } else {
        return response.statusMessage;
      }
    } catch (e) {
      dynamic exception = e;
      return exception.message;
    }
  }
}
