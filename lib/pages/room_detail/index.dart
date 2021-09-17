import 'package:flutter/material.dart';
import 'package:hook_up_rent/pages/home/info/index.dart';
import 'package:hook_up_rent/pages/room_detail/data.dart';
import 'package:hook_up_rent/widgets/common_swipper.dart';
import 'package:hook_up_rent/widgets/common_tags.dart';
import 'package:hook_up_rent/widgets/common_title.dart';
import 'package:hook_up_rent/widgets/room_appliance.dart';
import 'package:share/share.dart';

class RoomDetailPage extends StatefulWidget {
  final String roomId;

  const RoomDetailPage({Key? key, required this.roomId}) : super(key: key);

  @override
  _RoomDetailPageState createState() => _RoomDetailPageState();
}

class _RoomDetailPageState extends State<RoomDetailPage> {
  late RoomDetailData _data;
  bool _isLike = false;
  bool _showAllText = false;

  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      _data = defaultData;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_data == null) {
      return Container();
    }
    bool showTextTool = (_data.subTitle ?? '').length > 100;
    return Scaffold(
      appBar: AppBar(
        title: Text(_data.title ?? "房屋详情"),
        actions: [
          IconButton(
              onPressed: () {
                Share.share('www.baidu.com');
              },
              icon: Icon(Icons.share))
        ],
      ),
      body: Stack(
        children: [
          ListView(
            children: [
              CommonSwipper(
                images: _data.houseImgs ?? [],
              ),
              CommonTitle(_data.title ?? '房屋信息'),
              Container(
                padding: EdgeInsets.only(left: 10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      _data.price.toString(),
                      style: TextStyle(fontSize: 20.0, color: Colors.pink),
                    ),
                    Text('元/月(押一付三)',
                        style: TextStyle(fontSize: 14.0, color: Colors.pink)),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 10.0, top: 6.0, bottom: 6.0),
                child: Wrap(
                  spacing: 4.0,
                  children:
                      (_data.tags ?? []).map((e) => CommonTag(e)).toList(),
                ),
              ),
              Divider(
                color: Colors.grey,
                indent: 10.0,
                endIndent: 10.0,
              ),
              Container(
                padding: EdgeInsets.only(left: 10.0, top: 6.0, bottom: 6.0),
                child: Wrap(
                  runSpacing: 10.0,
                  children: [
                    Container(
                      child: Text('面积：${_data.size}平米'),
                      width: (MediaQuery.of(context).size.width - 3 * 10) / 2,
                    ),
                    Container(
                      child: Text('楼层：${_data.floor}'),
                      width: (MediaQuery.of(context).size.width - 3 * 10) / 2,
                    ),
                    Container(
                      child: Text('房型：${_data.roomType}'),
                      width: (MediaQuery.of(context).size.width - 3 * 10) / 2,
                    ),
                    Container(
                      child: Text('装修：精装'),
                      width: (MediaQuery.of(context).size.width - 3 * 10) / 2,
                    ),
                  ],
                ),
              ),
              CommonTitle('房屋配置'),
              RoomApplicanceList(list: _data.applicances),
              CommonTitle('房屋概况'),
              Container(
                padding: EdgeInsets.only(left: 10.0, right: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _data.subTitle ?? "暂无房屋信息",
                      maxLines: _showAllText ? null : 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        showTextTool
                            ? GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _showAllText = !_showAllText;
                                  });
                                },
                                child: Row(
                                  children: [
                                    Text(_showAllText ? '收起' : '展开'),
                                    Icon(_showAllText
                                        ? Icons.keyboard_arrow_up
                                        : Icons.keyboard_arrow_down)
                                  ],
                                ),
                              )
                            : Container(),
                        Text('举报')
                      ],
                    ),
                  ],
                ),
              ),
              CommonTitle('猜你喜欢'),
              InfoList(),
              SizedBox(
                height: 100,
              ),
            ],
          ),
          Positioned(
              width: MediaQuery.of(context).size.width,
              height: 100.0,
              bottom: 0,
              child: Container(
                padding: EdgeInsets.only(
                    top: 10.0, left: 20.0, right: 20.0, bottom: 20.0),
                color: Colors.grey[200],
                child: Row(
                  children: [
                    GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        setState(() {
                          _isLike = !_isLike;
                        });
                      },
                      child: Container(
                        height: 50.0,
                        width: 40.0,
                        margin: EdgeInsets.only(right: 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              _isLike ? Icons.star : Icons.star_border,
                              size: 24,
                              color: _isLike ? Colors.green : Colors.black,
                            ),
                            Text(
                              _isLike ? '已收藏' : '收藏',
                              style: TextStyle(fontSize: 12.0),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.cyan,
                              borderRadius: BorderRadius.circular(6.0)),
                          height: 50.0,
                          child: Center(
                            child: Text(
                              '联系房东',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 5.0),
                    Expanded(
                      child: GestureDetector(
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(6.0)),
                          height: 50.0,
                          child: Center(
                            child: Text(
                              '预约看房',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
