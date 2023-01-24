import 'dart:convert';

import 'package:allserve/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chatgpt_api/flutter_chatgpt_api.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../../app/AppController.dart';

class ChatGptPage extends StatefulWidget {
  ChatGptPage({super.key});

  @override
  State<ChatGptPage> createState() => _ChatGptPageState();
}

// Future<String> generateResponse(String prompt) async {
//   final apiKey = apiSecretKey;
//   var url = Uri.https("api.openai.com", "/v1/completions");
//   final response = await http.post(url,
//       headers: {
//         'Content-Type': 'application/json',
//         'Authorization': 'Bearer $apiKey',
//       },
//       body: jsonEncode({
//         'model': 'text-davinci-003',
//         'prompt': prompt,
//         'temperature': 0,
//         'max_token': 2000,
//         'top_p': 1,
//         'frequency_penalty': 0.0,
//         'presence_penalty': 0.0,
//       }));
//   Map<String, dynamic> newresponse = jsonDecode(response.body);
//   return newresponse['choices'][0]['text'];
// }

class _ChatGptPageState extends State<ChatGptPage> {
  final backgroundColor = Color(0xff343541);
  final botBackgroundColor = Color(0xff444654);
  final _textController = TextEditingController();
  final _scrollController = ScrollController();
  final List<ChatMessage> _messages = [];
  late ChatGPTApi _api;
  String? _parentMessageId;
  String? _conversationId;
  late bool isLoading;

  @override
  void initState() {
    super.initState();
    _api = ChatGPTApi(
      sessionToken: SESSION_TOKEN,
      clearanceToken: CLEARANCE_TOKEN,
      userAgent:
          'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36',
    );
    isLoading = false;
    _loadItem();
  }

  Future<String> generateResponse(String prompt) async {
    final apiKey = apiSecretKey;
    var url = Uri.https("api.openai.com", "/v1/completions");
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $apiKey',
      },
      body: json.encode({
        "model": "text-davinci-003",
        "prompt": prompt,
        'temperature': 0,
        'max_tokens': 2000,
        'top_p': 1,
        'frequency_penalty': 0.0,
        'presence_penalty': 0.0,
      }),
    );
    Map<String, dynamic> newresponse = jsonDecode(response.body);
    return newresponse['choices'][0]['text'];
  }

  Future _loadItem() async {
    final user = await context.read<AppController>().user;
  }

  @override
  Widget build(BuildContext context) {
    final user = context.read<AppController>().user;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: Text(
          'Chat',
          maxLines: 2,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
        elevation: 0,
        // backgroundColor: botBackgroundColor,
        backgroundColor: Colors.cyan,
      ),
      // backgroundColor: backgroundColor,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: _buildList(),
            ),
            Visibility(
              visible: isLoading,
              child: Padding(
                padding: EdgeInsets.all(8),
                child: CircularProgressIndicator(
                  color: Colors.blueAccent,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                children: [
                  _buildInput(),
                  _buildSubmit(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSubmit() {
    return Visibility(
      visible: !isLoading,
      child: Container(
        // color: botBackgroundColor,
        color: Colors.cyan,
        child: IconButton(
          icon: Icon(
            Icons.send_rounded,
            // color: Color.fromRGBO(142, 142, 160, 1),
            color: Colors.white,
          ),
          onPressed: () async {
            setState(
              () {
                _messages.add(
                  ChatMessage(
                    text: _textController.text,
                    chatMessageType: ChatMessageType.user,
                  ),
                );
                isLoading = true;
              },
            );
            var input = _textController.text;
            _textController.clear();
            Future.delayed(Duration(milliseconds: 50)).then((_) => _scrollDown());

            // var newMessage = await _api.sendMessage(
            //   input,
            //   conversationId: _conversationId,
            //   parentMessageId: _parentMessageId,
            // );
            // setState(() {
            //   _conversationId = newMessage.conversationId;
            //   _parentMessageId = newMessage.messageId;
            //   isLoading = false;
            //   _messages.add(
            //     ChatMessage(
            //       text: newMessage.message,
            //       chatMessageType: ChatMessageType.bot,
            //     ),
            //   );
            // });

            generateResponse(input).then(
              (value) {
                setState(() {
                  // _conversationId = newMessage.conversationId;
                  // _parentMessageId = newMessage.messageId;
                  isLoading = false;
                  _messages.add(
                    ChatMessage(
                      text: value,
                      chatMessageType: ChatMessageType.bot,
                    ),
                  );
                });
              },
            );

            _textController.clear();
            Future.delayed(Duration(milliseconds: 50)).then((_) => _scrollDown());
          },
        ),
      ),
    );
  }

  Expanded _buildInput() {
    return Expanded(
      child: TextField(
        textCapitalization: TextCapitalization.sentences,
        style: TextStyle(color: Colors.black),
        controller: _textController,
        decoration: InputDecoration(
          // fillColor: botBackgroundColor,
          fillColor: Colors.cyan,
          filled: true,
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
        ),
      ),
    );
  }

  ListView _buildList() {
    return ListView.builder(
      controller: _scrollController,
      itemCount: _messages.length,
      itemBuilder: (context, index) {
        var message = _messages[index];
        return ChatMessageWidget(
          text: message.text,
          chatMessageType: message.chatMessageType,
        );
      },
    );
  }

  void _scrollDown() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }
}

class ChatMessageWidget extends StatelessWidget {
  ChatMessageWidget({super.key, required this.text, required this.chatMessageType});

  final String text;
  final ChatMessageType chatMessageType;
  final backgroundColor = Color(0xff343541);
  final botBackgroundColor = Color(0xff444654);
  final backgroundColor1 = Colors.cyan;
  final botBackgroundColor1 = Colors.cyanAccent;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(16),
      color: chatMessageType == ChatMessageType.bot ? botBackgroundColor1 : backgroundColor1,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          chatMessageType == ChatMessageType.bot
              ? Container(
                  margin: EdgeInsets.only(right: 16),
                  child: CircleAvatar(
                    backgroundColor: Color.fromRGBO(16, 163, 127, 1),
                    child: Image.asset(
                      'assets/bot.png',
                      color: Colors.white,
                      scale: 1.5,
                    ),
                  ),
                )
              : Container(
                  margin: EdgeInsets.only(right: 16),
                  child: CircleAvatar(
                    child: Icon(
                      Icons.person,
                    ),
                  ),
                ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  child: Text(
                    text,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
