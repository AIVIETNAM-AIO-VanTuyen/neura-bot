import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import 'widgets/chat_welcome_grid.dart';
import 'widgets/chat_message_bubble.dart';
import 'widgets/chat_bottom_input.dart';

class ChatMessage {
  final String text;
  final bool isUser;
  final DateTime timestamp;

  ChatMessage({
    required this.text,
    required this.isUser,
    required this.timestamp,
  });
}

class ChatScreen extends StatefulWidget {
  final String botId;

  const ChatScreen({
    super.key,
    required this.botId,
  });

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<ChatMessage> _messages = [];
  final TextEditingController _inputController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  bool _isTyping = false;

  @override
  void dispose() {
    _inputController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  void _sendMessage(String text) {
    if (text.trim().isEmpty) return;

    setState(() {
      _messages.add(
        ChatMessage(
          text: text,
          isUser: true,
          timestamp: DateTime.now(),
        ),
      );
      _isTyping = true;
    });

    _inputController.clear();
    _scrollToBottom();

    // Mock AI response delay
    Future.delayed(const Duration(seconds: 1), () {
      if (!mounted) return;

      String aiResponse = "I'm here to help! Ask me anything about NeuraBot AI.";
      
      // Smart response logic for realistic demonstration
      final lowerText = text.toLowerCase();
      if (lowerText.contains('get started') || lowerText.contains('flour')) {
        aiResponse = "You'll need flour, eggs, and a pinch of salt.";
      } else if (lowerText.contains('thank')) {
        aiResponse = "You're very welcome! If you need anything else, just ask me anytime.";
      } else if (lowerText.contains('smart replies')) {
        aiResponse = "Smart Replies help you draft instant, context-aware responses to any message.";
      } else if (lowerText.contains('mood')) {
        aiResponse = "Mood Mode adapts the AI's personality to match your emotional state (creative, professional, empathetic).";
      }

      setState(() {
        _messages.add(
          ChatMessage(
            text: aiResponse,
            isUser: false,
            timestamp: DateTime.now(),
          ),
        );
        _isTyping = false;
      });
      _scrollToBottom();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary500, // Solid deep dark blue
      appBar: AppBar(
        backgroundColor: AppColors.primary500,
        elevation: 0,
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu, color: Colors.white),
              onPressed: () {
                // Open menu / drawer
              },
            );
          },
        ),
        title: const Text(
          'NeuraBot AI',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.edit_note, color: Colors.white, size: 28),
            onPressed: () {
              setState(() {
                _messages.clear();
              });
            },
          ),
          IconButton(
            icon: const Icon(Icons.chat_bubble_outline, color: Colors.white, size: 22),
            onPressed: () {
              // Action / settings
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Chat history area or Welcome Area
            Expanded(
              child: _messages.isEmpty
                  ? ChatWelcomeGrid(onActionTap: _sendMessage)
                  : _buildChatList(),
            ),

            // Bottom Input field & tools
            ChatBottomInput(
              controller: _inputController,
              onSubmitted: _sendMessage,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChatList() {
    return ListView.builder(
      controller: _scrollController,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      itemCount: _messages.length + (_isTyping ? 1 : 0),
      itemBuilder: (context, index) {
        if (index == _messages.length) {
          // Display typing indicator
          return const ChatMessageBubble(
            text: '',
            isUser: false,
            isTyping: true,
          );
        }

        final message = _messages[index];
        return ChatMessageBubble(
          text: message.text,
          isUser: message.isUser,
        );
      },
    );
  }
}
