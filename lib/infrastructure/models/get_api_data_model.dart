import 'package:yes_no_app/domain/entities/message.dart';

class GetAPIDataModel {
  String answer;
  bool forced;
  String image;

  GetAPIDataModel(
      {required this.answer, required this.forced, required this.image});

  factory GetAPIDataModel.fromJsonMap(Map<String, dynamic> json) =>
      GetAPIDataModel(
          answer: json['answer'], forced: json['forced'], image: json['image']);

  Message toMessageEntity() => Message(
      text: answer == 'yes' ? 'Si' : 'No',
      fromWho: FromWho.hers,
      imageUrl: image);
}
