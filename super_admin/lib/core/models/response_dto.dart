
class ResponseDto{
    final String? status;
    final String? message;
    final dynamic data;
    final int? statusCode;
    ResponseDto({this.status,this.message,required this.data,this.statusCode});

    factory ResponseDto.fromJson(Map<String, dynamic> json){
      return ResponseDto(
        status: json['status'],
        message: json['message'],
        data: json['data'],
        statusCode: json['statusCode']
      );
    }

     Map<String, dynamic> toJson() {
      return {
        'status': status,
        'message': message,
        'data': data,
        'statusCode': statusCode
      };
    }
}