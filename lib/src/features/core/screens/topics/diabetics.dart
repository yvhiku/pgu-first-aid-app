import 'package:first_aid_app/src/constants/image_strings.dart';
import 'package:first_aid_app/src/features/core/controllers/topic_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Diabetics extends StatelessWidget {
  const Diabetics({super.key});

 @override
  Widget build(BuildContext context) {
    final TopicController topicController = Get.find();
    // Define the current topic
    final currentTopic = {
      'title': 'Diabetics',
      'image': tDiabeticsimg, // Make sure this matches your image constant
      'screen': const Diabetics(),
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text('Diabetics'),
        actions: [
          Obx(
            () => IconButton(
              icon: Icon(
                topicController.isTopicSaved(currentTopic)
                    ? Icons.bookmark
                    : Icons.bookmark_border,
                color:
                    topicController.isTopicSaved(currentTopic)
                        ? Colors.red
                        : null,
              ),
              onPressed: () {
                topicController.toggleTopicSave(currentTopic);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      topicController.isTopicSaved(currentTopic)
                          ? 'Added to saved topics'
                          : 'Removed from saved topics',
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      body: const Center(child: Text('content goes here')),
    );
  }
}
