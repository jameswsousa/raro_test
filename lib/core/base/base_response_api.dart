class BaseResponseAPI {
  String? statusMessage;
  int? statusCode;
  dynamic body;

  BaseResponseAPI(
      {this.statusCode = 0, required this.statusMessage, this.body});

  BaseResponseAPI.fromJson(Map<String, dynamic> json) {
    statusMessage = json['statusMessage'] as String;
    statusCode = json['statusCode'] as int;
    body = json['response'];
  }

  @override
  String toString() {
    return '{ statusCode: $statusCode, statusMessage: $statusMessage, response: ${body.toString()} }';
  }
}
