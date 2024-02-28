import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widgets_catalog/shared/app_scaffold.dart';

class Apis extends StatelessWidget {
  const Apis({super.key});

  @override
  Widget build(BuildContext context) {
    final ctr = Get.put(ApiScreenCTR());
    return AppScaffold(
      title: 'Apis',
      filePath: 'lib/17apis.dart',
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () async {
                dynamic data = await ctr.sendData({
                  'title': 'Test Post Title',
                  'body': 'This is a test post body. It has some content.',
                  'userId': 1,
                });
                if (data is Map) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('success: ${data['title']}'),
                  ));
                }
              },
              child: const Text('send data')),
          GetBuilder<ApiScreenCTR>(builder: (context) {
            if (ctr.loading == true) {
              return const Center(child: CircularProgressIndicator());
            } else if (ctr.data.isEmpty) {
              return const Center(child: Text('No Data'));
            } else {
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: ctr.data.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(ctr.data[index]['title']),
                      subtitle: Text(ctr.data[index]['title']),
                      leading: Text(ctr.data[index]['id'].toString()),
                    );
                  });
            }
          })
        ],
      ),
    );
  }
}

class ApiScreenCTR extends GetxController {
  @override
  void onInit() {
    getData();
    super.onInit();
  }

  bool loading = false;
  List data = [];
  final ApiService _apiService = ApiService();

  getData() async {
    loading = true;
    update();
    final response = await _apiService.get('https://jsonplaceholder.typicode.com/todos/');
    data = response;

    loading = false;
    update();
  }

  sendData(Map data) async {
    final response = await _apiService.post('https://jsonplaceholder.typicode.com/posts', data);
    return response;
  }
}

class ApiService {
  final Dio _dio = Dio();

  Future<dynamic> get(String url) async {
    try {
      final response = await _dio.get(url);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  Future<dynamic> post(String url, Map body) async {
    try {
      final response = await _dio.post(
        url,
        data: body,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      } else {
        throw Exception('Failed to post data');
      }
    } catch (e) {
      throw Exception('Failed to connect to the server');
    }
  }
}
