import 'package:flutter/material.dart';

class Course {

  final int id;
  final String title;
  final String image;
  final String level;
  final int pointToEnroll;
  final double progress; // 0.0 - 1.0


  Course({

    required this.id,
    required this.title,
    required this.image,
    required this.level,
    required this.pointToEnroll,
    this.progress = 0.0,

  });
}

class CoursesScreen extends StatelessWidget {
  CoursesScreen({Key? key}) : super(key: key);

  // بيانات ثابتة مؤقتة
  final List<Course> availableCourses = [
    Course(
      id: 1,
      title: "Flutter Basics",
      image: "https://i.pravatar.cc/150?img=1",
      level: "Beginner",
      pointToEnroll: 50,
    ),
    Course(
      id: 2,
      title: "Advanced Dart",
      image: "https://i.pravatar.cc/150?img=2",
      level: "Advanced",
      pointToEnroll: 80,
    ),
    Course(
      id: 3,
      title: "UI/UX Design",
      image: "https://i.pravatar.cc/150?img=3",
      level: "Intermediate",
      pointToEnroll: 30,
    ),
  ];

  final List<Course> enrolledCourses = [
    Course(
      id: 1,
      title: "Flutter Basics",
      image: "https://i.pravatar.cc/150?img=1",
      level: "Beginner",
      pointToEnroll: 50,
      progress: 0.6,
    ),
    Course(
      id: 3,
      title: "UI/UX Design",
      image: "https://i.pravatar.cc/150?img=3",
      level: "Intermediate",
      pointToEnroll: 30,
      progress: 0.25,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("الدورات"),
          bottom: TabBar(
            tabs: [
              Tab(text: "Available Courses"),
              Tab(text: "Enrolled Courses"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // الدورات المتاحة
            ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: availableCourses.length,
              itemBuilder: (context, index) {
                final course = availableCourses[index];
                return buildAvailableCourseCard(course);
              },
            ),

            // الدورات المسجلة
            ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: enrolledCourses.length,
              itemBuilder: (context, index) {
                final course = enrolledCourses[index];
                return buildEnrolledCourseCard(course);
              },
            ),
          ],
        ),
      ),
    );
  }

  // بطاقة الدورات المتاحة
  Widget buildAvailableCourseCard(Course course) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Image.network(course.image, width: 80, height: 80, fit: BoxFit.cover),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(course.title,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text("Level: ${course.level}"),
                  Text("Points to enroll: ${course.pointToEnroll}"),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          print("Enroll in course ${course.id}");
                        },
                        child: Text("Enroll"),
                      ),
                      SizedBox(width: 8),
                      OutlinedButton(
                        onPressed: () {
                          print("Save course ${course.id}");
                        },
                        child: Text("Save"),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // بطاقة الدورات المسجلة
  Widget buildEnrolledCourseCard(Course course) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        onTap: () {
          print("Go to course details ${course.id}");
        },
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              Image.network(course.image, width: 80, height: 80, fit: BoxFit.cover),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(course.title,
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    Text("Level: ${course.level}"),
                    SizedBox(height: 8),
                    LinearProgressIndicator(value: course.progress),
                    SizedBox(height: 4),
                    Text("${(course.progress * 100).toInt()}% Completed"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
