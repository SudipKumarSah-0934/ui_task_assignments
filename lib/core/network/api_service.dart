import 'package:ui_task_assignments/core/constants/app_constants.dart';
import 'package:ui_task_assignments/core/network/base_api_service.dart';

class ApiManager extends BaseApiService {
  Function(int send, int total)? sendProgressBar;
  ApiManager({this.sendProgressBar}) : super(baseUrl: AppConstants.baseUrl);
// TO DO: call api here
  // Future<> getApiCall(String subject) async {
  //   return await safeApiRequest<>(
  //       endpoint: '',
  //       fromJson: (json) => ModelClass.fromJson(json),
  //       isAuthRequired: true,
  //       body: jsonEncode({
  //         'subject': subject,
  //       }),
  //       httpMethod: HttpMethod.post);
  // }
}
