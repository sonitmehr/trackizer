import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:trackizer/common/color_extension.dart';

class ChatSentCard extends StatelessWidget {
  const ChatSentCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
        child: Container(
          constraints: const BoxConstraints(minHeight: 50, maxWidth: 100),
          decoration: BoxDecoration(
              // color: Colors.white,
              color: TColor.chatSend,
              borderRadius: BorderRadius.circular(12)),
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
          child: const Text(
            'Hello',
            textAlign: TextAlign.left,
          ),
        ),
      ),
    );
  }
}
