/*
 * Copyright (c) 2015 Accorto, Inc. All Rights Reserved
 * License: GPLv3  http://www.gnu.org/licenses/gpl-3.0.txt
 * License options+support:  https://lightningdart.com
 */

import 'dart:html';
import 'package:lightning/lightning.dart';
/**
 * Index (Main Page)
 */
main() async {

LForm form = new LForm.stacked("mc-embedded-subscribe-form")
  ..addEditor(new LInput("FNAME", EditorI.TYPE_TEXT)
    ..label = "First Name"
    ..placeholder = "Your First Name")
  ..addEditor(new LInput("LNAME", EditorI.TYPE_TEXT)
    ..label = "Last Name"
    ..placeholder = "Your Last Name")
  ..addEditor(new LInput("EMAIL", EditorI.TYPE_EMAIL)
    ..label = "Email"
    ..placeholder = "Your Email"
    ..required = true)
  ..addEditor(new LCheckbox("cool")
    ..label = "Lightning Dart is Cool!")
  ..addEditor(new LSelect("interest")
    ..label = "Interest Area"
    ..listText = ["Lightning Dart", "Accorto", "Time+Expense", "Gantt"])
  ..addEditor(new LTextArea("comments")
    ..label = "Comments")
    ..addResetButton()
 ;





      Element loadDiv = document.body;
      loadDiv.children.clear();
      loadDiv.children.add(
        // new Element.p()..text = "test"
        form.element

      );
}
