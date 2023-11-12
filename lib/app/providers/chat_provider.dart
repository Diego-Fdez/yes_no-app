import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_api_data.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();
  final GetAPIData getAPIData = GetAPIData();

  List<Message> messageList = [
    Message(text: 'hi', fromWho: FromWho.me),
  ];

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;

    final newMessage = Message(text: text, fromWho: FromWho.me);
    messageList.add(newMessage);

    if (text.endsWith('?')) {
      await herReply();
    }

    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> herReply() async {
    final herMessage = await getAPIData.getAnswer();
    messageList.add(herMessage);
    notifyListeners();
  }

  void moveScrollToBottom() {
    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent,
      duration: const Duration(microseconds: 300),
      curve: Curves.easeIn,
    );
  }
}
