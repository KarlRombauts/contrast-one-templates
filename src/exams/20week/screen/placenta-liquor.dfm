object cxtsPlacentaLiquor: TcxTabSheet
  Caption = 'Placenta  and Liquor'
  ImageIndex = 4
  object cxgbPlacentalDetails1: TcxGroupBox
    Left = 12
    Top = 13
    Style.Edges = []
    TabOrder = 0
    Height = 148
    Width = 640
    object cxGroupBox32: TcxGroupBox
      Left = 4
      Top = 29
      PanelStyle.Active = True
      Style.BorderStyle = ebsNone
      Style.Edges = []
      Style.LookAndFeel.NativeStyle = True
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 0
      Transparent = True
      Height = 24
      Width = 389
      object cxLabel14: TcxLabel
        Left = 8
        Top = 1
        Caption = '1:'
        Transparent = True
      end
      object cbPlacentaSite1: TcxComboBox
        Left = 19
        Top = 0
        Properties.DropDownRows = 25
        Properties.Items.Strings = (
          ''
          'Anterior'
          'Posterior'
          'Right Anterolateral'
          'Left Anterolateral'
          'Right Posterolateral'
          'Left Posterolateral'
          'Fundal')
        TabOrder = 1
        Width = 175
      end
      object cxLabel38: TcxLabel
        Left = 207
        Top = 1
        Caption = 'Low lying (<20mm)'
        Transparent = True
      end
      object cxGroupBox35: TcxGroupBox
        Left = 311
        Top = 2
        Style.BorderStyle = ebsNone
        Style.Edges = []
        Style.LookAndFeel.NativeStyle = True
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 2
        Transparent = True
        Height = 21
        Width = 78
        object cxCheckBox13: TcxCheckBox
          Left = -92
          Top = 45
          Caption = 'Yes'
          Style.BorderColor = clRed
          Style.BorderStyle = ebsThick
          TabOrder = 2
          Transparent = True
          Width = 41
        end
        object cbLowLyingPlacentaNo1: TcxCheckBox
          Left = 38
          Top = -4
          Caption = 'No'
          Style.BorderColor = clRed
          Style.BorderStyle = ebsThick
          TabOrder = 1
          Transparent = True
          Width = 40
        end
        object cbLowLyingPlacentaYes1: TcxCheckBox
          Left = -3
          Top = -4
          Caption = 'Yes'
          Style.BorderColor = clRed
          Style.BorderStyle = ebsThick
          TabOrder = 0
          Transparent = True
          Width = 41
        end
      end
    end
    object cxLabel138: TcxLabel
      Left = 17
      Top = -1
      Caption = 'Placenta Site'
      Transparent = True
    end
    object cxLabel353: TcxLabel
      Left = 244
      Top = 55
      Caption = 'mm'
      Transparent = True
    end
    object cxLabel163: TcxLabel
      Left = 8
      Top = 55
      Caption = 'Leading edge to Internal Os'
      Transparent = True
    end
    object meInternalOS1: TcxMaskEdit
      Left = 218
      Top = 53
      Properties.IgnoreMaskBlank = True
      Properties.MaskKind = emkRegExprEx
      Properties.EditMask = '(\d?)(\d?)\1\1\1'
      Properties.MaxLength = 0
      TabOrder = 1
      Width = 26
    end
    object cxGroupBox36: TcxGroupBox
      Left = 367
      Top = 53
      Style.BorderStyle = ebsNone
      Style.Edges = []
      Style.LookAndFeel.NativeStyle = True
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 2
      Transparent = True
      Height = 21
      Width = 81
    end
    object cxLabel511: TcxLabel
      Left = 8
      Top = 77
      Caption = 'Extends beyond the Internal cervical os by'
      Transparent = True
    end
    object cxLabel512: TcxLabel
      Left = 244
      Top = 77
      Caption = 'mm'
      Transparent = True
    end
    object cxLabel517: TcxLabel
      Left = 446
      Top = 26
      Caption = 'Succenturiate lobe'
      Transparent = True
    end
    object cxGroupBox63: TcxGroupBox
      Left = 542
      Top = 24
      Style.BorderStyle = ebsNone
      Style.Edges = []
      Style.LookAndFeel.NativeStyle = True
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 4
      Transparent = True
      Height = 21
      Width = 73
      object cbSuccenturiateLobeYes1: TcxCheckBox
        Left = -4
        Top = -1
        Caption = 'Yes'
        Style.LookAndFeel.NativeStyle = True
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 0
        Transparent = True
        Width = 41
      end
      object cbSuccenturiateLobeNo1: TcxCheckBox
        Left = 35
        Top = 0
        Caption = 'No'
        Style.LookAndFeel.NativeStyle = True
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 1
        Transparent = True
        Width = 37
      end
    end
    object cbSuccentPos1: TcxComboBox
      Left = 512
      Top = 67
      Enabled = False
      Properties.DropDownRows = 25
      Properties.Items.Strings = (
        ''
        'Anterior'
        'Posterior'
        'Central'
        'Right anterolateral'
        'Left anterolateral'
        'Right posterolateral'
        'Left posterolateral'
        'Fundal'
        '')
      TabOrder = 5
      Width = 120
    end
    object cxLabel518: TcxLabel
      Left = 490
      Top = 45
      Caption = 'Low lying'
      Transparent = True
    end
    object cxLabel519: TcxLabel
      Left = 469
      Top = 3
      Caption = 'Vasa praevia'
      Transparent = True
    end
    object cxGroupBox67: TcxGroupBox
      Left = 538
      Top = 1
      Style.BorderStyle = ebsNone
      Style.Edges = []
      Style.LookAndFeel.NativeStyle = True
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 3
      Transparent = True
      Height = 21
      Width = 91
      object cbVasaPraeviaYes1: TcxCheckBox
        Left = 0
        Top = 0
        Caption = 'Yes'
        Style.LookAndFeel.NativeStyle = True
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 0
        Transparent = True
        Width = 41
      end
      object cbVasaPraeviaNo1: TcxCheckBox
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
    object cxLabel520: TcxLabel
      Left = 484
      Top = 68
      Caption = 'Site'
      Transparent = True
    end
    object cxGroupBox10: TcxGroupBox
      Left = 12
      Top = 103
      Style.BorderStyle = ebsNone
      Style.Edges = []
      Style.LookAndFeel.NativeStyle = True
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 15
      Transparent = True
      Height = 21
      Width = 552
      object cxCheckBox2: TcxCheckBox
        Left = -92
        Top = 45
        Caption = 'Yes'
        Style.BorderColor = clRed
        Style.BorderStyle = ebsThick
        TabOrder = 0
        Transparent = True
        Width = 41
      end
      object cbVCI1: TcxCheckBox
        Left = 5
        Top = 1
        Caption = 'Velamentous cord insertion'
        TabOrder = 1
        Transparent = True
        Width = 164
      end
      object cbMCI1: TcxCheckBox
        Left = 186
        Top = 1
        Caption = 'Marginal cord insertion'
        TabOrder = 2
        Transparent = True
        Width = 138
      end
      object cbCCI1: TcxCheckBox
        Left = 333
        Top = 0
        Caption = 'Central cord insertion'
        State = cbsChecked
        TabOrder = 3
        Transparent = True
        Width = 136
      end
    end
    object sePlacentaExtendsBy1: TcxMaskEdit
      Left = 218
      Top = 76
      Properties.IgnoreMaskBlank = True
      Properties.MaskKind = emkRegExprEx
      Properties.EditMask = '(\d?)(\d?)\1\1\1'
      Properties.MaxLength = 0
      TabOrder = 16
      Width = 26
    end
  end
  object cxGroupBox9: TcxGroupBox
    Left = 553
    Top = 58
    Style.BorderStyle = ebsNone
    Style.Edges = []
    Style.LookAndFeel.NativeStyle = True
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.NativeStyle = True
    TabOrder = 1
    Transparent = True
    Height = 21
    Width = 88
    object cbLowLyingYes11: TcxCheckBox
      Left = -3
      Top = 0
      Caption = 'Yes'
      Style.LookAndFeel.NativeStyle = True
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 0
      Transparent = True
      Width = 41
    end
    object cbLowLyingNo11: TcxCheckBox
      Left = 37
      Top = 0
      Caption = 'No'
      Style.LookAndFeel.NativeStyle = True
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 1
      Transparent = True
      Width = 37
    end
  end
end
