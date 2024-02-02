import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;

enum HttpMethod { get, post, delete, patch }

class BaseApiService {
  String baseUrl;
  int httpTimeoutSeconds = 500;

  BaseApiService({required this.baseUrl});

  Future<T> safeApiRequest<T>({
    required String endpoint,
    required T Function(dynamic) fromJson,
    required bool isAuthRequired,
    required HttpMethod httpMethod,
    Object? body,
  }) async {
    // Empty response
    bool success = false;
    String message = "Something went wrong !";
    T? data;
    // Network call
    try {
      final response = await requestResponse(
          endpoint: endpoint,
          body: body,
          httpMethod: httpMethod,
          authRequired: isAuthRequired);
      if (response.statusCode == 505) {
        message = getMessageFromStatusCode(response.statusCode);
      }
      print(response.body);
      return fromJson(jsonDecode(response.body));
    } on SocketException catch (e) {
      message = "No Internet Connection !";
      log("No Internet Connection !  \n Exception:$e");
    } on FormatException catch (e) {
      message = "Invalid Data Format !";
      log("Invalid Data Format !  \n Exception:$e");
    } on TimeoutException catch (e) {
      message = "Request Timeout, Try Again !";
      log("Request Timeout, Try Again !  \n Exception:$e");
    } on http.ClientException catch (e) {
      message = "Failed to connect to the server !";
      log("Failed to connect to the server !  \n Exception:$e");
    } on Exception catch (e) {
      message = "An exception error occurred !";
      log("An exception error occurred !  \n Exception:$e");
    } catch (e) {
      message = "An exception error occurred !";
      log("An exception error occurred !  \n Exception:$e");
    }

    final apiResponse =
        {"success": success, "message": message, "data": null}.toString();
    return fromJson(jsonDecode(apiResponse));
  }

  Future<http.Response> requestResponse({
    required String endpoint,
    required Object? body,
    required HttpMethod httpMethod,
    required bool authRequired,
  }) async {
    var authToken = "";
    Map<String, String> header = authRequired
        ? {
            "content-type": "application/json",
            "Accept": "application/json",
            "authorization": "Bearer $authToken",
          }
        : {
            //"content-type": "application/json",
            "Accept": "application/json",
          };

    switch (httpMethod) {
      case HttpMethod.get:
        return await http
            .get(
              Uri.parse(baseUrl + endpoint),
              headers: header,
            )
            .timeout(Duration(seconds: httpTimeoutSeconds));
      case HttpMethod.post:
        return await http
            .post(Uri.parse(baseUrl + endpoint), body: body, headers: header)
            .timeout(Duration(seconds: httpTimeoutSeconds));
      case HttpMethod.delete:
        return await http
            .delete(Uri.parse(baseUrl + endpoint), headers: header)
            .timeout(Duration(seconds: httpTimeoutSeconds));
      case HttpMethod.patch:
        return await http
            .patch(Uri.parse(baseUrl + endpoint), body: body, headers: header)
            .timeout(Duration(seconds: httpTimeoutSeconds));
    }
  }

  String getMessageFromStatusCode(int statusCode) {
    switch (statusCode) {
      case 200:
        return "Success! Request completed.";
      case 201:
        return "Success! Item created.";
      case 202:
        return "Success! Request accepted.";
      case 203:
        return "Success! Non-Authoritative Information.";
      case 204:
        return "Done! Request successful.";
      case 205:
        return "Done! Request successful.";
      case 301:
        return "Redirecting! Page moved.";
      case 400:
        return "Oops! Invalid request.";
      case 401:
        return "Unauthorized! Access denied.";
      case 403:
        return "Forbidden! No permission.";
      case 404:
        return "Not Found! Resource does not exist.";
      case 410:
        return "Gone! Resource no longer available.";
      case 429:
        return "Too Many Requests! Try again later.";
      case 500:
        return "Server Error! Try again later.";
      case 503:
        return "Service Unavailable! Try again later.";
      case 505:
        return "HTTP Version Not Supported! Server Error.";
      default:
        return "Unknown status code: $statusCode";
    }
  }
}
