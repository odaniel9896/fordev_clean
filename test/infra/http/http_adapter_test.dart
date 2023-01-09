import 'dart:convert';

import 'package:faker/faker.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class HttpAdapter {
  final Client client;
  HttpAdapter(this.client);

  Future<Response>? request(
      {required String url, required String method, Map? body}) async {
    final headers = {
      'content-type': 'application/json',
      'accept': "application/json"
    };
    final jsonBody = body != null ? jsonEncode(body) : null;
    return await client.post(Uri.parse(url), headers: headers, body: jsonBody);
  }
}

class ClientSpy extends MockClient implements Client {
  ClientSpy(super.fn);
}

void main() {
  late HttpAdapter sut;
  late ClientSpy client;
  late String url;

  setUp(() async {
    url = faker.internet.httpUrl();
    client = ClientSpy((Request request) async {
      final mapJson = {'id': 123};
      return Response(json.encode(mapJson), 200);
    });
    sut = HttpAdapter(client);
  });
  group('post', () {
    test('Should call post with correct values', () async {
      final response = await sut
          .request(url: url, method: "post", body: {'any_key': 'any_value'});

      expect(response!.body, '{"id":123}');
    });

    // test('Should call post without body', () async {
    //   await sut.request(url: url, method: "post");

    //   verify(client.post(Uri.parse(""), headers: anyNamed('headers')));
    // });
  });
}
