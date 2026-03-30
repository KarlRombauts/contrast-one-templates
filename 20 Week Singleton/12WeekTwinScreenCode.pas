inherited Third_Trimester: TThird_Trimester
Width = 1198
Height = 721
Align = alClient
ExplicitWidth = 451
ExplicitHeight = 304
  inherited cxpcReportMainPage: TcxPageControl
    Left = 0
    Top = 0
    Width = 1223
    Height = 701
    TabOrder = 0
    Properties.ActivePage = cxtsReportDetails
    Properties.CustomButtons.Buttons = <>
    ClientRectBottom = 701
    ClientRectRight = 1223
    ClientRectTop = 24
    object cxtsReportDetails: TcxTabSheet
      Caption = 'Details'
      ImageIndex = 1
      object ScrollBox1: TScrollBox
        Left = 0
        Top = 0
        Width = 1223
        Height = 677
        Align = alClient
        TabOrder = 0
        object cxgbFirstRiMainScollPanel: TcxGroupBox
          Left = 0
          Top = 0
          Align = alTop
          Constraints.MinHeight = 455
          Constraints.MinWidth = 380
          PanelStyle.Active = True
          Style.BorderStyle = ebsNone
          Style.Edges = []
          TabOrder = 0
          Height = 825
          Width = 1202
          object cxGroupBox10: TcxGroupBox
            Left = 2
            Top = 2
            Align = alTop
            PanelStyle.Active = True
            Style.BorderStyle = ebsNone
            Style.Edges = []
            TabOrder = 0
            Height = 164
            Width = 1198
            object cxLabel69: TcxLabel
              Left = 34
              Top = 4
              Caption = 'Exam Date'
              Transparent = True
            end
            object deExamDate: TcxDateEdit
              Left = 96
              Top = 2
              Properties.ImmediatePost = True
              Properties.ShowTime = False
              TabOrder = 1
              Width = 121
            end
            object cxLabel249: TcxLabel
              Left = 2
              Top = 24
              Caption = 'Referral indication'
              Transparent = True
            end
            object edtReferralIndicator1: TcxTextEdit
              Left = 96
              Top = 44
              Enabled = False
              TabOrder = 3
              Width = 371
            end
            object cxLabel276: TcxLabel
              Left = 322
              Top = 3
              Caption = '(12w v7.8.9 03/08/2017)'
              Transparent = True
            end
            object cxLabel256: TcxLabel
              Left = 20
              Top = 105
              Caption = 'Clinical History'
              Transparent = True
            end
            object edtOtherPastHistory1: TcxTextEdit
              Left = 96
              Top = 128
              Enabled = False
              TabOrder = 6
              Width = 371
            end
            object cxLabel284: TcxLabel
              Left = 61
              Top = 46
              Caption = 'Other'
              Transparent = True
            end
            object cxccbObstetricHistory: TcxCheckComboBox
              Left = 96
              Top = 103
              Properties.DropDownRows = 20
              Properties.Items = <
                item
                  Description = 'Uncertain dates'
                  ShortDescription = 'Uncertain dates'
                end
                item
                  Description = 'Bleeding'
                  ShortDescription = 'Bleeding'
                end
                item
                  Description = 'Abdominal pain'
                  ShortDescription = 'Abdominal pain'
                end
                item
                  Description = 'Recurrent miscarriage'
                  ShortDescription = 'Recurrent miscarriage'
                end
                item
                  Description = 'Cervical surveillance'
                  ShortDescription = 'Cervical surveillance'
                end
                item
                  Description = 'Other'
                  ShortDescription = 'Other'
                end>
              TabOrder = 8
              Width = 371
            end
            object cxLabel2: TcxLabel
              Left = 96
              Top = 74
              Caption = 'G'
              Transparent = True
            end
            object cxLabel5: TcxLabel
              Left = 145
              Top = 74
              Caption = 'P'
              Transparent = True
            end
            object cxLabel7: TcxLabel
              Left = 192
              Top = 74
              Caption = 'M'
              Transparent = True
            end
            object cxLabel6: TcxLabel
              Left = 245
              Top = 74
              Caption = 'T'
              Transparent = True
            end
            object cxLabel8: TcxLabel
              Left = 295
              Top = 74
              Caption = 'C/S'
              Transparent = True
            end
            object cxLabel9: TcxLabel
              Left = 361
              Top = 74
              Caption = 'IVF'
              Transparent = True
            end
            object edtG: TcxTextEdit
              Left = 109
              Top = 73
              TabOrder = 15
              Width = 26
            end
            object edtP: TcxTextEdit
              Left = 157
              Top = 73
              TabOrder = 16
              Width = 26
            end
            object edtM: TcxTextEdit
              Left = 206
              Top = 73
              TabOrder = 17
              Width = 26
            end
            object edtT: TcxTextEdit
              Left = 256
              Top = 73
              TabOrder = 18
              Width = 26
            end
            object edtCS: TcxTextEdit
              Left = 322
              Top = 73
              TabOrder = 19
              Width = 26
            end
            object edtIVF: TcxTextEdit
              Left = 387
              Top = 73
              TabOrder = 20
              Width = 26
            end
            object cxccbReferralIndication: TcxCheckComboBox
              Left = 96
              Top = 26
              Properties.DropDownRows = 20
              Properties.Items = <
                item
                  Description = 'Early morphology assessment.  NIPS Normal.'
                  ShortDescription = 'Early morphology assessment.  Normal NIPS'
                end
                item
                  Description = 
                    'Early morphology assessment.  Combined first trimester screening' +
                    '. '
                  ShortDescription = 
                    'Early morphology assessment and combined first trimester screeni' +
                    'ng'
                end
                item
                  Description = 'Early morphology assessment.  NIPS taken today.'
                  ShortDescription = 'Early morphology assessment and non-invasive prenatal screening'
                end
                item
                  Description = 'Early morphology assessment.  NIPS result pending.'
                  ShortDescription = 'Early morphology assessment.  NIPS result pending'
                end
                item
                  Description = 'Early morphology assessment.  NIPS Increased risk .'
                  ShortDescription = 'Early morphology assessment.  Increased risk NIPS'
                end
                item
                  Description = 'Early morphology assessment.  NT only screening.'
                  ShortDescription = 'Early morphology assessment and NT only screening'
                end
                item
                  Description = 'Early morphology assessment.  Aneuploidy screening declined.'
                  ShortDescription = 
                    'Early morphology assessment.  Patient declined aneuploidy screen' +
                    'ing'
                end
                item
                  Description = 'Pre-eclampsia screening'
                  ShortDescription = 'Pre-eclampsia screening'
                end
                item
                  Description = 'Establish gestational age'
                  ShortDescription = 'Establish gestational age'
                end
                item
                  Description = 'Other'
                  ShortDescription = 'Other'
                end>
              Style.BorderColor = clRed
              Style.BorderStyle = ebsThick
              Style.Edges = [bLeft, bTop, bRight, bBottom]
              Style.Shadow = False
              TabOrder = 21
              Width = 393
            end
          end
          object pcReportBody: TcxPageControl
            Left = 2
            Top = 297
            Width = 1198
            Height = 562
            Align = alTop
            TabOrder = 1
            Properties.ActivePage = cxtsFetalAnatomy
            Properties.CustomButtons.Buttons = <>
            LookAndFeel.NativeStyle = False
            ClientRectBottom = 562
            ClientRectRight = 1198
            ClientRectTop = 24
            object cxtsFetalAnatomy: TcxTabSheet
              Caption = 'The Fetus'
              ImageIndex = 6
              object pgFetusMeasusements: TcxPageControl
                Left = 0
                Top = 0
                Width = 1198
                Height = 538
                Align = alClient
                TabOrder = 0
                Properties.ActivePage = cxtsFetus1
                Properties.CustomButtons.Buttons = <>
                Properties.Style = 2
                ClientRectBottom = 538
                ClientRectRight = 1198
                ClientRectTop = 23
                object cxtsFetus1: TcxTabSheet
                  Caption = 'Fetus 1'
                  ImageIndex = 0
                  object cxpgFetus1: TcxPageControl
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
                    object cxtsFetusGeneral1: TcxTabSheet
                      Caption = 'General'
                      ImageIndex = 0
                      object cxpnlEmbryo1LRSI1: TcxGroupBox
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
                        object Bevel33: TBevel
                          Left = 5
                          Top = 29
                          Width = 450
                          Height = 4
                        end
                        object Bevel34: TBevel
                          Left = 3
                          Top = 95
                          Width = 450
                          Height = 4
                        end
                        object Bevel35: TBevel
                          Left = 4
                          Top = 220
                          Width = 450
                          Height = 4
                        end
                        object cxLabel286: TcxLabel
                          Left = 7
                          Top = 4
                          Caption = 'USS EDD'
                          Transparent = True
                        end
                        object deUSSEDD1: TcxDateEdit
                          Left = 61
                          Top = 2
                          Properties.SaveTime = False
                          Properties.ShowTime = False
                          TabOrder = 1
                          Width = 105
                        end
                        object cxLabel287: TcxLabel
                          Left = 194
                          Top = 4
                          Caption = 'Gestational Age'
                          Transparent = True
                        end
                        object seUSSEDDGAWeeks1: TcxSpinEdit
                          Left = 289
                          Top = 2
                          Properties.SpinButtons.Visible = False
                          TabOrder = 2
                          Width = 28
                        end
                        object cxLabel288: TcxLabel
                          Left = 318
                          Top = 4
                          Caption = 'Weeks'
                          Transparent = True
                        end
                        object seSSEDDGADays1: TcxSpinEdit
                          Left = 355
                          Top = 2
                          Properties.SpinButtons.Visible = False
                          TabOrder = 3
                          Width = 28
                        end
                        object cxLabel289: TcxLabel
                          Left = 386
                          Top = 4
                          Caption = 'Days'
                          Transparent = True
                        end
                        object edtCRL1: TcxMaskEdit
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
                        object cxLabel23: TcxLabel
                          Left = 4
                          Top = 55
                          Caption = 'CRL'
                          Transparent = True
                        end
                        object cxLabel24: TcxLabel
                          Left = 111
                          Top = 54
                          Caption = 'BPD'
                          Transparent = True
                        end
                        object edtBPD1: TcxMaskEdit
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
                        object cxLabel27: TcxLabel
                          Left = 4
                          Top = 109
                          Caption = 'Nuchal Translucency Measurement'
                          Transparent = True
                        end
                        object edNucTransMeasurement1: TcxMaskEdit
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
                        object cxLabel32: TcxLabel
                          Left = 231
                          Top = 109
                          Caption = 'mm'
                          Transparent = True
                        end
                        object cgNasalBone1: TcxGroupBox
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
                          object cbNasalVisualised1: TcxCheckBox
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
                          object cbNasaAbsent1: TcxCheckBox
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
                          object cbNasalNotClear1: TcxCheckBox
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
                        object cxLabel159: TcxLabel
                          Left = 65
                          Top = 56
                          Caption = 'mm'
                          Transparent = True
                        end
                        object cxLabel160: TcxLabel
                          Left = 174
                          Top = 55
                          Caption = 'mm'
                          Transparent = True
                        end
                        object cbBiometryNotPerformed1: TcxCheckBox
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
                        object ntmeasureLabel1: TcxLabel
                          Left = 5
                          Top = 126
                          Caption = '(CRL 45 - 84 mm)'
                          Transparent = True
                        end
                        object cxLabel3: TcxLabel
                          Left = 14
                          Top = 236
                          Caption = 'Placenta Site'
                          Transparent = True
                        end
                        object cxLabel4: TcxLabel
                          Left = 11
                          Top = 262
                          Caption = 'Amniotic Fluid'
                          Transparent = True
                        end
                        object cbAmnioticFluid1: TcxComboBox
                          Left = 86
                          Top = 257
                          Properties.DropDownRows = 25
                          Properties.Items.Strings = (
                            'Normal')
                          TabOrder = 21
                          Text = 'Normal'
                          Width = 120
                        end
                        object cbPlacentaSite1: TcxComboBox
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
                      object cxgbAnatomy1: TcxGroupBox
                        Left = 2
                        Top = 2
                        Style.Edges = []
                        TabOrder = 0
                        Height = 32
                        Width = 686
                        object cxLabel13: TcxLabel
                          Left = 3
                          Top = 9
                          Caption = 'Fetal Anatomy'
                          Style.TextStyle = [fsBold]
                          Transparent = True
                        end
                        object cxGroupBox1: TcxGroupBox
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
                      object cxScrollBox1: TcxScrollBox
                        Left = 3
                        Top = 40
                        Width = 688
                        Height = 434
                        HorzScrollBar.Visible = False
                        TabOrder = 1
                        object cxgbTheChecks1: TcxGroupBox
                          Left = 1
                          Top = 4
                          PanelStyle.Active = True
                          Style.BorderStyle = ebsNone
                          Style.Edges = []
                          TabOrder = 0
                          Height = 427
                          Width = 691
                          object Bevel1: TBevel
                            Left = 5
                            Top = 137
                            Width = 544
                            Height = 3
                          end
                          object Bevel3: TBevel
                            Left = 5
                            Top = 97
                            Width = 548
                            Height = 2
                          end
                          object Bevel5: TBevel
                            Left = 4
                            Top = 289
                            Width = 550
                            Height = 2
                          end
                          object Bevel4: TBevel
                            Left = 3
                            Top = 190
                            Width = 551
                            Height = 2
                          end
                          object Bevel2: TBevel
                            Left = 5
                            Top = 239
                            Width = 550
                            Height = 2
                          end
                          object cbHeart4Chamber1: TcxCheckBox
                            Left = 53
                            Top = 114
                            Caption = '4CH'
                            TabOrder = 0
                            Transparent = True
                            Width = 47
                          end
                          object cbLVOT1: TcxCheckBox
                            Left = 201
                            Top = 114
                            Caption = 'LVOT'
                            TabOrder = 1
                            Transparent = True
                            Width = 48
                          end
                          object cbRVOT1: TcxCheckBox
                            Left = 305
                            Top = 114
                            Caption = 'RVOT'
                            TabOrder = 2
                            Transparent = True
                            Width = 54
                          end
                          object cbSitus1: TcxCheckBox
                            Left = 2
                            Top = 114
                            Caption = 'Situs'
                            TabOrder = 3
                            Transparent = True
                            Width = 53
                          end
                          object cbSkull1: TcxCheckBox
                            Left = 53
                            Top = 74
                            Caption = 'Skull'
                            TabOrder = 4
                            Transparent = True
                            Width = 51
                          end
                          object cbFalx1: TcxCheckBox
                            Left = 0
                            Top = 74
                            Caption = 'Falx'
                            TabOrder = 5
                            Transparent = True
                            Width = 52
                          end
                          object cbChoroids1: TcxCheckBox
                            Left = 113
                            Top = 75
                            Caption = 'Choroid'
                            TabOrder = 6
                            Transparent = True
                            Width = 64
                          end
                          object cbCoronal1: TcxCheckBox
                            Left = 2
                            Top = 210
                            Caption = 'Ossification'
                            TabOrder = 7
                            Transparent = True
                            Width = 88
                          end
                          object cbCordInsert1: TcxCheckBox
                            Left = 305
                            Top = 163
                            Caption = 'Cord Insertion'
                            TabOrder = 10
                            Transparent = True
                            Width = 97
                          end
                          object cbBladder1: TcxCheckBox
                            Left = 201
                            Top = 163
                            Caption = 'Bladder'
                            TabOrder = 9
                            Transparent = True
                            Width = 62
                          end
                          object cbStomach1: TcxCheckBox
                            Left = 1
                            Top = 162
                            Caption = 'Stomach'
                            TabOrder = 8
                            Transparent = True
                            Width = 74
                          end
                          object cb3VCord1: TcxCheckBox
                            Left = 412
                            Top = 163
                            Caption = '3VC'
                            TabOrder = 11
                            Transparent = True
                            Width = 68
                          end
                          object cbKidneys1: TcxCheckBox
                            Left = 113
                            Top = 163
                            Caption = 'Kidneys'
                            TabOrder = 12
                            Transparent = True
                            Width = 64
                          end
                          object cbFingers1: TcxCheckBox
                            Left = 205
                            Top = 257
                            Caption = 'Legs'
                            TabOrder = 15
                            Transparent = True
                            Width = 81
                          end
                          object cbHands1: TcxCheckBox
                            Left = 110
                            Top = 257
                            Caption = 'Hands'
                            TabOrder = 14
                            Transparent = True
                            Width = 81
                          end
                          object cbArms1: TcxCheckBox
                            Left = 2
                            Top = 257
                            Caption = 'Arms'
                            TabOrder = 13
                            Transparent = True
                            Width = 81
                          end
                          object cbFeet1: TcxCheckBox
                            Left = 305
                            Top = 257
                            Caption = 'Feet'
                            TabOrder = 16
                            Transparent = True
                            Width = 90
                          end
                          object cxLabel14: TcxLabel
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
                          object cxLabel15: TcxLabel
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
                          object cxLabel17: TcxLabel
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
                          object cxLabel18: TcxLabel
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
                          object cxLabel19: TcxLabel
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
                          object cb3VV1: TcxCheckBox
                            Left = 113
                            Top = 115
                            Caption = '3VV'
                            TabOrder = 22
                            Transparent = True
                            Width = 48
                          end
                          object cbVentricles1: TcxCheckBox
                            Left = 201
                            Top = 75
                            Caption = 'Ventricles'
                            TabOrder = 23
                            Transparent = True
                            Width = 73
                          end
                          object cbPostFossa1: TcxCheckBox
                            Left = 305
                            Top = 76
                            Caption = 'Post Fossa / ICT'
                            TabOrder = 24
                            Transparent = True
                            Width = 109
                          end
                          object cbCmagma1: TcxCheckBox
                            Left = 411
                            Top = 74
                            Caption = 'Orbits'
                            TabOrder = 25
                            Transparent = True
                            Width = 73
                          end
                          object cbLargeBMI1: TcxCheckBox
                            Left = -2
                            Top = 31
                            Caption = 'Large BMI'
                            Properties.Alignment = taLeftJustify
                            TabOrder = 26
                            Transparent = True
                            Width = 94
                          end
                          object cbEarlyGestation1: TcxCheckBox
                            Left = 98
                            Top = 31
                            Caption = 'Early Gestation'
                            Properties.Alignment = taLeftJustify
                            TabOrder = 27
                            Transparent = True
                            Width = 100
                          end
                          object cbAwkFetalPos1: TcxCheckBox
                            Left = 200
                            Top = 31
                            Caption = 'Awkward fetal position'
                            Properties.Alignment = taLeftJustify
                            TabOrder = 28
                            Transparent = True
                            Width = 154
                          end
                          object btnSelectAll1: TcxButton
                            Left = 3
                            Top = 5
                            Width = 75
                            Height = 25
                            Caption = 'Select All'
                            TabOrder = 29
                          end
                          object btnClear1: TcxButton
                            Left = 257
                            Top = 4
                            Width = 75
                            Height = 25
                            Caption = 'Clear'
                            TabOrder = 30
                          end
                          object cbDiaphragm1: TcxCheckBox
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
                        object cbBiometryNotPerformed2: TcxCheckBox
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
                        object cxLabelFetus23: TcxLabel
                          Left = 14
                          Top = 236
                          Caption = 'Placenta Site'
                          Transparent = True
                        end
                        object cxLabelFetus24: TcxLabel
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
                    object cxTabSheetFetus2_6: TcxTabSheet
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
                        object cxGroupBoxFetus2_2: TcxGroupBox
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
                      object cxScrollBoxFetus2: TcxScrollBox
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
                          object BevelFetus2_2: TBevel
                            Left = 5
                            Top = 137
                            Width = 544
                            Height = 3
                          end
                          object BevelFetus2_3: TBevel
                            Left = 5
                            Top = 97
                            Width = 548
                            Height = 2
                          end
                          object BevelFetus2_5: TBevel
                            Left = 4
                            Top = 289
                            Width = 550
                            Height = 2
                          end
                          object BevelFetus2_4: TBevel
                            Left = 3
                            Top = 190
                            Width = 551
                            Height = 2
                          end
                          object BevelFetus2_22: TBevel
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
              end
            end
            object cxtsUterusAndCervix: TcxTabSheet
              Caption = 'Uterus && Cervix'
              ImageIndex = 7
              object cxGroupBox14: TcxGroupBox
                Left = 0
                Top = 0
                Align = alClient
                PanelStyle.Active = True
                Style.BorderStyle = ebsNone
                Style.Edges = []
                TabOrder = 0
                Height = 538
                Width = 1198
                object cxGroupBox15: TcxGroupBox
                  Left = 2
                  Top = 2
                  Align = alTop
                  PanelStyle.Active = True
                  Style.BorderStyle = ebsNone
                  Style.Edges = []
                  TabOrder = 0
                  Height = 158
                  Width = 1194
                  object lblCervicalLength: TcxLabel
                    Left = 8
                    Top = 37
                    Caption = 'Cervical length'
                    Transparent = True
                  end
                  object meCervicalLength: TcxMaskEdit
                    Left = 98
                    Top = 35
                    Properties.IgnoreMaskBlank = True
                    Properties.MaskKind = emkRegExprEx
                    Properties.EditMask = '(\d?)\1'
                    Properties.MaxLength = 0
                    TabOrder = 1
                    Text = '00'
                    Width = 43
                  end
                  object cxLabel98: TcxLabel
                    Left = 141
                    Top = 37
                    Caption = 'mm'
                    Transparent = True
                  end
                  object cxGroupBox2: TcxGroupBox
                    Left = 166
                    Top = 36
                    Style.BorderStyle = ebsNone
                    Style.Edges = []
                    Style.LookAndFeel.NativeStyle = True
                    StyleDisabled.LookAndFeel.NativeStyle = True
                    StyleFocused.LookAndFeel.NativeStyle = True
                    StyleHot.LookAndFeel.NativeStyle = True
                    TabOrder = 3
                    Transparent = True
                    Height = 25
                    Width = 96
                    object cbCervixTVS: TcxCheckBox
                      Left = -2
                      Top = -1
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
                      Left = 48
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
                  object cxLabel229: TcxLabel
                    Left = 269
                    Top = 37
                    Caption = 'Funnelling of membranes'
                    Transparent = True
                  end
                  object cxGroupBox4: TcxGroupBox
                    Left = 403
                    Top = 36
                    Style.BorderStyle = ebsNone
                    Style.Edges = []
                    Style.LookAndFeel.NativeStyle = True
                    StyleDisabled.LookAndFeel.NativeStyle = True
                    StyleFocused.LookAndFeel.NativeStyle = True
                    StyleHot.LookAndFeel.NativeStyle = True
                    TabOrder = 5
                    Transparent = True
                    Height = 22
                    Width = 125
                    object cbFunnellingofmembranesYes: TcxCheckBox
                      Left = 0
                      Top = 2
                      Caption = 'Yes'
                      Style.LookAndFeel.NativeStyle = True
                      StyleDisabled.LookAndFeel.NativeStyle = True
                      StyleFocused.LookAndFeel.NativeStyle = True
                      StyleHot.LookAndFeel.NativeStyle = True
                      TabOrder = 0
                      Transparent = True
                      Width = 57
                    end
                    object cbFunnellingofmembranesNo: TcxCheckBox
                      Left = 51
                      Top = 2
                      Caption = 'No'
                      Style.LookAndFeel.NativeStyle = True
                      StyleDisabled.LookAndFeel.NativeStyle = True
                      StyleFocused.LookAndFeel.NativeStyle = True
                      StyleHot.LookAndFeel.NativeStyle = True
                      TabOrder = 1
                      Transparent = True
                      Width = 71
                    end
                  end
                  object edtSutureToOS: TcxMaskEdit
                    Left = 360
                    Top = 77
                    Enabled = False
                    Properties.IgnoreMaskBlank = True
                    Properties.MaskKind = emkRegExprEx
                    Properties.EditMask = '(\d?)(\d?)\1'#39'.'#39'\1\1'
                    Properties.MaxLength = 0
                    TabOrder = 8
                    Text = '0'
                    Width = 43
                  end
                  object cxLabel296: TcxLabel
                    Left = 403
                    Top = 79
                    Caption = 'mm'
                    Transparent = True
                  end
                  object cxLabel295: TcxLabel
                    Left = 215
                    Top = 79
                    Caption = 'Suture to external cervical os'
                    Transparent = True
                  end
                  object cxGroupBox8: TcxGroupBox
                    Left = 125
                    Top = 77
                    Style.BorderStyle = ebsNone
                    Style.Edges = []
                    Style.LookAndFeel.NativeStyle = True
                    StyleDisabled.LookAndFeel.NativeStyle = True
                    StyleFocused.LookAndFeel.NativeStyle = True
                    StyleHot.LookAndFeel.NativeStyle = True
                    TabOrder = 7
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
                  object cxLabel294: TcxLabel
                    Left = 8
                    Top = 79
                    Caption = 'Cervical suture present'
                    Transparent = True
                  end
                  object lblShortCervix: TcxLabel
                    Left = 8
                    Top = 58
                    Caption = 'Short Cervix < 25mm'
                    Transparent = True
                  end
                  object cxGroupBox47: TcxGroupBox
                    Left = 145
                    Top = 56
                    Style.BorderStyle = ebsNone
                    Style.Edges = []
                    Style.LookAndFeel.NativeStyle = True
                    StyleDisabled.LookAndFeel.NativeStyle = True
                    StyleFocused.LookAndFeel.NativeStyle = True
                    StyleHot.LookAndFeel.NativeStyle = True
                    TabOrder = 6
                    Transparent = True
                    Height = 21
                    Width = 81
                    object cbCervixShortYes: TcxCheckBox
                      Left = -4
                      Top = 1
                      Caption = 'Yes'
                      Style.TextStyle = []
                      TabOrder = 0
                      Transparent = True
                      Width = 44
                    end
                    object cbCervixShortNo: TcxCheckBox
                      Left = 39
                      Top = 1
                      Caption = 'No'
                      State = cbsChecked
                      TabOrder = 1
                      Transparent = True
                      Width = 40
                    end
                  end
                end
              end
            end
            object tsOvaries: TcxTabSheet
              Caption = 'Ovaries'
              ImageIndex = 0
              object cxLabel33: TcxLabel
                Left = 7
                Top = 3
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
              object cbLeftOvaryIdentified: TcxCheckBox
                Left = 352
                Top = 4
                Caption = 'Not Identified'
                TabOrder = 2
                Transparent = True
                Width = 98
              end
              object cbRightOvaryIdentified: TcxCheckBox
                Left = 82
                Top = 2
                Caption = 'Not Identified'
                TabOrder = 0
                Transparent = True
                Width = 92
              end
              object cxLabel78: TcxLabel
                Left = 277
                Top = 8
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
              object cbRightOvaryCL: TcxCheckBox
                Left = 159
                Top = 28
                Caption = 'Corpus Luteum'
                TabOrder = 1
                Transparent = True
                Width = 100
              end
              object cbLeftOvaryCL: TcxCheckBox
                Left = 439
                Top = 31
                Caption = 'Corpus Luteum'
                TabOrder = 3
                Transparent = True
                Width = 121
              end
              object cxGroupBox3: TcxGroupBox
                Left = 15
                Top = 29
                Style.BorderStyle = ebsNone
                Style.Edges = []
                Style.LookAndFeel.NativeStyle = True
                StyleDisabled.LookAndFeel.NativeStyle = True
                StyleFocused.LookAndFeel.NativeStyle = True
                StyleHot.LookAndFeel.NativeStyle = True
                TabOrder = 6
                Transparent = True
                Height = 21
                Width = 145
                object cbRightOvaryAbnormal: TcxCheckBox
                  Left = 69
                  Top = -1
                  Caption = 'Abnormal'
                  TabOrder = 0
                  Transparent = True
                  Width = 86
                end
                object cbRightOvaryNormal: TcxCheckBox
                  Left = 0
                  Top = -1
                  Caption = 'Normal'
                  TabOrder = 1
                  Transparent = True
                  Width = 62
                end
              end
              object cxGroupBox5: TcxGroupBox
                Left = 291
                Top = 31
                Style.BorderStyle = ebsNone
                Style.Edges = []
                Style.LookAndFeel.NativeStyle = True
                StyleDisabled.LookAndFeel.NativeStyle = True
                StyleFocused.LookAndFeel.NativeStyle = True
                StyleHot.LookAndFeel.NativeStyle = True
                TabOrder = 7
                Transparent = True
                Height = 21
                Width = 145
                object cbLeftOvaryAbnormal: TcxCheckBox
                  Left = 74
                  Top = 1
                  Caption = 'Abnormal'
                  TabOrder = 0
                  Transparent = True
                  Width = 87
                end
                object cbLeftOvaryNormal: TcxCheckBox
                  Left = 3
                  Top = 0
                  Caption = 'Normal'
                  TabOrder = 1
                  Transparent = True
                  Width = 60
                end
              end
            end
            object tsFibroids: TcxTabSheet
              Caption = 'Fibroids'
              ImageIndex = 7
              object gbFibroids: TcxGroupBox
                Left = 0
                Top = 0
                Align = alClient
                Caption = 'Fibroids'
                TabOrder = 0
                Height = 538
                Width = 1198
                object cxGroupBox9: TcxGroupBox
                  Left = 2
                  Top = 18
                  Align = alTop
                  PanelStyle.Active = True
                  Style.BorderStyle = ebsNone
                  Style.Edges = []
                  TabOrder = 0
                  Height = 22
                  Width = 1194
                  object cxLabel79: TcxLabel
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
                  object lblFibroid1: TcxLabel
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
                  object cxLabel22: TcxLabel
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
                  object cxLabel25: TcxLabel
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
                  object cxLabel26: TcxLabel
                    Left = 351
                    Top = 5
                    Caption = 'mm'
                    Transparent = True
                  end
                  object cxLabel28: TcxLabel
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
                  object cxLabel29: TcxLabel
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
                  object cxLabel75: TcxLabel
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
                  object cxLabel76: TcxLabel
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
                  object cxLabel77: TcxLabel
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
                  object cxLabel80: TcxLabel
                    Left = 347
                    Top = 5
                    Caption = 'mm'
                    Transparent = True
                  end
                  object cxLabel81: TcxLabel
                    Left = 403
                    Top = 5
                    Caption = 'cc'
                    Transparent = True
                  end
                  object seCloseToCrevix10: TcxSpinEdit
                    Left = 532
                    Top = 3
                    Enabled = False
                    Properties.AssignedValues.MinValue = True
                    Properties.SpinButtons.Visible = False
                    TabOrder = 13
                    Width = 30
                  end
                  object cxLabel82: TcxLabel
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
                  object cxLabel83: TcxLabel
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
                  object cxLabel84: TcxLabel
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
                  object cxLabel85: TcxLabel
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
                  object cxLabel86: TcxLabel
                    Left = 347
                    Top = 5
                    Caption = 'mm'
                    Transparent = True
                  end
                  object cxLabel87: TcxLabel
                    Left = 403
                    Top = 5
                    Caption = 'cc'
                    Transparent = True
                  end
                  object seCloseToCrevix9: TcxSpinEdit
                    Left = 532
                    Top = 3
                    Enabled = False
                    Properties.AssignedValues.MinValue = True
                    Properties.SpinButtons.Visible = False
                    TabOrder = 13
                    Width = 30
                  end
                  object cxLabel88: TcxLabel
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
                  object cxLabel89: TcxLabel
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
                  object cxLabel90: TcxLabel
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
                  object cxLabel91: TcxLabel
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
                  object cxLabel92: TcxLabel
                    Left = 347
                    Top = 5
                    Caption = 'mm'
                    Transparent = True
                  end
                  object cxLabel93: TcxLabel
                    Left = 403
                    Top = 5
                    Caption = 'cc'
                    Transparent = True
                  end
                  object seCloseToCrevix8: TcxSpinEdit
                    Left = 532
                    Top = 3
                    Enabled = False
                    Properties.AssignedValues.MinValue = True
                    Properties.SpinButtons.Visible = False
                    TabOrder = 13
                    Width = 30
                  end
                  object cxLabel94: TcxLabel
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
                  object cxLabel95: TcxLabel
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
                  object cxLabel96: TcxLabel
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
                  object cxLabel97: TcxLabel
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
                  object cxLabel99: TcxLabel
                    Left = 347
                    Top = 5
                    Caption = 'mm'
                    Transparent = True
                  end
                  object cxLabel100: TcxLabel
                    Left = 402
                    Top = 6
                    Caption = 'cc'
                    Transparent = True
                  end
                  object seCloseToCrevix7: TcxSpinEdit
                    Left = 531
                    Top = 3
                    Enabled = False
                    Properties.AssignedValues.MinValue = True
                    Properties.SpinButtons.Visible = False
                    TabOrder = 13
                    Width = 30
                  end
                  object cxLabel524: TcxLabel
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
                  object cxLabel185: TcxLabel
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
                  object cxLabel186: TcxLabel
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
                  object cxLabel187: TcxLabel
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
                  object cxLabel188: TcxLabel
                    Left = 347
                    Top = 5
                    Caption = 'mm'
                    Transparent = True
                  end
                  object cxLabel189: TcxLabel
                    Left = 403
                    Top = 5
                    Caption = 'cc'
                    Transparent = True
                  end
                  object seCloseToCrevix6: TcxSpinEdit
                    Left = 531
                    Top = 2
                    Enabled = False
                    Properties.AssignedValues.MinValue = True
                    Properties.SpinButtons.Visible = False
                    TabOrder = 13
                    Width = 30
                  end
                  object cxLabel523: TcxLabel
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
                  object cxLabel190: TcxLabel
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
                  object cxLabel191: TcxLabel
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
                  object cxLabel192: TcxLabel
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
                  object cxLabel193: TcxLabel
                    Left = 347
                    Top = 5
                    Caption = 'mm'
                    Transparent = True
                  end
                  object cxLabel194: TcxLabel
                    Left = 403
                    Top = 5
                    Caption = 'cc'
                    Transparent = True
                  end
                  object seCloseToCrevix5: TcxSpinEdit
                    Left = 532
                    Top = 2
                    Enabled = False
                    Properties.AssignedValues.MinValue = True
                    Properties.SpinButtons.Visible = False
                    TabOrder = 13
                    Width = 30
                  end
                  object cxLabel522: TcxLabel
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
                  object cxLabel195: TcxLabel
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
                  object cxLabel196: TcxLabel
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
                  object cxLabel197: TcxLabel
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
                  object cxLabel198: TcxLabel
                    Left = 347
                    Top = 1
                    Caption = 'mm'
                    Transparent = True
                  end
                  object cxLabel199: TcxLabel
                    Left = 403
                    Top = 1
                    Caption = 'cc'
                    Transparent = True
                  end
                  object seCloseToCrevix4: TcxSpinEdit
                    Left = 532
                    Top = 0
                    Enabled = False
                    Properties.AssignedValues.MinValue = True
                    Properties.SpinButtons.Visible = False
                    TabOrder = 13
                    Width = 30
                  end
                  object cxLabel521: TcxLabel
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
                  object cxLabel200: TcxLabel
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
                  object cxLabel201: TcxLabel
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
                  object cxLabel202: TcxLabel
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
                  object cxLabel203: TcxLabel
                    Left = 345
                    Top = 4
                    Caption = 'mm'
                    Transparent = True
                  end
                  object cxLabel204: TcxLabel
                    Left = 401
                    Top = 4
                    Caption = 'cc'
                    Transparent = True
                  end
                  object seCloseToCrevix3: TcxSpinEdit
                    Left = 530
                    Top = 2
                    Enabled = False
                    Properties.AssignedValues.MinValue = True
                    Properties.SpinButtons.Visible = False
                    TabOrder = 13
                    Width = 30
                  end
                  object cxLabel520: TcxLabel
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
                  object cxLabel205: TcxLabel
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
                  object cxLabel206: TcxLabel
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
                  object cxLabel207: TcxLabel
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
                  object cxLabel208: TcxLabel
                    Left = 347
                    Top = 5
                    Caption = 'mm'
                    Transparent = True
                  end
                  object cxLabel209: TcxLabel
                    Left = 403
                    Top = 5
                    Caption = 'cc'
                    Transparent = True
                  end
                  object seCloseToCrevix2: TcxSpinEdit
                    Left = 530
                    Top = 2
                    Enabled = False
                    Properties.AssignedValues.MinValue = True
                    Properties.SpinButtons.Visible = False
                    TabOrder = 13
                    Width = 30
                  end
                  object cxLabel519: TcxLabel
                    Left = 564
                    Top = 6
                    Caption = 'mm'
                    Transparent = True
                  end
                end
              end
            end
            object cxTabSheet4: TcxTabSheet
              Caption = 'Pre Eclampsia'
              ImageIndex = 4
              object cxScrollBox2: TcxScrollBox
                Left = 0
                Top = 0
                Width = 1198
                Height = 538
                Align = alTop
                TabOrder = 0
                object cbOrigin: TcxComboBox
                  Left = 220
                  Top = 67
                  Properties.DropDownRows = 25
                  Properties.Items.Strings = (
                    ''
                    'Caucasian'
                    'South Asian'
                    'Afro-Caribbean'
                    'East Asian'
                    'Mixed')
                  TabOrder = 0
                  Width = 175
                end
                object cxLabel16: TcxLabel
                  Left = 19
                  Top = 38
                  Caption = 'Maternal characteristics: '
                  ParentFont = False
                  Style.Font.Charset = DEFAULT_CHARSET
                  Style.Font.Color = clWindowText
                  Style.Font.Height = -11
                  Style.Font.Name = 'Tahoma'
                  Style.Font.Style = [fsBold]
                  Style.IsFontAssigned = True
                  Transparent = True
                end
                object edtHeight: TcxMaskEdit
                  Left = 220
                  Top = 34
                  Properties.IgnoreMaskBlank = True
                  Properties.MaskKind = emkRegExprEx
                  Properties.EditMask = '(\d?)(\d?)(\d?)\1'
                  Properties.MaxLength = 0
                  TabOrder = 2
                  Text = '00'
                  Width = 37
                end
                object cxLabel21: TcxLabel
                  Left = 177
                  Top = 38
                  Caption = 'Height'
                  Transparent = True
                end
                object cxLabel55: TcxLabel
                  Left = 256
                  Top = 38
                  Caption = 'cm'
                  Transparent = True
                end
                object edtWeight: TcxMaskEdit
                  Left = 350
                  Top = 34
                  Properties.IgnoreMaskBlank = True
                  Properties.MaskKind = emkRegExprEx
                  Properties.EditMask = '(\d?)(\d?)\1'
                  Properties.MaxLength = 0
                  TabOrder = 5
                  Text = '00'
                  Width = 37
                end
                object cxLabel56: TcxLabel
                  Left = 307
                  Top = 38
                  Caption = 'Weight'
                  Transparent = True
                end
                object cxLabel57: TcxLabel
                  Left = 390
                  Top = 38
                  Caption = 'Kg'
                  Transparent = True
                end
                object cxLabel58: TcxLabel
                  Left = 147
                  Top = 68
                  Caption = 'Racial Origin:'
                  Transparent = True
                end
                object cxLabel59: TcxLabel
                  Left = 115
                  Top = 98
                  Caption = 'Conception method:'
                  Transparent = True
                end
                object cbConceptionMethod: TcxComboBox
                  Left = 221
                  Top = 94
                  Properties.DropDownRows = 25
                  Properties.Items.Strings = (
                    ''
                    'Spontaneous'
                    'Ovulation drugs'
                    'IVF')
                  TabOrder = 10
                  Width = 175
                end
                object cxLabel60: TcxLabel
                  Left = 81
                  Top = 125
                  Caption = 'Smoking during pregnancy: '
                  Transparent = True
                end
                object cxGroupBox7: TcxGroupBox
                  Left = 225
                  Top = 124
                  Style.BorderStyle = ebsNone
                  Style.Edges = []
                  Style.LookAndFeel.NativeStyle = True
                  StyleDisabled.LookAndFeel.NativeStyle = True
                  StyleFocused.LookAndFeel.NativeStyle = True
                  StyleHot.LookAndFeel.NativeStyle = True
                  TabOrder = 12
                  Transparent = True
                  Height = 21
                  Width = 97
                  object cbSmokingYes: TcxCheckBox
                    Left = -4
                    Top = 1
                    Caption = 'Yes'
                    Style.TextStyle = []
                    TabOrder = 0
                    Transparent = True
                    Width = 44
                  end
                  object cbSmokingNo: TcxCheckBox
                    Left = 54
                    Top = 3
                    Caption = 'No'
                    TabOrder = 1
                    Transparent = True
                    Width = 40
                  end
                end
                object cxLabel61: TcxLabel
                  Left = 74
                  Top = 152
                  Caption = 'Mother of the patient had PE'
                  Transparent = True
                end
                object cxGroupBox11: TcxGroupBox
                  Left = 227
                  Top = 150
                  Style.BorderStyle = ebsNone
                  Style.Edges = []
                  Style.LookAndFeel.NativeStyle = True
                  StyleDisabled.LookAndFeel.NativeStyle = True
                  StyleFocused.LookAndFeel.NativeStyle = True
                  StyleHot.LookAndFeel.NativeStyle = True
                  TabOrder = 14
                  Transparent = True
                  Height = 21
                  Width = 97
                  object cbPEYes: TcxCheckBox
                    Left = -4
                    Top = 1
                    Caption = 'Yes'
                    Style.TextStyle = []
                    TabOrder = 0
                    Transparent = True
                    Width = 44
                  end
                  object cbPENo: TcxCheckBox
                    Left = 54
                    Top = 3
                    Caption = 'No'
                    TabOrder = 1
                    Transparent = True
                    Width = 40
                  end
                end
                object ccbPEMedicationHistory: TcxCheckComboBox
                  Left = 557
                  Top = 33
                  Properties.EmptySelectionText = 'Nil'
                  Properties.DropDownRows = 20
                  Properties.Items = <
                    item
                      Description = 'Chronic hypertension'
                      ShortDescription = 'Chronic hypertension'
                    end
                    item
                      Description = 'Diabetes type I'
                      ShortDescription = 'Diabetes type I'
                    end
                    item
                      Description = 'Diabetes type II'
                      ShortDescription = 'Diabetes type II'
                    end
                    item
                      Description = 'Systemic lupus erythematosus'
                      ShortDescription = 'Systemic lupus erythematosus'
                    end
                    item
                      Description = 'Anti-phospholipid Syndrome'
                      ShortDescription = 'Anti-phospholipid Syndrome'
                    end>
                  TabOrder = 15
                  Width = 244
                end
                object cxLabel20: TcxLabel
                  Left = 472
                  Top = 35
                  Caption = 'Medical history:'
                  Transparent = True
                end
                object cxLabel62: TcxLabel
                  Left = 463
                  Top = 64
                  Caption = 'Obstetric history:'
                  Transparent = True
                end
                object cbNalliPorous: TcxCheckBox
                  Left = 552
                  Top = 64
                  Caption = 'Nulliparous  (no previous pregnancies >=24w)'
                  Style.LookAndFeel.NativeStyle = True
                  StyleDisabled.LookAndFeel.NativeStyle = True
                  StyleFocused.LookAndFeel.NativeStyle = True
                  StyleHot.LookAndFeel.NativeStyle = True
                  TabOrder = 18
                  Transparent = True
                  Width = 249
                end
                object cbParous: TcxCheckBox
                  Left = 552
                  Top = 87
                  Caption = 'Parous (at least one pregnancy >=24w):'#9
                  Style.LookAndFeel.NativeStyle = True
                  StyleDisabled.LookAndFeel.NativeStyle = True
                  StyleFocused.LookAndFeel.NativeStyle = True
                  StyleHot.LookAndFeel.NativeStyle = True
                  TabOrder = 19
                  Transparent = True
                  Width = 246
                end
                object gbLastPregnancy: TcxGroupBox
                  Left = 466
                  Top = 109
                  TabOrder = 20
                  Visible = False
                  Height = 149
                  Width = 304
                  object lblDetails: TcxLabel
                    Left = 5
                    Top = 19
                    Caption = 'Details of last previous pregnancy >= 24 weeks'
                    Transparent = True
                  end
                  object lblPrevPE: TcxLabel
                    Left = 58
                    Top = 45
                    Caption = 'Preeclampsia:'
                    Transparent = True
                  end
                  object cxGroupBox12: TcxGroupBox
                    Left = 148
                    Top = 39
                    Style.BorderStyle = ebsNone
                    Style.Edges = []
                    Style.LookAndFeel.NativeStyle = True
                    StyleDisabled.LookAndFeel.NativeStyle = True
                    StyleFocused.LookAndFeel.NativeStyle = True
                    StyleHot.LookAndFeel.NativeStyle = True
                    TabOrder = 2
                    Transparent = True
                    Height = 21
                    Width = 97
                    object cbPrevPEYes: TcxCheckBox
                      Left = -4
                      Top = 1
                      Caption = 'Yes'
                      Style.TextStyle = []
                      TabOrder = 0
                      Transparent = True
                      Width = 44
                    end
                    object cbPrevPENo: TcxCheckBox
                      Left = 54
                      Top = 1
                      Caption = 'No'
                      TabOrder = 1
                      Transparent = True
                      Width = 40
                    end
                  end
                  object lblPrevDeliveryDate: TcxLabel
                    Left = 48
                    Top = 72
                    Caption = 'Date of delivery'
                    Transparent = True
                  end
                  object dtePrevDelivery: TcxDateEdit
                    Left = 147
                    Top = 67
                    TabOrder = 4
                    Width = 96
                  end
                  object lblPevGA: TcxLabel
                    Left = 27
                    Top = 95
                    Caption = 'Gestation at delivery'
                    Transparent = True
                  end
                  object sePrevGAWk: TcxSpinEdit
                    Left = 148
                    Top = 91
                    Properties.SpinButtons.Visible = False
                    TabOrder = 6
                    Width = 28
                  end
                  object lblPrevGAWk: TcxLabel
                    Left = 177
                    Top = 93
                    Caption = 'Weeks'
                    Transparent = True
                  end
                  object sePrevGADays: TcxSpinEdit
                    Left = 214
                    Top = 91
                    Properties.SpinButtons.Visible = False
                    TabOrder = 8
                    Visible = False
                    Width = 28
                  end
                  object lblPrevGADays: TcxLabel
                    Left = 245
                    Top = 93
                    Caption = 'Days'
                    Transparent = True
                    Visible = False
                  end
                  object cxLabel63: TcxLabel
                    Left = 66
                    Top = 118
                    Caption = 'Birth Weight'
                    Transparent = True
                  end
                  object meBirthWeight: TcxMaskEdit
                    Left = 148
                    Top = 118
                    Properties.IgnoreMaskBlank = True
                    Properties.MaskKind = emkRegExprEx
                    Properties.EditMask = '(\d?)(\d?)(\d?)\1'
                    Properties.MaxLength = 0
                    TabOrder = 11
                    Text = '00'
                    Width = 41
                  end
                  object cxLabel64: TcxLabel
                    Left = 191
                    Top = 122
                    Caption = 'g'
                    Transparent = True
                  end
                end
                object cxLabel65: TcxLabel
                  Left = 22
                  Top = 187
                  Caption = 'Pregnancy dating:'
                  ParentFont = False
                  Style.Font.Charset = DEFAULT_CHARSET
                  Style.Font.Color = clWindowText
                  Style.Font.Height = -11
                  Style.Font.Name = 'Tahoma'
                  Style.Font.Style = [fsBold]
                  Style.IsFontAssigned = True
                  Transparent = True
                end
                object edtPEDatingCRL: TcxMaskEdit
                  Left = 224
                  Top = 184
                  Properties.IgnoreMaskBlank = True
                  Properties.MaskKind = emkRegExprEx
                  Properties.EditMask = '(\d?)(\d?)\1'#39'.'#39'(\d?)\1'
                  Properties.MaxLength = 0
                  TabOrder = 22
                  Text = '00'
                  Width = 37
                end
                object lblPEDatingCRL: TcxLabel
                  Left = 187
                  Top = 188
                  Caption = 'CRL'
                  Transparent = True
                end
                object lblPEDatingMeasure: TcxLabel
                  Left = 259
                  Top = 188
                  Caption = 'mm'
                  Transparent = True
                end
                object cxLabel66: TcxLabel
                  Left = 22
                  Top = 210
                  Caption = 'Biophysical measurements:'
                  ParentFont = False
                  Style.Font.Charset = DEFAULT_CHARSET
                  Style.Font.Color = clWindowText
                  Style.Font.Height = -11
                  Style.Font.Name = 'Tahoma'
                  Style.Font.Style = [fsBold]
                  Style.IsFontAssigned = True
                  Transparent = True
                end
                object cxLabel67: TcxLabel
                  Left = 150
                  Top = 233
                  Caption = 'MAP(mmHg):'
                  Transparent = True
                end
                object edtMAP: TcxMaskEdit
                  Left = 224
                  Top = 229
                  Properties.IgnoreMaskBlank = True
                  Properties.MaskKind = emkRegExprEx
                  Properties.EditMask = '(\d?)(\d?)\1'#39'.'#39'(\d?)\1'
                  Properties.MaxLength = 0
                  TabOrder = 27
                  Text = '00'
                  Width = 37
                end
                object cxLabel68: TcxLabel
                  Left = 150
                  Top = 260
                  Caption = 'Mean UTPI:'
                  Transparent = True
                end
                object edtUTPUI: TcxMaskEdit
                  Left = 224
                  Top = 259
                  Properties.IgnoreMaskBlank = True
                  Properties.MaskKind = emkRegExprEx
                  Properties.EditMask = '(\d?)(\d?)\1'#39'.'#39'(\d?)\1'
                  Properties.MaxLength = 0
                  TabOrder = 29
                  Text = '00'
                  Width = 37
                end
                object cxLabel70: TcxLabel
                  Left = 22
                  Top = 286
                  Caption = 'Biochemical measurements:'
                  ParentFont = False
                  Style.Font.Charset = DEFAULT_CHARSET
                  Style.Font.Color = clWindowText
                  Style.Font.Height = -11
                  Style.Font.Name = 'Tahoma'
                  Style.Font.Style = [fsBold]
                  Style.IsFontAssigned = True
                  Transparent = True
                end
                object cxLabel71: TcxLabel
                  Left = 121
                  Top = 311
                  Caption = 'Date of blood test:'
                  Transparent = True
                end
                object cxLabel72: TcxLabel
                  Left = 121
                  Top = 334
                  Caption = 'PlGF (MoM)'
                  Transparent = True
                end
                object cxLabel73: TcxLabel
                  Left = 121
                  Top = 357
                  Caption = 'PAPP - A (MoM)'
                  Transparent = True
                end
                object dteBloodTest: TcxDateEdit
                  Left = 223
                  Top = 308
                  TabOrder = 34
                  Width = 96
                end
                object edtPIGF: TcxMaskEdit
                  Left = 223
                  Top = 330
                  Properties.IgnoreMaskBlank = True
                  Properties.MaskKind = emkRegExprEx
                  Properties.EditMask = '(\d?)(\d?)\1'#39'.'#39'(\d?)\1'
                  Properties.MaxLength = 0
                  TabOrder = 35
                  Text = '00'
                  Width = 37
                end
                object edtPAPP: TcxMaskEdit
                  Left = 223
                  Top = 352
                  Properties.IgnoreMaskBlank = True
                  Properties.MaskKind = emkRegExprEx
                  Properties.EditMask = '(\d?)(\d?)\1'#39'.'#39'(\d?)\1'
                  Properties.MaxLength = 0
                  TabOrder = 36
                  Text = '00'
                  Width = 37
                end
                object cxLabel74: TcxLabel
                  Left = 114
                  Top = 8
                  Caption = 'PE Done'
                  ParentFont = False
                  Style.Font.Charset = DEFAULT_CHARSET
                  Style.Font.Color = clWindowText
                  Style.Font.Height = -11
                  Style.Font.Name = 'Tahoma'
                  Style.Font.Style = [fsBold]
                  Style.IsFontAssigned = True
                  Transparent = True
                end
                object cxGroupBox13: TcxGroupBox
                  Left = 174
                  Top = 7
                  Style.BorderStyle = ebsNone
                  Style.Edges = []
                  Style.LookAndFeel.NativeStyle = True
                  StyleDisabled.LookAndFeel.NativeStyle = True
                  StyleFocused.LookAndFeel.NativeStyle = True
                  StyleHot.LookAndFeel.NativeStyle = True
                  TabOrder = 38
                  Transparent = True
                  Height = 21
                  Width = 97
                  object cbPEDoneYes: TcxCheckBox
                    Left = -4
                    Top = 1
                    Caption = 'Yes'
                    Style.TextStyle = []
                    TabOrder = 0
                    Transparent = True
                    Width = 44
                  end
                  object CbPEDoneNo: TcxCheckBox
                    Left = 54
                    Top = 1
                    Caption = 'No'
                    TabOrder = 1
                    Transparent = True
                    Width = 40
                  end
                end
              end
            end
          end
          object gbEDDDating: TcxGroupBox
            Left = 2
            Top = 166
            Margins.Left = 0
            Margins.Top = 0
            Margins.Right = 0
            Margins.Bottom = 0
            Align = alTop
            Caption = 'Dating'
            Style.BorderStyle = ebsNone
            Style.Edges = []
            TabOrder = 2
            Height = 100
            Width = 1198
            object cxGroupBox6: TcxGroupBox
              Left = 2
              Top = 18
              Align = alTop
              PanelStyle.Active = True
              Style.BorderStyle = ebsNone
              Style.Edges = []
              Style.LookAndFeel.NativeStyle = False
              StyleDisabled.LookAndFeel.NativeStyle = False
              StyleFocused.LookAndFeel.NativeStyle = False
              StyleHot.LookAndFeel.NativeStyle = False
              TabOrder = 0
              Height = 26
              Width = 1194
              object cbEDDPrinciple: TcxComboBox
                Left = 75
                Top = 1
                Properties.Items.Strings = (
                  'Stated EDD'
                  'No Dates'
                  'Menstrual EDD'
                  'City established EDD'
                  'IVF Embryo transfer')
                Style.BorderColor = clRed
                Style.BorderStyle = ebsThick
                Style.Edges = [bLeft, bTop, bRight, bBottom]
                Style.Shadow = True
                TabOrder = 0
                Width = 155
              end
              object cxLabel1: TcxLabel
                Left = 3
                Top = 4
                Caption = 'EDD Principle'
                Transparent = True
              end
              object lblMedication: TcxLabel
                Left = 744
                Top = -9
                Caption = 'Medication'
                Transparent = True
                Visible = False
              end
              object cbNaturalMedication: TcxComboBox
                Left = 744
                Top = 14
                Properties.Items.Strings = (
                  'Nil'
                  'Aspirin'
                  'Aspirin and heparin'
                  'Other')
                TabOrder = 3
                Text = 'Nil'
                Visible = False
                Width = 151
              end
              object edtMedicationOther: TcxTextEdit
                Left = 737
                Top = 14
                Enabled = False
                TabOrder = 4
                Visible = False
                Width = 150
              end
              object btnPregnancyRedated: TcxButton
                Left = 245
                Top = 0
                Width = 139
                Height = 20
                Caption = 'Re-Date Pregnancy'
                TabOrder = 5
              end
              object cbPregnancyRedatedYes: TcxCheckBox
                Left = 399
                Top = -2
                Caption = 'Pregnancy Re-dated'
                Enabled = False
                TabOrder = 6
                Transparent = True
                Width = 144
              end
            end
            object pcEDDPrinciple: TcxPageControl
              Left = 2
              Top = 44
              Width = 1194
              Height = 54
              Align = alClient
              TabOrder = 1
              Properties.ActivePage = tsEstEDD
              Properties.CustomButtons.Buttons = <>
              Properties.TabPosition = tpRight
              ClientRectBottom = 54
              ClientRectRight = 1170
              ClientRectTop = 0
              object tsMenstrualEDD: TcxTabSheet
                Caption = 'tsMenstrualEDD'
                ImageIndex = 0
                object cxLabel11: TcxLabel
                  Left = 1
                  Top = 4
                  Caption = 'LMP Date'
                  Transparent = True
                end
                object deLMPDate: TcxDateEdit
                  Left = 56
                  Top = 2
                  Properties.SaveTime = False
                  Properties.ShowTime = False
                  TabOrder = 1
                  Width = 105
                end
                object deMenstrualEDD: TcxDateEdit
                  Left = 268
                  Top = 2
                  Properties.SaveTime = False
                  Properties.ShowTime = False
                  TabOrder = 2
                  Width = 105
                end
                object cxLabel12: TcxLabel
                  Left = 379
                  Top = 4
                  Caption = 'Gestational Age'
                  Transparent = True
                end
                object seEDDCalGAWeeks: TcxSpinEdit
                  Left = 460
                  Top = 2
                  Properties.SpinButtons.Visible = False
                  TabOrder = 4
                  Width = 38
                end
                object cxLabel30: TcxLabel
                  Left = 497
                  Top = 4
                  Caption = 'W'
                  Transparent = True
                end
                object seEDDCalGADays: TcxSpinEdit
                  Left = 511
                  Top = 2
                  Properties.SpinButtons.Visible = False
                  TabOrder = 6
                  Width = 38
                end
                object cxLabel31: TcxLabel
                  Left = 548
                  Top = 4
                  Caption = 'D'
                  Transparent = True
                end
                object cxLabel34: TcxLabel
                  Left = 163
                  Top = 4
                  Caption = 'Menstrual EDD date'
                  Transparent = True
                end
              end
              object tsStatedEDD: TcxTabSheet
                Caption = 'tsStatedEDD'
                ImageIndex = 1
                object cxLabel35: TcxLabel
                  Left = 20
                  Top = 3
                  Caption = 'Stated EDD date'
                  Transparent = True
                end
                object deStatedEDD: TcxDateEdit
                  Left = 125
                  Top = 1
                  Properties.SaveTime = False
                  Properties.ShowTime = False
                  TabOrder = 1
                  Width = 105
                end
                object cxLabel36: TcxLabel
                  Left = 236
                  Top = 3
                  Caption = 'Gestational Age'
                  Transparent = True
                end
                object seStatedEDDGestAgeWeeks: TcxSpinEdit
                  Left = 317
                  Top = 1
                  Properties.SpinButtons.Visible = False
                  TabOrder = 3
                  Width = 38
                end
                object cxLabel37: TcxLabel
                  Left = 354
                  Top = 3
                  Caption = 'W'
                  Transparent = True
                end
                object seStatedEDDGestAgeDays: TcxSpinEdit
                  Left = 368
                  Top = 1
                  Properties.SpinButtons.Visible = False
                  TabOrder = 5
                  Width = 38
                end
                object cxLabel38: TcxLabel
                  Left = 405
                  Top = 3
                  Caption = 'D'
                  Transparent = True
                end
              end
              object tsEstEDD: TcxTabSheet
                Caption = 'tsEstEDD'
                ImageIndex = 2
                object cxLabel39: TcxLabel
                  Left = 17
                  Top = 3
                  Caption = 'Established EDD date'
                  Transparent = True
                end
                object deMUFWEdd: TcxDateEdit
                  Left = 125
                  Top = 1
                  Properties.SaveTime = False
                  Properties.ShowTime = False
                  TabOrder = 1
                  Width = 105
                end
                object cxLabel40: TcxLabel
                  Left = 236
                  Top = 3
                  Caption = 'Gestational Age'
                  Transparent = True
                end
                object seMUFWGestAgeWeeks: TcxSpinEdit
                  Left = 317
                  Top = 3
                  Properties.SpinButtons.Visible = False
                  TabOrder = 3
                  Width = 38
                end
                object cxLabel41: TcxLabel
                  Left = 354
                  Top = 3
                  Caption = 'W'
                  Transparent = True
                end
                object seMUFWGestAgeDays: TcxSpinEdit
                  Left = 368
                  Top = 1
                  Properties.SpinButtons.Visible = False
                  TabOrder = 5
                  Width = 38
                end
                object cxLabel42: TcxLabel
                  Left = 405
                  Top = 3
                  Caption = 'D'
                  Transparent = True
                end
              end
              object tsTimedEDD: TcxTabSheet
                Caption = 'tsTimedEDD'
                ImageIndex = 3
                object cxLabel43: TcxLabel
                  Left = 1
                  Top = 4
                  Caption = 'Ovulation date'
                  Transparent = True
                end
                object deOvulationDate: TcxDateEdit
                  Left = 75
                  Top = 2
                  Properties.SaveTime = False
                  Properties.ShowTime = False
                  TabOrder = 1
                  Width = 105
                end
                object cxLabel44: TcxLabel
                  Left = 182
                  Top = 4
                  Caption = 'EDD date'
                  Transparent = True
                end
                object deOvulationEDD: TcxDateEdit
                  Left = 235
                  Top = 2
                  Properties.SaveTime = False
                  Properties.ShowTime = False
                  TabOrder = 3
                  Width = 105
                end
                object cxLabel45: TcxLabel
                  Left = 346
                  Top = 4
                  Caption = 'Gestational Age'
                  Transparent = True
                end
                object spOvualtionGestAgeWeeks: TcxSpinEdit
                  Left = 427
                  Top = 2
                  Properties.SpinButtons.Visible = False
                  TabOrder = 5
                  Width = 38
                end
                object cxLabel46: TcxLabel
                  Left = 464
                  Top = 4
                  Caption = 'W'
                  Transparent = True
                end
                object spOvualtionGestAgeDays: TcxSpinEdit
                  Left = 478
                  Top = 2
                  Properties.SpinButtons.Visible = False
                  TabOrder = 7
                  Width = 38
                end
                object cxLabel47: TcxLabel
                  Left = 515
                  Top = 4
                  Caption = 'D'
                  Transparent = True
                end
              end
              object tsIVFEDD: TcxTabSheet
                Caption = 'tsIVFEDD'
                ImageIndex = 4
                object cxLabel48: TcxLabel
                  Left = 3
                  Top = 3
                  Caption = 'Date of Conception'
                  Transparent = True
                end
                object deConceptionDate: TcxDateEdit
                  Left = 108
                  Top = 1
                  Properties.SaveTime = False
                  Properties.ShowTime = False
                  TabOrder = 1
                  Width = 103
                end
                object cxLabel49: TcxLabel
                  Left = 3
                  Top = 25
                  Caption = 'Embryo Transfer Day'
                  Transparent = True
                end
                object seTransferDay: TcxSpinEdit
                  Left = 108
                  Top = 23
                  Properties.AssignedValues.MinValue = True
                  Properties.MaxValue = 5.000000000000000000
                  TabOrder = 3
                  Width = 41
                end
                object cxLabel50: TcxLabel
                  Left = 166
                  Top = 25
                  Caption = 'Transfer Date'
                  Transparent = True
                end
                object deTransferDate: TcxDateEdit
                  Left = 238
                  Top = 23
                  TabOrder = 5
                  Width = 96
                end
                object cxLabel10: TcxLabel
                  Left = 341
                  Top = 25
                  Caption = 'Number Transferred'
                  Transparent = True
                end
                object cxLabel51: TcxLabel
                  Left = 340
                  Top = 3
                  Caption = 'Gestational Age'
                  Transparent = True
                end
                object deIVFEDD: TcxDateEdit
                  Left = 238
                  Top = 1
                  TabOrder = 8
                  Width = 96
                end
                object cxLabel52: TcxLabel
                  Left = 216
                  Top = 3
                  Caption = 'EDD'
                  Transparent = True
                end
                object seIVFGAWeeks: TcxSpinEdit
                  Left = 421
                  Top = 1
                  Properties.SpinButtons.Visible = False
                  TabOrder = 10
                  Width = 30
                end
                object cxLabel53: TcxLabel
                  Left = 459
                  Top = 3
                  Caption = 'W'
                  Transparent = True
                end
                object seIVFGADays: TcxSpinEdit
                  Left = 473
                  Top = 1
                  Properties.SpinButtons.Visible = False
                  TabOrder = 12
                  Width = 30
                end
                object cxLabel54: TcxLabel
                  Left = 502
                  Top = 3
                  Caption = 'D'
                  Transparent = True
                end
                object seNumberTransferred: TcxSpinEdit
                  Left = 448
                  Top = 23
                  Properties.AssignedValues.MinValue = True
                  Properties.MaxValue = 10.000000000000000000
                  TabOrder = 14
                  Width = 41
                end
                object lbDonorOva: TcxLabel
                  Left = 48
                  Top = 46
                  Caption = 'Donor Ova'
                  Transparent = True
                  Visible = False
                end
                object cbDonorOvaYes: TcxCheckBox
                  Left = 100
                  Top = 44
                  Caption = 'Yes'
                  Properties.Alignment = taLeftJustify
                  TabOrder = 16
                  Transparent = True
                  Visible = False
                  Width = 47
                end
                object cbDonorOvaNo: TcxCheckBox
                  Left = 136
                  Top = 44
                  Caption = 'No'
                  TabOrder = 17
                  Transparent = True
                  Visible = False
                  Width = 37
                end
                object deDonorAge: TcxDateEdit
                  Left = 238
                  Top = 44
                  TabOrder = 18
                  Visible = False
                  Width = 96
                end
                object lbDonorDOB: TcxLabel
                  Left = 179
                  Top = 46
                  Caption = 'Donor DOB'
                  Transparent = True
                  Visible = False
                end
              end
            end
          end
          object cxGroupBox27: TcxGroupBox
            Left = 2
            Top = 266
            Align = alTop
            Style.BorderStyle = ebsNone
            Style.Edges = []
            TabOrder = 3
            Height = 31
            Width = 1198
            object cxLabel369: TcxLabel
              Left = 3
              Top = 3
              Caption = 'Gestation Type'
              Transparent = True
            end
            object cbGestationType: TcxComboBox
              Left = 100
              Top = 1
              Properties.DropDownRows = 20
              Properties.Items.Strings = (
                ''
                'Singleton'
                'Twins'
                )
              Style.BorderColor = clRed
              Style.BorderStyle = ebsThick
              Style.Shadow = True
              TabOrder = 0
              Width = 163
            end
          end
        end
        object cxGroupBox38: TcxGroupBox
          Left = 0
          Top = 825
          Align = alClient
          PanelStyle.Active = True
          Style.BorderStyle = ebsNone
          Style.Edges = []
          TabOrder = 1
          Height = 0
          Width = 1202
        end
      end
    end
  end
end