import 'package:coronatracker_usemy/app/services/api_keys.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class API {
  API({@required this.apiKey});
  final String apiKey;

  factory API.sandbox() => API(apiKey: ApiKeys.ncovSandboxKey);

  static final host = "ncov2019-admin.firebaseapp.com";

  Uri tokenUri() => Uri(scheme: "https", host: host, path: "token");
}
