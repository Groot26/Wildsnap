import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wildsnap/app/theme/app_colors.dart';
import '../../app/data/values/images.dart';
import '../../app/modules/comments/views/comments_view.dart';

_launchMap(String lat, String lng) async {
  var url =
      Uri.parse("https://www.google.com/maps/search/?api=1&query=$lat,$lng");
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    await launchUrl(url);
    //throw 'Could not launch $url';
  }
}

class CustomPost extends StatelessWidget {
  final String userName;
  final String description;
  final String lat;
  final String lng;
   final bool isLiked ;
   final VoidCallback onLikeTap;
  final String imageUrl;
  final String profilePic;

  //todo: final AssetImage profileImg;

  CustomPost({
    required this.userName,
    required this.description,
    required this.lat,
    required this.lng,
     required this.isLiked,
     required this.onLikeTap,
    required this.imageUrl,
    required this.profilePic,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Container(
        //height: 400,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
                width: double.infinity,

                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: AppColors.black),
                ),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.contain,
                )
            ),
            Container(
              height: 90,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.greyDark,
                border: Border.all(
                  width: 1,
                  color: AppColors.primaryColor,
                ),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(12),
                ),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: CircleAvatar(
                        backgroundImage: NetworkImage(profilePic), radius: 24),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          userName,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          description,
                          style: TextStyle(fontSize: 12),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  CustomIcon(
                      icon: Images.icLocation,
                      onTap: () => _launchMap(lat, lng)),
                  //SizedBox(width: 20,),
                  CustomIcon(
                      //icon: Images.icDislike, onTap: () {}
                       icon: isLiked ? Images.icLike : Images.icDislike,
                       onTap: onLikeTap
                      ),
                  CustomIcon(
                      icon: Images.icComment, onTap: CommentsView.launch),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomIcon extends StatelessWidget {
  final String icon;
  final VoidCallback onTap;

  const CustomIcon({Key? key, required this.icon, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: SvgPicture.asset(
          icon,
          height: 25,
          width: 25,
        ),
      ),
    );
  }
}
