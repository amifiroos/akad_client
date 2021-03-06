import 'package:akad/constant.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:akad/core_utilitas/layout.dart';
import 'package:akad/core_widget/navigation/appbar_widget.dart';
import 'package:akad/view_model/vm_template.dart';
import 'package:akad/core_widget/navigation/navigation_widget.dart';

class TemplateWidget extends StatelessWidget {
  final Widget? child;

  TemplateWidget({this.child});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final isDesktop = isDisplayDesktop(context);

    return ViewModelBuilder<TemplateVM>.reactive(
      viewModelBuilder: () => TemplateVM(),
      builder: (context, model, _) {
        if (isDesktop) {
          return Scaffold(
            body: Row(
              children: [
                SidebarWidget(model: model),
                Expanded(
                  child: NestedScrollView(
                    headerSliverBuilder:
                        (BuildContext context, bool innerBoxIsScrolled) {
                      return <Widget>[sliverAppBarW()];
                    },
                    body: child ?? Container(
                      padding: EdgeInsets.all(defaultPadding),
                      decoration: BoxDecoration(
                        color: secondaryColor,
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          );
        } else {
          return Scaffold(
            appBar: appBarW(),
            body: SingleChildScrollView(child: child),
            drawer: SidebarWidget(model: model),
          );
        }
      },
    );
  }
}

class TemplateWidgetLogin extends StatelessWidget {
  final Widget? child;

  TemplateWidgetLogin({this.child});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final isDesktop = isDisplayDesktop(context);

    return ViewModelBuilder<TemplateVM>.reactive(
      viewModelBuilder: () => TemplateVM(),
      builder: (context, model, _) {
        if (isDesktop) {
          return Scaffold(
            body: Row(
              children: [
                SidebarWidget(model: model),
                Expanded(
                  child: NestedScrollView(
                    headerSliverBuilder:
                        (BuildContext context, bool innerBoxIsScrolled) {
                      return <Widget>[//sliverAppBarW()
                      ];
                    },
                    body: child ?? Container(),
                  ),
                ),
              ],
            ),
          );
        } else {
          return Scaffold(
            //appBar: appBarW(),
            body: SingleChildScrollView(child: child),
            //drawer: SidebarWidget(model: model),
          );
        }
      },
    );
  }
}


