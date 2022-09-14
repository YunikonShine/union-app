import 'package:flutter/material.dart';
import 'package:union/widgets/psychologist_card/psychologist_card_image.dart';
import 'package:union/widgets/psychologist_card/psychologist_card_login_icon.dart';
import 'package:union/widgets/psychologist_card/psychologist_card_message_number.dart';
import 'package:union/widgets/psychologist_card/psychologist_card_name.dart';

class PsychologistCard extends StatelessWidget {
  const PsychologistCard(
      {Key? key,
      required this.online,
      required this.messageNumber,
      required this.name,
      required this.avatar})
      : super(key: key);

  final bool online;
  final int messageNumber;
  final String name;
  final String avatar;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 5),
                child: Stack(
                  children: [
                    PsychologistCardLoginIcon(
                      online: online,
                    ),
                    PsychologistCardImage(
                      image: avatar,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: PsychologistCardName(
                  name: name,
                ),
              ),
              PsychologistCardMessageNumber(
                messageNumber: messageNumber,
              ),
            ],
          ),
          const Divider(
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
