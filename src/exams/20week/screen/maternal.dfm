object cxtsPlacenta: TcxTabSheet
  Caption = 'Maternal'
  ImageIndex = 3
  object Bevel8: TBevel
    Left = 3
    Top = 219
    Width = 568
    Height = 3
    Style = bsRaised
  end
  object lblCervicalLength: TcxLabel
    Left = 8
    Top = 29
    Caption = 'Cervical length'
    Style.TextStyle = []
    Transparent = True
  end
  object meCervicalLength: TcxMaskEdit
    Left = 98
    Top = 27
    Properties.IgnoreMaskBlank = True
    Properties.MaskKind = emkRegExprEx
    Properties.EditMask = '(\d?)(\d?)\1'
    Properties.MaxLength = 0
    TabOrder = 1
    Text = '00'
    Width = 43
  end
  object cxLabel42: TcxLabel
    Left = 141
    Top = 29
    Caption = 'mm'
    Transparent = True
  end
  object cxGroupBox5: TcxGroupBox
    Left = 160
    Top = 28
    Style.BorderStyle = ebsNone
    Style.Edges = []
    Style.LookAndFeel.NativeStyle = True
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.NativeStyle = True
    TabOrder = 3
    Transparent = True
    Height = 22
    Width = 81
    object cbCervixTVS: TcxCheckBox
      Left = 0
      Top = 0
      Caption = 'TVS'
      Style.LookAndFeel.NativeStyle = True
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 0
      Transparent = True
      Width = 44
    end
    object cbCervixTA: TcxCheckBox
      Left = 42
      Top = 0
      Caption = 'TA'
      Style.LookAndFeel.NativeStyle = True
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 1
      Transparent = True
      Width = 42
    end
  end
  object cxLabel79: TcxLabel
    Left = 10
    Top = 76
    Caption = 'Funnelling of membranes'
    Transparent = True
  end
  object cxGroupBox28: TcxGroupBox
    Left = 163
    Top = 75
    Style.BorderStyle = ebsNone
    Style.Edges = []
    Style.LookAndFeel.NativeStyle = True
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.NativeStyle = True
    TabOrder = 5
    Transparent = True
    Height = 22
    Width = 82
    object cbFunnellingofmembranesYes: TcxCheckBox
      Left = -3
      Top = 0
      Caption = 'Yes'
      Style.LookAndFeel.NativeStyle = True
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 0
      Transparent = True
      Width = 44
    end
    object cbFunnellingofmembranesNo: TcxCheckBox
      Left = 39
      Top = 0
      Caption = 'No'
      Style.LookAndFeel.NativeStyle = True
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 1
      Transparent = True
      Width = 44
    end
  end
  object cxLabel294: TcxLabel
    Left = 10
    Top = 99
    Caption = 'Cervical suture present'
    Transparent = True
  end
  object cxGroupBox8: TcxGroupBox
    Left = 127
    Top = 97
    Style.BorderStyle = ebsNone
    Style.Edges = []
    Style.LookAndFeel.NativeStyle = True
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.NativeStyle = True
    TabOrder = 6
    Transparent = True
    Height = 21
    Width = 83
    object cbCervixSutureYes: TcxCheckBox
      Left = -3
      Top = 0
      Caption = 'Yes'
      TabOrder = 0
      Transparent = True
      Width = 41
    end
    object cbCervixSutureNo: TcxCheckBox
      Left = 42
      Top = 1
      Caption = 'No'
      TabOrder = 1
      Transparent = True
      Width = 41
    end
  end
  object cxLabel295: TcxLabel
    Left = 220
    Top = 99
    Caption = 'Suture to external cervical os'
    Transparent = True
  end
  object edtSutureToOS: TcxMaskEdit
    Left = 365
    Top = 97
    Enabled = False
    Properties.IgnoreMaskBlank = True
    Properties.MaskKind = emkRegExprEx
    Properties.EditMask = '(\d?)(\d?)\1'#39'.'#39'\1\1'
    Properties.MaxLength = 0
    TabOrder = 7
    Text = '0'
    Width = 43
  end
  object cxLabel296: TcxLabel
    Left = 408
    Top = 99
    Caption = 'mm'
    Transparent = True
  end
  object cxLabel360: TcxLabel
    Left = 9
    Top = 136
    Caption = 'Uterine artery PI:'
    Transparent = True
  end
  object cxLabel361: TcxLabel
    Left = 143
    Top = 136
    Caption = 'Right'
    Transparent = True
  end
  object cxLabel362: TcxLabel
    Left = 266
    Top = 136
    Caption = 'Left'
    Transparent = True
  end
  object cxLabel363: TcxLabel
    Left = 143
    Top = 157
    Caption = 'Mean'
    Transparent = True
  end
  object cxGroupBox21: TcxGroupBox
    Left = 298
    Top = 154
    Style.BorderStyle = ebsNone
    Style.Edges = []
    Style.LookAndFeel.NativeStyle = True
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.NativeStyle = True
    TabOrder = 11
    Transparent = True
    Height = 21
    Width = 154
    object cbUAPINormal: TcxCheckBox
      Left = 0
      Top = 0
      Caption = 'Normal'
      TabOrder = 0
      Transparent = True
      Width = 70
    end
    object cbUAPI95: TcxCheckBox
      Left = 76
      Top = 0
      Caption = '95%ile'
      TabOrder = 1
      Transparent = True
      Width = 67
    end
  end
  object edtMeanUAPI: TcxMaskEdit
    Left = 178
    Top = 156
    Properties.IgnoreMaskBlank = True
    Properties.MaskKind = emkRegExprEx
    Properties.EditMask = '(\d?)\1'#39'.'#39'\1\1'
    Properties.MaxLength = 0
    TabOrder = 10
    Text = '0.0'
    Width = 38
  end
  object edtMeanRUAPI: TcxMaskEdit
    Left = 178
    Top = 134
    Properties.IgnoreMaskBlank = True
    Properties.MaskKind = emkRegExprEx
    Properties.EditMask = '(\d?)\1'#39'.'#39'\1\1'
    Properties.MaxLength = 0
    TabOrder = 8
    Text = '0.0'
    Width = 38
  end
  object edtMeanLUAPI: TcxMaskEdit
    Left = 303
    Top = 134
    Properties.IgnoreMaskBlank = True
    Properties.MaskKind = emkRegExprEx
    Properties.EditMask = '(\d?)\1'#39'.'#39'\1\1'
    Properties.MaxLength = 0
    TabOrder = 9
    Text = '0.0'
    Width = 38
  end
  object lblShortCervix: TcxLabel
    Left = 9
    Top = 53
    Caption = 'Short Cervix < 25mm'
    Transparent = True
  end
  object cxGroupBox55: TcxGroupBox
    Left = 164
    Top = 51
    Style.BorderStyle = ebsNone
    Style.Edges = []
    Style.LookAndFeel.NativeStyle = True
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.NativeStyle = True
    TabOrder = 4
    Transparent = True
    Height = 21
    Width = 81
    object cbCervixShortYes: TcxCheckBox
      Left = -4
      Top = 0
      Caption = 'Yes'
      Style.TextStyle = []
      TabOrder = 0
      Transparent = True
      Width = 44
    end
    object cbCervixShortNo: TcxCheckBox
      Left = 38
      Top = 0
      Caption = 'No'
      TabOrder = 1
      Transparent = True
      Width = 40
    end
  end
  object cxLabel28: TcxLabel
    Left = 303
    Top = 193
    Caption = 'Left Ovary'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
    Transparent = True
  end
  object cxLabel29: TcxLabel
    Left = 2
    Top = 192
    Caption = 'Right Ovary'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
    Transparent = True
  end
  object gbRightOvary: TcxGroupBox
    Left = 82
    Top = 180
    Style.Edges = []
    TabOrder = 23
    Height = 29
    Width = 185
    object cbRightOvaryAbNormal: TcxCheckBox
      Left = 74
      Top = 10
      Caption = 'Abnormal'
      TabOrder = 0
      Transparent = True
      Width = 86
    end
    object cbRightOvaryNormal: TcxCheckBox
      Left = 9
      Top = 10
      Caption = 'Normal'
      TabOrder = 1
      Transparent = True
      Width = 62
    end
  end
  object cxGroupBox7: TcxGroupBox
    Left = 367
    Top = 175
    Style.Edges = []
    TabOrder = 24
    Height = 40
    Width = 178
    object cbLeftOvaryAbNormal: TcxCheckBox
      Left = 73
      Top = 15
      Caption = 'Abnormal'
      TabOrder = 0
      Transparent = True
      Width = 84
    end
    object cbLeftOvaryNormal: TcxCheckBox
      Left = 7
      Top = 15
      Caption = 'Normal'
      TabOrder = 1
      Transparent = True
      Width = 60
    end
  end
  object gbFibroids: TcxGroupBox
    Left = 2
    Top = 245
    Style.Edges = []
    TabOrder = 25
    Height = 379
    Width = 1177
    object cxGroupBox2: TcxGroupBox
      Left = 2
      Top = 5
      Align = alTop
      PanelStyle.Active = True
      Style.BorderStyle = ebsNone
      Style.Edges = []
      TabOrder = 0
      Height = 22
      Width = 1173
      object cxLabel26: TcxLabel
        Left = 119
        Top = 2
        Caption = 'Count'
        Transparent = True
      end
      object spFibroidCount: TcxSpinEdit
        Left = 160
        Top = 0
        Properties.AssignedValues.MinValue = True
        Properties.LargeIncrement = 2.000000000000000000
        Properties.MaxValue = 10.000000000000000000
        TabOrder = 2
        Width = 44
      end
      object cbFibroidsVisualised: TcxCheckBox
        Left = 2
        Top = 0
        Caption = 'Fibroids visualised'
        TabOrder = 1
        Transparent = True
        Width = 111
      end
    end
    object gbFibroid1: TcxGroupBox
      Left = 1
      Top = 46
      PanelStyle.Active = True
      Style.BorderStyle = ebsNone
      Style.Edges = []
      Style.LookAndFeel.NativeStyle = True
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 1
      Transparent = True
      Height = 25
      Width = 591
      object cxLabel39: TcxLabel
        Left = 5
        Top = 5
        Caption = '1'
        Transparent = True
      end
      object cbFibriodPosition1: TcxComboBox
        Left = 68
        Top = 3
        Properties.Items.Strings = (
          'anterior'
          'posterior'
          'fundal'
          'lateral')
        TabOrder = 2
        Text = 'anterior'
        Width = 69
      end
      object cbFibroidsType1: TcxComboBox
        Tag = 1
        Left = 138
        Top = 3
        Properties.Items.Strings = (
          'intramural'
          'subserous'
          'submucosal'
          'pedunculated')
        TabOrder = 3
        Text = 'intramural'
        Width = 89
      end
      object edtFibroidLength1: TcxSpinEdit
        Left = 228
        Top = 3
        Properties.AssignedValues.MinValue = True
        Properties.SpinButtons.Visible = False
        TabOrder = 4
        Width = 30
      end
      object cxLabel40: TcxLabel
        Left = 260
        Top = 5
        Caption = 'x'
        Transparent = True
      end
      object edtFibroidWidth1: TcxSpinEdit
        Left = 274
        Top = 3
        Properties.AssignedValues.MinValue = True
        Properties.SpinButtons.Visible = False
        TabOrder = 5
        Width = 30
      end
      object cbFibroidsLeftRight1: TcxComboBox
        Left = 17
        Top = 3
        Properties.Items.Strings = (
          ''
          'Right'
          'Left'
          'Fundal')
        TabOrder = 1
        Width = 50
      end
      object cbCavityDistortion1: TcxCheckBox
        Left = 425
        Top = 1
        Caption = 'Close to Cervix'
        TabOrder = 8
        Transparent = True
        Width = 110
      end
      object cxLabel41: TcxLabel
        Left = 309
        Top = 5
        Caption = 'x'
        Transparent = True
      end
      object edtFibroiddepth1: TcxSpinEdit
        Left = 322
        Top = 3
        Properties.AssignedValues.MinValue = True
        Properties.SpinButtons.Visible = False
        TabOrder = 6
        Width = 30
      end
      object edtFibroidVolume1: TcxSpinEdit
        Left = 377
        Top = 3
        Properties.AssignedValues.MinValue = True
        Properties.DisplayFormat = '#00'
        Properties.EditFormat = '#00'
        Properties.SpinButtons.Visible = False
        Properties.ValueType = vtInt
        TabOrder = 7
        Width = 30
      end
      object cxLabel43: TcxLabel
        Left = 351
        Top = 5
        Caption = 'mm'
        Transparent = True
      end
      object cxLabel44: TcxLabel
        Left = 407
        Top = 5
        Caption = 'cc'
        Transparent = True
      end
      object seCloseToCrevix1: TcxSpinEdit
        Left = 535
        Top = 1
        Properties.AssignedValues.MinValue = True
        Properties.SpinButtons.Visible = False
        TabOrder = 13
        Width = 30
      end
      object cxLabel45: TcxLabel
        Left = 568
        Top = 5
        Caption = 'mm'
        Transparent = True
      end
    end
    object gbFibroid10: TcxGroupBox
      Left = 6
      Top = 265
      PanelStyle.Active = True
      Style.BorderStyle = ebsNone
      Style.Edges = []
      Style.LookAndFeel.NativeStyle = True
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 2
      Transparent = True
      Height = 24
      Width = 591
      object cxLabel46: TcxLabel
        Left = 0
        Top = 5
        Caption = '10'
        Transparent = True
      end
      object cbFibriodPosition10: TcxComboBox
        Left = 64
        Top = 3
        Properties.Items.Strings = (
          'anterior'
          'posterior'
          'fundal'
          'lateral')
        TabOrder = 2
        Text = 'anterior'
        Width = 69
      end
      object cbFibroidsType10: TcxComboBox
        Tag = 10
        Left = 134
        Top = 3
        Properties.Items.Strings = (
          'intramural'
          'subserous'
          'submucosal'
          'pedunculated')
        TabOrder = 3
        Text = 'intramural'
        Width = 89
      end
      object edtFibroidLength10: TcxSpinEdit
        Left = 224
        Top = 3
        Properties.AssignedValues.MinValue = True
        Properties.SpinButtons.Visible = False
        TabOrder = 4
        Width = 30
      end
      object cxLabel47: TcxLabel
        Left = 256
        Top = 5
        Caption = 'x'
        Transparent = True
      end
      object edtFibroidWidth10: TcxSpinEdit
        Left = 271
        Top = 3
        Properties.AssignedValues.MinValue = True
        Properties.SpinButtons.Visible = False
        TabOrder = 5
        Width = 30
      end
      object cbFibroidsLeftRight10: TcxComboBox
        Left = 13
        Top = 3
        Properties.Items.Strings = (
          ''
          'Right'
          'Left'
          'Fundal')
        TabOrder = 1
        Width = 50
      end
      object cbCavityDistortion10: TcxCheckBox
        Left = 420
        Top = 4
        Caption = 'Close to Cervix'
        TabOrder = 8
        Transparent = True
        Width = 120
      end
      object edtFibroiddepth10: TcxSpinEdit
        Left = 318
        Top = 3
        Properties.AssignedValues.MinValue = True
        Properties.SpinButtons.Visible = False
        TabOrder = 6
        Width = 30
      end
      object cxLabel48: TcxLabel
        Left = 305
        Top = 5
        Caption = 'x'
        Transparent = True
      end
      object edtFibroidVolume10: TcxSpinEdit
        Left = 373
        Top = 3
        Properties.AssignedValues.MinValue = True
        Properties.DisplayFormat = '#0.0'
        Properties.EditFormat = '#0.0'
        Properties.Increment = 0.100000000000000000
        Properties.SpinButtons.Visible = False
        Properties.ValueType = vtFloat
        TabOrder = 7
        Width = 30
      end
      object cxLabel49: TcxLabel
        Left = 347
        Top = 5
        Caption = 'mm'
        Transparent = True
      end
      object cxLabel50: TcxLabel
        Left = 403
        Top = 5
        Caption = 'cc'
        Transparent = True
      end
      object seCloseToCrevix10: TcxSpinEdit
        Left = 532
        Top = 3
        Properties.AssignedValues.MinValue = True
        Properties.SpinButtons.Visible = False
        TabOrder = 13
        Width = 30
      end
      object cxLabel51: TcxLabel
        Left = 566
        Top = 7
        Caption = 'mm'
        Transparent = True
      end
    end
    object gbFibroid9: TcxGroupBox
      Left = 6
      Top = 240
      PanelStyle.Active = True
      Style.BorderStyle = ebsNone
      Style.Edges = []
      Style.LookAndFeel.NativeStyle = True
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 3
      Transparent = True
      Height = 24
      Width = 591
      object cxLabel54: TcxLabel
        Left = 2
        Top = 5
        Caption = '9'
        Transparent = True
      end
      object cbFibriodPosition9: TcxComboBox
        Left = 64
        Top = 3
        Properties.Items.Strings = (
          'anterior'
          'posterior'
          'fundal'
          'lateral')
        TabOrder = 2
        Text = 'anterior'
        Width = 69
      end
      object cbFibroidsType9: TcxComboBox
        Tag = 9
        Left = 134
        Top = 3
        Properties.Items.Strings = (
          'intramural'
          'subserous'
          'submucosal'
          'pedunculated')
        TabOrder = 3
        Text = 'intramural'
        Width = 89
      end
      object edtFibroidLength9: TcxSpinEdit
        Left = 224
        Top = 3
        Properties.AssignedValues.MinValue = True
        Properties.SpinButtons.Visible = False
        TabOrder = 4
        Width = 30
      end
      object cxLabel55: TcxLabel
        Left = 256
        Top = 5
        Caption = 'x'
        Transparent = True
      end
      object edtFibroidWidth9: TcxSpinEdit
        Left = 271
        Top = 3
        Properties.AssignedValues.MinValue = True
        Properties.SpinButtons.Visible = False
        TabOrder = 5
        Width = 30
      end
      object cbFibroidsLeftRight9: TcxComboBox
        Left = 13
        Top = 3
        Properties.Items.Strings = (
          ''
          'Right'
          'Left'
          'Fundal')
        TabOrder = 1
        Width = 50
      end
      object cbCavityDistortion9: TcxCheckBox
        Left = 420
        Top = 5
        Caption = 'Close to Cervix'
        TabOrder = 8
        Transparent = True
        Width = 117
      end
      object edtFibroiddepth9: TcxSpinEdit
        Left = 318
        Top = 3
        Properties.AssignedValues.MinValue = True
        Properties.SpinButtons.Visible = False
        TabOrder = 6
        Width = 30
      end
      object cxLabel56: TcxLabel
        Left = 305
        Top = 5
        Caption = 'x'
        Transparent = True
      end
      object edtFibroidVolume9: TcxSpinEdit
        Left = 373
        Top = 3
        Properties.AssignedValues.MinValue = True
        Properties.DisplayFormat = '#0.0'
        Properties.EditFormat = '#0.0'
        Properties.Increment = 0.100000000000000000
        Properties.SpinButtons.Visible = False
        Properties.ValueType = vtFloat
        TabOrder = 7
        Width = 30
      end
      object cxLabel57: TcxLabel
        Left = 347
        Top = 5
        Caption = 'mm'
        Transparent = True
      end
      object cxLabel58: TcxLabel
        Left = 403
        Top = 5
        Caption = 'cc'
        Transparent = True
      end
      object seCloseToCrevix9: TcxSpinEdit
        Left = 532
        Top = 3
        Properties.AssignedValues.MinValue = True
        Properties.SpinButtons.Visible = False
        TabOrder = 13
        Width = 30
      end
      object cxLabel59: TcxLabel
        Left = 566
        Top = 7
        Caption = 'mm'
        Transparent = True
      end
    end
    object gbFibroid8: TcxGroupBox
      Left = 6
      Top = 214
      PanelStyle.Active = True
      Style.BorderStyle = ebsNone
      Style.Edges = []
      Style.LookAndFeel.NativeStyle = True
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 4
      Transparent = True
      Height = 24
      Width = 591
      object cxLabel60: TcxLabel
        Left = 1
        Top = 5
        Caption = '8'
        Transparent = True
      end
      object cbFibriodPosition8: TcxComboBox
        Left = 64
        Top = 3
        Properties.Items.Strings = (
          'anterior'
          'posterior'
          'fundal'
          'lateral')
        TabOrder = 2
        Text = 'anterior'
        Width = 69
      end
      object cbFibroidsType8: TcxComboBox
        Tag = 8
        Left = 134
        Top = 3
        Properties.Items.Strings = (
          'intramural'
          'subserous'
          'submucosal'
          'pedunculated')
        TabOrder = 3
        Text = 'intramural'
        Width = 89
      end
      object edtFibroidLength8: TcxSpinEdit
        Left = 224
        Top = 3
        Properties.AssignedValues.MinValue = True
        Properties.SpinButtons.Visible = False
        TabOrder = 4
        Width = 30
      end
      object cxLabel61: TcxLabel
        Left = 256
        Top = 5
        Caption = 'x'
        Transparent = True
      end
      object edtFibroidWidth8: TcxSpinEdit
        Left = 271
        Top = 3
        Properties.AssignedValues.MinValue = True
        Properties.SpinButtons.Visible = False
        TabOrder = 5
        Width = 30
      end
      object cbFibroidsLeftRight8: TcxComboBox
        Left = 13
        Top = 3
        Properties.Items.Strings = (
          ''
          'Right'
          'Left'
          'Fundal')
        TabOrder = 1
        Width = 50
      end
      object cbCavityDistortion8: TcxCheckBox
        Left = 420
        Top = 4
        Caption = 'Close to Cervix'
        TabOrder = 8
        Transparent = True
        Width = 103
      end
      object edtFibroiddepth8: TcxSpinEdit
        Left = 318
        Top = 3
        Properties.AssignedValues.MinValue = True
        Properties.SpinButtons.Visible = False
        TabOrder = 6
        Width = 30
      end
      object cxLabel62: TcxLabel
        Left = 305
        Top = 5
        Caption = 'x'
        Transparent = True
      end
      object edtFibroidVolume8: TcxSpinEdit
        Left = 373
        Top = 3
        Properties.AssignedValues.MinValue = True
        Properties.DisplayFormat = '#0.0'
        Properties.EditFormat = '#0.0'
        Properties.Increment = 0.100000000000000000
        Properties.SpinButtons.Visible = False
        Properties.ValueType = vtFloat
        TabOrder = 7
        Width = 30
      end
      object cxLabel63: TcxLabel
        Left = 347
        Top = 5
        Caption = 'mm'
        Transparent = True
      end
      object cxLabel64: TcxLabel
        Left = 403
        Top = 5
        Caption = 'cc'
        Transparent = True
      end
      object seCloseToCrevix8: TcxSpinEdit
        Left = 532
        Top = 3
        Properties.AssignedValues.MinValue = True
        Properties.SpinButtons.Visible = False
        TabOrder = 13
        Width = 30
      end
      object cxLabel65: TcxLabel
        Left = 566
        Top = 7
        Caption = 'mm'
        Transparent = True
      end
    end
    object gbFibroid7: TcxGroupBox
      Left = 6
      Top = 190
      PanelStyle.Active = True
      Style.BorderStyle = ebsNone
      Style.Edges = []
      Style.LookAndFeel.NativeStyle = True
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 5
      Transparent = True
      Height = 25
      Width = 591
      object cxLabel66: TcxLabel
        Left = 1
        Top = 5
        Caption = '7'
        Transparent = True
      end
      object cbFibriodPosition7: TcxComboBox
        Left = 64
        Top = 3
        Properties.Items.Strings = (
          'anterior'
          'posterior'
          'fundal'
          'lateral')
        TabOrder = 2
        Text = 'anterior'
        Width = 69
      end
      object cbFibroidsType7: TcxComboBox
        Tag = 7
        Left = 134
        Top = 3
        Properties.Items.Strings = (
          'intramural'
          'subserous'
          'submucosal'
          'pedunculated')
        TabOrder = 3
        Text = 'intramural'
        Width = 89
      end
      object edtFibroidLength7: TcxSpinEdit
        Left = 224
        Top = 3
        Properties.AssignedValues.MinValue = True
        Properties.SpinButtons.Visible = False
        TabOrder = 4
        Width = 30
      end
      object cxLabel67: TcxLabel
        Left = 256
        Top = 5
        Caption = 'x'
        Transparent = True
      end
      object edtFibroidWidth7: TcxSpinEdit
        Left = 271
        Top = 3
        Properties.AssignedValues.MinValue = True
        Properties.SpinButtons.Visible = False
        TabOrder = 5
        Width = 30
      end
      object cbFibroidsLeftRight7: TcxComboBox
        Left = 13
        Top = 3
        Properties.Items.Strings = (
          ''
          'Right'
          'Left'
          'Fundal')
        TabOrder = 1
        Width = 50
      end
      object cbCavityDistortion7: TcxCheckBox
        Left = 420
        Top = 4
        Caption = 'Close to Cervix'
        TabOrder = 8
        Transparent = True
        Width = 97
      end
      object edtFibroiddepth7: TcxSpinEdit
        Left = 318
        Top = 3
        Properties.AssignedValues.MinValue = True
        Properties.SpinButtons.Visible = False
        TabOrder = 6
        Width = 30
      end
      object cxLabel68: TcxLabel
        Left = 305
        Top = 5
        Caption = 'x'
        Transparent = True
      end
      object edtFibroidVolume7: TcxSpinEdit
        Left = 373
        Top = 3
        Properties.AssignedValues.MinValue = True
        Properties.DisplayFormat = '#0.0'
        Properties.EditFormat = '#0.0'
        Properties.Increment = 0.100000000000000000
        Properties.SpinButtons.Visible = False
        Properties.ValueType = vtFloat
        TabOrder = 7
        Width = 30
      end
      object cxLabel69: TcxLabel
        Left = 347
        Top = 5
        Caption = 'mm'
        Transparent = True
      end
      object cxLabel70: TcxLabel
        Left = 402
        Top = 6
        Caption = 'cc'
        Transparent = True
      end
      object seCloseToCrevix7: TcxSpinEdit
        Left = 531
        Top = 3
        Properties.AssignedValues.MinValue = True
        Properties.SpinButtons.Visible = False
        TabOrder = 13
        Width = 30
      end
      object cxLabel71: TcxLabel
        Left = 567
        Top = 6
        Caption = 'mm'
        Transparent = True
      end
    end
    object gbFibroid6: TcxGroupBox
      Left = 6
      Top = 166
      PanelStyle.Active = True
      Style.BorderStyle = ebsNone
      Style.Edges = []
      Style.LookAndFeel.NativeStyle = True
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 6
      Transparent = True
      Height = 25
      Width = 591
      object cxLabel72: TcxLabel
        Left = 1
        Top = 5
        Caption = '6'
        Transparent = True
      end
      object cbFibriodPosition6: TcxComboBox
        Left = 64
        Top = 3
        Properties.Items.Strings = (
          'anterior'
          'posterior'
          'fundal'
          'lateral')
        TabOrder = 2
        Text = 'anterior'
        Width = 69
      end
      object cbFibroidsType6: TcxComboBox
        Tag = 6
        Left = 134
        Top = 3
        Properties.Items.Strings = (
          'intramural'
          'subserous'
          'submucosal'
          'pedunculated')
        TabOrder = 3
        Text = 'intramural'
        Width = 89
      end
      object edtFibroidLength6: TcxSpinEdit
        Left = 224
        Top = 3
        Properties.AssignedValues.MinValue = True
        Properties.SpinButtons.Visible = False
        TabOrder = 4
        Width = 30
      end
      object cxLabel73: TcxLabel
        Left = 256
        Top = 5
        Caption = 'x'
        Transparent = True
      end
      object edtFibroidWidth6: TcxSpinEdit
        Left = 271
        Top = 3
        Properties.AssignedValues.MinValue = True
        Properties.SpinButtons.Visible = False
        TabOrder = 5
        Width = 30
      end
      object cbFibroidsLeftRight6: TcxComboBox
        Left = 13
        Top = 3
        Properties.Items.Strings = (
          ''
          'Right'
          'Left'
          'Fundal')
        TabOrder = 1
        Width = 50
      end
      object cbCavityDistortion6: TcxCheckBox
        Left = 420
        Top = 4
        Caption = 'Close to Cervix'
        TabOrder = 8
        Transparent = True
        Width = 104
      end
      object edtFibroiddepth6: TcxSpinEdit
        Left = 318
        Top = 3
        Properties.AssignedValues.MinValue = True
        Properties.SpinButtons.Visible = False
        TabOrder = 6
        Width = 30
      end
      object cxLabel74: TcxLabel
        Left = 305
        Top = 5
        Caption = 'x'
        Transparent = True
      end
      object edtFibroidVolume6: TcxSpinEdit
        Left = 373
        Top = 3
        Properties.AssignedValues.MinValue = True
        Properties.DisplayFormat = '#0.0'
        Properties.EditFormat = '#0.0'
        Properties.Increment = 0.100000000000000000
        Properties.SpinButtons.Visible = False
        Properties.ValueType = vtFloat
        TabOrder = 7
        Width = 30
      end
      object cxLabel75: TcxLabel
        Left = 347
        Top = 5
        Caption = 'mm'
        Transparent = True
      end
      object cxLabel76: TcxLabel
        Left = 403
        Top = 5
        Caption = 'cc'
        Transparent = True
      end
      object seCloseToCrevix6: TcxSpinEdit
        Left = 531
        Top = 2
        Properties.AssignedValues.MinValue = True
        Properties.SpinButtons.Visible = False
        TabOrder = 13
        Width = 30
      end
      object cxLabel77: TcxLabel
        Left = 565
        Top = 7
        Caption = 'mm'
        Transparent = True
      end
    end
    object gbFibroid5: TcxGroupBox
      Left = 6
      Top = 142
      PanelStyle.Active = True
      Style.BorderStyle = ebsNone
      Style.Edges = []
      Style.LookAndFeel.NativeStyle = True
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 7
      Transparent = True
      Height = 25
      Width = 591
      object cxLabel78: TcxLabel
        Left = 1
        Top = 5
        Caption = '5'
        Transparent = True
      end
      object cbFibriodPosition5: TcxComboBox
        Left = 64
        Top = 3
        Properties.Items.Strings = (
          'anterior'
          'posterior'
          'fundal'
          'lateral')
        TabOrder = 2
        Text = 'anterior'
        Width = 69
      end
      object cbFibroidsType5: TcxComboBox
        Tag = 5
        Left = 134
        Top = 3
        Properties.Items.Strings = (
          'intramural'
          'subserous'
          'submucosal'
          'pedunculated')
        TabOrder = 3
        Text = 'intramural'
        Width = 89
      end
      object edtFibroidLength5: TcxSpinEdit
        Left = 224
        Top = 3
        Properties.AssignedValues.MinValue = True
        Properties.SpinButtons.Visible = False
        TabOrder = 4
        Width = 30
      end
      object cxLabel80: TcxLabel
        Left = 256
        Top = 5
        Caption = 'x'
        Transparent = True
      end
      object edtFibroidWidth5: TcxSpinEdit
        Left = 271
        Top = 3
        Properties.AssignedValues.MinValue = True
        Properties.SpinButtons.Visible = False
        TabOrder = 5
        Width = 30
      end
      object cbFibroidsLeftRight5: TcxComboBox
        Left = 13
        Top = 3
        Properties.Items.Strings = (
          ''
          'Right'
          'Left'
          'Fundal')
        TabOrder = 1
        Width = 50
      end
      object cbCavityDistortion5: TcxCheckBox
        Left = 420
        Top = 4
        Caption = 'Close to Cervix'
        TabOrder = 8
        Transparent = True
        Width = 101
      end
      object edtFibroiddepth5: TcxSpinEdit
        Left = 318
        Top = 3
        Properties.AssignedValues.MinValue = True
        Properties.SpinButtons.Visible = False
        TabOrder = 6
        Width = 30
      end
      object cxLabel81: TcxLabel
        Left = 305
        Top = 5
        Caption = 'x'
        Transparent = True
      end
      object edtFibroidVolume5: TcxSpinEdit
        Left = 373
        Top = 3
        Properties.AssignedValues.MinValue = True
        Properties.DisplayFormat = '#0.0'
        Properties.EditFormat = '#0.0'
        Properties.Increment = 0.100000000000000000
        Properties.SpinButtons.Visible = False
        Properties.ValueType = vtFloat
        TabOrder = 7
        Width = 30
      end
      object cxLabel82: TcxLabel
        Left = 347
        Top = 5
        Caption = 'mm'
        Transparent = True
      end
      object cxLabel83: TcxLabel
        Left = 403
        Top = 5
        Caption = 'cc'
        Transparent = True
      end
      object seCloseToCrevix5: TcxSpinEdit
        Left = 532
        Top = 2
        Properties.AssignedValues.MinValue = True
        Properties.SpinButtons.Visible = False
        TabOrder = 13
        Width = 30
      end
      object cxLabel84: TcxLabel
        Left = 565
        Top = 5
        Caption = 'mm'
        Transparent = True
      end
    end
    object gbFibroid4: TcxGroupBox
      Left = 6
      Top = 120
      PanelStyle.Active = True
      Style.BorderStyle = ebsNone
      Style.Edges = []
      Style.LookAndFeel.NativeStyle = True
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 8
      Transparent = True
      Height = 25
      Width = 591
      object cxLabel85: TcxLabel
        Left = 1
        Top = 1
        Caption = '4'
        Transparent = True
      end
      object cbFibriodPosition4: TcxComboBox
        Left = 64
        Top = -1
        Properties.Items.Strings = (
          'anterior'
          'posterior'
          'fundal'
          'lateral')
        TabOrder = 2
        Text = 'anterior'
        Width = 69
      end
      object cbFibroidsType4: TcxComboBox
        Tag = 4
        Left = 134
        Top = -1
        Properties.Items.Strings = (
          'intramural'
          'subserous'
          'submucosal'
          'pedunculated')
        TabOrder = 3
        Text = 'intramural'
        Width = 89
      end
      object edtFibroidLength4: TcxSpinEdit
        Left = 224
        Top = -1
        Properties.AssignedValues.MinValue = True
        Properties.SpinButtons.Visible = False
        TabOrder = 4
        Width = 30
      end
      object cxLabel86: TcxLabel
        Left = 256
        Top = 1
        Caption = 'x'
        Transparent = True
      end
      object edtFibroidWidth4: TcxSpinEdit
        Left = 271
        Top = -1
        Properties.AssignedValues.MinValue = True
        Properties.SpinButtons.Visible = False
        TabOrder = 5
        Width = 30
      end
      object cbFibroidsLeftRight4: TcxComboBox
        Left = 13
        Top = -1
        Properties.Items.Strings = (
          ''
          'Right'
          'Left'
          'Fundal')
        TabOrder = 1
        Width = 50
      end
      object cbCavityDistortion4: TcxCheckBox
        Left = 420
        Top = -1
        Caption = 'Close to Cervix'
        TabOrder = 8
        Transparent = True
        Width = 104
      end
      object edtFibroiddepth4: TcxSpinEdit
        Left = 318
        Top = -1
        Properties.AssignedValues.MinValue = True
        Properties.SpinButtons.Visible = False
        TabOrder = 6
        Width = 30
      end
      object cxLabel87: TcxLabel
        Left = 305
        Top = 1
        Caption = 'x'
        Transparent = True
      end
      object edtFibroidVolume4: TcxSpinEdit
        Left = 373
        Top = -1
        Properties.AssignedValues.MinValue = True
        Properties.DisplayFormat = '#0.0'
        Properties.EditFormat = '#0.0'
        Properties.Increment = 0.100000000000000000
        Properties.SpinButtons.Visible = False
        Properties.ValueType = vtFloat
        TabOrder = 7
        Width = 30
      end
      object cxLabel88: TcxLabel
        Left = 347
        Top = 1
        Caption = 'mm'
        Transparent = True
      end
      object cxLabel89: TcxLabel
        Left = 403
        Top = 1
        Caption = 'cc'
        Transparent = True
      end
      object seCloseToCrevix4: TcxSpinEdit
        Left = 532
        Top = 0
        Properties.AssignedValues.MinValue = True
        Properties.SpinButtons.Visible = False
        TabOrder = 13
        Width = 30
      end
      object cxLabel90: TcxLabel
        Left = 565
        Top = 1
        Caption = 'mm'
        Transparent = True
      end
    end
    object gbFibroid3: TcxGroupBox
      Left = 8
      Top = 93
      PanelStyle.Active = True
      Style.BorderStyle = ebsNone
      Style.Edges = []
      Style.LookAndFeel.NativeStyle = True
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 9
      Transparent = True
      Height = 25
      Width = 591
      object cxLabel91: TcxLabel
        Left = -1
        Top = 4
        Caption = '3'
        Transparent = True
      end
      object cbFibriodPosition3: TcxComboBox
        Left = 62
        Top = 2
        Properties.Items.Strings = (
          'anterior'
          'posterior'
          'fundal'
          'lateral')
        TabOrder = 2
        Text = 'anterior'
        Width = 69
      end
      object cbFibroidsType3: TcxComboBox
        Tag = 3
        Left = 132
        Top = 2
        Properties.Items.Strings = (
          'intramural'
          'subserous'
          'submucosal'
          'pedunculated')
        TabOrder = 3
        Text = 'intramural'
        Width = 89
      end
      object edtFibroidLength3: TcxSpinEdit
        Left = 222
        Top = 2
        Properties.AssignedValues.MinValue = True
        Properties.SpinButtons.Visible = False
        TabOrder = 4
        Width = 30
      end
      object cxLabel92: TcxLabel
        Left = 254
        Top = 4
        Caption = 'x'
        Transparent = True
      end
      object edtFibroidWidth3: TcxSpinEdit
        Left = 269
        Top = 2
        Properties.AssignedValues.MinValue = True
        Properties.SpinButtons.Visible = False
        TabOrder = 5
        Width = 30
      end
      object cbFibroidsLeftRight3: TcxComboBox
        Left = 11
        Top = 2
        Properties.Items.Strings = (
          ''
          'Right'
          'Left'
          'Fundal')
        TabOrder = 1
        Width = 50
      end
      object cbCavityDistortion3: TcxCheckBox
        Left = 418
        Top = 2
        Caption = 'Close to Cervix'
        TabOrder = 8
        Transparent = True
        Width = 100
      end
      object edtFibroiddepth3: TcxSpinEdit
        Left = 316
        Top = 2
        Properties.AssignedValues.MinValue = True
        Properties.SpinButtons.Visible = False
        TabOrder = 6
        Width = 30
      end
      object cxLabel93: TcxLabel
        Left = 303
        Top = 4
        Caption = 'x'
        Transparent = True
      end
      object edtFibroidVolume3: TcxSpinEdit
        Left = 371
        Top = 2
        Properties.AssignedValues.MinValue = True
        Properties.DisplayFormat = '#0.0'
        Properties.EditFormat = '#0.0'
        Properties.Increment = 0.100000000000000000
        Properties.SpinButtons.Visible = False
        Properties.ValueType = vtFloat
        TabOrder = 7
        Width = 30
      end
      object cxLabel94: TcxLabel
        Left = 345
        Top = 4
        Caption = 'mm'
        Transparent = True
      end
      object cxLabel95: TcxLabel
        Left = 401
        Top = 4
        Caption = 'cc'
        Transparent = True
      end
      object seCloseToCrevix3: TcxSpinEdit
        Left = 530
        Top = 2
        Properties.AssignedValues.MinValue = True
        Properties.SpinButtons.Visible = False
        TabOrder = 13
        Width = 30
      end
      object cxLabel52: TcxLabel
        Left = 561
        Top = 4
        Caption = 'mm'
        Transparent = True
      end
    end
    object gbFibroid2: TcxGroupBox
      Left = 6
      Top = 68
      PanelStyle.Active = True
      Style.BorderStyle = ebsNone
      Style.Edges = []
      Style.LookAndFeel.NativeStyle = True
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 10
      Transparent = True
      Height = 25
      Width = 591
      object cxLabel96: TcxLabel
        Left = 1
        Top = 5
        Caption = '2'
        Transparent = True
      end
      object cbFibriodPosition2: TcxComboBox
        Left = 64
        Top = 3
        Properties.Items.Strings = (
          'anterior'
          'posterior'
          'fundal'
          'lateral')
        TabOrder = 2
        Text = 'anterior'
        Width = 69
      end
      object cbFibroidsType2: TcxComboBox
        Tag = 2
        Left = 134
        Top = 3
        Properties.Items.Strings = (
          'intramural'
          'subserous'
          'submucosal'
          'pedunculated')
        TabOrder = 3
        Text = 'intramural'
        Width = 89
      end
      object edtFibroidLength2: TcxSpinEdit
        Left = 224
        Top = 3
        Properties.AssignedValues.MinValue = True
        Properties.SpinButtons.Visible = False
        TabOrder = 4
        Width = 30
      end
      object cxLabel97: TcxLabel
        Left = 256
        Top = 5
        Caption = 'x'
        Transparent = True
      end
      object edtFibroidWidth2: TcxSpinEdit
        Left = 270
        Top = 3
        Properties.AssignedValues.MinValue = True
        Properties.SpinButtons.Visible = False
        TabOrder = 5
        Width = 30
      end
      object cbFibroidsLeftRight2: TcxComboBox
        Left = 13
        Top = 3
        Properties.Items.Strings = (
          ''
          'Right'
          'Left'
          'Fundal')
        TabOrder = 1
        Width = 50
      end
      object cbCavityDistortion2: TcxCheckBox
        Left = 420
        Top = 4
        Caption = 'Close to Cervix'
        TabOrder = 8
        Transparent = True
        Width = 104
      end
      object edtFibroiddepth2: TcxSpinEdit
        Left = 318
        Top = 3
        Properties.AssignedValues.MinValue = True
        Properties.SpinButtons.Visible = False
        TabOrder = 6
        Width = 30
      end
      object cxLabel98: TcxLabel
        Left = 305
        Top = 5
        Caption = 'x'
        Transparent = True
      end
      object edtFibroidVolume2: TcxSpinEdit
        Left = 373
        Top = 4
        Properties.AssignedValues.MinValue = True
        Properties.DisplayFormat = '#0.0'
        Properties.EditFormat = '#0.0'
        Properties.Increment = 0.100000000000000000
        Properties.SpinButtons.Visible = False
        Properties.ValueType = vtFloat
        TabOrder = 7
        Width = 30
      end
      object cxLabel99: TcxLabel
        Left = 347
        Top = 5
        Caption = 'mm'
        Transparent = True
      end
      object cxLabel100: TcxLabel
        Left = 403
        Top = 5
        Caption = 'cc'
        Transparent = True
      end
      object seCloseToCrevix2: TcxSpinEdit
        Left = 530
        Top = 2
        Properties.AssignedValues.MinValue = True
        Properties.SpinButtons.Visible = False
        TabOrder = 13
        Width = 30
      end
      object cxLabel53: TcxLabel
        Left = 564
        Top = 6
        Caption = 'mm'
        Transparent = True
      end
    end
  end
  object cxLabel101: TcxLabel
    Left = 2
    Top = 232
    Caption = 'Fibroids :'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
    Transparent = True
  end
end
