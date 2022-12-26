import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rsi/blocs/cubit/notification/notification_cubit.dart';
import 'package:rsi/foundation/constants.dart';
import 'package:rsi/ui/_common/loading/circular_loading.dart';
import 'package:rsi/ui/_common/loading/shimmer_loading.dart';
import 'package:rsi/ui/_common/pull_refresh.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  void initState() {
    context.read<NotificationCubit>().fetchNotifications(false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleTextStyle:
            TextStyle(fontSize: kFontSize, fontWeight: FontWeight.bold),
        title: Text("Thông báo"),
        centerTitle: true,
        actions: [
          BlocBuilder<NotificationCubit, NotificationState>(
            builder: (context, state) {
              return TextButton(
                onPressed: () =>
                    context.read<NotificationCubit>().fetchNotifications(true),
                child: Text(
                  "Đánh dấu đã đọc (${state.newNotification})",
                  style: TextStyle(
                      fontSize: kFontSize - 2, color: kLightTextColor),
                ),
              );
            },
          )
        ],
      ),
      body: PullRefresh(
        action: () =>
            context.read<NotificationCubit>().fetchNotifications(false),
        child: BlocBuilder<NotificationCubit, NotificationState>(
          builder: (context, state) {
            switch (state.status) {
              case NotificationStatus.loading:
                return CircularLoading();
              case NotificationStatus.success:
                if (state.notifications!.length > 0) {
                  return renderSuccess(context, state);
                } else {
                  return renderEmpty();
                }
              case NotificationStatus.failure:
                return Container();
              default:
                return Container();
            }
          },
        ),
      ),
    );
  }

  Widget renderSuccess(BuildContext context, NotificationState state) {
    final notifications = state.notifications!;
    return ListView.separated(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final notification = notifications[index];
        return Container(
          child: ListTile(
            dense: true,
            leading: Builder(
              builder: (context) {
                if (notification.image == null) {
                  return Image.asset(
                    "assets/images/logo.png",
                    width: 50,
                    height: 50,
                  );
                } else {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(kBorder),
                    child: Image.network(
                      notification.image.toString(),
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return ShimmerWidget.rectangular(
                          width: 50,
                          height: 50,
                          hasMargin: false,
                        );
                      },
                      errorBuilder: (BuildContext context, Object exception,
                              StackTrace? stackTrace) =>
                          Image.asset(
                        "assets/images/logo.png",
                        width: 50,
                        height: 50,
                      ),
                    ),
                  );
                }
              },
            ),
            minVerticalPadding: 10,
            title: Text(
              notification.title.toString(),
              style: TextStyle(fontSize: kFontSize - 3),
            ),
            subtitle: Container(
              margin: EdgeInsets.only(top: 5),
              child: Text(
                notification.createDate.toString(),
                style: TextStyle(fontSize: kFontSize - 4),
              ),
            ),
            trailing: Builder(
              builder: (context) {
                if (notification.seen == false)
                  return Icon(
                    Icons.circle,
                    color: kPrimaryColor,
                    size: 5,
                  );
                else {
                  return SizedBox();
                }
              },
            ),
          ),
        );
      },
      separatorBuilder: (context, index) => Divider(
        height: 10,
      ),
      itemCount: notifications.length,
    );
  }

  Widget renderEmpty() => Container();
}
