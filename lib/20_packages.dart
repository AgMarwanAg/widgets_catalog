import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import 'shared/app_scaffold.dart';

class Packages extends StatefulWidget {
  const Packages({super.key});

  @override
  State<Packages> createState() => _PackagesState();
}

class _PackagesState extends State<Packages> {
  XFile? pickedImage;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      filePath: 'lib/20_packages.dart',
      title: 'Packages',
      body: Column(
        children: [
          const Text(
            'السلام عليكم',
            style: TextStyle(fontFamily: 'cairo', fontWeight: FontWeight.w700),
          ),
          Text(
            'Goolge Fonts',
            style: GoogleFonts.lobster(),
          ),
          ElevatedButton(
              onPressed: () async {
                final Uri url = Uri.parse('https://flutter.dev');
                if (!await launchUrl(url)) {
                  print('Could not launch $url');
                }
              },
              child: const Text('URL luncher')),
          ElevatedButton(
              onPressed: () async {
                //open dial number
                final Uri url = Uri(scheme: 'tel', path: '1234567890');
                !await launchUrl(url);
              },
              child: const Text('call')),
          ElevatedButton(
              onPressed: () async {
                //open dial number
                final Uri url = Uri(
                  scheme: 'sms',
                  path: '1234567890',
                  queryParameters: {'body': 'Hello World'},
                );
                !await launchUrl(url);
              },
              child: const Text('sms')),
          ElevatedButton(
              onPressed: () async {
                Share.share('text');
              },
              child: const Text('Share')),
          SizedBox(
            height: 200,
            width: 200,
            child: SvgPicture.asset(
              'assets/svg.svg',
            ),
          ),
          SizedBox(
            height: 100,
            width: 100,
            child: Lottie.asset('assets/lottie.json'),
          ),
          ElevatedButton(
            onPressed: () async {
              final XFile? image = await ImagePicker().
              pickImage(source: ImageSource.gallery);
              pickedImage = image;
              setState(() {}); 
            },
            child: const Text('Gallery'),
          ),
          SizedBox(
            width: double.infinity,
            height: 300,
            child: pickedImage == null ? const Text('No image') : 
            Image.file(File(pickedImage!.path)),
          )
        ],
      ),
    );
  }
}
