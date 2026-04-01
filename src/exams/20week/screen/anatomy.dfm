object cxTabSheet4: TcxTabSheet
  Caption = 'Anatomy'
  ImageIndex = 1
  object cxgbAnatomy1: TcxGroupBox
    Left = 2
    Top = 2
    Style.Edges = []
    TabOrder = 0
    Height = 32
    Width = 686
    object cxLabel415: TcxLabel
      Left = 3
      Top = 9
      Caption = 'Fetal Anatomy'
      Style.TextStyle = [fsBold]
      Transparent = True
    end
    object cxGroupBox4: TcxGroupBox
      Left = 85
      Top = 6
      Style.BorderStyle = ebsNone
      Style.Edges = []
      Style.LookAndFeel.NativeStyle = True
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 0
      Transparent = True
      Height = 22
      Width = 146
      object cbFetalAnatomyNormal1: TcxCheckBox
        Left = 5
        Top = 1
        Caption = 'Normal'
        Style.LookAndFeel.NativeStyle = True
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 0
        Transparent = True
        Width = 59
      end
      object cbFetalAnatomyAbNormal1: TcxCheckBox
        Left = 70
        Top = 1
        Caption = 'Abnormal'
        Style.LookAndFeel.NativeStyle = True
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 1
        Transparent = True
        Width = 71
      end
    end
  end
  object cxScrollBox2: TcxScrollBox
    Left = 3
    Top = 40
    Width = 688
    Height = 434
    HorzScrollBar.Visible = False
    TabOrder = 1
    object cxgbTheChecks1: TcxGroupBox
      Left = 8
      Top = 7
      PanelStyle.Active = True
      Style.BorderStyle = ebsNone
      Style.Edges = []
      TabOrder = 0
      Height = 427
      Width = 691
      object Bevel1: TBevel
        Left = 3
        Top = 111
        Width = 544
        Height = 3
      end
      object Bevel2: TBevel
        Left = 3
        Top = 195
        Width = 550
        Height = 2
      end
      object Bevel3: TBevel
        Left = 5
        Top = 155
        Width = 548
        Height = 2
      end
      object Bevel5: TBevel
        Left = 3
        Top = 283
        Width = 550
        Height = 2
      end
      object Bevel4: TBevel
        Left = 3
        Top = 332
        Width = 551
        Height = 2
      end
      object Bevel6: TBevel
        Left = 2
        Top = 380
        Width = 335
        Height = 2
      end
      object Bevel7: TBevel
        Left = 3
        Top = 237
        Width = 550
        Height = 2
      end
      object cbHeart4Chamber1: TcxCheckBox
        Left = 54
        Top = 88
        Caption = '4CH'
        TabOrder = 0
        Transparent = True
        Width = 47
      end
      object cbLVOT1: TcxCheckBox
        Left = 150
        Top = 88
        Caption = 'LVOT'
        TabOrder = 1
        Transparent = True
        Width = 48
      end
      object cbRVOT1: TcxCheckBox
        Left = 199
        Top = 88
        Caption = 'RVOT'
        TabOrder = 2
        Transparent = True
        Width = 54
      end
      object cbSitus1: TcxCheckBox
        Left = 0
        Top = 88
        Caption = 'Situs'
        TabOrder = 3
        Transparent = True
        Width = 53
      end
      object cbSkull1: TcxCheckBox
        Left = 53
        Top = 132
        Caption = 'Skull'
        TabOrder = 4
        Transparent = True
        Width = 51
      end
      object cbFalx1: TcxCheckBox
        Left = 0
        Top = 132
        Caption = 'Falx'
        TabOrder = 5
        Transparent = True
        Width = 52
      end
      object cbChoroids1: TcxCheckBox
        Left = 199
        Top = 132
        Caption = 'Choroid'
        TabOrder = 6
        Transparent = True
        Width = 64
      end
      object cbNoseLips1: TcxCheckBox
        Left = 110
        Top = 173
        Caption = 'Nose / Lips'
        TabOrder = 8
        Transparent = True
        Width = 83
      end
      object cbOrbits1: TcxCheckBox
        Left = 1
        Top = 173
        Caption = 'Orbits'
        TabOrder = 7
        Transparent = True
        Width = 52
      end
      object cbCoronal1: TcxCheckBox
        Left = 2
        Top = 256
        Caption = 'Coronal'
        TabOrder = 10
        Transparent = True
        Width = 60
      end
      object cbAxial1: TcxCheckBox
        Left = 182
        Top = 256
        Caption = 'Axial'
        TabOrder = 11
        Transparent = True
        Width = 60
      end
      object cbSagital1: TcxCheckBox
        Left = 96
        Top = 256
        Caption = 'Sagittal'
        TabOrder = 12
        Transparent = True
        Width = 60
      end
      object cbCordInsert1: TcxCheckBox
        Left = 264
        Top = 305
        Caption = 'Cord Insert'
        TabOrder = 16
        Transparent = True
        Width = 81
      end
      object cbBladder1: TcxCheckBox
        Left = 408
        Top = 304
        Caption = 'Bladder'
        TabOrder = 15
        Transparent = True
        Width = 62
      end
      object cbStomach1: TcxCheckBox
        Left = 1
        Top = 304
        Caption = 'Stomach'
        TabOrder = 14
        Transparent = True
        Width = 74
      end
      object cbAbdomen1: TcxCheckBox
        Left = 467
        Top = 303
        Caption = 'Abdomen Wall'
        TabOrder = 17
        Transparent = True
        Width = 99
      end
      object cb3VCord1: TcxCheckBox
        Left = 344
        Top = 305
        Caption = '3V Cord'
        TabOrder = 18
        Transparent = True
        Width = 68
      end
      object cbBowel1: TcxCheckBox
        Left = 98
        Top = 304
        Caption = 'Bowel'
        TabOrder = 19
        Transparent = True
        Width = 56
      end
      object cbKidneys1: TcxCheckBox
        Left = 182
        Top = 305
        Caption = 'Kidneys'
        TabOrder = 20
        Transparent = True
        Width = 64
      end
      object cbFingers1: TcxCheckBox
        Left = 182
        Top = 356
        Caption = ' Fingers'
        TabOrder = 23
        Transparent = True
        Width = 81
      end
      object cbRadiusUlna1: TcxCheckBox
        Left = 98
        Top = 355
        Caption = 'Radius/Ulna'
        TabOrder = 22
        Transparent = True
        Width = 81
      end
      object cbHumerus1: TcxCheckBox
        Left = 1
        Top = 358
        Caption = 'Humerus'
        TabOrder = 21
        Transparent = True
        Width = 81
      end
      object cbFemur1: TcxCheckBox
        Left = 1
        Top = 398
        Caption = 'Femur'
        TabOrder = 24
        Transparent = True
        Width = 81
      end
      object cbTibsFibs1: TcxCheckBox
        Left = 98
        Top = 396
        Caption = 'Tibs/Fibs'
        TabOrder = 25
        Transparent = True
        Width = 81
      end
      object cbFootPosition1: TcxCheckBox
        Left = 182
        Top = 398
        Caption = 'Foot Position'
        TabOrder = 26
        Transparent = True
        Width = 90
      end
      object cbSkinline1: TcxCheckBox
        Left = 264
        Top = 256
        Caption = 'Skinline'
        TabOrder = 13
        Transparent = True
        Width = 74
      end
      object cxLabel417: TcxLabel
        Left = 0
        Top = 72
        Caption = 'Heart'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
        Transparent = True
      end
      object cxLabel418: TcxLabel
        Left = 0
        Top = 115
        Caption = 'Head'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
        Transparent = True
      end
      object cxLabel419: TcxLabel
        Left = 0
        Top = 159
        Caption = 'Face'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
        Transparent = True
      end
      object cxLabel420: TcxLabel
        Left = 0
        Top = 241
        Caption = 'Spine'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
        Transparent = True
      end
      object cxLabel421: TcxLabel
        Left = 0
        Top = 290
        Caption = 'Abdomen'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
        Transparent = True
      end
      object cxLabel422: TcxLabel
        Left = 0
        Top = 342
        Caption = 'Upper limbs'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
        Transparent = True
      end
      object cxLabel423: TcxLabel
        Left = 0
        Top = 383
        Caption = 'Lower limbs'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
        Transparent = True
      end
      object cbPalate1: TcxCheckBox
        Left = 264
        Top = 173
        Caption = 'Palate'
        Properties.Alignment = taLeftJustify
        TabOrder = 9
        Transparent = True
        Width = 62
      end
      object cbIVS1: TcxCheckBox
        Left = 110
        Top = 88
        Caption = 'IVS'
        TabOrder = 34
        Transparent = True
        Width = 44
      end
      object cb3VV1: TcxCheckBox
        Left = 252
        Top = 88
        Caption = '3VV'
        TabOrder = 35
        Transparent = True
        Width = 48
      end
      object cb3VT1: TcxCheckBox
        Left = 303
        Top = 88
        Caption = '3VT'
        TabOrder = 36
        Transparent = True
        Width = 48
      end
      object cbPV1: TcxCheckBox
        Left = 357
        Top = 88
        Caption = 'PV'
        TabOrder = 37
        Transparent = True
        Width = 48
      end
      object cbAoArch1: TcxCheckBox
        Left = 411
        Top = 88
        Caption = 'AoArch'
        TabOrder = 38
        Transparent = True
        Width = 63
      end
      object cbDArch1: TcxCheckBox
        Left = 490
        Top = 88
        Caption = 'DArch'
        TabOrder = 39
        Transparent = True
        Width = 63
      end
      object cbCSP1: TcxCheckBox
        Left = 110
        Top = 132
        Caption = 'CSP'
        TabOrder = 40
        Transparent = True
        Width = 44
      end
      object cbCC1: TcxCheckBox
        Left = 150
        Top = 132
        Caption = 'CC'
        TabOrder = 41
        Transparent = True
        Width = 46
      end
      object cbVentricles1: TcxCheckBox
        Left = 264
        Top = 132
        Caption = 'Ventricles'
        TabOrder = 42
        Transparent = True
        Width = 73
      end
      object cbCerebellum1: TcxCheckBox
        Left = 334
        Top = 132
        Caption = 'Cerebellum'
        TabOrder = 43
        Transparent = True
        Width = 79
      end
      object cbCmagma1: TcxCheckBox
        Left = 411
        Top = 132
        Caption = 'CMagma'
        TabOrder = 44
        Transparent = True
        Width = 73
      end
      object cbNuchal1: TcxCheckBox
        Left = 490
        Top = 132
        Caption = 'Nuchal'
        TabOrder = 45
        Transparent = True
        Width = 73
      end
      object cbLenses1: TcxCheckBox
        Left = 54
        Top = 173
        Caption = 'Lenses'
        TabOrder = 46
        Transparent = True
        Width = 57
      end
      object cbNB1: TcxCheckBox
        Left = 199
        Top = 173
        Caption = 'NB'
        TabOrder = 47
        Transparent = True
        Width = 43
      end
      object cbMandible1: TcxCheckBox
        Left = 336
        Top = 173
        Caption = 'Mandible'
        Properties.Alignment = taLeftJustify
        TabOrder = 48
        Transparent = True
        Width = 69
      end
      object cbProfile1: TcxCheckBox
        Left = 413
        Top = 172
        Caption = 'Profile'
        Properties.Alignment = taLeftJustify
        TabOrder = 49
        Transparent = True
        Width = 62
      end
      object cbLargeBMI1: TcxCheckBox
        Left = -2
        Top = 31
        Caption = 'Large BMI'
        Properties.Alignment = taLeftJustify
        TabOrder = 50
        Transparent = True
        Width = 94
      end
      object cbEarlyGestation1: TcxCheckBox
        Left = 98
        Top = 31
        Caption = 'Early Gestation'
        Properties.Alignment = taLeftJustify
        TabOrder = 51
        Transparent = True
        Width = 100
      end
      object cbAwkFetalPos1: TcxCheckBox
        Left = 200
        Top = 31
        Caption = 'Awkward fetal position'
        Properties.Alignment = taLeftJustify
        TabOrder = 52
        Transparent = True
        Width = 154
      end
      object btnSelectAll1: TcxButton
        Left = 3
        Top = 5
        Width = 75
        Height = 25
        Caption = 'Select All'
        TabOrder = 53
      end
      object btnClear1: TcxButton
        Left = 257
        Top = 4
        Width = 75
        Height = 25
        Caption = 'Clear'
        TabOrder = 54
      end
      object cbDiaphragm1: TcxCheckBox
        Left = 0
        Top = 214
        Caption = 'Diaphragm'
        TabOrder = 55
        Transparent = True
        Width = 81
      end
      object cbLungs1: TcxCheckBox
        Left = 96
        Top = 214
        Caption = 'Lungs'
        TabOrder = 56
        Transparent = True
        Width = 60
      end
      object cxLabel37: TcxLabel
        Left = 2
        Top = 197
        Caption = 'Thorax'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
        Transparent = True
      end
      object cbToes1: TcxCheckBox
        Left = 269
        Top = 398
        Caption = 'Toes'
        TabOrder = 58
        Transparent = True
        Width = 54
      end
      object gbAnatomyViews: TcxGroupBox
        Left = -7
        Top = 50
        Style.BorderStyle = ebsNone
        Style.Edges = []
        Style.LookAndFeel.NativeStyle = True
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 59
        Transparent = True
        Height = 22
        Width = 464
        object cbPoorView: TcxCheckBox
          Left = 5
          Top = 1
          Caption = 'Poor Views'
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 0
          Transparent = True
          Width = 94
        end
        object cbAverageViews: TcxCheckBox
          Left = 105
          Top = 2
          Caption = 'Average views'
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 1
          Transparent = True
          Width = 100
        end
        object cbGoodViews: TcxCheckBox
          Left = 207
          Top = 3
          Caption = 'Good views'
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 2
          Transparent = True
          Width = 100
        end
        object cbVeryGoodViews: TcxCheckBox
          Left = 295
          Top = 2
          Caption = 'Very good views'
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 3
          Transparent = True
          Width = 109
        end
      end
    end
  end
end
