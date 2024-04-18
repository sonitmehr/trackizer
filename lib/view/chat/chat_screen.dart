import 'package:flutter/material.dart';
import 'package:trackizer/common/color_extension.dart';
import 'package:trackizer/common_widget/round_textfield.dart';
import 'package:trackizer/view/chat/chat_recieve_card.dart';
import 'package:trackizer/view/chat/chat_sent_card.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _chatController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColor.gray,
      appBar: AppBar(
        backgroundColor: TColor.gray,
        leading: Row(
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Image.asset("assets/img/back.png",
                    width: 25, height: 25, color: TColor.gray30)),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      if (index == 1) return ChatRecieveCard();
                      return ChatSentCard();
                    })),
            Padding(
                padding: const EdgeInsets.only(
                    top: 30, left: 20, right: 20, bottom: 20),
                child: RoundTextField(
                  title: "",
                  titleAlign: TextAlign.center,
                  controller: _chatController,
                )),
          ],
        ),
      ),
    );
  }
}
