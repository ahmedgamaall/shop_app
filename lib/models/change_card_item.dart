class ChangeCardItemsModel{
  bool? status;
  String? message;

  ChangeCardItemsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }
}