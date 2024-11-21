import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<String> adImages = [
    'assets/ad/ad1.png',
    'assets/ad/ad2.png',
    'assets/ad/ad3.png',
    'assets/ad/ad4.png',
    'assets/ad/ad5.png',
  ];

  final List<Map<String, String>> projectList = [
    {
      'projectName': 'Project A',
      'company': 'Company A',
      'image': 'assets/logos/sample-img.png',
    },
    {
      'projectName': 'Project B',
      'company': 'Company B',
      'image': 'assets/logos/sample-img.png',
    },
    // Add more project items here
  ];

  final List<Map<String, String>> freelancerList = [
    {
      'username': 'Freelancer A',
      'jobPart': 'Developer',
      'image': 'assets/logos/freelancer-icon.png',
    },
    {
      'username': 'Freelancer B',
      'jobPart': 'Designer',
      'image': 'assets/logos/freelancer-icon.png',
    },
    // Add more freelancer items here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Freelancer Platform'),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Advertisement Slider
            Container(
              width: double.infinity,
              child: Column(
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3),
                      enlargeCenterPage: true,
                      aspectRatio: 16 / 9,
                    ),
                    items: adImages.map((imagePath) {
                      return Builder(
                        builder: (context) {
                          return Image.asset(imagePath, fit: BoxFit.cover);
                        },
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Ad Progress: 1/5',
                    style: TextStyle(fontSize: 16, color: Colors.black.withOpacity(0.7)),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),

            // Projects Section
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '많이 찾는 프로젝트 공고들',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text('프로젝트를 시작해볼까요?', style: TextStyle(fontSize: 14, color: Colors.black.withOpacity(0.6))),
                  SizedBox(height: 10),
                  Container(
                    height: 250,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: projectList.length,
                      itemBuilder: (context, index) {
                        final project = projectList[index];
                        return GestureDetector(
                          onTap: () {
                            // Navigate to project detail
                          },
                          child: Container(
                            width: 180,
                            margin: EdgeInsets.symmetric(horizontal: 8),
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.asset(
                                    project['image']!,
                                    width: 180,
                                    height: 120,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  project['projectName']!,
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  project['company']!,
                                  style: TextStyle(fontSize: 14, color: Colors.black.withOpacity(0.7)),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            // Advertisement Banner Section
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset('assets/ad/work_ad1.png', width: 200, height: 200),
                  Image.asset('assets/ad/work_ad2.png', width: 200, height: 200),
                  Image.asset('assets/ad/work_ad3.png', width: 200, height: 200),
                ],
              ),
            ),

            // Freelancers Section
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '현재 핫한 프리랜서 개발자들',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text('함께 프로젝트를 시작해보세요', style: TextStyle(fontSize: 14, color: Colors.black.withOpacity(0.6))),
                  SizedBox(height: 10),
                  Container(
                    height: 250,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: freelancerList.length,
                      itemBuilder: (context, index) {
                        final freelancer = freelancerList[index];
                        return GestureDetector(
                          onTap: () {
                            // Navigate to freelancer detail
                          },
                          child: Container(
                            width: 180,
                            margin: EdgeInsets.symmetric(horizontal: 8),
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: 40,
                                  backgroundImage: AssetImage(freelancer['image']!),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  freelancer['username']!,
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  freelancer['jobPart']!,
                                  style: TextStyle(fontSize: 14, color: Colors.black.withOpacity(0.7)),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
