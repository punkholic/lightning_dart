/*
 * Copyright (c) 2015 Accorto, Inc. All Rights Reserved
 * License: GPLv3  http://www.gnu.org/licenses/gpl-3.0.txt
 * License options+support:  https://lightningdart.com
 */

part of lightning_dart;

/**
 * Color Editor
 * (Browser support:
 * - FF, Chrome
 * - NOT: IE, Safari
 * http://caniuse.com/#feat=input-color
 */
class LInputColor
    extends LInput {

  /// default editor as background color
  static bool defaultBackground = true;

  static const String WHITE = "#ffffff";
  static const String BLACK = "#000000";

  static final Logger _log = new Logger("LInputColor");

  /**
   * Color Editor
   */
  LInputColor (String name, {String idPrefix, bool inGrid:false})
      : super(name, EditorI.TYPE_COLOR, idPrefix:idPrefix, inGrid:inGrid) {
  }

  /**
   * Color Editor
   */
  LInputColor.from(DataColumn dataColumn, {String idPrefix, bool inGrid:false})
      : super.from(dataColumn, EditorI.TYPE_COLOR, idPrefix:idPrefix, inGrid:inGrid) {
  }

  /// init color
  void _initEditor(String type) {
    super._initEditor(type);
    //
    pattern = "#[a-f0-9]{6}";
    background = defaultBackground; // if empty shows black :-(
    // onClick (old value) - onInput - onChange
  } // initEditor

  /// set value
  void set value (String newValue) {
    if (newValue == null || newValue.isEmpty) {
      input.value = _background ? WHITE : BLACK;
    } else {
      input.value = newValue;
    }
    //_log.fine("${name} value=${input.value} (${newValue})");
  }

  /// Color is a background Color
  bool get background => _background;
  /// Color Background (default white) or not (default black)
  void set background (bool newValue) {
    _background = newValue;
    String vv = input.value; // default is black
    //_log.fine("${name} background=${_background} ${vv}");
    defaultValue = _background ? WHITE : BLACK;
    if (vv.isEmpty || vv == BLACK) {
      input.value = defaultValue;
    }
  }
  bool _background = true;

  /// render Element
  bool get isValueRenderElement => true;

  /// render the value
  Element getValueRenderElement(String theValue) {
    DivElement div = new DivElement()
      ..classes.add(LText.C_TRUNCATE);
    if (theValue != null && theValue.isNotEmpty) {
      div.style.backgroundColor = theValue;
      div.text = theValue;
    }
    return div;
  }

  /// set readOnly via disabled of color
  void set readOnly(bool newValue) {
    input.readOnly = newValue; // does not prevent click
    if (type == EditorI.TYPE_COLOR)
      input.disabled = newValue;
  }

  bool get disabled => _disabled;
  void set disabled(bool newValue) {
    _disabled = newValue;
    if (type == EditorI.TYPE_COLOR)
      input.disabled = _disabled || readOnly;
    else
      input.disabled = newValue;
  }
  bool _disabled = false;



} // LInputColor
