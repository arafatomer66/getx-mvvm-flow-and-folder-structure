import 'package:uniname/model/university_model.dart';

import '../api_services/api_service.dart';
import '../api_services/base_service.dart';
import '../utils/api_constants.dart';

class ApiRepository {
  final BaseService _apiService = ApiService();

  Future<List<University>> fetchUniversityList() async {
    dynamic response = await _apiService.getGetResponse(ApiConstants.UNIVERSITY_LIST_URL);
    return List<University>.from(response.map((i) => University.fromJson(i)));
  }
}
