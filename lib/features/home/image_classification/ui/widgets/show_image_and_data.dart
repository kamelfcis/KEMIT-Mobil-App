/*import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:morshd/features/home/image_classification/controller/image_classifier.dart';

class ShowImageAndData extends ConsumerStatefulWidget {
  const ShowImageAndData({super.key});

  @override
  ConsumerState<ShowImageAndData> createState() => _ShowImageAndDataState();
}

class _ShowImageAndDataState extends ConsumerState<ShowImageAndData> {
  @override
  Widget build(BuildContext context) {
    final data = ref.watch(chatBotControllerProvider);
    final dataAndImage =
        ref.read(chatBotControllerProvider.notifier).dataAndImage;

    return data.when(
      data: (data) {
        return ListView.builder(
          shrinkWrap: true,
          itemCount: dataAndImage.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: 370,
                      height: 370,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border:
                            Border.all(color: Color(0xff464A7A), width: 1.5),
                        image: DecorationImage(
                          image: FileImage(dataAndImage[index].image,),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const Gap(20),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      // color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        _defaultText(
                            title: 'Name of statue', subTitle: dataAndImage[index].name),
                      ],
                    ),
                  ),
                  const Gap(10),
                ],
              ),
            );
          },
        );
      },
      error: (error, stackTrace) {
        return Center(child: Text(error.toString()));
      },
      loading: () {
        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget _defaultText({
    required String title,
    required String subTitle,
  }) {
    return Text(
      textAlign: TextAlign.center,
      '$title\n$subTitle',
      style: const TextStyle(fontSize: 45, fontWeight: FontWeight.w800),
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
    );
  }


}
*/

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:morshd/features/home/image_classification/controller/image_classifier.dart';
import 'package:morshd/features/home/video_page.dart';

class ShowImageAndData extends ConsumerStatefulWidget {
  const ShowImageAndData({super.key});

  @override
  ConsumerState<ShowImageAndData> createState() => _ShowImageAndDataState();
}

class _ShowImageAndDataState extends ConsumerState<ShowImageAndData> {
  @override
  Widget build(BuildContext context) {
    final data = ref.watch(chatBotControllerProvider);
    final dataAndImage =
        ref.read(chatBotControllerProvider.notifier).dataAndImage;

    return data.when(
      data: (data) {
        return ListView.builder(
          shrinkWrap: true,
          itemCount: dataAndImage.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Column(
                children: [
                  // Image Display
                  Container(
                    width: 370,
                    height: 370,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Color(0xff464A7A), width: 1.5),
                      image: DecorationImage(
                        image: FileImage(dataAndImage[index].image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const Gap(20),

                  // Prediction & Description Display
                  Container(
                    padding: const EdgeInsets.all(16),
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 8,
                          spreadRadius: 2,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                   child: Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Align(
      alignment: Alignment.topRight,
      child: ElevatedButton.icon(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => VideoPage(
                token: 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJHcm91cE5hbWUiOiJHb2FsIEh1cCIsIlVzZXJOYW1lIjoiR29hbCBIdXAiLCJBY2NvdW50IjoiIiwiU3ViamVjdElEIjoiMTkwOTk3MTU5NjA2NDMzMDA2MCIsIlBob25lIjoiIiwiR3JvdXBJRCI6IjE5MDk5NzE1OTYwNjAxMzU3NTYiLCJQYWdlTmFtZSI6IiIsIk1haWwiOiJnb2FsaHVwN0BnbWFpbC5jb20iLCJDcmVhdGVUaW1lIjoiMjAyNS0wNC0xMCAwMDoyMDowNSIsIlRva2VuVHlwZSI6MSwiaXNzIjoibWluaW1heCJ9.l0IOUA-JGcZrB5LKd6kOwV5gIeuHdkRf75ZBhsRzLShX8Iujegj6T7QDkB5OGJDUqf8rN8zF1gLAFqvZngI-qNxqK87HbKOXhhtYEhYjK8QQvBTow_Qo_Id9QPPld_tuRW7Lewd1zsfBXZH4I9eyheN9WcuZ_vBq7epY6Tkk3V_82JbSe2M_6G1NRFWYXzyGTENuJtQhsWGvEdmxcCW8BKJa8Nvf9uLL4aK55BH3b8vA8oVPDZCiaUkheauF1CcebKx3cgDuzBghkm9dUxGg1RecasRDPPJuElbYZXr1bsIfwJjxpn4OqIVtvOqxA14l3KUJQ90EdXDU0-rFAi8t7w',
                groupId: '1909971596060135756',
                videoUrl: "https://public-cdn-video-data-algeng.oss-cn-wulanchabu.aliyuncs.com/inference_output%2Fvideo%2F2025-04-10%2F841e1338-2703-4886-96df-e555d4a96060%2Foutput.mp4?Expires=1744248132&OSSAccessKeyId=LTAI5tAmwsjSaaZVA6cEFAUu&Signature=AkT3qZjnZEND7%2FOgJhoRS%2B%2BwTHM%3D",
                imageUrl: 'http://foshetk.somee.com/${dataAndImage[index].resultimage}',
              ),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xff464A7A),
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        icon: Icon(Icons.play_circle_fill, color: Colors.white),
        label: Text(
          "Generate Video",
          style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ),
    ),
    const SizedBox(height: 16),
    _sectionTitle("Recognized King"),
    _styledText(
      dataAndImage[index].name,
      fontSize: 28,
      fontWeight: FontWeight.w900,
      color: Color(0xff464A7A),
    ),
    const SizedBox(height: 16),
    _sectionTitle("Description"),
    _styledText(
      dataAndImage[index].description,
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: Colors.black87,
      height: 1.5,
    ),
  ],
),

                  ),
                  const Gap(10),
                ],
              ),
            );
          },
        );
      },
      error: (error, stackTrace) {
        return Center(child: Text(error.toString()));
      },
      loading: () {
        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  // Styled section title
  Widget _sectionTitle(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
    );
  }

  // Styled text with customization
  Widget _styledText(
      String text, {
        required double fontSize,
        required FontWeight fontWeight,
        required Color color,
        double height = 1.2,
      }) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        height: height,
      ),
    );
  }
}
