object cxtsFetusGeneral1: TcxTabSheet
  Caption = 'General'
  ImageIndex = 0
  ExplicitTop = 0
  ExplicitWidth = 0
  ExplicitHeight = 0
  object gbLeftRight1: TcxGroupBox
    Tag = 2
    Left = 0
    Top = 0
    Align = alTop
    PanelStyle.Active = True
    Style.BorderStyle = ebsNone
    Style.Edges = []
    Style.LookAndFeel.NativeStyle = True
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.NativeStyle = True
    TabOrder = 0
    Transparent = True
    Height = 1
    Width = 1173
  end
  object cxGroupBox39: TcxGroupBox
    Left = 0
    Top = 1
    Align = alClient
    PanelStyle.Active = True
    Style.BorderStyle = ebsNone
    Style.Edges = []
    TabOrder = 1
    Transparent = True
    Height = 536
    Width = 1173
    object Bevel29: TBevel
      Left = 6
      Top = 33
      Width = 450
      Height = 2
    end
    object Bevel57: TBevel
      Left = 3
      Top = 244
      Width = 450
      Height = 3
      Style = bsRaised
    end
    object gbGender1: TcxGroupBox
      Left = 8
      Top = 260
      Caption = 'Gender'
      Style.BorderStyle = ebsNone
      Style.Edges = []
      Style.LookAndFeel.NativeStyle = True
      Style.TextStyle = [fsBold]
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 7
      Transparent = True
      Height = 34
      Width = 109
      object cbGendermale1: TcxCheckBox
        Left = 1
        Top = 16
        Caption = 'Male'
        Style.LookAndFeel.NativeStyle = True
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 0
        Transparent = True
        Width = 47
      end
      object cbGenderFemale1: TcxCheckBox
        Left = 49
        Top = 16
        Caption = 'Female'
        Style.LookAndFeel.NativeStyle = True
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 1
        Transparent = True
        Width = 61
      end
    end
    object cxGroupBox22: TcxGroupBox
      Left = 266
      Top = 261
      Caption = 'Consistent with NIPT'
      Style.BorderStyle = ebsNone
      Style.Edges = []
      Style.LookAndFeel.NativeStyle = True
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 8
      Transparent = True
      Height = 36
      Width = 207
      object cbConsistentNIPTYes1: TcxCheckBox
        Left = 3
        Top = 14
        Caption = 'Yes'
        Style.LookAndFeel.NativeStyle = True
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 0
        Transparent = True
        Width = 49
      end
      object cbConsistentNIPTNo1: TcxCheckBox
        Left = 54
        Top = 14
        Caption = 'No'
        Style.LookAndFeel.NativeStyle = True
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 1
        Transparent = True
        Width = 44
      end
      object cbConsistentNIPTUnknown1: TcxCheckBox
        Left = 104
        Top = 14
        Caption = 'Unknown'
        Style.LookAndFeel.NativeStyle = True
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 2
        Transparent = True
        Width = 71
      end
    end
    object cxLabel258: TcxLabel
      Left = 8
      Top = 8
      Caption = 'USS EDD'
      Transparent = True
    end
    object deUSSEDD1: TcxDateEdit
      Left = 56
      Top = 6
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 0
      Width = 105
    end
    object cxLabel356: TcxLabel
      Left = 195
      Top = 8
      Caption = 'Gestational Age'
      Transparent = True
    end
    object seUSSEDDGAWeeks1: TcxSpinEdit
      Left = 290
      Top = 6
      Properties.SpinButtons.Visible = False
      TabOrder = 1
      Width = 28
    end
    object cxLabel357: TcxLabel
      Left = 319
      Top = 8
      Caption = 'Weeks'
      Transparent = True
    end
    object seSSEDDGADays1: TcxSpinEdit
      Left = 356
      Top = 6
      Properties.SpinButtons.Visible = False
      TabOrder = 2
      Width = 28
    end
    object cxLabel358: TcxLabel
      Left = 387
      Top = 8
      Caption = 'Days'
      Transparent = True
    end
    object cbBiometryNotPerformed1: TcxCheckBox
      Left = 3
      Top = 37
      Caption = 'Biometry Not Performed'
      Style.LookAndFeel.NativeStyle = True
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 3
      Transparent = True
      Width = 174
    end
    object cxGraphData: TcxMemo
      Left = 639
      Top = 6
      Lines.Strings = (
        'cxGraphData')
      Properties.ScrollBars = ssBoth
      TabOrder = 13
      Visible = False
      Height = 94
      Width = 204
    end
    object cbBioPercentile1: TcxComboBox
      Left = 13
      Top = 57
      Properties.DropDownRows = 30
      Properties.Items.Strings = (
        ''
        'CHITTY'
        'HADLOCK'
        'Intergrowth')
      TabOrder = 4
      Text = 'CHITTY'
      Width = 110
    end
    object btnGeneratePercentiles: TcxButton
      Left = 133
      Top = 56
      Width = 139
      Height = 20
      Caption = 'Get Percentiles'
      TabOrder = 5
    end
    object cbOverrideCurrentValues: TcxCheckBox
      Left = 9
      Top = 78
      Caption = 'Override Current values'
      Style.LookAndFeel.NativeStyle = True
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 6
      Transparent = True
      Width = 145
    end
    object cxGroupBox3: TcxGroupBox
      Left = 155
      Top = 95
      Style.BorderStyle = ebsNone
      Style.Edges = []
      Style.LookAndFeel.NativeStyle = True
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 14
      Transparent = True
      Height = 21
      Width = 81
    end
    object cxgbBiometry: TcxGroupBox
      Left = 13
      Top = 95
      Style.Edges = []
      TabOrder = 15
      Height = 139
      Width = 604
      object cxLabel15: TcxLabel
        Left = 23
        Top = 116
        Caption = 'Lateral ventricle diameter'
        Transparent = True
      end
      object edtLatFentDiam1: TcxMaskEdit
        Left = 154
        Top = 115
        Properties.IgnoreMaskBlank = True
        Properties.MaskKind = emkRegExprEx
        Properties.EditMask = '(\d?)(\d?)\1'#39'.'#39'\1\1'
        Properties.MaxLength = 0
        TabOrder = 13
        Text = '0.0'
        Width = 37
      end
      object cxLabel19: TcxLabel
        Left = 197
        Top = 119
        Caption = 'mm'
        Transparent = True
      end
      object cxLabel20: TcxLabel
        Left = 47
        Top = 95
        Caption = 'Cerebellar diameter '
        Transparent = True
      end
      object cxLabel21: TcxLabel
        Left = 196
        Top = 96
        Caption = 'mm'
        Transparent = True
      end
      object edtCerebDiam1: TcxMaskEdit
        Left = 154
        Top = 92
        Properties.IgnoreMaskBlank = True
        Properties.MaskKind = emkRegExprEx
        Properties.EditMask = '(\d?)(\d?)\1'#39'.'#39'\1\1'
        Properties.MaxLength = 0
        TabOrder = 12
        Text = '0.0'
        Width = 37
      end
      object edtOFD1: TcxMaskEdit
        Left = 37
        Top = 60
        Properties.IgnoreMaskBlank = True
        Properties.MaskKind = emkRegExprEx
        Properties.EditMask = '(\d?)(\d?)\1'#39'.'#39'\1'
        Properties.MaxLength = 0
        TabOrder = 2
        Text = '0.0'
        Width = 37
      end
      object lblOFD1: TcxLabel
        Left = 9
        Top = 64
        Caption = 'OFD'
        Transparent = True
      end
      object lblBPD1: TcxLabel
        Left = 11
        Top = 17
        Caption = 'BPD'
        Transparent = True
      end
      object edtBPD1: TcxMaskEdit
        Left = 37
        Top = 15
        Properties.IgnoreMaskBlank = True
        Properties.MaskKind = emkRegExprEx
        Properties.EditMask = '(\d?)(\d?)\1'#39'.'#39'\1'
        Properties.MaxLength = 0
        TabOrder = 0
        Text = '0.0'
        Width = 37
      end
      object lblHC1: TcxLabel
        Left = 13
        Top = 37
        Caption = 'HC'
        Transparent = True
      end
      object edtHC1: TcxMaskEdit
        Left = 37
        Top = 37
        Properties.IgnoreMaskBlank = True
        Properties.MaskKind = emkRegExprEx
        Properties.EditMask = '(\d?)(\d?)\1'#39'.'#39'\1'
        Properties.MaxLength = 0
        TabOrder = 1
        Text = '0.0'
        Width = 37
      end
      object edtAC1: TcxMaskEdit
        Left = 254
        Top = 12
        Properties.IgnoreMaskBlank = True
        Properties.MaskKind = emkRegExprEx
        Properties.EditMask = '(\d?)(\d?)\1'#39'.'#39'\1'
        Properties.MaxLength = 0
        TabOrder = 3
        Text = '0.0'
        Width = 37
      end
      object lblAC1: TcxLabel
        Left = 236
        Top = 14
        Caption = 'AC'
        Transparent = True
      end
      object lblHL1: TcxLabel
        Left = 235
        Top = 64
        Caption = 'HL'
        Transparent = True
      end
      object edtHL1: TcxMaskEdit
        Left = 253
        Top = 62
        Properties.IgnoreMaskBlank = True
        Properties.MaskKind = emkRegExprEx
        Properties.EditMask = '(\d?)(\d?)\1'#39'.'#39'\1'
        Properties.MaxLength = 0
        TabOrder = 5
        Text = '0.0'
        Width = 37
      end
      object cxLabel22: TcxLabel
        Left = 73
        Top = 64
        Caption = 'cm'
        Transparent = True
      end
      object cxLabel23: TcxLabel
        Left = 73
        Top = 18
        Caption = 'cm'
        Transparent = True
      end
      object cxLabel24: TcxLabel
        Left = 291
        Top = 15
        Caption = 'cm'
        Transparent = True
      end
      object cxLabel11: TcxLabel
        Left = 73
        Top = 42
        Caption = 'cm'
        Transparent = True
      end
      object cxLabel16: TcxLabel
        Left = 290
        Top = 63
        Caption = 'cm'
        Transparent = True
      end
      object edtBPDPer1: TcxMaskEdit
        Left = 98
        Top = 15
        Properties.Alignment.Horz = taRightJustify
        Properties.IgnoreMaskBlank = True
        Properties.MaxLength = 0
        TabOrder = 6
        Text = '00'
        Width = 29
      end
      object cxLabel25: TcxLabel
        Left = 127
        Top = 17
        Caption = '%'
        Transparent = True
      end
      object edtOFDPer1: TcxMaskEdit
        Left = 98
        Top = 61
        Properties.Alignment.Horz = taRightJustify
        Properties.IgnoreMaskBlank = True
        Properties.MaxLength = 0
        TabOrder = 8
        Text = '00'
        Width = 29
      end
      object cxLabel30: TcxLabel
        Left = 127
        Top = 40
        Caption = '%'
        Transparent = True
      end
      object edtHCPer1: TcxMaskEdit
        Left = 98
        Top = 39
        Properties.Alignment.Horz = taRightJustify
        Properties.IgnoreMaskBlank = True
        Properties.MaxLength = 0
        TabOrder = 7
        Text = '00'
        Width = 29
      end
      object cxLabel32: TcxLabel
        Left = 127
        Top = 64
        Caption = '%'
        Transparent = True
      end
      object edtACPer1: TcxMaskEdit
        Left = 313
        Top = 13
        Properties.Alignment.Horz = taRightJustify
        Properties.IgnoreMaskBlank = True
        Properties.MaxLength = 0
        TabOrder = 9
        Text = '00'
        Width = 29
      end
      object cxLabel17: TcxLabel
        Left = 342
        Top = 15
        Caption = '%'
        Transparent = True
      end
      object edtHLPer1: TcxMaskEdit
        Left = 313
        Top = 61
        Properties.Alignment.Horz = taRightJustify
        Properties.IgnoreMaskBlank = True
        Properties.MaxLength = 0
        TabOrder = 11
        Text = '00'
        Width = 29
      end
      object cxLabel33: TcxLabel
        Left = 341
        Top = 64
        Caption = '%'
        Transparent = True
      end
      object edtBPDForm1: TcxTextEdit
        Left = 146
        Top = 13
        Enabled = False
        TabOrder = 33
        Width = 70
      end
      object edtOFDForm1: TcxTextEdit
        Left = 146
        Top = 65
        Enabled = False
        TabOrder = 34
        Width = 70
      end
      object edtHCForm1: TcxTextEdit
        Left = 146
        Top = 41
        Enabled = False
        TabOrder = 35
        Width = 70
      end
      object edtACForm1: TcxTextEdit
        Left = 362
        Top = 11
        Enabled = False
        TabOrder = 36
        Width = 70
      end
      object edtHLForm1: TcxTextEdit
        Left = 361
        Top = 59
        Enabled = False
        TabOrder = 37
        Width = 70
      end
      object edtFL1: TcxMaskEdit
        Left = 254
        Top = 37
        Properties.IgnoreMaskBlank = True
        Properties.MaskKind = emkRegExprEx
        Properties.EditMask = '(\d?)(\d?)\1'#39'.'#39'\1'
        Properties.MaxLength = 0
        TabOrder = 4
        Text = '0.0'
        Width = 37
      end
      object lblFl1: TcxLabel
        Left = 236
        Top = 39
        Caption = 'FL'
        Transparent = True
      end
      object cxLabel18: TcxLabel
        Left = 290
        Top = 39
        Caption = 'cm'
        Transparent = True
      end
      object edtFLPer1: TcxMaskEdit
        Left = 313
        Top = 35
        Properties.Alignment.Horz = taRightJustify
        Properties.IgnoreMaskBlank = True
        Properties.MaxLength = 0
        TabOrder = 10
        Text = '00'
        Width = 29
      end
      object cxLabel34: TcxLabel
        Left = 341
        Top = 38
        Caption = '%'
        Transparent = True
      end
      object edtFLForm1: TcxTextEdit
        Left = 362
        Top = 35
        Enabled = False
        TabOrder = 38
        Width = 70
      end
      object cxGroupBox11: TcxGroupBox
        Left = 376
        Top = 38
        Style.BorderStyle = ebsNone
        Style.Edges = []
        Style.LookAndFeel.NativeStyle = True
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 42
        Transparent = True
        Height = 22
        Width = 125
      end
    end
    object cxGroupBox6: TcxGroupBox
      Left = 124
      Top = 261
      Caption = 'Patient Informed'
      Style.BorderStyle = ebsNone
      Style.Edges = []
      Style.LookAndFeel.NativeStyle = True
      Style.TextStyle = [fsBold]
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 16
      Transparent = True
      Height = 43
      Width = 109
      object cbPatientInformedYes: TcxCheckBox
        Left = 1
        Top = 16
        Caption = 'Yes'
        Style.LookAndFeel.NativeStyle = True
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 0
        Transparent = True
        Width = 47
      end
      object cbPatientInformedNo: TcxCheckBox
        Left = 53
        Top = 16
        Caption = 'No'
        Style.LookAndFeel.NativeStyle = True
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 1
        Transparent = True
        Width = 47
      end
    end
  end
end
