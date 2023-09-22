
import 'package:dio/dio.dart';
import '../../model/medical_history_model.dart';
import '../../modules/dio_service.dart';

class GetMedicalHostory {
  var _dioService = DioService.getInstance();

  Future getmedicalHistory(String userId) async {
    try {
      final response = await _dioService.get(
        'medical-history',
        options: Options(headers: {
         // HttpHeaders.authorizationHeader: 'Bearer $token',
          'content-Type': 'application/json'
        }),
      );
      if (response.statusCode == 200) {
        List historyData = response.data["data"];
        List<MedicalHistoryModel> medicalhistoryModel =
            historyData.map((e) => MedicalHistoryModel.fromJson(e)).toList();
        return medicalhistoryModel;
      } else {
        return response.statusMessage;
      }
    } catch (e) {
      dynamic exception = e;
      return exception.message;
    }
  }
}