import 'package:fasta_moni_test/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLayout extends StatelessWidget {
  const AppLayout({
    Key? key,
    required this.child,
    required this.title,
    this.centerTitle = false,
    this.showHeader = true,
    this.showBackBtn = true,
    this.onBackClick,
    this.padding = 0,
    this.statusBgColor = Colors.transparent,
    this.darkStatusText = true,
    this.bottomNavigationBar,
    this.skaffoldKey,
    this.drawer,
    this.actions,
  }) : super(key: key);

  final String title;
  final Widget child;
  final bool centerTitle;
  final bool showHeader;
  final bool showBackBtn;
  final Function()? onBackClick;
  final double padding;
  final Color statusBgColor;
  final bool darkStatusText;
  final Widget? bottomNavigationBar;
  final GlobalKey<ScaffoldState>? skaffoldKey;
  final Widget? drawer;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: skaffoldKey,
      drawer: drawer,
      appBar: AppBar(
        leading: showBackBtn
            ? InkWell(
                onTap: () => onBackClick != null ? onBackClick!() : Navigator.of(context).pop(),
                highlightColor: KColors.TEXT_VERY_LIGHT.withOpacity(.3),
                borderRadius: const BorderRadius.all(Radius.circular(50)),
                child: const Icon(
                  Icons.keyboard_backspace,
                  size: 32,
                ),
              )
            : null,
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
        centerTitle: centerTitle,
        elevation: 0,
        toolbarHeight: showHeader ? null : 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          // Status bar color
          statusBarColor: statusBgColor,
          // Status bar brightness (optional)
          statusBarIconBrightness: darkStatusText
              ? Brightness.dark // For Android (dark icons)
              : Brightness.light,
          statusBarBrightness: darkStatusText
              ? Brightness.light // For iOS (dark icons)
              : Brightness.dark,
        ),
        backgroundColor: statusBgColor,
        actions: actions,
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(padding),
        decoration: BoxDecoration(
          border: showHeader
              ? Border(
                  top: BorderSide(color: Colors.grey.withOpacity(.3)),
                )
              : null,
        ),
        child: child,
      ),
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
