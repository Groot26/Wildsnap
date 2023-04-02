import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:wildsnap/app/modules/dashboard/views/dashboard_view.dart';
import 'package:zego_zimkit/compnents/conversation_list.dart';
import 'package:zego_zimkit/pages/message_list_page.dart';
import 'package:zego_zimkit/services/services.dart';
import 'package:zego_zimkit/utils/dialogs_utils.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/styles.dart';

class ChatView extends StatelessWidget {
  const ChatView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: AppColors.black,
            ),
            onPressed: DashboardView.launch),
        elevation: 0,
        backgroundColor: AppColors.white,
        title: const Text(
          'Chats',
          style: Styles.tsBlackBold24,
        ),
        actions: [
          PopupMenuButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              position: PopupMenuPosition.under,
              icon: Icon(
                Icons.add_circle_outline,
                color: AppColors.black,
              ),
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                    value: 'New Chat',
                    child: ListTile(
                      leading: Icon(CupertinoIcons.chat_bubble),
                      title: Text(
                        'New Chat',
                        maxLines: 1,
                      ),
                    ),
                    onTap: () => ZIMKit().showDefaultNewPeerChatDialog(context),
                  ),
                ];
              })
        ],
      ),
      body: ZIMKitConversationListView(
        onPressed: (context, conversation, defaultAction) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return ZIMKitMessageListPage(
                  conversationID: conversation.id,
                  conversationType: conversation.type,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
