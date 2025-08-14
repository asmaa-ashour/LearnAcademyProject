import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/Recommendation_controller.dart';

class RecommendationScreen extends StatelessWidget {
  RecommendationScreen({super.key});

  final RecommendationController controller =
  Get.put(RecommendationController());

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // بيانات مؤقتة للمحادثة (UI فقط)
    final List<Map<String, dynamic>> chatMessages = [
      {"type": "sent", "text": "أرغب بدورة Flutter"},
      {"type": "received", "text": "ننصحك بدورة Flutter للمبتدئين"},
      {"type": "sent", "text": "أريد دورة متقدمة بالذكاء الاصطناعي"},
      {"type": "received", "text": "ننصحك بدورة AI مع Python"},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "إرسال توصية",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: Column(
        children: [
          // نموذج الإدخال
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Icon(Icons.recommend,
                    size: 80, color: Colors.deepPurple.shade300),
                const SizedBox(height: 10),
                Text(
                  "شاركنا اهتمامك لتحصل على توصيات مناسبة لك",
                  textAlign: TextAlign.center,
                  style: theme.textTheme.titleMedium
                      ?.copyWith(color: Colors.grey.shade700),
                ),
                const SizedBox(height: 15),
                Form(
                  key: _formKey,
                  child: TextFormField(
                    controller: controller.interestController,
                    decoration: InputDecoration(
                      labelText: "أدخل اهتمامك أو موضوع الدورة",
                      prefixIcon:
                      const Icon(Icons.search, color: Colors.deepPurple),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                            color: Colors.deepPurple, width: 2),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    icon: const Icon(Icons.send, color: Colors.white),
                    label: const Text(
                      "إرسال",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),

          const Divider(),

          // المحادثة
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: chatMessages.length,
              itemBuilder: (context, index) {
                final message = chatMessages[index];
                final isSent = message["type"] == "sent";

                return Align(
                  alignment:
                  isSent ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                    decoration: BoxDecoration(
                      color:
                      isSent ? Colors.deepPurple.shade200 : Colors.grey[300],
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(12),
                        topRight: const Radius.circular(12),
                        bottomLeft:
                        isSent ? const Radius.circular(12) : Radius.zero,
                        bottomRight:
                        isSent ? Radius.zero : const Radius.circular(12),
                      ),
                    ),
                    child: Text(
                      message["text"],
                      style: TextStyle(
                        color: isSent ? Colors.white : Colors.black87,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
