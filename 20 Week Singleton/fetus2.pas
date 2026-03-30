object cxtsFetus: TcxTabSheet
                  Caption = 'Fetus 2'
                  ImageIndex = 0
                  object cxpgFetus2: TcxPageControl
                    Left = 0
                    Top = 0
                    Width = 1198
                    Height = 515
                    Align = alClient
                    TabOrder = 0
                    Properties.ActivePage = cxtsFetusGeneral1
                    Properties.CustomButtons.Buttons = <>
                    ClientRectBottom = 515
                    ClientRectRight = 1198
                    ClientRectTop = 24
                    object cxtsFetusGeneral2: TcxTabSheet
                      Caption = 'General'
                      ImageIndex = 0
                      object cxpnlEmbryo1LRSI2: TcxGroupBox
                        Tag = 2
                        Left = 0
                        Top = 0
                        Align = alClient
                        PanelStyle.Active = True
                        Style.BorderStyle = ebsNone
                        Style.Edges = []
                        Style.LookAndFeel.NativeStyle = True
                        StyleDisabled.LookAndFeel.NativeStyle = True
                        StyleFocused.LookAndFeel.NativeStyle = True
                        StyleHot.LookAndFeel.NativeStyle = True
                        TabOrder = 0
                        Transparent = True
                        Height = 491
                        Width = 1198
                        object Bevel233: TBevel
                          Left = 5
                          Top = 29
                          Width = 450
                          Height = 4
                        end
                        object Bevel234: TBevel
                          Left = 3
                          Top = 95
                          Width = 450
                          Height = 4
                        end
                        object Bevel235: TBevel
                          Left = 4
                          Top = 220
                          Width = 450
                          Height = 4
                        end
                        object cxLabel2286: TcxLabel
                          Left = 7
                          Top = 4
                          Caption = 'USS EDD'
                          Transparent = True
                        end
                        object deUSSEDD2: TcxDateEdit
                          Left = 61
                          Top = 2
                          Properties.SaveTime = False
                          Properties.ShowTime = False
                          TabOrder = 1
                          Width = 105
                        end
                        object cxLabel2287: TcxLabel
                          Left = 194
                          Top = 4
                          Caption = 'Gestational Age'
                          Transparent = True
                        end
                        object seUSSEDDGAWeeks2: TcxSpinEdit
                          Left = 289
                          Top = 2
                          Properties.SpinButtons.Visible = False
                          TabOrder = 2
                          Width = 28
                        end
                        object cxLabel2288: TcxLabel
                          Left = 318
                          Top = 4
                          Caption = 'Weeks'
                          Transparent = True
                        end
                        object seSSEDDGADays2: TcxSpinEdit
                          Left = 355
                          Top = 2
                          Properties.SpinButtons.Visible = False
                          TabOrder = 3
                          Width = 28
                        end
                        object cxLabel2289: TcxLabel
                          Left = 386
                          Top = 4
                          Caption = 'Days'
                          Transparent = True
                        end
                        object edtCRL2: TcxMaskEdit
                          Left = 30
                          Top = 51
                          Properties.IgnoreMaskBlank = True
                          Properties.MaskKind = emkRegExprEx
                          Properties.EditMask = '(\d?)(\d?)\1'#39'.'#39'(\d?)\1'
                          Properties.MaxLength = 0
                          TabOrder = 4
                          Text = '00'
                          Width = 37
                        end
                        object cxLabel223: TcxLabel
                          Left = 4
                          Top = 55
                          Caption = 'CRL'
                          Transparent = True
                        end
                        object cxLabel224: TcxLabel
                          Left = 111
                          Top = 54
                          Caption = 'BPD'
                          Transparent = True
                        end
                        object edtBPD2: TcxMaskEdit
                          Left = 137
                          Top = 52
                          Properties.IgnoreMaskBlank = True
                          Properties.MaskKind = emkRegExprEx
                          Properties.EditMask = '(\d?)(\d?)\1'#39'.'#39'(\d?)\1'
                          Properties.MaxLength = 0
                          TabOrder = 5
                          Text = '00'
                          Width = 37
                        end
                        object cxLabel227: TcxLabel
                          Left = 4
                          Top = 109
                          Caption = 'Nuchal Translucency Measurement'
                          Transparent = True
                        end
                        object edNucTransMeasurement2: TcxMaskEdit
                          Left = 188
                          Top = 105
                          ParentFont = False
                          Properties.IgnoreMaskBlank = True
                          Properties.MaskKind = emkRegExprEx
                          Properties.EditMask = '(\d?)(\d?)\1'#39'.'#39'\1\1'
                          Properties.MaxLength = 0
                          Style.BorderColor = clRed
                          Style.BorderStyle = ebsThick
                          Style.Color = clWindow
                          Style.Font.Charset = DEFAULT_CHARSET
                          Style.Font.Color = clWindowText
                          Style.Font.Height = -11
                          Style.Font.Name = 'Tahoma'
                          Style.Font.Style = []
                          Style.IsFontAssigned = True
                          TabOrder = 6
                          Text = '00'
                          Width = 37
                        end
                        object cxLabel232: TcxLabel
                          Left = 231
                          Top = 109
                          Caption = 'mm'
                          Transparent = True
                        end
                        object cgNasalBone2: TcxGroupBox
                          Left = 0
                          Top = 155
                          Caption = 'Nasal bone'
                          Style.BorderStyle = ebsNone
                          Style.Edges = []
                          Style.LookAndFeel.NativeStyle = True
                          StyleDisabled.LookAndFeel.NativeStyle = True
                          StyleFocused.LookAndFeel.NativeStyle = True
                          StyleHot.LookAndFeel.NativeStyle = True
                          TabOrder = 7
                          Transparent = True
                          Height = 49
                          Width = 263
                          object cbNasalVisualised2: TcxCheckBox
                            Left = 2
                            Top = 13
                            Caption = 'Clearly visualised'
                            Style.LookAndFeel.NativeStyle = True
                            StyleDisabled.LookAndFeel.NativeStyle = True
                            StyleFocused.LookAndFeel.NativeStyle = True
                            StyleHot.LookAndFeel.NativeStyle = True
                            TabOrder = 0
                            Transparent = True
                            Width = 113
                          end
                          object cbNasaAbsent2: TcxCheckBox
                            Left = 2
                            Top = 31
                            Caption = 'Clearly absent'
                            Style.LookAndFeel.NativeStyle = True
                            StyleDisabled.LookAndFeel.NativeStyle = True
                            StyleFocused.LookAndFeel.NativeStyle = True
                            StyleHot.LookAndFeel.NativeStyle = True
                            TabOrder = 1
                            Transparent = True
                            Width = 103
                          end
                          object cbNasalNotClear2: TcxCheckBox
                            Left = 111
                            Top = 31
                            Caption = 'Not clearly visualised'
                            Style.LookAndFeel.NativeStyle = True
                            StyleDisabled.LookAndFeel.NativeStyle = True
                            StyleFocused.LookAndFeel.NativeStyle = True
                            StyleHot.LookAndFeel.NativeStyle = True
                            TabOrder = 2
                            Transparent = True
                            Width = 130
                          end
                        end
                        object cxLabel2159: TcxLabel
                          Left = 65
                          Top = 56
                          Caption = 'mm'
                          Transparent = True
                        end
                        object cxLabel2160: TcxLabel
                          Left = 174
                          Top = 55
                          Caption = 'mm'
                          Transparent = True
                        end
                        object cbBiometryNotPerformed: TcxCheckBox
                          Left = 1
                          Top = 33
                          Caption = 'Biometry Not Performed'
                          Style.LookAndFeel.NativeStyle = True
                          StyleDisabled.LookAndFeel.NativeStyle = True
                          StyleFocused.LookAndFeel.NativeStyle = True
                          StyleHot.LookAndFeel.NativeStyle = True
                          TabOrder = 17
                          Transparent = True
                          Width = 174
                        end
                        object ntmeasureLabel2: TcxLabel
                          Left = 5
                          Top = 126
                          Caption = '(CRL 45 - 84 mm)'
                          Transparent = True
                        end
                        object cxLabel23: TcxLabel
                          Left = 14
                          Top = 236
                          Caption = 'Placenta Site'
                          Transparent = True
                        end
                        object cxLabel24: TcxLabel
                          Left = 11
                          Top = 262
                          Caption = 'Amniotic Fluid'
                          Transparent = True
                        end
                        object cbAmnioticFluid2: TcxComboBox
                          Left = 86
                          Top = 257
                          Properties.DropDownRows = 25
                          Properties.Items.Strings = (
                            'Normal')
                          TabOrder = 21
                          Text = 'Normal'
                          Width = 120
                        end
                        object cbPlacentaSite2: TcxComboBox
                          Left = 86
                          Top = 234
                          Properties.DropDownRows = 25
                          Properties.Items.Strings = (
                            ''
                            'Anterior'
                            'Posterior'
                            'Right lateral'
                            'Left lateral')
                          TabOrder = 22
                          Width = 175
                        end
                      end
                    end
                    object cxTabSheet6: TcxTabSheet
                      Caption = 'Anatomy'
                      ImageIndex = 1
                      object cxgbAnatomy2: TcxGroupBox
                        Left = 2
                        Top = 2
                        Style.Edges = []
                        TabOrder = 0
                        Height = 32
                        Width = 686
                        object cxLabel213: TcxLabel
                          Left = 3
                          Top = 9
                          Caption = 'Fetal Anatomy'
                          Style.TextStyle = [fsBold]
                          Transparent = True
                        end
                        object cxGroupBox2: TcxGroupBox
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
                          object cbFetalAnatomyNormal2: TcxCheckBox
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
                          object cbFetalAnatomyAbNormal2: TcxCheckBox
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
                        object cxgbTheChecks2: TcxGroupBox
                          Left = 1
                          Top = 4
                          PanelStyle.Active = True
                          Style.BorderStyle = ebsNone
                          Style.Edges = []
                          TabOrder = 0
                          Height = 427
                          Width = 691
                          object Bevel22: TBevel
                            Left = 5
                            Top = 137
                            Width = 544
                            Height = 3
                          end
                          object Bevel23: TBevel
                            Left = 5
                            Top = 97
                            Width = 548
                            Height = 2
                          end
                          object Bevel25: TBevel
                            Left = 4
                            Top = 289
                            Width = 550
                            Height = 2
                          end
                          object Bevel24: TBevel
                            Left = 3
                            Top = 190
                            Width = 551
                            Height = 2
                          end
                          object Bevel22: TBevel
                            Left = 5
                            Top = 239
                            Width = 550
                            Height = 2
                          end
                          object cbHeart4Chamber2: TcxCheckBox
                            Left = 53
                            Top = 114
                            Caption = '4CH'
                            TabOrder = 0
                            Transparent = True
                            Width = 47
                          end
                          object cbLVOT2: TcxCheckBox
                            Left = 201
                            Top = 114
                            Caption = 'LVOT'
                            TabOrder = 1
                            Transparent = True
                            Width = 48
                          end
                          object cbRVOT2: TcxCheckBox
                            Left = 305
                            Top = 114
                            Caption = 'RVOT'
                            TabOrder = 2
                            Transparent = True
                            Width = 54
                          end
                          object cbSitus2: TcxCheckBox
                            Left = 2
                            Top = 114
                            Caption = 'Situs'
                            TabOrder = 3
                            Transparent = True
                            Width = 53
                          end
                          object cbSkull2: TcxCheckBox
                            Left = 53
                            Top = 74
                            Caption = 'Skull'
                            TabOrder = 4
                            Transparent = True
                            Width = 51
                          end
                          object cbFalx2: TcxCheckBox
                            Left = 0
                            Top = 74
                            Caption = 'Falx'
                            TabOrder = 5
                            Transparent = True
                            Width = 52
                          end
                          object cbChoroids2: TcxCheckBox
                            Left = 113
                            Top = 75
                            Caption = 'Choroid'
                            TabOrder = 6
                            Transparent = True
                            Width = 64
                          end
                          object cbCoronal2: TcxCheckBox
                            Left = 2
                            Top = 210
                            Caption = 'Ossification'
                            TabOrder = 7
                            Transparent = True
                            Width = 88
                          end
                          object cbCordInsert2: TcxCheckBox
                            Left = 305
                            Top = 163
                            Caption = 'Cord Insertion'
                            TabOrder = 10
                            Transparent = True
                            Width = 97
                          end
                          object cbBladder2: TcxCheckBox
                            Left = 201
                            Top = 163
                            Caption = 'Bladder'
                            TabOrder = 9
                            Transparent = True
                            Width = 62
                          end
                          object cbStomach2: TcxCheckBox
                            Left = 1
                            Top = 162
                            Caption = 'Stomach'
                            TabOrder = 8
                            Transparent = True
                            Width = 74
                          end
                          object cb3VCord2: TcxCheckBox
                            Left = 412
                            Top = 163
                            Caption = '3VC'
                            TabOrder = 11
                            Transparent = True
                            Width = 68
                          end
                          object cbKidneys2: TcxCheckBox
                            Left = 113
                            Top = 163
                            Caption = 'Kidneys'
                            TabOrder = 12
                            Transparent = True
                            Width = 64
                          end
                          object cbFingers2: TcxCheckBox
                            Left = 205
                            Top = 257
                            Caption = 'Legs'
                            TabOrder = 15
                            Transparent = True
                            Width = 81
                          end
                          object cbHands2: TcxCheckBox
                            Left = 110
                            Top = 257
                            Caption = 'Hands'
                            TabOrder = 14
                            Transparent = True
                            Width = 81
                          end
                          object cbArms2: TcxCheckBox
                            Left = 2
                            Top = 257
                            Caption = 'Arms'
                            TabOrder = 13
                            Transparent = True
                            Width = 81
                          end
                          object cbFeet2: TcxCheckBox
                            Left = 305
                            Top = 257
                            Caption = 'Feet'
                            TabOrder = 16
                            Transparent = True
                            Width = 90
                          end
                          object cxLabel214: TcxLabel
                            Left = 2
                            Top = 98
                            Caption = 'Chest'
                            ParentFont = False
                            Style.Font.Charset = DEFAULT_CHARSET
                            Style.Font.Color = clWindowText
                            Style.Font.Height = -11
                            Style.Font.Name = 'Tahoma'
                            Style.Font.Style = [fsBold]
                            Style.IsFontAssigned = True
                            Transparent = True
                          end
                          object cxLabel215: TcxLabel
                            Left = 2
                            Top = 55
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
                          object cxLabel217: TcxLabel
                            Left = 0
                            Top = 195
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
                          object cxLabel218: TcxLabel
                            Left = 0
                            Top = 148
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
                          object cxLabel219: TcxLabel
                            Left = 3
                            Top = 242
                            Caption = 'Limbs'
                            ParentFont = False
                            Style.Font.Charset = DEFAULT_CHARSET
                            Style.Font.Color = clWindowText
                            Style.Font.Height = -11
                            Style.Font.Name = 'Tahoma'
                            Style.Font.Style = [fsBold]
                            Style.IsFontAssigned = True
                            Transparent = True
                          end
                          object cb3VV2: TcxCheckBox
                            Left = 113
                            Top = 115
                            Caption = '3VV'
                            TabOrder = 22
                            Transparent = True
                            Width = 48
                          end
                          object cbVentricles2: TcxCheckBox
                            Left = 201
                            Top = 75
                            Caption = 'Ventricles'
                            TabOrder = 23
                            Transparent = True
                            Width = 73
                          end
                          object cbPostFossa2: TcxCheckBox
                            Left = 305
                            Top = 76
                            Caption = 'Post Fossa / ICT'
                            TabOrder = 24
                            Transparent = True
                            Width = 109
                          end
                          object cbCmagma2: TcxCheckBox
                            Left = 411
                            Top = 74
                            Caption = 'Orbits'
                            TabOrder = 25
                            Transparent = True
                            Width = 73
                          end
                          object cbLargeBMI2: TcxCheckBox
                            Left = -2
                            Top = 31
                            Caption = 'Large BMI'
                            Properties.Alignment = taLeftJustify
                            TabOrder = 26
                            Transparent = True
                            Width = 94
                          end
                          object cbEarlyGestation2: TcxCheckBox
                            Left = 98
                            Top = 31
                            Caption = 'Early Gestation'
                            Properties.Alignment = taLeftJustify
                            TabOrder = 27
                            Transparent = True
                            Width = 100
                          end
                          object cbAwkFetalPos2: TcxCheckBox
                            Left = 200
                            Top = 31
                            Caption = 'Awkward fetal position'
                            Properties.Alignment = taLeftJustify
                            TabOrder = 28
                            Transparent = True
                            Width = 154
                          end
                          object btnSelectAll2: TcxButton
                            Left = 3
                            Top = 5
                            Width = 75
                            Height = 25
                            Caption = 'Select All'
                            TabOrder = 29
                          end
                          object btnClear2: TcxButton
                            Left = 257
                            Top = 4
                            Width = 75
                            Height = 25
                            Caption = 'Clear'
                            TabOrder = 30
                          end
                          object cbDiaphragm2: TcxCheckBox
                            Left = 411
                            Top = 116
                            Caption = 'Diaphragm'
                            TabOrder = 31
                            Transparent = True
                            Width = 81
                          end
                        end
                      end
                    end
                  end
                end