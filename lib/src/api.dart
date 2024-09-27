import 'dart:convert';
import 'package:http/http.dart';

const String backendUrl = '127.0.0.1:8000';

Future<dynamic> _getSomething(String something, {Map<String, String>? headers}) async {
	final Response response = await get(
		Uri.parse('$backendUrl/$something'),
		headers: headers
	);

	if (response.statusCode == 200) {
		return jsonDecode(response.body);
	} else {
		throw Exception('FALHOUUUU: ${response.statusCode}');
	}
}

Future<dynamic> _postSomething(
		String something, {
		Map<String, String>? headers,
		Object? body,
		Encoding? encoding,
	}) async {
	final Response response = await post(
		Uri.parse('$backendUrl/$something'),
		headers: headers,
		body: body,
		encoding: encoding,
	);

	if (response.statusCode == 200) {
		return jsonDecode(response.body);
	} else {
		throw Exception('FALHOUUUU: ${response.statusCode}');
	}
}

addEvent (String name, String description, String date, String time) async {
	return await _postSomething('/CreateEvent', body: {
		'name': name,
		'description': description,
		'date': date,
		'time': time
	});
}

createUser(String nickname, String email, String password) async {
	return await _postSomething('/CreateUser', body: {
		'nickname': nickname,
		'email': email,
		'password': password
	});
}

login(String email, String password) async {
	return await _postSomething('/Login', body: {
		'email': email,
		'password': password
	});
}