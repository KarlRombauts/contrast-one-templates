inherited Third_Trimester_Twins: TContrastReportDetailTemplate
  Left = 0
  Top = 0
  Width = 471
  Height = 513
  Align = alClient
  TabOrder = 0
  inherited cxpcReportMainPage: TcxPageControl
    Left = 0
    Top = 0
    Width = 471
    Height = 513
    Align = alClient
    TabOrder = 0
    Properties.ActivePage = cxtsReportDetails
    Properties.CustomButtons.Buttons = <>
    ExplicitWidth = 720
    ExplicitHeight = 541
    ClientRectBottom = 513
    ClientRectRight = 471
    ClientRectTop = 24
    object cxtsReportDetails: TcxTabSheet
      Caption = 'Details'
      ImageIndex = 1
      ExplicitWidth = 720
      ExplicitHeight = 517
      object ScrollBox1: TScrollBox
        Left = 0
        Top = 0
        Width = 471
        Height = 489
        Align = alClient
        TabOrder = 0
        ExplicitWidth = 720
        ExplicitHeight = 517
        object cxGroupBox1: TcxGroupBox
          Left = 0
          Top = 0
          TabStop = True
          Align = alTop
          PanelStyle.Active = True
          TabOrder = 0
          ExplicitWidth = 716
          Height = 128
          Width = 467
          object cxLabel2: TcxLabel
            Left = 60
            Top = 6
            Caption = 'Exam date'
            Transparent = True
          end
          object deExamDate: TcxDateEdit
            Left = 118
            Top = 4
            Properties.ImmediatePost = True
            Properties.ShowTime = False
            TabOrder = 1
            Width = 121
          end
          object cxLabel1: TcxLabel
            Left = 24
            Top = 27
            Caption = 'Referral indication'
            Transparent = True
          end
          object cxLabel4: TcxLabel
            Left = 31
            Top = 76
            Caption = 'Obstetric history'
            Transparent = True
          end
          object edtOtherPastHistory1: TcxTextEdit
            Left = 118
            Top = 97
            Enabled = False
            TabOrder = 5
            Width = 399
          end
          object cxLabel256: TcxLabel
            Left = 387
            Top = 3
            Caption = '3rd Twins (02.02.02 31/05/2021)' 
            Transparent = True
          end
          object cxccbReferralIndicators: TcxCheckComboBox
            Left = 118
            Top = 26
            Properties.DropDownRows = 20
            Properties.Items = <
              item
                Description = 'Assess fetal growth and well-being'
                ShortDescription = 'Assess fetal growth and well-being'
              end
              item
                Description = 'Reduced fetal movements'
                ShortDescription = 'Reduced fetal movements'
              end
              item
                Description = 'Clinically small for dates'
                ShortDescription = 'Clinically small for dates'
              end
              item
                Description = 'Clinically large for dates'
                ShortDescription = 'Clinically large for dates'
              end
              item
                Description = 'Review pyelectasis'
                ShortDescription = 'Review pyelectasis'
              end
              item
                Description = 'APH'
                ShortDescription = 'APH'
              end
              item
                Description = 'Assess placental position'
                ShortDescription = 'Assess placental position'
              end
              item
                Description = 'Assess cervical length'
                ShortDescription = 'Assess cervical length'
              end
              item
                Description = 'GDM'
                ShortDescription = 'GDM'
              end
              item
                Description = 'Ongoing surveillance'
                ShortDescription = 'Ongoing surveillance'
              end
              item
                Description = 'Ongoing surveillance for TTTS and TAPS'
                ShortDescription = 'Ongoing surveillance for TTTS and TAPS'
              end
              item
                Description = 'Post laser for TTTS'
                ShortDescription = 'Post laser for TTTS'
              end
              item
                Description = 'IUGR'
                ShortDescription = 'IUGR'
              end
              item
                Description = 'Selective IUGR'
                ShortDescription = 'Selective IUGR'
              end
              item
                Description = 'Growth discordance'
                ShortDescription = 'Growth discordance'
              end
              item
                Description = 'Other'
                ShortDescription = 'Other'
              end>
            Style.BorderColor = clRed
            Style.BorderStyle = ebsThick
            TabOrder = 2
            Width = 399
          end
          object cxccbObstetricHistory: TcxCheckComboBox
            Left = 118
            Top = 74
            Properties.Items = <
              item
                Description = 'Preterm labour'
                ShortDescription = 'Preterm labour'
              end
              item
                Description = 'PPROM'
                ShortDescription = 'PPROM'
              end
              item
                Description = 'Cervical incompetence'
                ShortDescription = 'Cervical incompetence'
              end
              item
                Description = 'FDIU'
                ShortDescription = 'FDIU'
              end
              item
                Description = 'IUGR'
                ShortDescription = 'IUGR'
              end
              item
                Description = 'Caesarean delivery'
                ShortDescription = 'Caesarean delivery'
              end
              item
                Description = 'Cervical cerclage'
                ShortDescription = 'Cervical cerclage'
              end
              item
                Description = 'Other'
                ShortDescription = 'Other'
              end>
            TabOrder = 4
            Width = 399
          end
          object edtReferralIndicator1: TcxTextEdit
            Left = 118
            Top = 49
            Enabled = False
            TabOrder = 8
            Width = 399
          end
        end
        object gbEDDDating: TcxGroupBox
          Left = 0
          Top = 128
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          TabStop = True
          Align = alTop
          Caption = 'Dating'
          Style.BorderStyle = ebsNone
          Style.Edges = []
          TabOrder = 1
          ExplicitWidth = 716
          Height = 51
          Width = 467
          object pcEDDPrinciple: TcxPageControl
            Left = 2
            Top = 18
            Width = 463
            Height = 31
            Align = alClient
            TabOrder = 0
            Properties.ActivePage = tsStatedEDD
            Properties.CustomButtons.Buttons = <>
            Properties.TabPosition = tpRight
            ExplicitWidth = 712
            ClientRectBottom = 31
            ClientRectRight = 461
            ClientRectTop = 0
            object tsStatedEDD: TcxTabSheet
              Caption = 'tsStatedEDD'
              ImageIndex = 1
              ExplicitWidth = 710
              object cxLabel16: TcxLabel
                Left = 87
                Top = 2
                Caption = ' EDD'
                Transparent = True
              end
              object deStatedEDD: TcxDateEdit
                Left = 123
                Top = 1
                Properties.SaveTime = False
                Properties.ShowTime = False
                TabOrder = 1
                Width = 105
              end
              object cxLabel17: TcxLabel
                Left = 234
                Top = 3
                Caption = 'Gestational Age'
                Transparent = True
              end
              object seEDDCalGAWeeks: TcxSpinEdit
                Left = 315
                Top = 1
                Properties.SpinButtons.Visible = False
                TabOrder = 3
                Width = 38
              end
              object cxLabel18: TcxLabel
                Left = 352
                Top = 3
                Caption = 'W'
                Transparent = True
              end
              object seEDDCalGADays: TcxSpinEdit
                Left = 366
                Top = 1
                Properties.SpinButtons.Visible = False
                TabOrder = 5
                Width = 38
              end
              object cxLabel19: TcxLabel
                Left = 403
                Top = 3
                Caption = 'D'
                Transparent = True
              end
            end
          end
        end
        object cxGroupBox23: TcxGroupBox
          Left = 0
          Top = 179
          TabStop = True
          Align = alTop
          Style.BorderStyle = ebsNone
          Style.Edges = []
          TabOrder = 2
          ExplicitWidth = 716
          Height = 32
          Width = 467
          object cxLabel377: TcxLabel
            Left = 39
            Top = 0
            Caption = 'Gestation Type'
            Transparent = True
          end
          object cbGestationType1: TcxComboBox
            Left = 550
            Top = 2
            Properties.DropDownRows = 20
            Properties.Items.Strings = (
              ''
              'Singleton')
            Style.BorderColor = clRed
            Style.BorderStyle = ebsThick
            Style.Shadow = True
            TabOrder = 1
            Visible = False
            Width = 290
          end
          object ccbGestationType: TcxCheckComboBox
            Left = 118
            Top = 0
            Properties.DropDownRows = 20
            Properties.Items = <
              item
                Description = 'DCDA twins'
                ShortDescription = 'DCDA twin pregnancy'
              end
              item
                Description = 'MCDA twins'
                ShortDescription = 'MCDA twin pregnancy'
              end
              item
                Description = 'MCMA twins'
                ShortDescription = 'MCMA twin pregnancy'
              end
              item
                Description = 'Now singleton pregnancy'
                ShortDescription = 'Now singleton pregnancy'
              end>
            Style.BorderColor = clRed
            Style.BorderStyle = ebsThick
            TabOrder = 2
            Width = 237
          end
        end
        object pgFetusMeasusements: TcxPageControl
          Left = 0
          Top = 211
          Width = 467
          Height = 274
          Align = alClient
          TabOrder = 3
          Properties.ActivePage = cxtsFetus1
          Properties.CustomButtons.Buttons = <>
          ExplicitWidth = 716
          ExplicitHeight = 302
          ClientRectBottom = 274
          ClientRectRight = 467
          ClientRectTop = 24
          object cxtsFetus1: TcxTabSheet
            Caption = 'Fetus 1'
            ImageIndex = 0
            ExplicitWidth = 716
            ExplicitHeight = 278
            object cxpgFetus1: TcxPageControl
              Left = 0
              Top = 0
              Width = 467
              Height = 250
              Align = alClient
              TabOrder = 0
              Properties.ActivePage = cxtsFetusGeneral1
              Properties.CustomButtons.Buttons = <>
              ExplicitWidth = 716
              ExplicitHeight = 278
              ClientRectBottom = 250
              ClientRectRight = 467
              ClientRectTop = 24
              object cxtsFetusGeneral1: TcxTabSheet
                Caption = 'General'
                ImageIndex = 0
                ExplicitWidth = 716
                ExplicitHeight = 254
                object Bevel1: TBevel
                  Left = 377
                  Top = 461
                  Width = 541
                  Height = 3
                  Style = bsRaised
                end
                object cxScrollBox1: TcxScrollBox
                  Left = 0
                  Top = 0
                  Width = 467
                  Height = 509
                  Align = alTop
                  HorzScrollBar.Tracking = True
                  TabOrder = 0
                  VertScrollBar.Tracking = True
                  ExplicitWidth = 716
                  object GroupBoxFetus1: TcxGroupBox
                    Left = 4
                    Top = 38
                    PanelStyle.Active = True
                    Style.BorderStyle = ebsNone
                    Style.Edges = []
                    TabOrder = 0
                    Height = 467
                    Width = 1111
                    object Bevel2: TBevel
                      Left = 10
                      Top = 185
                      Width = 450
                      Height = 3
                      Style = bsRaised
                    end
                    object Bevel3: TBevel
                      Left = 9
                      Top = 153
                      Width = 450
                      Height = 3
                      Style = bsRaised
                    end
                    object seEstFetalWeight1: TcxSpinEdit
                      Left = 131
                      Top = 160
                      Properties.AssignedValues.MinValue = True
                      Properties.SpinButtons.Visible = False
                      TabOrder = 21
                      Width = 40
                    end
                    object cxLabel28: TcxLabel
                      Left = 10
                      Top = 162
                      Caption = 'Estimated Fetal Weight'
                      Transparent = True
                    end
                    object cxLabel29: TcxLabel
                      Left = 172
                      Top = 162
                      Caption = 'g   '
                      Transparent = True
                    end
                    object cxLabel31: TcxLabel
                      Left = 186
                      Top = 163
                      Caption = 'Weight Percentile'
                      Transparent = True
                    end
                    object cbWeightChart1: TcxComboBox
                      Left = 307
                      Top = 159
                      Enabled = False
                      Properties.DropDownRows = 30
                      Properties.Items.Strings = (
                        'Hadlock'
                        'Australian (Mikolajczyk 2011)')
                      TabOrder = 23
                      Width = 142
                    end
                    object cbBioPercentile1: TcxComboBox
                      Left = 13
                      Top = 9
                      Properties.DropDownRows = 30
                      Properties.Items.Strings = (
                        ''
                        'CHITTY'
                        'HADLOCK'
                        'Intergrowth')
                      TabOrder = 0
                      Width = 110
                    end
                    object cxLabel40: TcxLabel
                      Left = 164
                      Top = -17
                      Caption = 'Author'
                      Transparent = True
                    end
                    object seWeightPercentile1: TcxMaskEdit
                      Left = 276
                      Top = 160
                      Properties.Alignment.Horz = taRightJustify
                      Properties.IgnoreMaskBlank = True
                      Properties.MaxLength = 0
                      TabOrder = 22
                      Width = 29
                    end
                    object btnGeneratePercentiles1: TcxButton
                      Left = 133
                      Top = 8
                      Width = 139
                      Height = 20
                      Caption = 'Get Percentiles'
                      TabOrder = 2
                    end
                    object cxGraphData: TcxMemo
                      Left = 728
                      Top = 84
                      Properties.ScrollBars = ssBoth
                      TabOrder = 54
                      Visible = False
                      Height = 94
                      Width = 204
                    end
                    object cbOverrideCurrentValues: TcxCheckBox
                      Left = 9
                      Top = 30
                      Caption = 'Override Current values'
                      State = cbsChecked
                      Style.LookAndFeel.NativeStyle = True
                      StyleDisabled.LookAndFeel.NativeStyle = True
                      StyleFocused.LookAndFeel.NativeStyle = True
                      StyleHot.LookAndFeel.NativeStyle = True
                      TabOrder = 1
                      Transparent = True
                      Width = 145
                    end
                    object btnCalGrowthPer1: TcxButton
                      Left = 468
                      Top = 160
                      Width = 111
                      Height = 20
                      Caption = 'Cal growth Percentile'
                      TabOrder = 24
                    end
                    object edtGrowthForm1: TcxTextEdit
                      Left = 743
                      Top = 184
                      Enabled = False
                      TabOrder = 25
                      Visible = False
                      Width = 116
                    end
                    object cxgbTheChecks1: TcxGroupBox
                      Left = 13
                      Top = 197
                      Caption = 'Fetal Anatomy'
                      PanelStyle.Active = True
                      TabOrder = 26
                      Height = 90
                      Width = 549
                      object cxGroupBox4: TcxGroupBox
                        Left = 8
                        Top = -1
                        ParentFont = False
                        Style.BorderStyle = ebsNone
                        Style.Edges = []
                        Style.Font.Charset = DEFAULT_CHARSET
                        Style.Font.Color = clWindowText
                        Style.Font.Height = -11
                        Style.Font.Name = 'Tahoma'
                        Style.Font.Style = []
                        Style.LookAndFeel.NativeStyle = True
                        Style.IsFontAssigned = True
                        StyleDisabled.LookAndFeel.NativeStyle = True
                        StyleFocused.LookAndFeel.NativeStyle = True
                        StyleHot.LookAndFeel.NativeStyle = True
                        TabOrder = 0
                        Transparent = True
                        Height = 36
                        Width = 152
                        object cbFetalAnatomyNormal1: TcxCheckBox
                          Left = 2
                          Top = 14
                          Caption = 'Normal'
                          State = cbsChecked
                          Style.BorderColor = clRed
                          Style.BorderStyle = ebsThick
                          Style.LookAndFeel.NativeStyle = True
                          StyleDisabled.LookAndFeel.NativeStyle = True
                          StyleFocused.LookAndFeel.NativeStyle = True
                          StyleHot.LookAndFeel.NativeStyle = True
                          TabOrder = 0
                          Transparent = True
                          Width = 62
                        end
                        object cbFetalAnatomyAbNormal1: TcxCheckBox
                          Left = 73
                          Top = 13
                          Caption = 'Abnormal'
                          Style.BorderColor = clRed
                          Style.BorderStyle = ebsThick
                          Style.LookAndFeel.NativeStyle = True
                          StyleDisabled.LookAndFeel.NativeStyle = True
                          StyleFocused.LookAndFeel.NativeStyle = True
                          StyleHot.LookAndFeel.NativeStyle = True
                          TabOrder = 1
                          Transparent = True
                          Width = 71
                        end
                      end
                      object cbAbnSUA1: TcxCheckBox
                        Left = 10
                        Top = 32
                        Caption = 'SUA'
                        TabOrder = 1
                        Transparent = True
                        Width = 53
                      end
                      object cxgbAbnormal1: TcxGroupBox
                        Left = 7
                        Top = 48
                        Style.Edges = []
                        TabOrder = 2
                        Height = 39
                        Width = 539
                        object cbHeart4Chamber1: TcxCheckBox
                          Left = 102
                          Top = 13
                          Caption = 'Heart'
                          Enabled = False
                          Properties.Alignment = taLeftJustify
                          TabOrder = 0
                          Transparent = True
                          Width = 51
                        end
                        object cbBrain1: TcxCheckBox
                          Left = 54
                          Top = 13
                          Caption = 'Brain'
                          Enabled = False
                          Properties.Alignment = taLeftJustify
                          TabOrder = 1
                          Transparent = True
                          Width = 49
                        end
                        object cbStomach1: TcxCheckBox
                          Left = 271
                          Top = 13
                          Caption = 'Diaphragm'
                          Enabled = False
                          Properties.Alignment = taLeftJustify
                          TabOrder = 2
                          Transparent = True
                          Width = 74
                        end
                        object cbUGS1: TcxCheckBox
                          Left = 345
                          Top = 13
                          Caption = 'UGS'
                          Enabled = False
                          Properties.Alignment = taLeftJustify
                          TabOrder = 3
                          Transparent = True
                          Width = 54
                        end
                        object cbSkeletal1: TcxCheckBox
                          Left = 202
                          Top = 13
                          Caption = 'Skeletal'
                          Enabled = False
                          TabOrder = 4
                          Transparent = True
                          Width = 63
                        end
                        object cbFace1: TcxCheckBox
                          Left = 3
                          Top = 13
                          Caption = 'Face'
                          Enabled = False
                          Properties.Alignment = taLeftJustify
                          TabOrder = 5
                          Transparent = True
                          Width = 55
                        end
                        object cbLungs1: TcxCheckBox
                          Left = 152
                          Top = 13
                          Caption = 'Lungs'
                          Enabled = False
                          Properties.Alignment = taLeftJustify
                          TabOrder = 6
                          Transparent = True
                          Width = 54
                        end
                        object cbGIT1: TcxCheckBox
                          Left = 400
                          Top = 13
                          Caption = 'GIT'
                          Enabled = False
                          Properties.Alignment = taLeftJustify
                          TabOrder = 7
                          Transparent = True
                          Width = 62
                        end
                      end
                    end
                    object cxgbPlacentalDetails1: TcxGroupBox
                      Left = 3
                      Top = 293
                      ParentBackground = False
                      Style.Edges = []
                      TabOrder = 27
                      Height = 99
                      Width = 640
                      object cxLabel6: TcxLabel
                        Left = 15
                        Top = 3
                        Caption = 'Placenta Site'
                        Transparent = True
                      end
                      object gbPlacenta1: TcxGroupBox
                        Left = 4
                        Top = 17
                        PanelStyle.Active = True
                        Style.BorderStyle = ebsNone
                        Style.Edges = []
                        Style.LookAndFeel.NativeStyle = True
                        StyleDisabled.LookAndFeel.NativeStyle = True
                        StyleFocused.LookAndFeel.NativeStyle = True
                        StyleHot.LookAndFeel.NativeStyle = True
                        TabOrder = 0
                        Transparent = True
                        Height = 26
                        Width = 386
                        object cxLabel7: TcxLabel
                          Left = 8
                          Top = 7
                          Caption = '1:'
                          Transparent = True
                        end
                        object cbPlacentaSite1: TcxComboBox
                          Left = 23
                          Top = 2
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
                        object cxLabel8: TcxLabel
                          Left = 212
                          Top = 5
                          Caption = 'Low lying (<20mm)'
                          Transparent = True
                        end
                        object cxGroupBox6: TcxGroupBox
                          Left = 308
                          Top = 3
                          TabStop = True
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
                          object cbLowLyingPlacentaYes1: TcxCheckBox
                            Left = -3
                            Top = 0
                            Caption = 'Yes'
                            Style.BorderColor = clRed
                            Style.BorderStyle = ebsThick
                            TabOrder = 0
                            Transparent = True
                            Width = 41
                          end
                          object cbLowLyingPlacentaNo1: TcxCheckBox
                            Left = 38
                            Top = 0
                            Caption = 'No'
                            Style.BorderColor = clRed
                            Style.BorderStyle = ebsThick
                            TabOrder = 1
                            Transparent = True
                            Width = 41
                          end
                        end
                      end
                      object cxLabel9: TcxLabel
                        Left = 250
                        Top = 49
                        Caption = 'mm'
                        Transparent = True
                      end
                      object cxLabel10: TcxLabel
                        Left = 14
                        Top = 49
                        Caption = 'Leading edge to Internal Os'
                        Transparent = True
                      end
                      object meInternalOS1: TcxMaskEdit
                        Left = 226
                        Top = 47
                        Properties.IgnoreMaskBlank = True
                        Properties.MaskKind = emkRegExprEx
                        Properties.EditMask = '(\d?)(\d?)\1\1\1'
                        Properties.MaxLength = 0
                        TabOrder = 1
                        Width = 26
                      end
                      object cxLabel13: TcxLabel
                        Left = 13
                        Top = 70
                        Caption = 'Extends beyond the Internal cervical os by'
                        Transparent = True
                      end
                      object sePlacentaExtendsBy1: TcxSpinEdit
                        Left = 226
                        Top = 70
                        Properties.AssignedValues.MinValue = True
                        Properties.SpinButtons.Visible = False
                        TabOrder = 2
                        Width = 26
                      end
                      object cxLabel14: TcxLabel
                        Left = 250
                        Top = 71
                        Caption = 'mm'
                        Transparent = True
                      end
                    end
                    object cxGroupBox8: TcxGroupBox
                      Left = 155
                      Top = 47
                      Style.BorderStyle = ebsNone
                      Style.Edges = []
                      Style.LookAndFeel.NativeStyle = True
                      StyleDisabled.LookAndFeel.NativeStyle = True
                      StyleFocused.LookAndFeel.NativeStyle = True
                      StyleHot.LookAndFeel.NativeStyle = True
                      TabOrder = 28
                      Transparent = True
                      Height = 21
                      Width = 81
                    end
                    object cxGroupBox9: TcxGroupBox
                      Left = 408
                      Top = 395
                      Style.BorderStyle = ebsNone
                      Style.Edges = []
                      Style.LookAndFeel.NativeStyle = True
                      StyleDisabled.LookAndFeel.NativeStyle = True
                      StyleFocused.LookAndFeel.NativeStyle = True
                      StyleHot.LookAndFeel.NativeStyle = True
                      TabOrder = 29
                      Transparent = True
                      Height = 22
                      Width = 125
                      object cbFunnellingofmembranesYes: TcxCheckBox
                        Left = 0
                        Top = 0
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
                        Left = 60
                        Top = 0
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
                    object cxLabel12: TcxLabel
                      Left = 277
                      Top = 396
                      Caption = 'Funnelling of membranes'
                      Transparent = True
                    end
                    object cxLabel11: TcxLabel
                      Left = 147
                      Top = 396
                      Caption = 'mm'
                      Transparent = True
                    end
                    object meCervicalLength: TcxMaskEdit
                      Left = 98
                      Top = 394
                      Properties.IgnoreMaskBlank = True
                      Properties.MaskKind = emkRegExprEx
                      Properties.EditMask = '(\d?)\1'
                      Properties.MaxLength = 0
                      TabOrder = 32
                      Width = 43
                    end
                    object lblCervicalLength: TcxLabel
                      Left = 14
                      Top = 396
                      Caption = 'Cervical length'
                      Style.TextStyle = []
                      Transparent = True
                    end
                    object edtOFD1: TcxMaskEdit
                      Left = 37
                      Top = 88
                      Properties.IgnoreMaskBlank = True
                      Properties.MaskKind = emkRegExprEx
                      Properties.EditMask = '(\d?)(\d?)\1'#39'.'#39'\1'
                      Properties.MaxLength = 0
                      TabOrder = 4
                      Width = 37
                    end
                    object cxLabel15: TcxLabel
                      Left = 6
                      Top = 89
                      Caption = 'OFD'
                      Transparent = True
                    end
                    object cxLabel20: TcxLabel
                      Left = 8
                      Top = 70
                      Caption = 'BPD'
                      Transparent = True
                    end
                    object edtBPD1: TcxMaskEdit
                      Left = 37
                      Top = 65
                      Properties.IgnoreMaskBlank = True
                      Properties.MaskKind = emkRegExprEx
                      Properties.EditMask = '(\d?)(\d?)\1'#39'.'#39'\1'
                      Properties.MaxLength = 0
                      TabOrder = 3
                      Width = 37
                    end
                    object lblHC1: TcxLabel
                      Left = 13
                      Top = 112
                      Caption = 'HC'
                      Transparent = True
                    end
                    object edHC1: TcxMaskEdit
                      Left = 37
                      Top = 112
                      Properties.IgnoreMaskBlank = True
                      Properties.MaskKind = emkRegExprEx
                      Properties.EditMask = '(\d?)(\d?)\1'#39'.'#39'\1'
                      Properties.MaxLength = 0
                      TabOrder = 5
                      Width = 37
                    end
                    object edAC1: TcxMaskEdit
                      Left = 252
                      Top = 62
                      Properties.IgnoreMaskBlank = True
                      Properties.MaskKind = emkRegExprEx
                      Properties.EditMask = '(\d?)(\d?)\1'#39'.'#39'\1'
                      Properties.MaxLength = 0
                      TabOrder = 6
                      Width = 37
                    end
                    object cxLabel21: TcxLabel
                      Left = 234
                      Top = 65
                      Caption = 'AC'
                      Transparent = True
                    end
                    object cxLabel22: TcxLabel
                      Left = 233
                      Top = 113
                      Caption = 'HL'
                      Transparent = True
                    end
                    object edHL1: TcxMaskEdit
                      Left = 252
                      Top = 111
                      Properties.IgnoreMaskBlank = True
                      Properties.MaskKind = emkRegExprEx
                      Properties.EditMask = '(\d?)(\d?)\1'#39'.'#39'\1'
                      Properties.MaxLength = 0
                      TabOrder = 8
                      Width = 37
                    end
                    object cxLabel23: TcxLabel
                      Left = 74
                      Top = 92
                      Caption = 'cm'
                      Transparent = True
                    end
                    object cxLabel24: TcxLabel
                      Left = 74
                      Top = 67
                      Caption = 'cm'
                      Transparent = True
                    end
                    object cxLabel25: TcxLabel
                      Left = 292
                      Top = 66
                      Caption = 'cm'
                      Transparent = True
                    end
                    object cxLabel26: TcxLabel
                      Left = 75
                      Top = 115
                      Caption = 'cm'
                      Transparent = True
                    end
                    object cxLabel27: TcxLabel
                      Left = 292
                      Top = 91
                      Caption = 'cm'
                      Transparent = True
                    end
                    object edtBPDPer1: TcxMaskEdit
                      Left = 100
                      Top = 65
                      Properties.Alignment.Horz = taRightJustify
                      Properties.IgnoreMaskBlank = True
                      Properties.MaxLength = 0
                      TabOrder = 9
                      Width = 29
                    end
                    object cxLabel32: TcxLabel
                      Left = 133
                      Top = 67
                      Caption = '%'
                      Transparent = True
                    end
                    object edtOFDPer1: TcxMaskEdit
                      Left = 101
                      Top = 88
                      Properties.Alignment.Horz = taRightJustify
                      Properties.IgnoreMaskBlank = True
                      Properties.MaxLength = 0
                      TabOrder = 10
                      Width = 29
                    end
                    object cxLabel33: TcxLabel
                      Left = 133
                      Top = 89
                      Caption = '%'
                      Transparent = True
                    end
                    object edHCPer1: TcxMaskEdit
                      Left = 101
                      Top = 112
                      Properties.Alignment.Horz = taRightJustify
                      Properties.IgnoreMaskBlank = True
                      Properties.MaxLength = 0
                      TabOrder = 11
                      Width = 29
                    end
                    object cxLabel34: TcxLabel
                      Left = 133
                      Top = 111
                      Caption = '%'
                      Transparent = True
                    end
                    object edACPer1: TcxMaskEdit
                      Left = 315
                      Top = 61
                      Properties.Alignment.Horz = taRightJustify
                      Properties.IgnoreMaskBlank = True
                      Properties.MaxLength = 0
                      TabOrder = 12
                      Width = 29
                    end
                    object cxLabel36: TcxLabel
                      Left = 347
                      Top = 63
                      Caption = '%'
                      Transparent = True
                    end
                    object edHLPer1: TcxMaskEdit
                      Left = 315
                      Top = 109
                      Properties.Alignment.Horz = taRightJustify
                      Properties.IgnoreMaskBlank = True
                      Properties.MaxLength = 0
                      TabOrder = 14
                      Width = 29
                    end
                    object cxLabel37: TcxLabel
                      Left = 347
                      Top = 91
                      Caption = '%'
                      Transparent = True
                    end
                    object edtBPDForm1: TcxTextEdit
                      Left = 153
                      Top = 64
                      Enabled = False
                      TabOrder = 15
                      Width = 70
                    end
                    object edtOFDForm1: TcxTextEdit
                      Left = 153
                      Top = 87
                      Enabled = False
                      TabOrder = 16
                      Width = 70
                    end
                    object edHCForm1: TcxTextEdit
                      Left = 153
                      Top = 111
                      Enabled = False
                      TabOrder = 17
                      Width = 70
                    end
                    object edACForm1: TcxTextEdit
                      Left = 369
                      Top = 61
                      Enabled = False
                      TabOrder = 18
                      Width = 70
                    end
                    object edHLForm1: TcxTextEdit
                      Left = 368
                      Top = 109
                      Enabled = False
                      TabOrder = 20
                      Width = 70
                    end
                    object edFL1: TcxMaskEdit
                      Left = 252
                      Top = 88
                      Properties.IgnoreMaskBlank = True
                      Properties.MaskKind = emkRegExprEx
                      Properties.EditMask = '(\d?)(\d?)\1'#39'.'#39'\1'
                      Properties.MaxLength = 0
                      TabOrder = 7
                      Width = 37
                    end
                    object cxLabel35: TcxLabel
                      Left = 233
                      Top = 91
                      Caption = 'FL'
                      Transparent = True
                    end
                    object cxLabel38: TcxLabel
                      Left = 292
                      Top = 114
                      Caption = 'cm'
                      Transparent = True
                    end
                    object edFLPer1: TcxMaskEdit
                      Left = 315
                      Top = 87
                      Properties.Alignment.Horz = taRightJustify
                      Properties.IgnoreMaskBlank = True
                      Properties.MaxLength = 0
                      TabOrder = 13
                      Width = 29
                    end
                    object cxLabel39: TcxLabel
                      Left = 347
                      Top = 113
                      Caption = '%'
                      Transparent = True
                    end
                    object edFLForm1: TcxTextEdit
                      Left = 369
                      Top = 85
                      Enabled = False
                      TabOrder = 19
                      Width = 70
                    end
                    object cxGroupBox7: TcxGroupBox
                      Left = 413
                      Top = 91
                      Style.BorderStyle = ebsNone
                      Style.Edges = []
                      Style.LookAndFeel.NativeStyle = True
                      StyleDisabled.LookAndFeel.NativeStyle = True
                      StyleFocused.LookAndFeel.NativeStyle = True
                      StyleHot.LookAndFeel.NativeStyle = True
                      TabOrder = 57
                      Transparent = True
                      Height = 22
                      Width = 125
                    end
                    object cxGroupBox14: TcxGroupBox
                      Left = 174
                      Top = 393
                      Style.BorderStyle = ebsNone
                      Style.Edges = []
                      Style.LookAndFeel.NativeStyle = True
                      StyleDisabled.LookAndFeel.NativeStyle = True
                      StyleFocused.LookAndFeel.NativeStyle = True
                      StyleHot.LookAndFeel.NativeStyle = True
                      TabOrder = 58
                      Transparent = True
                      Height = 22
                      Width = 96
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
                        Left = 46
                        Top = 1
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
                  end
                  object cxGroupBox2: TcxGroupBox
                    Left = 275
                    Top = 7
                    Style.BorderStyle = ebsNone
                    Style.Edges = []
                    Style.LookAndFeel.NativeStyle = True
                    StyleDisabled.LookAndFeel.NativeStyle = True
                    StyleFocused.LookAndFeel.NativeStyle = True
                    StyleHot.LookAndFeel.NativeStyle = True
                    TabOrder = 1
                    Transparent = True
                    Height = 22
                    Width = 125
                    object presentingTwinYes1: TcxCheckBox
                      Left = 0
                      Top = -1
                      Caption = 'Yes'
                      Style.LookAndFeel.NativeStyle = True
                      StyleDisabled.LookAndFeel.NativeStyle = True
                      StyleFocused.LookAndFeel.NativeStyle = True
                      StyleHot.LookAndFeel.NativeStyle = True
                      TabOrder = 0
                      Transparent = True
                      Width = 50
                    end
                    object presentingTwinNo1: TcxCheckBox
                      Left = 51
                      Top = -1
                      Caption = 'No'
                      Style.LookAndFeel.NativeStyle = True
                      StyleDisabled.LookAndFeel.NativeStyle = True
                      StyleFocused.LookAndFeel.NativeStyle = True
                      StyleHot.LookAndFeel.NativeStyle = True
                      TabOrder = 1
                      Transparent = True
                      Width = 58
                    end
                  end
                  object lblPresentingTwin1: TcxLabel
                    Left = 194
                    Top = 8
                    Caption = 'Presenting Twin'
                    Transparent = True
                  end
                  object cbPresentation1: TcxComboBox
                    Left = 75
                    Top = 6
                    Properties.DropDownRows = 30
                    Properties.Items.Strings = (
                      ''
                      'Cephalic'
                      'Flexed breech'
                      'Extended breech'
                      'Footling breech'
                      'Transverse lie')
                    TabOrder = 3
                    Width = 113
                  end
                  object cxLabel5: TcxLabel
                    Left = 6
                    Top = 10
                    Caption = 'Presentation'
                    Style.TextStyle = []
                    Transparent = True
                  end
                  object cxGroupBox3: TcxGroupBox
                    Left = 377
                    Top = 7
                    Style.BorderStyle = ebsNone
                    Style.Edges = []
                    Style.LookAndFeel.NativeStyle = True
                    StyleDisabled.LookAndFeel.NativeStyle = True
                    StyleFocused.LookAndFeel.NativeStyle = True
                    StyleHot.LookAndFeel.NativeStyle = True
                    TabOrder = 5
                    Transparent = True
                    Height = 22
                    Width = 217
                    object cbMaternalLeft1: TcxCheckBox
                      Left = 78
                      Top = 0
                      Style.LookAndFeel.NativeStyle = True
                      StyleDisabled.LookAndFeel.NativeStyle = True
                      StyleFocused.LookAndFeel.NativeStyle = True
                      StyleHot.LookAndFeel.NativeStyle = True
                      TabOrder = 0
                      Transparent = True
                      Width = 24
                    end
                    object cbMaternalRight1: TcxCheckBox
                      Left = 190
                      Top = -1
                      Style.LookAndFeel.NativeStyle = True
                      StyleDisabled.LookAndFeel.NativeStyle = True
                      StyleFocused.LookAndFeel.NativeStyle = True
                      StyleHot.LookAndFeel.NativeStyle = True
                      TabOrder = 1
                      Transparent = True
                      Width = 26
                    end
                    object cxLabel3: TcxLabel
                      Left = 5
                      Top = 2
                      Caption = 'Maternal left '
                      Style.TextStyle = [fsBold]
                      Transparent = True
                    end
                    object cxLabel85: TcxLabel
                      Left = 105
                      Top = 2
                      Caption = 'Maternal right'
                      Style.TextStyle = [fsBold]
                      Transparent = True
                    end
                  end
                  object cxGroupBox5: TcxGroupBox
                    Left = 609
                    Top = 7
                    Style.BorderStyle = ebsNone
                    Style.Edges = []
                    Style.LookAndFeel.NativeStyle = True
                    StyleDisabled.LookAndFeel.NativeStyle = True
                    StyleFocused.LookAndFeel.NativeStyle = True
                    StyleHot.LookAndFeel.NativeStyle = True
                    TabOrder = 6
                    Transparent = True
                    Height = 22
                    Width = 217
                    object cbMale1: TcxCheckBox
                      Left = 36
                      Top = 1
                      Style.LookAndFeel.NativeStyle = True
                      StyleDisabled.LookAndFeel.NativeStyle = True
                      StyleFocused.LookAndFeel.NativeStyle = True
                      StyleHot.LookAndFeel.NativeStyle = True
                      TabOrder = 0
                      Transparent = True
                      Width = 24
                    end
                    object cbFemale1: TcxCheckBox
                      Left = 114
                      Top = 1
                      Style.LookAndFeel.NativeStyle = True
                      StyleDisabled.LookAndFeel.NativeStyle = True
                      StyleFocused.LookAndFeel.NativeStyle = True
                      StyleHot.LookAndFeel.NativeStyle = True
                      TabOrder = 1
                      Transparent = True
                      Width = 26
                    end
                    object cxLabel86: TcxLabel
                      Left = 5
                      Top = 2
                      Caption = 'Male'
                      Style.TextStyle = [fsBold]
                      Transparent = True
                    end
                    object cxLabel87: TcxLabel
                      Left = 71
                      Top = 2
                      Caption = 'Female'
                      Style.TextStyle = [fsBold]
                      Transparent = True
                    end
                  end
                end
              end
              object tsWellBeing1: TcxTabSheet
                Caption = 'Fetal Well-being'
                ImageIndex = 3
                ExplicitWidth = 1297
                ExplicitHeight = 360
                object Bevel4: TBevel
                  Left = 5
                  Top = 76
                  Width = 450
                  Height = 3
                  Style = bsRaised
                end
                object Bevel5: TBevel
                  Left = 6
                  Top = 139
                  Width = 450
                  Height = 3
                  Style = bsRaised
                end
                object Bevel6: TBevel
                  Left = 2
                  Top = 315
                  Width = 450
                  Height = 3
                  Style = bsRaised
                end
                object cxLabel41: TcxLabel
                  Left = 233
                  Top = 193
                  Caption = 'S/D ratio'
                  Transparent = True
                end
                object edtUmbilicalArtSD1: TcxMaskEdit
                  Left = 285
                  Top = 191
                  Properties.IgnoreMaskBlank = True
                  Properties.MaskKind = emkRegExprEx
                  Properties.EditMask = '(\d?)\1'#39'.'#39'\1\1'
                  Properties.MaxLength = 0
                  TabOrder = 11
                  Width = 37
                end
                object cxLabel42: TcxLabel
                  Left = 55
                  Top = 193
                  Caption = 'Pulsatility Index (PI)'
                  Transparent = True
                end
                object edtUmbilicalArtPI1: TcxMaskEdit
                  Left = 190
                  Top = 191
                  Properties.IgnoreMaskBlank = True
                  Properties.MaskKind = emkRegExprEx
                  Properties.EditMask = '(\d?)\1'#39'.'#39'\1\1'
                  Properties.MaxLength = 0
                  TabOrder = 10
                  Width = 37
                end
                object cxLabel43: TcxLabel
                  Left = 55
                  Top = 236
                  Caption = 'Pulsatility Index (PI)'
                  Transparent = True
                end
                object edtMidCerArtPI1: TcxMaskEdit
                  Left = 190
                  Top = 234
                  Properties.IgnoreMaskBlank = True
                  Properties.MaskKind = emkRegExprEx
                  Properties.EditMask = '(\d?)\1'#39'.'#39'\1\1'
                  Properties.MaxLength = 0
                  TabOrder = 13
                  Width = 37
                end
                object cxLabel44: TcxLabel
                  Left = 22
                  Top = 149
                  Caption = 'Doppler Evaluation'
                  Style.TextStyle = [fsBold]
                  Transparent = True
                end
                object cxLabel45: TcxLabel
                  Left = 34
                  Top = 216
                  Caption = 'Middle cerebral artery'
                  Style.TextColor = clBlue
                  Transparent = True
                end
                object cxLabel46: TcxLabel
                  Left = 19
                  Top = 7
                  Caption = 'Biophysically Well'
                  Style.TextStyle = [fsBold]
                  Transparent = True
                end
                object cxGroupBox10: TcxGroupBox
                  Left = 129
                  Top = 5
                  Style.BorderStyle = ebsNone
                  Style.Edges = []
                  Style.LookAndFeel.NativeStyle = True
                  StyleDisabled.LookAndFeel.NativeStyle = True
                  StyleFocused.LookAndFeel.NativeStyle = True
                  StyleHot.LookAndFeel.NativeStyle = True
                  TabOrder = 1
                  Transparent = True
                  Height = 21
                  Width = 91
                  object cbFeatlMovementsYes1: TcxCheckBox
                    Left = 0
                    Top = 0
                    Caption = 'Yes'
                    TabOrder = 0
                    Transparent = True
                    Width = 41
                  end
                  object cbFeatlMovementsNo1: TcxCheckBox
                    Left = 39
                    Top = 0
                    Caption = 'No'
                    TabOrder = 1
                    Transparent = True
                    Width = 44
                  end
                end
                object lblBioPhysicalScore1: TcxLabel
                  Left = 19
                  Top = 48
                  Caption = 'Biophysical Profile score:'
                  Enabled = False
                  Transparent = True
                end
                object seBiophysicalScore1: TcxSpinEdit
                  Left = 155
                  Top = 46
                  Enabled = False
                  Properties.MaxValue = 8.000000000000000000
                  Properties.SpinButtons.Visible = False
                  TabOrder = 6
                  Width = 26
                end
                object lbldivBy81: TcxLabel
                  Left = 187
                  Top = 48
                  Caption = '/8'
                  Enabled = False
                  Transparent = True
                end
                object cbFetalTone1: TcxCheckBox
                  Left = 15
                  Top = 25
                  Caption = 'Fetal tone  '
                  Enabled = False
                  TabOrder = 2
                  Transparent = True
                  Width = 79
                end
                object cbFetalMovement1: TcxCheckBox
                  Left = 100
                  Top = 23
                  Caption = 'Fetal movement'
                  Enabled = False
                  TabOrder = 3
                  Transparent = True
                  Width = 101
                end
                object cbFetalBreathing1: TcxCheckBox
                  Left = 209
                  Top = 25
                  Caption = 'Fetal Breathing'
                  Enabled = False
                  TabOrder = 4
                  Transparent = True
                  Width = 108
                end
                object cbLiqur1: TcxCheckBox
                  Left = 329
                  Top = 25
                  Caption = 'Liquor'
                  Enabled = False
                  TabOrder = 5
                  Transparent = True
                  Width = 79
                end
                object lblAmnioticIndex1: TcxLabel
                  Left = 19
                  Top = 88
                  Caption = 'Amniotic fluid index (AFI)'
                  Transparent = True
                end
                object edtAFI1: TcxMaskEdit
                  Left = 149
                  Top = 86
                  Properties.IgnoreMaskBlank = True
                  Properties.MaskKind = emkRegExprEx
                  Properties.EditMask = '(\d?)\1'#39'.'#39'\1'
                  Properties.MaxLength = 0
                  TabOrder = 7
                  Width = 37
                end
                object lblAmnioticMeasure1: TcxLabel
                  Left = 188
                  Top = 88
                  Caption = 'cm'
                  Transparent = True
                end
                object cxLabel49: TcxLabel
                  Left = 35
                  Top = 172
                  Caption = 'Umbilical artery '
                  Style.TextColor = clBlue
                  Transparent = True
                end
                object lblAmnioticVerticlePocket1: TcxLabel
                  Left = 224
                  Top = 88
                  Caption = 'Deepest vertical pocket  '
                  Transparent = True
                end
                object edtDeepestPocket1: TcxMaskEdit
                  Left = 354
                  Top = 85
                  Properties.IgnoreMaskBlank = True
                  Properties.MaskKind = emkRegExprEx
                  Properties.EditMask = '(\d?)\1'#39'.'#39'\1'
                  Properties.MaxLength = 0
                  Style.BorderColor = clWindowFrame
                  Style.BorderStyle = ebsUltraFlat
                  TabOrder = 8
                  Width = 37
                end
                object lblAmnioticVerticleMeasure1: TcxLabel
                  Left = 393
                  Top = 88
                  Caption = 'cm'
                  Transparent = True
                end
                object cbFetalWellLiqor1: TcxComboBox
                  Left = 98
                  Top = 110
                  Properties.DropDownRows = 25
                  Properties.Items.Strings = (
                    'Normal'
                    'Increased'
                    'Decreased'
                    '')
                  TabOrder = 9
                  Width = 120
                end
                object cxLabel50: TcxLabel
                  Left = 18
                  Top = 112
                  Caption = 'Amniotic Fluid'
                  Transparent = True
                end
                object cxGroupBox11: TcxGroupBox
                  Left = 326
                  Top = 190
                  Style.BorderStyle = ebsNone
                  Style.Edges = []
                  Style.LookAndFeel.NativeStyle = True
                  StyleDisabled.LookAndFeel.NativeStyle = True
                  StyleFocused.LookAndFeel.NativeStyle = True
                  StyleHot.LookAndFeel.NativeStyle = True
                  TabOrder = 12
                  Transparent = True
                  Height = 21
                  Width = 108
                  object cbAEDF1: TcxCheckBox
                    Left = 0
                    Top = 2
                    Caption = 'AEDF'
                    TabOrder = 0
                    Transparent = True
                    Width = 48
                  end
                  object cbREDF1: TcxCheckBox
                    Left = 53
                    Top = 2
                    Caption = 'REDF'
                    TabOrder = 1
                    Transparent = True
                    Width = 54
                  end
                end
                object cxLabel51: TcxLabel
                  Left = 34
                  Top = 287
                  Caption = 'Ductus Venosus waveform'
                  Transparent = True
                end
                object cxGroupBox12: TcxGroupBox
                  Left = 187
                  Top = 284
                  Style.BorderStyle = ebsNone
                  Style.Edges = []
                  Style.LookAndFeel.NativeStyle = True
                  StyleDisabled.LookAndFeel.NativeStyle = True
                  StyleFocused.LookAndFeel.NativeStyle = True
                  StyleHot.LookAndFeel.NativeStyle = True
                  TabOrder = 14
                  Transparent = True
                  Height = 21
                  Width = 154
                  object cbDVWNormal1: TcxCheckBox
                    Left = 1
                    Top = 2
                    Caption = 'Normal'
                    TabOrder = 0
                    Transparent = True
                    Width = 61
                  end
                  object cbDVWAbNormal1: TcxCheckBox
                    Left = 76
                    Top = 1
                    Caption = 'Abnormal'
                    TabOrder = 1
                    Transparent = True
                    Width = 75
                  end
                end
                object cxLabel52: TcxLabel
                  Left = 37
                  Top = 384
                  Caption = 'Peak systolic velocity (PSV)'
                  Transparent = True
                end
                object edtMidCerArtPSF1: TcxMaskEdit
                  Left = 188
                  Top = 380
                  Properties.IgnoreMaskBlank = True
                  Properties.MaskKind = emkRegExprEx
                  Properties.EditMask = '(\d?)(\d?)\1'#39'.'#39'\1\1'
                  Properties.MaxLength = 0
                  TabOrder = 16
                  Width = 37
                end
                object cxLabel53: TcxLabel
                  Left = 226
                  Top = 382
                  Caption = 'cm/s'
                  Transparent = True
                end
                object gbRiskFetalAnaemia: TcxGroupBox
                  Left = 275
                  Top = 380
                  Style.BorderStyle = ebsNone
                  Style.Edges = []
                  Style.LookAndFeel.NativeStyle = True
                  StyleDisabled.LookAndFeel.NativeStyle = True
                  StyleFocused.LookAndFeel.NativeStyle = True
                  StyleHot.LookAndFeel.NativeStyle = True
                  TabOrder = 17
                  Transparent = True
                  Height = 21
                  Width = 217
                  object fetalAnaemiaYes1: TcxCheckBox
                    Left = 6
                    Top = 0
                    Caption = '>=1.5 MoM'
                    TabOrder = 0
                    Transparent = True
                    Width = 88
                  end
                  object fetalAnaemiaNo1: TcxCheckBox
                    Left = 97
                    Top = 0
                    Caption = 'Normal'
                    TabOrder = 1
                    Transparent = True
                    Width = 75
                  end
                end
                object cxLabel54: TcxLabel
                  Left = 37
                  Top = 340
                  Caption = 'Risk of fetal anaemia (RBC antibodies or MC Twins)'
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
                  Left = 332
                  Top = 336
                  Style.BorderStyle = ebsNone
                  Style.Edges = []
                  Style.LookAndFeel.NativeStyle = True
                  StyleDisabled.LookAndFeel.NativeStyle = True
                  StyleFocused.LookAndFeel.NativeStyle = True
                  StyleHot.LookAndFeel.NativeStyle = True
                  TabOrder = 15
                  Transparent = True
                  Height = 21
                  Width = 154
                  object cbRiskFetalAnemiaYes1: TcxCheckBox
                    Left = 1
                    Top = 2
                    Caption = 'Yes'
                    TabOrder = 0
                    Transparent = True
                    Width = 45
                  end
                  object cbRiskFetalAnemiaNo1: TcxCheckBox
                    Left = 52
                    Top = 2
                    Caption = 'No'
                    TabOrder = 1
                    Transparent = True
                    Width = 75
                  end
                end
                object cxLabel55: TcxLabel
                  Left = 38
                  Top = 361
                  Caption = 'Middle cerebral artery'
                  Style.TextColor = clBlue
                  Transparent = True
                end
                object cbMergeLiquorGraphs1: TcxCheckBox
                  Left = 231
                  Top = 109
                  Caption = 'Merge Doppler / Liquor graphs'
                  Style.LookAndFeel.NativeStyle = True
                  StyleDisabled.LookAndFeel.NativeStyle = True
                  StyleFocused.LookAndFeel.NativeStyle = True
                  StyleHot.LookAndFeel.NativeStyle = True
                  TabOrder = 36
                  Transparent = True
                  Width = 183
                end
              end
              object tsFibroids: TcxTabSheet
                Caption = 'Fibroids'
                ImageIndex = 2
                ExplicitWidth = 1297
                ExplicitHeight = 360
                object gbFibroids: TcxGroupBox
                  Left = 0
                  Top = 0
                  Align = alClient
                  Caption = 'Fibroids'
                  TabOrder = 0
                  ExplicitWidth = 1297
                  ExplicitHeight = 360
                  Height = 226
                  Width = 467
                  object cxGroupBox33: TcxGroupBox
                    Left = 2
                    Top = 18
                    Align = alTop
                    PanelStyle.Active = True
                    Style.BorderStyle = ebsNone
                    Style.Edges = []
                    TabOrder = 0
                    ExplicitTop = 5
                    ExplicitWidth = 1293
                    Height = 22
                    Width = 463
                    object cxLabel47: TcxLabel
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
                    Visible = False
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
                    object cxLabel48: TcxLabel
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
                    object cxLabel96: TcxLabel
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
                    object cxLabel105: TcxLabel
                      Left = 351
                      Top = 5
                      Caption = 'mm'
                      Transparent = True
                    end
                    object cxLabel106: TcxLabel
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
                    object cxLabel107: TcxLabel
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
                    Visible = False
                    Height = 24
                    Width = 591
                    object cxLabel108: TcxLabel
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
                    object cxLabel112: TcxLabel
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
                    object cxLabel113: TcxLabel
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
                    object cxLabel114: TcxLabel
                      Left = 347
                      Top = 5
                      Caption = 'mm'
                      Transparent = True
                    end
                    object cxLabel115: TcxLabel
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
                    object cxLabel116: TcxLabel
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
                    Visible = False
                    Height = 24
                    Width = 591
                    object cxLabel117: TcxLabel
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
                    object cxLabel118: TcxLabel
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
                    object cxLabel119: TcxLabel
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
                    object cxLabel120: TcxLabel
                      Left = 347
                      Top = 5
                      Caption = 'mm'
                      Transparent = True
                    end
                    object cxLabel128: TcxLabel
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
                    object cxLabel129: TcxLabel
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
                    Visible = False
                    Height = 24
                    Width = 591
                    object cxLabel130: TcxLabel
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
                    object cxLabel131: TcxLabel
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
                    object cxLabel132: TcxLabel
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
                    object cxLabel133: TcxLabel
                      Left = 347
                      Top = 5
                      Caption = 'mm'
                      Transparent = True
                    end
                    object cxLabel134: TcxLabel
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
                    object cxLabel135: TcxLabel
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
                    Visible = False
                    Height = 25
                    Width = 591
                    object cxLabel136: TcxLabel
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
                    object cxLabel137: TcxLabel
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
                    object cxLabel138: TcxLabel
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
                    object cxLabel139: TcxLabel
                      Left = 347
                      Top = 5
                      Caption = 'mm'
                      Transparent = True
                    end
                    object cxLabel140: TcxLabel
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
                    Visible = False
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
                    Visible = False
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
                    Visible = False
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
                    Visible = False
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
                    Visible = False
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
            end
          end
          object cxtsFetus2: TcxTabSheet
            Caption = 'Fetus 2'
            ImageIndex = 1
            object cxpgFetus2: TcxPageControl
              Left = 0
              Top = 0
              Width = 467
              Height = 250
              Align = alClient
              TabOrder = 0
              Properties.ActivePage = cxtsFetusGeneral2
              Properties.CustomButtons.Buttons = <>
              ClientRectBottom = 250
              ClientRectRight = 467
              ClientRectTop = 24
              object cxtsFetusGeneral2: TcxTabSheet
                Caption = 'General'
                ImageIndex = 0
                object Bevel8: TBevel
                  Left = 377
                  Top = 461
                  Width = 541
                  Height = 3
                  Style = bsRaised
                end
                object cxGroupBox15: TcxGroupBox
                  Left = 0
                  Top = 0
                  Align = alTop
                  PanelStyle.Active = True
                  Style.BorderStyle = ebsNone
                  Style.Edges = []
                  TabOrder = 0
                  ExplicitWidth = 1297
                  Height = 40
                  Width = 467
                  object cxGroupBox16: TcxGroupBox
                    Left = 298
                    Top = 9
                    Style.BorderStyle = ebsNone
                    Style.Edges = []
                    Style.LookAndFeel.NativeStyle = True
                    StyleDisabled.LookAndFeel.NativeStyle = True
                    StyleFocused.LookAndFeel.NativeStyle = True
                    StyleHot.LookAndFeel.NativeStyle = True
                    TabOrder = 0
                    Transparent = True
                    Height = 22
                    Width = 125
                    object presentingTwinYes2: TcxCheckBox
                      Left = -2
                      Top = -1
                      Caption = 'Yes'
                      Style.LookAndFeel.NativeStyle = True
                      StyleDisabled.LookAndFeel.NativeStyle = True
                      StyleFocused.LookAndFeel.NativeStyle = True
                      StyleHot.LookAndFeel.NativeStyle = True
                      TabOrder = 0
                      Transparent = True
                      Width = 57
                    end
                    object presentingTwinNo2: TcxCheckBox
                      Left = 51
                      Top = -1
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
                  object cxLabel56: TcxLabel
                    Left = 208
                    Top = 10
                    Caption = 'Presenting Twin'
                    Transparent = True
                  end
                  object cbPresentation2: TcxComboBox
                    Left = 75
                    Top = 6
                    Properties.DropDownRows = 30
                    Properties.Items.Strings = (
                      ''
                      'Cephalic'
                      'Flexed breech'
                      'Extended breech'
                      'Footling breech'
                      'Transverse lie')
                    TabOrder = 2
                    Width = 113
                  end
                  object cxLabel57: TcxLabel
                    Left = 6
                    Top = 10
                    Caption = 'Presentation'
                    Transparent = True
                  end
                  object cxGroupBox24: TcxGroupBox
                    Left = 391
                    Top = 7
                    Style.BorderStyle = ebsNone
                    Style.Edges = []
                    Style.LookAndFeel.NativeStyle = True
                    StyleDisabled.LookAndFeel.NativeStyle = True
                    StyleFocused.LookAndFeel.NativeStyle = True
                    StyleHot.LookAndFeel.NativeStyle = True
                    TabOrder = 4
                    Transparent = True
                    Height = 22
                    Width = 217
                    object cbMaternalLeft2: TcxCheckBox
                      Left = 78
                      Top = 0
                      Style.LookAndFeel.NativeStyle = True
                      StyleDisabled.LookAndFeel.NativeStyle = True
                      StyleFocused.LookAndFeel.NativeStyle = True
                      StyleHot.LookAndFeel.NativeStyle = True
                      TabOrder = 0
                      Transparent = True
                      Width = 24
                    end
                    object cbMaternalRight2: TcxCheckBox
                      Left = 190
                      Top = -1
                      Style.LookAndFeel.NativeStyle = True
                      StyleDisabled.LookAndFeel.NativeStyle = True
                      StyleFocused.LookAndFeel.NativeStyle = True
                      StyleHot.LookAndFeel.NativeStyle = True
                      TabOrder = 1
                      Transparent = True
                      Width = 26
                    end
                    object cxLabel88: TcxLabel
                      Left = 5
                      Top = 2
                      Caption = 'Maternal left '
                      Style.TextStyle = [fsBold]
                      Transparent = True
                    end
                    object cxLabel89: TcxLabel
                      Left = 105
                      Top = 2
                      Caption = 'Maternal right'
                      Style.TextStyle = [fsBold]
                      Transparent = True
                    end
                  end
                  object cxGroupBox30: TcxGroupBox
                    Left = 623
                    Top = 7
                    Style.BorderStyle = ebsNone
                    Style.Edges = []
                    Style.LookAndFeel.NativeStyle = True
                    StyleDisabled.LookAndFeel.NativeStyle = True
                    StyleFocused.LookAndFeel.NativeStyle = True
                    StyleHot.LookAndFeel.NativeStyle = True
                    TabOrder = 5
                    Transparent = True
                    Height = 22
                    Width = 217
                    object cbMale2: TcxCheckBox
                      Left = 36
                      Top = 1
                      Style.LookAndFeel.NativeStyle = True
                      StyleDisabled.LookAndFeel.NativeStyle = True
                      StyleFocused.LookAndFeel.NativeStyle = True
                      StyleHot.LookAndFeel.NativeStyle = True
                      TabOrder = 0
                      Transparent = True
                      Width = 24
                    end
                    object cbFemale2: TcxCheckBox
                      Left = 114
                      Top = 1
                      Style.LookAndFeel.NativeStyle = True
                      StyleDisabled.LookAndFeel.NativeStyle = True
                      StyleFocused.LookAndFeel.NativeStyle = True
                      StyleHot.LookAndFeel.NativeStyle = True
                      TabOrder = 1
                      Transparent = True
                      Width = 26
                    end
                    object cxLabel109: TcxLabel
                      Left = 5
                      Top = 2
                      Caption = 'Male'
                      Style.TextStyle = [fsBold]
                      Transparent = True
                    end
                    object cxLabel110: TcxLabel
                      Left = 71
                      Top = 2
                      Caption = 'Female'
                      Style.TextStyle = [fsBold]
                      Transparent = True
                    end
                  end
                end
                object cxScrollBox2: TcxScrollBox
                  Left = 0
                  Top = 40
                  Width = 467
                  Height = 186
                  Align = alClient
                  HorzScrollBar.Tracking = True
                  TabOrder = 1
                  VertScrollBar.Tracking = True
                  object GroupBoxFetus2: TcxGroupBox
                    Left = 0
                    Top = 6
                    PanelStyle.Active = True
                    Style.BorderStyle = ebsNone
                    Style.Edges = []
                    TabOrder = 0
                    Height = 456
                    Width = 1006
                    object Bevel7: TBevel
                      Left = 10
                      Top = 147
                      Width = 450
                      Height = 3
                      Style = bsRaised
                    end
                    object Bevel9: TBevel
                      Left = 9
                      Top = 115
                      Width = 450
                      Height = 3
                      Style = bsRaised
                    end
                    object edtOFD2: TcxMaskEdit
                      Left = 37
                      Top = 63
                      Properties.IgnoreMaskBlank = True
                      Properties.MaskKind = emkRegExprEx
                      Properties.EditMask = '(\d?)(\d?)\1'#39'.'#39'\1'
                      Properties.MaxLength = 0
                      TabOrder = 5
                      Width = 37
                    end
                    object cxLabel30: TcxLabel
                      Left = 10
                      Top = 64
                      Caption = 'OFD'
                      Transparent = True
                    end
                    object cxLabel58: TcxLabel
                      Left = 12
                      Top = 43
                      Caption = 'BPD'
                      Transparent = True
                    end
                    object edtBPD2: TcxMaskEdit
                      Left = 37
                      Top = 41
                      Properties.IgnoreMaskBlank = True
                      Properties.MaskKind = emkRegExprEx
                      Properties.EditMask = '(\d?)(\d?)\1'#39'.'#39'\1'
                      Properties.MaxLength = 0
                      TabOrder = 4
                      Width = 37
                    end
                    object lblHC2: TcxLabel
                      Left = 13
                      Top = 85
                      Caption = 'HC'
                      Transparent = True
                    end
                    object edHC2: TcxMaskEdit
                      Left = 37
                      Top = 84
                      Properties.IgnoreMaskBlank = True
                      Properties.MaskKind = emkRegExprEx
                      Properties.EditMask = '(\d?)(\d?)\1'#39'.'#39'\1'
                      Properties.MaxLength = 0
                      TabOrder = 6
                      Width = 37
                    end
                    object edAC2: TcxMaskEdit
                      Left = 246
                      Top = 41
                      Properties.IgnoreMaskBlank = True
                      Properties.MaskKind = emkRegExprEx
                      Properties.EditMask = '(\d?)(\d?)\1'#39'.'#39'\1'
                      Properties.MaxLength = 0
                      TabOrder = 7
                      Width = 37
                    end
                    object cxLabel59: TcxLabel
                      Left = 224
                      Top = 43
                      Caption = 'AC'
                      Transparent = True
                    end
                    object cxLabel60: TcxLabel
                      Left = 226
                      Top = 87
                      Caption = 'HL'
                      Transparent = True
                    end
                    object edHL2: TcxMaskEdit
                      Left = 246
                      Top = 85
                      Properties.IgnoreMaskBlank = True
                      Properties.MaskKind = emkRegExprEx
                      Properties.EditMask = '(\d?)(\d?)\1'#39'.'#39'\1'
                      Properties.MaxLength = 0
                      TabOrder = 9
                      Width = 37
                    end
                    object cxLabel61: TcxLabel
                      Left = 74
                      Top = 65
                      Caption = 'cm'
                      Transparent = True
                    end
                    object cxLabel62: TcxLabel
                      Left = 74
                      Top = 43
                      Caption = 'cm'
                      Transparent = True
                    end
                    object cxLabel63: TcxLabel
                      Left = 286
                      Top = 43
                      Caption = 'cm'
                      Transparent = True
                    end
                    object cxLabel64: TcxLabel
                      Left = 74
                      Top = 87
                      Caption = 'cm'
                      Transparent = True
                    end
                    object cxLabel65: TcxLabel
                      Left = 286
                      Top = 65
                      Caption = 'cm'
                      Transparent = True
                    end
                    object seEstFetalWeight2: TcxSpinEdit
                      Left = 131
                      Top = 124
                      Properties.AssignedValues.MinValue = True
                      Properties.SpinButtons.Visible = False
                      TabOrder = 22
                      Width = 40
                    end
                    object cxLabel66: TcxLabel
                      Left = 10
                      Top = 125
                      Caption = 'Estimated Fetal Weight'
                      Transparent = True
                    end
                    object cxLabel67: TcxLabel
                      Left = 172
                      Top = 124
                      Caption = 'g   '
                      Transparent = True
                    end
                    object cxLabel68: TcxLabel
                      Left = 186
                      Top = 125
                      Caption = 'Weight Percentile'
                      Transparent = True
                    end
                    object edtBPDPer2: TcxMaskEdit
                      Left = 102
                      Top = 43
                      Properties.Alignment.Horz = taRightJustify
                      Properties.IgnoreMaskBlank = True
                      Properties.MaxLength = 0
                      TabOrder = 10
                      Width = 29
                    end
                    object cxLabel69: TcxLabel
                      Left = 133
                      Top = 43
                      Caption = '%'
                      Transparent = True
                    end
                    object edtOFDPer2: TcxMaskEdit
                      Left = 101
                      Top = 63
                      Properties.Alignment.Horz = taRightJustify
                      Properties.IgnoreMaskBlank = True
                      Properties.MaxLength = 0
                      TabOrder = 11
                      Width = 29
                    end
                    object cxLabel70: TcxLabel
                      Left = 133
                      Top = 65
                      Caption = '%'
                      Transparent = True
                    end
                    object edHCPer2: TcxMaskEdit
                      Left = 101
                      Top = 85
                      Properties.Alignment.Horz = taRightJustify
                      Properties.IgnoreMaskBlank = True
                      Properties.MaxLength = 0
                      TabOrder = 12
                      Width = 29
                    end
                    object cxLabel71: TcxLabel
                      Left = 133
                      Top = 87
                      Caption = '%'
                      Transparent = True
                    end
                    object edACPer2: TcxMaskEdit
                      Left = 309
                      Top = 41
                      Properties.Alignment.Horz = taRightJustify
                      Properties.IgnoreMaskBlank = True
                      Properties.MaxLength = 0
                      TabOrder = 13
                      Width = 29
                    end
                    object cxLabel72: TcxLabel
                      Left = 341
                      Top = 43
                      Caption = '%'
                      Transparent = True
                    end
                    object edHLPer2: TcxMaskEdit
                      Left = 309
                      Top = 85
                      Properties.Alignment.Horz = taRightJustify
                      Properties.IgnoreMaskBlank = True
                      Properties.MaxLength = 0
                      TabOrder = 15
                      Width = 29
                    end
                    object cxLabel73: TcxLabel
                      Left = 341
                      Top = 65
                      Caption = '%'
                      Transparent = True
                    end
                    object edtBPDForm2: TcxTextEdit
                      Left = 153
                      Top = 41
                      Enabled = False
                      TabOrder = 16
                      Width = 70
                    end
                    object edtOFDForm2: TcxTextEdit
                      Left = 153
                      Top = 63
                      Enabled = False
                      TabOrder = 17
                      Width = 70
                    end
                    object edHCForm2: TcxTextEdit
                      Left = 153
                      Top = 85
                      Enabled = False
                      TabOrder = 18
                      Width = 70
                    end
                    object edACForm2: TcxTextEdit
                      Left = 361
                      Top = 39
                      Enabled = False
                      TabOrder = 19
                      Width = 70
                    end
                    object edHLForm2: TcxTextEdit
                      Left = 362
                      Top = 85
                      Enabled = False
                      TabOrder = 20
                      Width = 70
                    end
                    object cbBiometryNotPerformed2: TcxCheckBox
                      Left = 7
                      Top = 0
                      Caption = 'Biometry Not Performed'
                      Style.LookAndFeel.NativeStyle = True
                      StyleDisabled.LookAndFeel.NativeStyle = True
                      StyleFocused.LookAndFeel.NativeStyle = True
                      StyleHot.LookAndFeel.NativeStyle = True
                      TabOrder = 0
                      Transparent = True
                      Width = 174
                    end
                    object edFL2: TcxMaskEdit
                      Left = 246
                      Top = 63
                      Properties.IgnoreMaskBlank = True
                      Properties.MaskKind = emkRegExprEx
                      Properties.EditMask = '(\d?)(\d?)\1'#39'.'#39'\1'
                      Properties.MaxLength = 0
                      TabOrder = 8
                      Width = 37
                    end
                    object cxLabel74: TcxLabel
                      Left = 227
                      Top = 65
                      Caption = 'FL'
                      Transparent = True
                    end
                    object cxLabel75: TcxLabel
                      Left = 286
                      Top = 87
                      Caption = 'cm'
                      Transparent = True
                    end
                    object edFLPer2: TcxMaskEdit
                      Left = 309
                      Top = 63
                      Properties.Alignment.Horz = taRightJustify
                      Properties.IgnoreMaskBlank = True
                      Properties.MaxLength = 0
                      TabOrder = 14
                      Width = 29
                    end
                    object cxLabel76: TcxLabel
                      Left = 341
                      Top = 87
                      Caption = '%'
                      Transparent = True
                    end
                    object edFLForm2: TcxTextEdit
                      Left = 362
                      Top = 63
                      Enabled = False
                      TabOrder = 21
                      Width = 70
                    end
                    object cbWeightChart2: TcxComboBox
                      Left = 307
                      Top = 121
                      Enabled = False
                      Properties.DropDownRows = 30
                      Properties.Items.Strings = (
                        'Hadlock'
                        'Australian (Mikolajczyk 2011)')
                      TabOrder = 24
                      Width = 142
                    end
                    object cbBioPercentile2: TcxComboBox
                      Left = 204
                      Top = 0
                      Properties.DropDownRows = 30
                      Properties.Items.Strings = (
                        ''
                        'CHITTY'
                        'HADLOCK'
                        'Intergrowth')
                      TabOrder = 1
                      Width = 110
                    end
                    object cxLabel77: TcxLabel
                      Left = 164
                      Top = -17
                      Caption = 'Author'
                      Transparent = True
                    end
                    object seWeightPercentile2: TcxMaskEdit
                      Left = 276
                      Top = 122
                      Properties.Alignment.Horz = taRightJustify
                      Properties.IgnoreMaskBlank = True
                      Properties.MaxLength = 0
                      TabOrder = 23
                      Width = 29
                    end
                    object btnGeneratePercentiles2: TcxButton
                      Left = 323
                      Top = 0
                      Width = 139
                      Height = 20
                      Caption = 'Get Percentiles'
                      TabOrder = 3
                    end
                    object cxMemo1: TcxMemo
                      Left = 728
                      Top = 84
                      Properties.ScrollBars = ssBoth
                      TabOrder = 48
                      Visible = False
                      Height = 94
                      Width = 204
                    end
                    object cxCheckBox1: TcxCheckBox
                      Left = 203
                      Top = 23
                      Caption = 'Override Current values'
                      Style.LookAndFeel.NativeStyle = True
                      StyleDisabled.LookAndFeel.NativeStyle = True
                      StyleFocused.LookAndFeel.NativeStyle = True
                      StyleHot.LookAndFeel.NativeStyle = True
                      TabOrder = 2
                      Transparent = True
                      Width = 145
                    end
                    object btnCalGrowthPer2: TcxButton
                      Left = 454
                      Top = 122
                      Width = 111
                      Height = 20
                      Caption = 'Cal growth Percentile'
                      TabOrder = 25
                    end
                    object cxgbTheChecks2: TcxGroupBox
                      Left = 13
                      Top = 159
                      Caption = 'Fetal Anatomy'
                      PanelStyle.Active = True
                      TabOrder = 49
                      Height = 88
                      Width = 549
                      object cbHeart4Chamber2: TcxCheckBox
                        Left = 8
                        Top = 55
                        Caption = 'Heart'
                        Properties.Alignment = taLeftJustify
                        TabOrder = 0
                        Transparent = True
                        Width = 113
                      end
                      object cbStomach2: TcxCheckBox
                        Left = 148
                        Top = 55
                        Caption = 'Stomach'
                        Properties.Alignment = taLeftJustify
                        TabOrder = 2
                        Transparent = True
                        Width = 113
                      end
                      object cbKidneys2: TcxCheckBox
                        Left = 317
                        Top = 56
                        Caption = 'Kidneys'
                        Properties.Alignment = taLeftJustify
                        TabOrder = 4
                        Transparent = True
                        Width = 62
                      end
                      object cbVentricles2: TcxCheckBox
                        Left = 77
                        Top = 55
                        Caption = 'Brain'
                        Properties.Alignment = taLeftJustify
                        TabOrder = 1
                        Transparent = True
                        Width = 76
                      end
                      object cbBladder2: TcxCheckBox
                        Left = 228
                        Top = 55
                        Caption = 'Bladder'
                        TabOrder = 3
                        Transparent = True
                        Width = 74
                      end
                      object cxGroupBox17: TcxGroupBox
                        Left = 8
                        Top = -1
                        ParentFont = False
                        Style.BorderStyle = ebsNone
                        Style.Edges = []
                        Style.Font.Charset = DEFAULT_CHARSET
                        Style.Font.Color = clWindowText
                        Style.Font.Height = -11
                        Style.Font.Name = 'Tahoma'
                        Style.Font.Style = []
                        Style.LookAndFeel.NativeStyle = True
                        Style.IsFontAssigned = True
                        StyleDisabled.LookAndFeel.NativeStyle = True
                        StyleFocused.LookAndFeel.NativeStyle = True
                        StyleHot.LookAndFeel.NativeStyle = True
                        TabOrder = 5
                        Transparent = True
                        Height = 36
                        Width = 152
                        object cbFetalAnatomyNormal2: TcxCheckBox
                          Left = 2
                          Top = 14
                          Caption = 'Normal'
                          State = cbsChecked
                          Style.BorderColor = clRed
                          Style.BorderStyle = ebsThick
                          Style.LookAndFeel.NativeStyle = True
                          StyleDisabled.LookAndFeel.NativeStyle = True
                          StyleFocused.LookAndFeel.NativeStyle = True
                          StyleHot.LookAndFeel.NativeStyle = True
                          TabOrder = 0
                          Transparent = True
                          Width = 62
                        end
                        object cbFetalAnatomyAbNormal2: TcxCheckBox
                          Left = 73
                          Top = 13
                          Caption = 'Abnormal'
                          Style.BorderColor = clRed
                          Style.BorderStyle = ebsThick
                          Style.LookAndFeel.NativeStyle = True
                          StyleDisabled.LookAndFeel.NativeStyle = True
                          StyleFocused.LookAndFeel.NativeStyle = True
                          StyleHot.LookAndFeel.NativeStyle = True
                          TabOrder = 1
                          Transparent = True
                          Width = 71
                        end
                      end
                      object cbAbnSUA2: TcxCheckBox
                        Left = 12
                        Top = 30
                        Caption = 'SUA'
                        TabOrder = 6
                        Transparent = True
                        Width = 53
                      end
                    end
                    object cxgbPlacentalDetails2: TcxGroupBox
                      Left = 16
                      Top = 259
                      ParentBackground = False
                      Style.Edges = []
                      TabOrder = 50
                      Height = 166
                      Width = 640
                      object cxLabel78: TcxLabel
                        Left = 0
                        Top = -2
                        Caption = 'Placenta Site'
                        Transparent = True
                      end
                      object gbPlacenta2: TcxGroupBox
                        Left = 4
                        Top = 17
                        PanelStyle.Active = True
                        Style.BorderStyle = ebsNone
                        Style.Edges = []
                        Style.LookAndFeel.NativeStyle = True
                        StyleDisabled.LookAndFeel.NativeStyle = True
                        StyleFocused.LookAndFeel.NativeStyle = True
                        StyleHot.LookAndFeel.NativeStyle = True
                        TabOrder = 0
                        Transparent = True
                        Height = 26
                        Width = 386
                        object cxLabel79: TcxLabel
                          Left = 8
                          Top = 7
                          Caption = '2:'
                          Transparent = True
                        end
                        object cbPlacentaSite2: TcxComboBox
                          Left = 25
                          Top = 4
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
                        object cxLabel80: TcxLabel
                          Left = 212
                          Top = 5
                          Caption = 'Low lying (<20mm)'
                          Transparent = True
                        end
                        object cxGroupBox18: TcxGroupBox
                          Left = 308
                          Top = 3
                          TabStop = True
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
                          object cbLowLyingPlacentaYes2: TcxCheckBox
                            Left = -3
                            Top = 0
                            Caption = 'Yes'
                            Style.BorderColor = clRed
                            Style.BorderStyle = ebsThick
                            TabOrder = 0
                            Transparent = True
                            Width = 41
                          end
                          object cbLowLyingPlacentaNo2: TcxCheckBox
                            Left = 38
                            Top = 0
                            Caption = 'No'
                            Style.BorderColor = clRed
                            Style.BorderStyle = ebsThick
                            TabOrder = 1
                            Transparent = True
                            Width = 41
                          end
                        end
                      end
                      object cxLabel81: TcxLabel
                        Left = 244
                        Top = 61
                        Caption = 'mm'
                        Transparent = True
                      end
                      object cxLabel82: TcxLabel
                        Left = 8
                        Top = 61
                        Caption = 'Leading edge to Internal Os'
                        Transparent = True
                      end
                      object meInternalOS2: TcxMaskEdit
                        Left = 220
                        Top = 59
                        Properties.IgnoreMaskBlank = True
                        Properties.MaskKind = emkRegExprEx
                        Properties.EditMask = '(\d?)(\d?)\1\1\1'
                        Properties.MaxLength = 0
                        TabOrder = 1
                        Width = 26
                      end
                      object cxLabel83: TcxLabel
                        Left = 7
                        Top = 82
                        Caption = 'Extends beyond the Internal cervical os by'
                        Transparent = True
                      end
                      object sePlacentaExtendsBy2: TcxSpinEdit
                        Left = 220
                        Top = 82
                        Properties.AssignedValues.MinValue = True
                        Properties.SpinButtons.Visible = False
                        TabOrder = 2
                        Width = 26
                      end
                      object cxLabel84: TcxLabel
                        Left = 244
                        Top = 83
                        Caption = 'mm'
                        Transparent = True
                      end
                    end
                    object cxGroupBox19: TcxGroupBox
                      Left = 170
                      Top = 65
                      Style.BorderStyle = ebsNone
                      Style.Edges = []
                      Style.LookAndFeel.NativeStyle = True
                      StyleDisabled.LookAndFeel.NativeStyle = True
                      StyleFocused.LookAndFeel.NativeStyle = True
                      StyleHot.LookAndFeel.NativeStyle = True
                      TabOrder = 51
                      Transparent = True
                      Height = 22
                      Width = 96
                    end
                    object cxGroupBox20: TcxGroupBox
                      Left = 407
                      Top = 65
                      Style.BorderStyle = ebsNone
                      Style.Edges = []
                      Style.LookAndFeel.NativeStyle = True
                      StyleDisabled.LookAndFeel.NativeStyle = True
                      StyleFocused.LookAndFeel.NativeStyle = True
                      StyleHot.LookAndFeel.NativeStyle = True
                      TabOrder = 52
                      Transparent = True
                      Height = 22
                      Width = 125
                    end
                    object cxGroupBox21: TcxGroupBox
                      Left = 155
                      Top = 21
                      Style.BorderStyle = ebsNone
                      Style.Edges = []
                      Style.LookAndFeel.NativeStyle = True
                      StyleDisabled.LookAndFeel.NativeStyle = True
                      StyleFocused.LookAndFeel.NativeStyle = True
                      StyleHot.LookAndFeel.NativeStyle = True
                      TabOrder = 53
                      Transparent = True
                      Height = 21
                      Width = 81
                    end
                    object cxGroupBox22: TcxGroupBox
                      Left = 171
                      Top = 385
                      Style.BorderStyle = ebsNone
                      Style.Edges = []
                      Style.LookAndFeel.NativeStyle = True
                      StyleDisabled.LookAndFeel.NativeStyle = True
                      StyleFocused.LookAndFeel.NativeStyle = True
                      StyleHot.LookAndFeel.NativeStyle = True
                      TabOrder = 54
                      Transparent = True
                      Height = 22
                      Width = 96
                    end
                  end
                end
              end
              object tsWellBeing2: TcxTabSheet
                Caption = 'Fetal Wellbeing'
                ImageIndex = 3
                ExplicitWidth = 1297
                ExplicitHeight = 360
                object Bevel12: TBevel
                  Left = 5
                  Top = 76
                  Width = 450
                  Height = 3
                  Style = bsRaised
                end
                object Bevel13: TBevel
                  Left = 6
                  Top = 139
                  Width = 450
                  Height = 3
                  Style = bsRaised
                end
                object Bevel14: TBevel
                  Left = 2
                  Top = 315
                  Width = 450
                  Height = 3
                  Style = bsRaised
                end
                object cxLabel90: TcxLabel
                  Left = 233
                  Top = 193
                  Caption = 'S/D ratio'
                  Transparent = True
                end
                object edtUmbilicalArtSD2: TcxMaskEdit
                  Left = 285
                  Top = 191
                  Properties.IgnoreMaskBlank = True
                  Properties.MaskKind = emkRegExprEx
                  Properties.EditMask = '(\d?)\1'#39'.'#39'\1\1'
                  Properties.MaxLength = 0
                  TabOrder = 11
                  Width = 37
                end
                object cxLabel91: TcxLabel
                  Left = 55
                  Top = 193
                  Caption = 'Pulsatility Index (PI)'
                  Transparent = True
                end
                object edtUmbilicalArtPI2: TcxMaskEdit
                  Left = 190
                  Top = 191
                  Properties.IgnoreMaskBlank = True
                  Properties.MaskKind = emkRegExprEx
                  Properties.EditMask = '(\d?)\1'#39'.'#39'\1\1'
                  Properties.MaxLength = 0
                  TabOrder = 10
                  Width = 37
                end
                object cxLabel92: TcxLabel
                  Left = 55
                  Top = 236
                  Caption = 'Pulsatility Index (PI)'
                  Transparent = True
                end
                object edtMidCerArtPI2: TcxMaskEdit
                  Left = 190
                  Top = 234
                  Properties.IgnoreMaskBlank = True
                  Properties.MaskKind = emkRegExprEx
                  Properties.EditMask = '(\d?)\1'#39'.'#39'\1\1'
                  Properties.MaxLength = 0
                  TabOrder = 13
                  Width = 37
                end
                object cxLabel93: TcxLabel
                  Left = 22
                  Top = 149
                  Caption = 'Doppler Evaluation'
                  Style.TextStyle = [fsBold]
                  Transparent = True
                end
                object cxLabel94: TcxLabel
                  Left = 34
                  Top = 216
                  Caption = 'Middle cerebral artery'
                  Style.TextColor = clBlue
                  Transparent = True
                end
                object cxLabel95: TcxLabel
                  Left = 19
                  Top = 7
                  Caption = 'Fetal movements:  Active '
                  Transparent = True
                end
                object cxGroupBox25: TcxGroupBox
                  Left = 154
                  Top = 5
                  Style.BorderStyle = ebsNone
                  Style.Edges = []
                  Style.LookAndFeel.NativeStyle = True
                  StyleDisabled.LookAndFeel.NativeStyle = True
                  StyleFocused.LookAndFeel.NativeStyle = True
                  StyleHot.LookAndFeel.NativeStyle = True
                  TabOrder = 1
                  Transparent = True
                  Height = 21
                  Width = 91
                  object cbFeatlMovementsYes2: TcxCheckBox
                    Left = 0
                    Top = 0
                    Caption = 'Yes'
                    TabOrder = 0
                    Transparent = True
                    Width = 41
                  end
                  object cbFeatlMovementsNo2: TcxCheckBox
                    Left = 39
                    Top = 0
                    Caption = 'No'
                    TabOrder = 1
                    Transparent = True
                    Width = 44
                  end
                end
                object lblBioPhysicalScore2: TcxLabel
                  Left = 19
                  Top = 48
                  Caption = 'Biophysical Profile score:'
                  Enabled = False
                  Transparent = True
                end
                object seBiophysicalScore2: TcxSpinEdit
                  Left = 155
                  Top = 46
                  Enabled = False
                  Properties.MaxValue = 8.000000000000000000
                  Properties.SpinButtons.Visible = False
                  TabOrder = 6
                  Width = 26
                end
                object lbldivBy82: TcxLabel
                  Left = 187
                  Top = 48
                  Caption = '/8'
                  Enabled = False
                  Transparent = True
                end
                object cbFetalTone2: TcxCheckBox
                  Left = 15
                  Top = 25
                  Caption = 'Fetal tone  '
                  Enabled = False
                  TabOrder = 2
                  Transparent = True
                  Width = 79
                end
                object cbFetalMovement2: TcxCheckBox
                  Left = 100
                  Top = 23
                  Caption = 'Fetal movement'
                  Enabled = False
                  TabOrder = 3
                  Transparent = True
                  Width = 101
                end
                object cbFetalBreathing2: TcxCheckBox
                  Left = 209
                  Top = 25
                  Caption = 'Fetal Breathing'
                  Enabled = False
                  TabOrder = 4
                  Transparent = True
                  Width = 108
                end
                object cbLiqur2: TcxCheckBox
                  Left = 329
                  Top = 25
                  Caption = 'Liquor'
                  Enabled = False
                  TabOrder = 5
                  Transparent = True
                  Width = 79
                end
                object lblAmnioticIndex2: TcxLabel
                  Left = 19
                  Top = 88
                  Caption = 'Amniotic fluid index (AFI)'
                  Transparent = True
                end
                object edtAFI2: TcxMaskEdit
                  Left = 149
                  Top = 85
                  Properties.IgnoreMaskBlank = True
                  Properties.MaskKind = emkRegExprEx
                  Properties.EditMask = '(\d?)\1'#39'.'#39'\1'
                  Properties.MaxLength = 0
                  TabOrder = 7
                  Width = 37
                end
                object lblAmnioticMeasure2: TcxLabel
                  Left = 188
                  Top = 88
                  Caption = 'cm'
                  Transparent = True
                end
                object cxLabel98: TcxLabel
                  Left = 35
                  Top = 172
                  Caption = 'Umbilical artery '
                  Style.TextColor = clBlue
                  Transparent = True
                end
                object lblAmnioticVerticlePocket2: TcxLabel
                  Left = 224
                  Top = 88
                  Caption = 'Deepest vertical pocket  '
                  Transparent = True
                end
                object edtDeepestPocket2: TcxMaskEdit
                  Left = 354
                  Top = 85
                  Properties.IgnoreMaskBlank = True
                  Properties.MaskKind = emkRegExprEx
                  Properties.EditMask = '(\d?)\1'#39'.'#39'\1'
                  Properties.MaxLength = 0
                  Style.BorderColor = clRed
                  Style.BorderStyle = ebsThick
                  TabOrder = 8
                  Width = 37
                end
                object lblAmnioticVerticleMeasure2: TcxLabel
                  Left = 393
                  Top = 88
                  Caption = 'cm'
                  Transparent = True
                end
                object cbFetalWellLiqor2: TcxComboBox
                  Left = 98
                  Top = 110
                  Properties.DropDownRows = 25
                  Properties.Items.Strings = (
                    'Normal'
                    'Increased'
                    'Decreased'
                    '')
                  TabOrder = 9
                  Width = 120
                end
                object cxLabel99: TcxLabel
                  Left = 18
                  Top = 112
                  Caption = 'Amniotic Fluid'
                  Transparent = True
                end
                object cxGroupBox26: TcxGroupBox
                  Left = 326
                  Top = 190
                  Style.BorderStyle = ebsNone
                  Style.Edges = []
                  Style.LookAndFeel.NativeStyle = True
                  StyleDisabled.LookAndFeel.NativeStyle = True
                  StyleFocused.LookAndFeel.NativeStyle = True
                  StyleHot.LookAndFeel.NativeStyle = True
                  TabOrder = 12
                  Transparent = True
                  Height = 21
                  Width = 108
                  object cbAEDF2: TcxCheckBox
                    Left = 0
                    Top = 2
                    Caption = 'AEDF'
                    TabOrder = 0
                    Transparent = True
                    Width = 48
                  end
                  object cbREDF3: TcxCheckBox
                    Left = 53
                    Top = 2
                    Caption = 'REDF'
                    TabOrder = 1
                    Transparent = True
                    Width = 54
                  end
                end
                object cxLabel100: TcxLabel
                  Left = 34
                  Top = 287
                  Caption = 'Ductus Venosus waveform'
                  Transparent = True
                end
                object cxGroupBox27: TcxGroupBox
                  Left = 187
                  Top = 284
                  Style.BorderStyle = ebsNone
                  Style.Edges = []
                  Style.LookAndFeel.NativeStyle = True
                  StyleDisabled.LookAndFeel.NativeStyle = True
                  StyleFocused.LookAndFeel.NativeStyle = True
                  StyleHot.LookAndFeel.NativeStyle = True
                  TabOrder = 14
                  Transparent = True
                  Height = 21
                  Width = 154
                  object cbDVWNormal2: TcxCheckBox
                    Left = 1
                    Top = 2
                    Caption = 'Normal'
                    TabOrder = 0
                    Transparent = True
                    Width = 61
                  end
                  object cbDVWAbNormal2: TcxCheckBox
                    Left = 76
                    Top = 1
                    Caption = 'Abnormal'
                    TabOrder = 1
                    Transparent = True
                    Width = 75
                  end
                end
                object cxLabel101: TcxLabel
                  Left = 37
                  Top = 384
                  Caption = 'Peak systolic velocity (PSV)'
                  Transparent = True
                end
                object edtMidCerArtPSF2: TcxMaskEdit
                  Left = 188
                  Top = 380
                  Properties.IgnoreMaskBlank = True
                  Properties.MaskKind = emkRegExprEx
                  Properties.EditMask = '(\d?)(\d?)\1'#39'.'#39'\1\1'
                  Properties.MaxLength = 0
                  TabOrder = 16
                  Width = 37
                end
                object cxLabel102: TcxLabel
                  Left = 226
                  Top = 382
                  Caption = 'cm/s'
                  Transparent = True
                end
                object cxGroupBox28: TcxGroupBox
                  Left = 275
                  Top = 380
                  Style.BorderStyle = ebsNone
                  Style.Edges = []
                  Style.LookAndFeel.NativeStyle = True
                  StyleDisabled.LookAndFeel.NativeStyle = True
                  StyleFocused.LookAndFeel.NativeStyle = True
                  StyleHot.LookAndFeel.NativeStyle = True
                  TabOrder = 17
                  Transparent = True
                  Height = 21
                  Width = 217
                  object fetalAnaemiaYes2: TcxCheckBox
                    Left = 6
                    Top = 0
                    Caption = '>=1.5 MoM'
                    TabOrder = 0
                    Transparent = True
                    Width = 88
                  end
                  object fetalAnaemiaNo2: TcxCheckBox
                    Left = 97
                    Top = 0
                    Caption = 'Normal'
                    TabOrder = 1
                    Transparent = True
                    Width = 75
                  end
                end
                object cxLabel103: TcxLabel
                  Left = 37
                  Top = 340
                  Caption = 'Risk of fetal anaemia (RBC antibodies or MC Twins)'
                  ParentFont = False
                  Style.Font.Charset = DEFAULT_CHARSET
                  Style.Font.Color = clWindowText
                  Style.Font.Height = -11
                  Style.Font.Name = 'Tahoma'
                  Style.Font.Style = [fsBold]
                  Style.IsFontAssigned = True
                  Transparent = True
                end
                object cxGroupBox29: TcxGroupBox
                  Left = 332
                  Top = 336
                  Style.BorderStyle = ebsNone
                  Style.Edges = []
                  Style.LookAndFeel.NativeStyle = True
                  StyleDisabled.LookAndFeel.NativeStyle = True
                  StyleFocused.LookAndFeel.NativeStyle = True
                  StyleHot.LookAndFeel.NativeStyle = True
                  TabOrder = 15
                  Transparent = True
                  Height = 21
                  Width = 154
                  object cbRiskFetalAnemiaYes2: TcxCheckBox
                    Left = 1
                    Top = 2
                    Caption = 'Yes'
                    TabOrder = 0
                    Transparent = True
                    Width = 45
                  end
                  object cbRiskFetalAnemiaNo2: TcxCheckBox
                    Left = 52
                    Top = 2
                    Caption = 'No'
                    TabOrder = 1
                    Transparent = True
                    Width = 75
                  end
                end
                object cxLabel104: TcxLabel
                  Left = 37
                  Top = 361
                  Caption = 'Middle cerebral artery'
                  Style.TextColor = clBlue
                  Transparent = True
                end
                object cbMergeLiquorGraphs2: TcxCheckBox
                  Left = 231
                  Top = 109
                  Caption = 'Merge Doppler / Liquor graphs'
                  Style.LookAndFeel.NativeStyle = True
                  StyleDisabled.LookAndFeel.NativeStyle = True
                  StyleFocused.LookAndFeel.NativeStyle = True
                  StyleHot.LookAndFeel.NativeStyle = True
                  TabOrder = 36
                  Transparent = True
                  Width = 183
                end
              end
            end
          end
        end
      end
    end
  end
end