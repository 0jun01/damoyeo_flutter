import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Notice(),
  ));
}

class Notice extends StatelessWidget {
  final List<Map<String, String>> notices = [
    {'title': '[10월 2주차 운영 정책] 법안 개정으로 인한 운영 정책 변경 안내', 'date': '2024-10-21'},
    {'title': '[10월 3주차 운영 정책] 법안 개정으로 인한 운영 정책 변경 안내', 'date': '2024-10-21'},
    {'title': '안녕하세요 다모아입니다.', 'date': '2024-10-29'},
    {'title': '다모아 화이팅', 'date': '2024-10-29'},
    {'title': '웅', 'date': '2024-10-29'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('공지사항'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          const Text(
            '다모아의 새로운 소식들',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              '신규 기능, 이벤트, 점검 일정 등 다양한 이야기를 확인해주세요.',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ),
          const Divider(),
          Expanded(
            child: SingleChildScrollView(
              child: DataTable(
                columnSpacing: 20,
                columns: const [
                  DataColumn(
                    label: Text(
                      '제목',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      '작성일',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
                rows: notices.map((notice) {
                  return DataRow(
                    cells: [
                      DataCell(
                        GestureDetector(
                          onTap: () {
                            // 자세히 보기 페이지로 이동
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NoticeDetail(
                                  title: notice['title']!,
                                  date: notice['date']!,
                                ),
                              ),
                            );
                          },
                          child: Text(
                            notice['title']!,
                            style: const TextStyle(
                                color: Colors.blue, decoration: TextDecoration.underline),
                          ),
                        ),
                      ),
                      DataCell(Text(notice['date']!)),
                    ],
                  );
                }).toList(),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  // 이전 페이지 버튼 로직
                },
                child: const Text('이전'),
              ),
              const SizedBox(width: 10),
              TextButton(
                onPressed: () {
                  // 다음 페이지 버튼 로직
                },
                child: const Text('다음'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class NoticeDetail extends StatelessWidget {
  final String title;
  final String date;

  const NoticeDetail({Key? key, required this.title, required this.date}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('공지사항 상세'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              '작성일: $date',
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            const Text(
              '공지사항의 내용',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
