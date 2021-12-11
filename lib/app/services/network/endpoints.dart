import 'package:wr_test/app/resources/constants.dart';
import 'package:wr_test/app/services/network/http_client.dart';

enum EndPoint { getHomeFeed }

extension URLExtenssion on EndPoint {
  static final String _baseUrl = AppConstants.baseURL;

  String get url {
    switch (this) {
      case EndPoint.getHomeFeed:
        return _baseUrl + '/5d565297300000680030a986';

      ///5d565297300000680030a986
      default:
        throw Exception(["Endpoint not defined"]);
    }
  }
}

extension RequestMode on EndPoint {
  RequestType get requestType {
    RequestType requestType = RequestType.get;

    switch (this) {
      case EndPoint.getHomeFeed:
        requestType = RequestType.get;
        break;
      default:
        break;
    }

    return requestType;
  }
}

extension Token on EndPoint {
  bool get shouldAddToken {
    var shouldAdd = true;

    switch (this) {
      case EndPoint.getHomeFeed:
        shouldAdd = false;
        break;
      default:
        break;
    }

    return shouldAdd;
  }
}
