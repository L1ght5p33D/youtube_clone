import 'package:flutter/material.dart';
import 'package:yt_clone_webplayer/state/yt_globals.dart';
import 'package:yt_clone_webplayer/vid_screen/video_details_page.dart';
import 'package:yt_clone_webplayer/state/vid_data.dart';
import 'package:yt_clone_webplayer/state/yt_state.dart';
import 'package:yt_clone_webplayer/state/AppStateModel.dart';

class VideoCard extends StatefulWidget {
  VideoCard({Key? key, required this.video}) : super(key: key);

  final Video video;
  @override
  _VideoCardState createState() => _VideoCardState();
}

class _VideoCardState extends State<VideoCard> {


  AppStateContainerState? scont;
  AppState? astate;

  @override
  Widget build(BuildContext context) {
    scont = AppStateContainer.of(context);
    astate = scont!.state!;

    return Column(
      children: [
        Stack(
          children: [
            GestureDetector(
              onTap: () {
                  astate!.cVideo = widget.video;
                  astate!.mp_expanded = false;
                  astate!.mp_drag_dist = 0.0;

                scont!.updateState();
                Future.delayed(Duration(milliseconds: 100),() {
                  setState(() {
                    astate!.mp_expanded = true;
                  });
                  scont!.updateState();
                });

              },
              child: Image.network(
                widget.video.miniatureImagePath,
                height: 220.0,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 8.0,
              right: 8.0,
              child: Container(
                padding: const EdgeInsets.all(4.0),
                color: Colors.black,
                child: Text(
                  widget.video.duration,
                  style: Theme.of(context)
                      .textTheme
                      .caption!
                      .copyWith(color: Colors.white),
                ),
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () => print('Navigate to profile'),
                child: CircleAvatar(
                  foregroundImage: NetworkImage(widget.video.channel.imageUrl),
                ),
              ),
              const SizedBox(width: 8.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: Text(
                        widget.video.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(fontSize: 15.0),
                      ),
                    ),
                    Flexible(
                      child: Text(
                        '${widget.video.channel.name}',
                            // '${formatNumber(video.viewsCounter)} • '
                            // '${timeago.format(video.timestamp)}',
                        // maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .textTheme
                            .caption!
                            .copyWith(fontSize: 14.0),
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Icon(Icons.more_vert, size: 20.0),
              ),
            ],
          ),
        )
      ],
    );
  }
}