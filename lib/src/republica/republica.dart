import 'package:flutter/material.dart';
import 'package:pulero_apk/src/my_future_builder.dart';
import 'package:pulero_apk/src/database/dweller.dart';
import 'package:pulero_apk/src/republica/member_details_view.dart';

/// Displays a list of SampleItems.
class RepublicaPage extends StatefulWidget {
	const RepublicaPage({
		super.key,
	});

	@override
	State<RepublicaPage> createState() => _RepublicaPageState();
}

class _RepublicaPageState extends State<RepublicaPage> {
	late Future<List<Map<String, dynamic>>> futureMembers = Dweller.getDwellers();

	@override
	Widget build(BuildContext context) {
		return MyFutureBuilder(
			future: futureMembers,
			builder: (context, members) {
				return ListView.builder(
						restorationId: null,
						itemCount: members.length,
						itemBuilder: (BuildContext context, int index) {
				
							return memberTile(members, index, context);
						}
				);
			}
		);
	}

	ListTile memberTile(List<Map<String, dynamic>> members, int index, BuildContext context) {
		return ListTile(
				title: Text('${members[index]['Apelido']}'),
				leading: const CircleAvatar(
					foregroundImage: AssetImage('assets/images/flutter_logo.png'),
				),
				onTap: () {
					Navigator.restorablePushNamed(
						context,
						MemberDetailsView.routeName,
						arguments: members[index],
					);
				}
			);
	}
}
