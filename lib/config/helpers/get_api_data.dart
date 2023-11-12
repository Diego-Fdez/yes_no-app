import 'package:dio/dio.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/infrastructure/models/get_api_data_model.dart';

class GetAPIData {
  final _dio = Dio();

  Future<Message> getAnswer() async {
    final response = await _dio.get('https://yesno.wtf/api');

    final getAPIdataModel = GetAPIDataModel.fromJsonMap(response.data);

    return getAPIdataModel.toMessageEntity();
  }
}
