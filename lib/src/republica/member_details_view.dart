import 'package:flutter/material.dart';

class MemberDetailsView extends StatelessWidget {
  const MemberDetailsView({
    super.key,
    required this.member,
  });

  static const routeName = '/member_details';

  final Map<String, dynamic> member;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${member['Apelido']}'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Apelido: ${member['nickname']}'),
            Text('Pontos: ${member['points']}'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        tooltip: 'Dar ponto',
        child: const Column(
          children: [
            Icon(Icons.add),
            Text('Ponto'),
          ],
        ),
      ),
    );
  }

}