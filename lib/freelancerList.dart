import 'package:flutter/material.dart';

void main() {
  runApp(FreelancerApp());
}

class FreelancerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '프리랜서 목록',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: FreelancerListPage(),
    );
  }
}

class FreelancerListPage extends StatefulWidget {
  @override
  _FreelancerListPageState createState() => _FreelancerListPageState();
}

class _FreelancerListPageState extends State<FreelancerListPage> {
  String? selectedJob;
  String? selectedWorkStyle;
  String? selectedTechStack;

  final List<Map<String, String>> freelancers = [
    {
      'name': '홍길동',
      'job': '프론트엔드 개발자',
      'workStyle': '재택',
      'techStack': 'CSS, JavaScript',
      'details': '5년 경력의 프론트엔드 개발자입니다.',
    },
    {
      'name': '김민수',
      'job': '백엔드 개발자',
      'workStyle': '출퇴근',
      'techStack': 'GraphQL, Python',
      'details': '전문적인 백엔드 개발 경험을 보유하고 있습니다.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('프리랜서 목록'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Dropdown 버튼
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DropdownButton<String>(
                  value: selectedJob,
                  hint: Text('직무'),
                  items: ['프론트엔드', '백엔드', '디자이너'].map((String job) {
                    return DropdownMenuItem<String>(
                      value: job,
                      child: Text(job),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedJob = value;
                    });
                  },
                ),
                DropdownButton<String>(
                  value: selectedWorkStyle,
                  hint: Text('근무 방식'),
                  items: ['재택', '출퇴근'].map((String style) {
                    return DropdownMenuItem<String>(
                      value: style,
                      child: Text(style),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedWorkStyle = value;
                    });
                  },
                ),
                DropdownButton<String>(
                  value: selectedTechStack,
                  hint: Text('기술 스택'),
                  items: ['JavaScript', 'Python', 'GraphQL'].map((String tech) {
                    return DropdownMenuItem<String>(
                      value: tech,
                      child: Text(tech),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedTechStack = value;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 16),
            // 평균 연봉 카드
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      '프리랜서 평균 희망 연봉',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '6346 만원',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            // 프리랜서 목록
            Expanded(
              child: ListView.builder(
                itemCount: freelancers.length,
                itemBuilder: (context, index) {
                  final freelancer = freelancers[index];
                  return Card(
                    elevation: 4,
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            freelancer['name']!,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 8),
                          Text('직무: ${freelancer['job']}'),
                          Text('근무 방식: ${freelancer['workStyle']}'),
                          Text('기술 스택: ${freelancer['techStack']}'),
                          SizedBox(height: 8),
                          Text('상세 내용: ${freelancer['details']}'),
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
    );
  }
}
