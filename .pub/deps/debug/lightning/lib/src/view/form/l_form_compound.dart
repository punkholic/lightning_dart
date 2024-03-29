/*
 * Copyright (c) 2015 Accorto, Inc. All Rights Reserved
 * License: GPLv3   http://www.gnu.org/licenses/gpl-3.0.txt
 * License options+support:  https://www.lightningdart.com
 */

part of lightning_dart;

/**
 * Compound Form
 *
 *    fieldset      .form--compound
 *      legend      .form-element__label
 *      div         .form-element__group
 *        div       .form-element__row
 *          label   .form-element__control  size-1-of-..
 *            span  .form-element__helper
 *            input .input
 *          label   .form-element__control  size-1-of-..
 *
 */
class LFormCompound extends LComponent {

  static const String C_FORM__COMPOUND = "slds-form--compound";

  static const String C_FORM_ELEMENT__LABEL = "slds-form-element__label";
  static const String C_FORM_ELEMENT__GROUP = "form-element__group";
  static const String C_FORM_ELEMENT__ROW = "slds-form-element__row";

  /// Compound Form
  final Element element;

  /// Field Sets
  final List<LFormCompoundFieldSet> fieldSets = new List<LFormCompoundFieldSet>();

  /// Compound Form
  LFormCompound(Element this.element) {
  }

  /// Compound Form
  LFormCompound.form() : this(new FormElement());

  /// add field set
  void addFieldSet(LFormCompoundFieldSet fieldSet) {
    add(fieldSet);
    fieldSets.add(fieldSet);
  }

} // LFormCompound


/**
 * Field Set
 */
class LFormCompoundFieldSet extends LComponent {

  /// FieldSet Element
  final FieldSetElement element = new FieldSetElement()
    ..classes.add(LFormCompound.C_FORM__COMPOUND);

  /// Fieldset Label
  final LegendElement legend = new LegendElement()
    ..classes.add(LFormCompound.C_FORM_ELEMENT__LABEL);

  /// List of Editors
  final List<LEditor> editors = new List<LEditor>();

  /// Field Set
  LFormCompoundFieldSet(String label) {
    element.append(legend);
    if (label != null) {
      legend.text = label;
    }

  }

  /**
   * div    .group
   * - div  .row
   * -- label
   * --- span
   * --- input
   */
  void addRow(List<LEditor> editors) {
    editors.addAll(editors);
    //
    DivElement group = new DivElement()
      ..classes.add(LFormCompound.C_FORM_ELEMENT__GROUP);
    element.append(group);
    /*
    DivElement row = new DivElement()
      ..classes.add(LFormCompound.C_FORM_ELEMENT__ROW);
    String size = LSizing.size1OfY{editors.length);
    for (LEditor editor in editors) {
      LabelElement label = new LabelElement()
        ..classes.add(LForm.C_FORM_ELEMENT__CONTROL)
        ..classes.add(size);
      row.append(label);
      // TODO label.append(editor.labelSmall); slds-form-element__helper
      // TODO label.append(editor.input);
    } */
  } // addRow

} // LFormCompoundFieldSet
