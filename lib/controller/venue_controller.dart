import 'package:bandobasta_task/models/venue_model.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class VenueController extends GetxController {
  Future<VenueModel> fetchVenueData() async {
    final dio = Dio();
    try {
      final response = await dio.get(
          'https://bandobasta.onrender.com/bandobasta/api/v1/venue/findAll');
      if (response.statusCode == 200) {
        // print(response.data);
        return VenueModel.fromJson(response.data);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      // print(e);
      throw Exception('Failed to load data');
    }
  }
}
