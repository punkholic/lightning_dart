import "package:lightning/lightning.dart";

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
  ..addSaveButton(label: "Subscribe", icon: new LIconUtility(LIconUtility.EMAIL));
form.showTrace(); // adds+shows detail debug info
  await LightningDart.init(); // client env
  // example: http://lightningdart.com/exampleForm.html
  LightningDart.createPageSimple()
    ..add(form);
}