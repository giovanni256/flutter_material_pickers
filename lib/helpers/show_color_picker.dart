// Copyright (c) 2018, codegrue. All rights reserved. Use of this source code
// is governed by the MIT license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

const double _kPickerHeaderPortraitHeight = 60.0;

void showMaterialColorPicker({
  BuildContext context,
  String title = "Pick a color",
  Color selectedColor,
  ValueChanged<Color> onChanged,
}) {
  showDialog<Color>(
    context: context,
    builder: (BuildContext context) {
      return OrientationBuilder(builder: (context, orientation) {
        return AlertDialog(
          title: Container(
            color: Theme.of(context).primaryColor,
            height: _kPickerHeaderPortraitHeight,
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 20.0,
                  color: const Color(0xffffffff),
                ),
              ),
            ),
            padding: EdgeInsets.all(20.0),
          ),
          titlePadding: const EdgeInsets.all(0.0),
          contentPadding: const EdgeInsets.all(0.0),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: selectedColor,
              onColorChanged: (color) => selectedColor = color,
              colorPickerWidth: 1000.0,
              pickerAreaHeightPercent: 0.3,
              enableAlpha: true,
              displayThumbColor: true,
              enableLabel: true,
              paletteType: PaletteType.hsv,
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('CANCEL'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            FlatButton(
              child: Text('OK'),
              onPressed: () => Navigator.of(context).pop<Color>(selectedColor),
            ),
          ],
        );
      });
    },
  ).then((selection) {
    if (onChanged != null && selection != null) onChanged(selection);
  });
}
