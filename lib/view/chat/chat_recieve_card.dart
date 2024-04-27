import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:trackizer/common/color_extension.dart';

class ChatRecieveCard extends StatelessWidget {
  const ChatRecieveCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
        child: Container(
          constraints: const BoxConstraints(minHeight: 50, maxWidth: 240),
          decoration: BoxDecoration(
              // color: Colors.white,
              color: TColor.chatRecieve,
              borderRadius: BorderRadius.circular(12)),
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Rent 25000',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('18 April 2024'),
                    Text("${Constants.currencySymbol} 25000"),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: DottedBorder(
                  color: Colors.black,
                  strokeWidth: 1,
                  dashPattern: [5, 5],
                  borderType: BorderType.RRect,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
                    decoration: BoxDecoration(
                        // border: Border.all(),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                                width: 30,
                                height: 25,
                                child: Image.asset("assets/img/expense.png")),
                            const Text('Expense'),
                          ],
                        ),
                        const Text('Housing'),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.edit),
                    // Image.asset("assets/img/next.png",
                    //     width: 12, height: 12, color: TColor.gray30),
                    Icon(Icons.delete),
                    // SizedBox(
                    //     width: 30,
                    //     height: 20,
                    //     child: Image.asset("assets/img/Trash.png"))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
