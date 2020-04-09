import 'package:connectivity/connectivity.dart';


Future<bool> checkoninternet() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  return connectivityResult== ConnectivityResult.mobile || connectivityResult==ConnectivityResult.wifi;

}