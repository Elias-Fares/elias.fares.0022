import 'package:get/get_connect/http/src/exceptions/exceptions.dart';
import 'dart:async';
import 'package:get/get.dart';
import '../../core/consatnt/appcolors.dart';
import '../../core/consatnt/utils.dart';
import 'CustomExeption.dart';

class ApiProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.timeout = Duration(seconds: 2);

    /// You can also set base configuration / behavior through the interceptor feature
    /// available inside this function too!
  }

  Future<dynamic> gets<JSON, DartModel>(String url,
      {Map<String, dynamic>? query,
      Map<String, String>? headers,
      required DartModel Function(JSON theComingJson)?
          makingTheFromJsonPossible}) async {
    var responseJson;
    try {
      httpClient.errorSafety = false;
      //print requset
      print(url);
      print(query.toString());

      //send the requset with the querey
      Response<dynamic> model = await get(url, query: query, headers: headers);

      //hadnle status code
      responseJson = _response(model);

      //apply from json function
      return makingTheFromJsonPossible!(responseJson);
    } catch (e, s) {
      //handling error
      print(".................. Error Type:  " +
          e.runtimeType.toString() +
          '  .................');
      print('Errorrrrrrrrrr' + e.toString());
      print(s);
      if (e is GetHttpException) {
        if (e.message.contains('SocketException'))
          Utils.showGetXToast(
              title: 'Error',
              message: 'No Internet Connection',
              toastColor: AppColors.transparentYellow);
        else
          Utils.showGetXToast(
              title: 'Error',
              message: e.message,
              toastColor: AppColors.transparentYellow);
        return 'error';
      } else {
        Utils.showGetXToast(
            title: 'Error',
            message: e.toString(),
            toastColor: AppColors.transparentYellow);
        print("UNEXPECTED ERROR");
        return 'error';
      }
      // return  NetWorkExceptions.getApiException(e);
    }
  }

  dynamic _response(response) {
    print(response.statusCode.toString() + ' status code');
    switch (response.statusCode) {
      case 200:
        Map<String, dynamic> mymap = {"data": response.body};
        print(mymap.toString());
        return mymap;

      case 400:
        Utils.showGetXToast(
            title: 'Error',
            message: response.body['message'],
            toastColor: AppColors.orange);
        throw BadRequestException(response.body.toString());
      case 404:
        Utils.showGetXToast(
            title: 'Error',
            message: response.body['message'],
            toastColor: AppColors.orange);
        throw BadRequestException(response.body.toString());
      case 401:

      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
        Utils.showGetXToast(
            title: 'firas',
            message: response.body['message'],
            toastColor: AppColors.orange);
        throw FirasException(response.body.toString());
      case 503:
        Utils.showGetXToast(
            title: 'ServiceUnavailableException',
            message: response.body['message'],
            toastColor: AppColors.orange);
        throw ServiceUnavailableException(response.body.toString());
      case null:
        Utils.showGetXToast(
            title: 'Unexpected Error',
            message: 'StatusCode is Null',
            toastColor: AppColors.orange);
        throw BadRequestException(response.body.toString());

      default:
        Utils.showGetXToast(
            title: 'null', message: 'null', toastColor: AppColors.orange);
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
// to get an image from backend --- test//
  Future<dynamic> getImage(String url) async {
    Response<dynamic> _imgResp = await get(url);
    var response = _response(_imgResp);
    return response;

  }
}



