import 'package:flutter/material.dart';

void main() {
  runApp(CompanyReviewApp());
}

class CompanyReviewApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Company Review',
      home: CompanyReviewPage(),
    );
  }
}

class CompanyReviewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Company Review'),
        backgroundColor: Colors.blue,
      ),
      body: Row(
        children: [
          SidebarMenu(),
          Expanded(
            child: Column(
              children: [
                Header(),
                Expanded(
                  child: CompanyReviewTable(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SidebarMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final menuItems = [
      '대시보드',
      '회원 관리',
      '결제 관리',
      '환불 관리',
      '광고 관리',
      '공지 관리',
      '고객 지원',
      '기업 리뷰',
      '프리랜서 리뷰',
    ];

    return Container(
      width: 200,
      color: Colors.blue[50],
      child: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            color: Colors.blue,
            child: const Text(
              '다모아',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ...menuItems.map((item) => ListTile(
            title: Text(item),
            leading: Icon(Icons.circle, size: 10),
          )),
        ],
      ),
    );
  }
}

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      color: Colors.blue[100],
      child: const Text(
        'Company Review',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class CompanyReviewTable extends StatelessWidget {
  final List<Map<String, String>> reviews = [
    {
      'projectName': '[원격] 국내 기업 갤러리 웹 사이트 개발 (CSS, HTML)',
      'userName': 'Damoa corp.',
      'work': '주요 기능 개발',
      'score': '5',
      'response': '훌륭한 작업 결과였습니다.',
    },
    {
      'projectName': '[원격] 국내 기업 갤러리 웹 사이트 개발 (CSS, HTML)',
      'userName': 'Damoa corp.',
      'work': '주요 기능 개발',
      'score': '4',
      'response': '시간을 잘 지켰고 품질도 좋았습니다.',
    },
    {
      'projectName': '[원격] 라이브 송출 관련 앱 개발 (CSS, PHP)',
      'userName': 'GreenSolutions',
      'work': 'UI 디자인',
      'score': '3',
      'response': '전반적으로 괜찮았지만 개선이 필요합니다.',
    },
    {
      'projectName': '[원격] 라이브 송출 관련 앱 개발 (CSS, PHP)',
      'userName': 'GreenSolutions',
      'work': 'UI 디자인',
      'score': '5',
      'response': '모든 부분에서 뛰어난 성과를 보여주었습니다.',
    },
    {
      'projectName': '[상주] 자바 웹 개발자 구인 (Spring Framework)',
      'userName': 'SmartSolutions',
      'work': '모바일 앱 개발',
      'score': '5',
      'response': '전문성과 기술력이 뛰어났습니다.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: DataTable(
          columnSpacing: 20.0,
          columns: const [
            DataColumn(
                label: Text(
                  '프로젝트 이름',
                  textAlign: TextAlign.center,
                )),
            DataColumn(
                label: Text(
                  '사용자 이름',
                  textAlign: TextAlign.center,
                )),
            DataColumn(
                label: Text(
                  '주요 작업',
                  textAlign: TextAlign.center,
                )),
            DataColumn(
                label: Text(
                  '전체 점수',
                  textAlign: TextAlign.center,
                )),
            DataColumn(
                label: Text(
                  '응답',
                  textAlign: TextAlign.center,
                )),
            DataColumn(
                label: Text(
                  '상세 보기',
                  textAlign: TextAlign.center,
                )),
          ],
          rows: reviews
              .map(
                (review) => DataRow(
              cells: [
                DataCell(Text(review['projectName']!)),
                DataCell(Text(review['userName']!)),
                DataCell(Text(review['work']!)),
                DataCell(Text(review['score']!)),
                DataCell(Text(review['response']!)),
                DataCell(
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return DetailDialog(review: review);
                        },
                      );
                    },
                    child: const Text('리뷰 상세 보기'),
                  ),
                ),
              ],
            ),
          )
              .toList(),
        ),
      ),
    );
  }
}

class DetailDialog extends StatelessWidget {
  final Map<String, String> review;

  DetailDialog({required this.review});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('리뷰 상세 정보'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('프로젝트 이름: ${review['projectName']}'),
          Text('사용자 이름: ${review['userName']}'),
          Text('주요 작업: ${review['work']}'),
          Text('전체 점수: ${review['score']}'),
          Text('응답: ${review['response']}'),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('닫기'),
        ),
      ],
    );
  }
}
