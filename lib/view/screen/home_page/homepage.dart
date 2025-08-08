import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/HomePage/homepage_controller.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome to EduPlatform"),
        actions: [
          IconButton(icon: const Icon(Icons.notifications), onPressed: () {}),
        ],
        backgroundColor: Colors.deepPurple,
      ),
      body: GetBuilder<HomeController>(
        builder: (controller) => controller.enrolledCourses.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : ListView(
          padding: const EdgeInsets.all(16),
          children: [

            // Progress Bar
            Text("Your Progress", style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 8),
            LinearProgressIndicator(
              value: controller.progress,
              backgroundColor: Colors.grey[300],
              color: Colors.deepPurple,
              minHeight: 10,
            ),
            const SizedBox(height: 20),

            // Enrolled Courses
            Text("Enrolled Courses", style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 8),
            ...controller.enrolledCourses.map((course) {
              return Card(
                child: ListTile(
                  title: Text(course['title']),
                  subtitle: LinearProgressIndicator(
                    value: course['progress'],
                    color: Colors.green,
                  ),
                  trailing: Icon(course['progress'] == 1.0 ? Icons.check_circle : Icons.play_arrow),
                ),
              );
            }),

            const SizedBox(height: 20),

            // Saved Courses
            Text("Saved Courses", style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 8),
            ...controller.savedCourses.map((course) {
              return ListTile(
                leading: const Icon(Icons.bookmark),
                title: Text(course['title']),
              );
            }),

            const SizedBox(height: 20),

            // Recommendations
            Text("Recommended for You", style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 8),
            SizedBox(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: controller.recommendations.length,
                itemBuilder: (context, index) {
                  final rec = controller.recommendations[index];
                  return Card(
                    elevation: 3,
                    margin: const EdgeInsets.only(right: 10),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      width: 200,
                      child: Center(child: Text(rec['title'])),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),

            // Quick Actions
            Text("Quick Actions", style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 10),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                _quickAction(Icons.play_circle_fill, "Watch Video"),
                _quickAction(Icons.quiz, "Solve Quiz"),
                _quickAction(Icons.support_agent, "Support"),
                _quickAction(Icons.search, "Search"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _quickAction(IconData icon, String label) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.deepPurple.shade100,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      ),
      icon: Icon(icon, color: Colors.deepPurple),
      label: Text(label, style: const TextStyle(color: Colors.black)),
      onPressed: () {
        // Add corresponding navigation
      },
    );
  }
}
