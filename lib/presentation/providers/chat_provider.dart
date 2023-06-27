import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  
  final ScrollController chatScrollController = ScrollController();
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();

  List<Message> messageList = [
    Message(text: 'Hola mundo', fromWho: FromWho.me),
    Message(text: 'Hola mundo v2', fromWho: FromWho.me),
  ];

  Future<void> sendMessage(String text) async {

    if (text.isEmpty) return;

    messageList.add(Message(text: text, fromWho: FromWho.me));
    
    if(text.endsWith('?')) {
      getAnswer();
    }
    
    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> getAnswer() async {
    final answer = await getYesNoAnswer.getAnswer();
    messageList.add(answer);
    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> moveScrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));

    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }
}