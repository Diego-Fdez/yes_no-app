import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/app/providers/chat_provider.dart';
import 'package:yes_no_app/app/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app/app/widgets/chat/message_field_box.dart';
import 'package:yes_no_app/app/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
            padding: EdgeInsets.all(4.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage('https://picsum.photos/300/300'),
            )),
        title: const Text('My chat'),
        centerTitle: true,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
              controller: chatProvider.chatScrollController,
              itemCount: chatProvider.messageList.length,
              itemBuilder: (context, index) {
                final message = chatProvider.messageList[index];

                return (message.fromWho == FromWho.hers)
                    ? HerMessageBubble(
                        message: message,
                      )
                    : MyMessageBubble(
                        message: message,
                      );
              },
            )),
            MessageFieldBox(
              onValue: (value) {
                chatProvider.sendMessage((value));
              },
            )
          ],
        ),
      ),
    );
  }
}
