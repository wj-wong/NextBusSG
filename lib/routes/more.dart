import 'package:flutter/material.dart';
import 'package:nextbussg/components/more/more_buttons_list.dart';
import 'package:nextbussg/styles/values.dart';
import 'package:nextbussg/utils/extensions.dart';
import 'package:nextbussg/components/more/settings/settings_list.dart';
import 'package:nextbussg/components/core/title_text.dart';
import 'package:nextbussg/components/core/line.dart';
import 'package:nextbussg/components/core/page_template.dart';
import 'package:nextbussg/components/core/space.dart';
import 'package:nextbussg/utils/strings.dart';

class MorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageTemplate(children: [
      TitleText(title: Strings.moreTitle.toUpperCase()).sliverToBoxAdapter(),
      // Spacing(height: Values.marginBelowTitle).sliver(),
      SettingsList(),

      // Spacing(height: Values.marginBelowTitle).sliver(),
      Line().sliverToBoxAdapter(),
      // Spacing(height: Values.marginBelowTitle).sliver(),
      
      MoreButtonsList(),
    ]);
  }
}
