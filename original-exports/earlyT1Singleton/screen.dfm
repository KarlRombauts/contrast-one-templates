inherited Early_Pregnancy: TEarly_Pregnancy
  Width = 1404
  Height = 808
  Align = alClient
  ExplicitWidth = 451
  ExplicitHeight = 304
  inherited cxpcReportMainPage: TcxPageControl
    Width = 1404
    Height = 808
    Properties.ActivePage = cxtsReportDetails
    ExplicitWidth = 451
    ExplicitHeight = 304
    ClientRectBottom = 808
    ClientRectRight = 1404
    ClientRectTop = 24
    object cxtsReportDetails: TcxTabSheet
      Caption = 'Details'
      ImageIndex = 1
      ExplicitWidth = 451
      ExplicitHeight = 280
      object ScrollBox1: TScrollBox
        Left = 0
        Top = 0
        Width = 1404
        Height = 784
        Align = alClient
        TabOrder = 0
        ExplicitWidth = 451
        ExplicitHeight = 280
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
          ExplicitWidth = 431
          Height = 847
          Width = 1384
          object cxGroupBox10: TcxGroupBox
            Left = 2
            Top = 2
            Align = alTop
            PanelStyle.Active = True
            Style.Edges = [bBottom]
            TabOrder = 0
            ExplicitWidth = 427
            Height = 126
            Width = 1380
            object cxLabel69: TcxLabel
              Left = 36
              Top = 2
              Caption = 'Exam Date'
              Transparent = True
            end
            object deExamDate: TcxDateEdit
              Left = 98
              Top = 0
              Properties.ImmediatePost = True
              Properties.ShowTime = False
              TabOrder = 1
              Width = 121
            end
            object cxLabel104: TcxLabel
              Left = -1
              Top = 22
              Caption = 'Referral indication'
              Transparent = True
            end
            object edtPresentComplaintOther: TcxTextEdit
              Left = 267
              Top = 21
              Enabled = False
              TabOrder = 3
              Width = 202
            end
            object cxLabel232: TcxLabel
              Left = 22
              Top = 76
              Caption = 'Clinical History'
              Transparent = True
            end
            object edtClicnicalHistory: TcxTextEdit
              Left = 267
              Top = 73
              Enabled = False
              TabOrder = 5
              Width = 202
            end
            object cxLabel23: TcxLabel
              Left = 543
              Top = 1
              Caption = 'v (06.06.06)06/08/2017'
              Transparent = True
            end
            object cbClinicalHistory: TcxCheckComboBox
              Left = 101
              Top = 73
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
                  Description = 'Slow rising serum HCG'
                  ShortDescription = 'Slow rising serum HCG'
                end
                item
                  Description = 'Abdominal pain'
                  ShortDescription = 'Abdominal pain'
                end
                item
                  Description = 'Previous miscarriage'
                  ShortDescription = 'Previous miscarriage'
                end
                item
                  Description = 'Other'
                  ShortDescription = 'Other'
                end>
              TabOrder = 7
              Width = 163
            end
            object cxccbReferralIndicators: TcxCheckComboBox
              Left = 98
              Top = 22
              Properties.DropDownRows = 20
              Properties.Items = <
                item
                  Description = 'Dating'
                  ShortDescription = 'Dating'
                end
                item
                  Description = 'Viability'
                  ShortDescription = 'Viability'
                end
                item
                  Description = 'Non-invasive prenatal screening'
                  ShortDescription = 'Non-invasive prenatal screening'
                end
                item
                  Description = 'Exclude ectopic'
                  ShortDescription = 'Exclude ectopic'
                end
                item
                  Description = 'Exclude RPOC'
                  ShortDescription = 'Exclude RPOC'
                end
                item
                  Description = 'Other'
                  ShortDescription = 'Other'
                end>
              Style.BorderColor = clRed
              Style.BorderStyle = ebsThick
              TabOrder = 8
              Width = 163
            end
            object cxLabel92: TcxLabel
              Left = 509
              Top = 1
              Caption = 'Early'
              Transparent = True
            end
            object cxLabel93: TcxLabel
              Left = 98
              Top = 52
              Caption = 'G'
              Transparent = True
            end
            object cxLabel94: TcxLabel
              Left = 147
              Top = 52
              Caption = 'P'
              Transparent = True
            end
            object cxLabel95: TcxLabel
              Left = 194
              Top = 52
              Caption = 'M'
              Transparent = True
            end
            object cxLabel96: TcxLabel
              Left = 247
              Top = 52
              Caption = 'T'
              Transparent = True
            end
            object cxLabel97: TcxLabel
              Left = 297
              Top = 52
              Caption = 'C/S'
              Transparent = True
            end
            object cxLabel98: TcxLabel
              Left = 363
              Top = 52
              Caption = 'IVF'
              Transparent = True
            end
            object edtG: TcxTextEdit
              Left = 111
              Top = 48
              TabOrder = 16
              Width = 26
            end
            object edtP: TcxTextEdit
              Left = 159
              Top = 48
              TabOrder = 17
              Width = 26
            end
            object edtM: TcxTextEdit
              Left = 208
              Top = 48
              TabOrder = 18
              Width = 26
            end
            object edtT: TcxTextEdit
              Left = 258
              Top = 48
              TabOrder = 19
              Width = 26
            end
            object edtCS: TcxTextEdit
              Left = 324
              Top = 48
              TabOrder = 20
              Width = 26
            end
            object edtIVF: TcxTextEdit
              Left = 389
              Top = 48
              TabOrder = 21
              Width = 26
            end
            object lblMedication: TcxLabel
              Left = 44
              Top = 100
              Caption = 'Medication'
              Transparent = True
            end
            object cbNaturalMedication: TcxComboBox
              Left = 102
              Top = 98
              Properties.Items.Strings = (
                'Nil'
                'Aspirin'
                'Aspirin and heparin'
                'Other')
              TabOrder = 23
              Text = 'Nil'
              Width = 151
            end
            object edtMedicationOther: TcxTextEdit
              Left = 267
              Top = 98
              Enabled = False
              TabOrder = 24
              Width = 150
            end
          end
          object pcReportBody: TcxPageControl
            Left = 2
            Top = 274
            Width = 1380
            Height = 599
            Align = alTop
            TabOrder = 1
            Properties.ActivePage = cxtsPregnancy
            Properties.CustomButtons.Buttons = <>
            ExplicitWidth = 427
            ClientRectBottom = 599
            ClientRectRight = 1380
            ClientRectTop = 24
            object cxtsPregnancy: TcxTabSheet
              Caption = 'Pregnancy Type'
              ImageIndex = 4
              ExplicitWidth = 427
              object pcEarlyPregType: TcxPageControl
                Left = 0
                Top = 0
                Width = 1380
                Height = 575
                Align = alClient
                TabOrder = 0
                Properties.ActivePage = cxtsIntrauterine
                Properties.CustomButtons.Buttons = <>
                ExplicitWidth = 427
                ClientRectBottom = 575
                ClientRectRight = 1380
                ClientRectTop = 24
                object cxtsIntrauterine: TcxTabSheet
                  Caption = 'Intrauterine'
                  ImageIndex = 0
                  ExplicitWidth = 427
                  object cxGroupBox6: TcxGroupBox
                    Left = 0
                    Top = 0
                    Align = alTop
                    PanelStyle.Active = True
                    Style.BorderStyle = ebsNone
                    Style.Edges = []
                    Style.LookAndFeel.NativeStyle = False
                    StyleDisabled.LookAndFeel.NativeStyle = False
                    StyleFocused.LookAndFeel.NativeStyle = False
                    StyleHot.LookAndFeel.NativeStyle = False
                    TabOrder = 0
                    ExplicitWidth = 427
                    Height = 28
                    Width = 1380
                    object cxLabel1: TcxLabel
                      Left = 3
                      Top = 5
                      Caption = 'Complete this section for live IUP and missed miscarriage.'
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
                  object pcEmbryos: TcxPageControl
                    Left = 0
                    Top = 28
                    Width = 1380
                    Height = 239
                    Align = alTop
                    TabOrder = 1
                    Properties.ActivePage = cxtsFetus1
                    Properties.CustomButtons.Buttons = <>
                    ExplicitWidth = 427
                    ClientRectBottom = 239
                    ClientRectRight = 1380
                    ClientRectTop = 24
                    object cxtsFetus1: TcxTabSheet
                      Caption = 'Embryo 1'
                      ImageIndex = 0
                      ExplicitWidth = 427
                      object cxpnlEmbryo1LRSI1: TcxGroupBox
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
                        ExplicitWidth = 427
                        Height = 7
                        Width = 1380
                      end
                      object cxGroupBox2: TcxGroupBox
                        Left = 0
                        Top = 7
                        Align = alClient
                        PanelStyle.Active = True
                        Style.BorderStyle = ebsNone
                        Style.Edges = []
                        Style.LookAndFeel.NativeStyle = True
                        StyleDisabled.LookAndFeel.NativeStyle = True
                        StyleFocused.LookAndFeel.NativeStyle = True
                        StyleHot.LookAndFeel.NativeStyle = True
                        TabOrder = 1
                        Transparent = True
                        ExplicitWidth = 427
                        Height = 208
                        Width = 1380
                        object Bevel2: TBevel
                          Left = 6
                          Top = 26
                          Width = 502
                          Height = 3
                        end
                        object Bevel3: TBevel
                          Left = 6
                          Top = 103
                          Width = 502
                          Height = 3
                        end
                        object cxGroupBox3: TcxGroupBox
                          Tag = 2
                          Left = 4
                          Top = 138
                          Style.BorderStyle = ebsNone
                          Style.Edges = []
                          Style.LookAndFeel.NativeStyle = True
                          StyleDisabled.LookAndFeel.NativeStyle = True
                          StyleFocused.LookAndFeel.NativeStyle = True
                          StyleHot.LookAndFeel.NativeStyle = True
                          TabOrder = 8
                          Transparent = True
                          Height = 100
                          Width = 510
                          object cbHeartMotionVisYes1: TcxCheckBox
                            Left = 137
                            Top = 0
                            Caption = 'Yes'
                            Enabled = False
                            TabOrder = 0
                            Transparent = True
                            Width = 40
                          end
                          object cbHeartMotionVisNo1: TcxCheckBox
                            Left = 174
                            Top = 0
                            Caption = 'No'
                            Enabled = False
                            TabOrder = 1
                            Transparent = True
                            Width = 41
                          end
                          object seHeartBPM1: TcxSpinEdit
                            Left = 385
                            Top = 0
                            Enabled = False
                            Properties.SpinButtons.Visible = False
                            TabOrder = 2
                            Width = 40
                          end
                          object lblHeartBPM: TcxLabel
                            Left = 427
                            Top = 2
                            Caption = 'bpm'
                            Transparent = True
                          end
                          object lblHeartRate1: TcxLabel
                            Left = 221
                            Top = 2
                            Caption = 'Heart Rate'
                            Enabled = False
                            Transparent = True
                          end
                          object cbHeartMotion1: TcxComboBox
                            Left = 282
                            Top = 0
                            Enabled = False
                            Properties.Items.Strings = (
                              ''
                              'Normal'
                              'Bradycardia'
                              'Tachycardia')
                            TabOrder = 3
                            Width = 97
                          end
                          object lblHeartVisualised1: TcxLabel
                            Left = 3
                            Top = 2
                            Caption = 'Heart Motion visualised'
                            Enabled = False
                            Transparent = True
                          end
                          object lblAbsentHeartConfrim1: TcxLabel
                            Left = 3
                            Top = 28
                            Caption = 'Absent Heart Motion, confirmed by'
                            Enabled = False
                            Transparent = True
                          end
                          object gbAbsentHeartMotion1: TcxGroupBox
                            Tag = 2
                            Left = 183
                            Top = 26
                            Style.BorderStyle = ebsNone
                            Style.Edges = []
                            Style.LookAndFeel.NativeStyle = True
                            StyleDisabled.LookAndFeel.NativeStyle = True
                            StyleFocused.LookAndFeel.NativeStyle = True
                            StyleHot.LookAndFeel.NativeStyle = True
                            TabOrder = 8
                            Transparent = True
                            Height = 25
                            Width = 192
                            object cbHeartMotMMode1: TcxCheckBox
                              Left = 4
                              Top = 0
                              Caption = 'M-Mode '
                              Enabled = False
                              TabOrder = 0
                              Transparent = True
                              Width = 85
                            end
                            object cbHeartMotColDop1: TcxCheckBox
                              Left = 95
                              Top = 0
                              Caption = 'Colour Doppler '
                              Enabled = False
                              TabOrder = 1
                              Transparent = True
                              Width = 98
                            end
                          end
                        end
                        object cxGroupBox5: TcxGroupBox
                          Tag = 2
                          Left = 95
                          Top = 60
                          Style.BorderStyle = ebsNone
                          Style.Edges = []
                          Style.LookAndFeel.NativeStyle = True
                          StyleDisabled.LookAndFeel.NativeStyle = True
                          StyleFocused.LookAndFeel.NativeStyle = True
                          StyleHot.LookAndFeel.NativeStyle = True
                          TabOrder = 7
                          Transparent = True
                          Height = 41
                          Width = 334
                          object cbEmbryo1Visualised1: TcxCheckBox
                            Left = 3
                            Top = 12
                            Caption = 'Yes'
                            TabOrder = 0
                            Transparent = True
                            Width = 44
                          end
                          object cbEmbryo1NotVisualised1: TcxCheckBox
                            Left = 40
                            Top = 13
                            Caption = 'No'
                            TabOrder = 1
                            Transparent = True
                            Width = 40
                          end
                          object edtEmbroSize1: TcxMaskEdit
                            Left = 127
                            Top = 13
                            Enabled = False
                            Properties.IgnoreMaskBlank = True
                            Properties.MaskKind = emkRegExprEx
                            Properties.EditMask = '(\d?)(\d?)\1'#39'.'#39'\1\1'
                            Properties.MaxLength = 0
                            TabOrder = 2
                            Text = '0'
                            Width = 40
                          end
                          object seEmbryoWeeks1: TcxSpinEdit
                            Left = 189
                            Top = 14
                            Enabled = False
                            Properties.SpinButtons.Visible = False
                            TabOrder = 3
                            Width = 28
                          end
                          object lblEnbryoWeeks: TcxLabel
                            Left = 217
                            Top = 15
                            Caption = 'Weeks'
                            Transparent = True
                          end
                          object seEmbryoDays1: TcxSpinEdit
                            Left = 254
                            Top = 13
                            Enabled = False
                            Properties.SpinButtons.Visible = False
                            TabOrder = 5
                            Width = 28
                          end
                          object lblEmbryoDays: TcxLabel
                            Left = 285
                            Top = 15
                            Caption = 'Days'
                            Transparent = True
                          end
                          object cxLabel56: TcxLabel
                            Left = 168
                            Top = 15
                            Caption = 'mm'
                            Transparent = True
                          end
                          object cxLabel273: TcxLabel
                            Left = 100
                            Top = 15
                            Caption = 'CRL'
                            Transparent = True
                          end
                        end
                        object cxGroupBox14: TcxGroupBox
                          Tag = 2
                          Left = 96
                          Top = 106
                          Style.BorderStyle = ebsNone
                          Style.Edges = []
                          Style.LookAndFeel.NativeStyle = True
                          StyleDisabled.LookAndFeel.NativeStyle = True
                          StyleFocused.LookAndFeel.NativeStyle = True
                          StyleHot.LookAndFeel.NativeStyle = True
                          TabOrder = 6
                          Transparent = True
                          Height = 29
                          Width = 222
                          object cbYolkSacYes1: TcxCheckBox
                            Left = 3
                            Top = 5
                            Caption = 'Yes'
                            TabOrder = 0
                            Transparent = True
                            Width = 44
                          end
                          object cbYolkSacNo1: TcxCheckBox
                            Left = 44
                            Top = 5
                            Caption = 'No'
                            TabOrder = 1
                            Transparent = True
                            Width = 42
                          end
                          object edtYolkSacSize1: TcxMaskEdit
                            Left = 129
                            Top = 5
                            Enabled = False
                            Properties.IgnoreMaskBlank = True
                            Properties.MaskKind = emkRegExprEx
                            Properties.EditMask = '(\d?)(\d?)\1'#39'.'#39'\1\1'
                            Properties.MaxLength = 0
                            TabOrder = 2
                            Text = '0'
                            Width = 40
                          end
                          object cxLabel55: TcxLabel
                            Left = 170
                            Top = 6
                            Caption = 'mm'
                            Transparent = True
                          end
                        end
                        object cxLabel40: TcxLabel
                          Left = 198
                          Top = 37
                          Caption = 'Avg:'
                          Transparent = True
                        end
                        object cxLabel39: TcxLabel
                          Left = 160
                          Top = 37
                          Caption = 'mm'
                          Transparent = True
                        end
                        object seSac31: TcxSpinEdit
                          Left = 129
                          Top = 35
                          Properties.AssignedValues.MinValue = True
                          Properties.SpinButtons.Visible = False
                          TabOrder = 2
                          Width = 30
                        end
                        object seSac21: TcxSpinEdit
                          Left = 90
                          Top = 35
                          Properties.AssignedValues.MinValue = True
                          Properties.SpinButtons.Visible = False
                          TabOrder = 1
                          Width = 30
                        end
                        object seSac11: TcxSpinEdit
                          Left = 52
                          Top = 35
                          Properties.AssignedValues.MinValue = True
                          Properties.SpinButtons.Visible = False
                          TabOrder = 0
                          Width = 30
                        end
                        object cxLabel36: TcxLabel
                          Left = 383
                          Top = 37
                          Caption = 'Days'
                          Transparent = True
                        end
                        object cxLabel32: TcxLabel
                          Left = 315
                          Top = 37
                          Caption = 'Weeks'
                          Transparent = True
                        end
                        object spSacWeeks1: TcxSpinEdit
                          Left = 286
                          Top = 35
                          Properties.SpinButtons.Visible = False
                          TabOrder = 4
                          Width = 28
                        end
                        object edtSacAvg1: TcxMaskEdit
                          Left = 227
                          Top = 35
                          Properties.IgnoreMaskBlank = True
                          Properties.MaskKind = emkRegExpr
                          Properties.EditMask = '\d+(\d{1,2})?'
                          Properties.MaxLength = 0
                          TabOrder = 3
                          Text = '0'
                          Width = 40
                        end
                        object cxLabel15: TcxLabel
                          Left = 3
                          Top = 37
                          Caption = 'Gest. Sac'
                          Transparent = True
                        end
                        object spSacDays1: TcxSpinEdit
                          Left = 352
                          Top = 35
                          Properties.SpinButtons.Visible = False
                          TabOrder = 5
                          Width = 28
                        end
                        object cxLabel2: TcxLabel
                          Left = 4
                          Top = 3
                          Caption = 'USS EDD'
                          Transparent = True
                        end
                        object deUSSEDD1: TcxDateEdit
                          Left = 50
                          Top = 1
                          Properties.SaveTime = False
                          Properties.ShowTime = False
                          TabOrder = 15
                          Width = 105
                        end
                        object cxLabel42: TcxLabel
                          Left = 191
                          Top = 3
                          Caption = 'Gestational Age'
                          Transparent = True
                        end
                        object seUSSEDDGAWeeks1: TcxSpinEdit
                          Left = 286
                          Top = 1
                          Properties.SpinButtons.Visible = False
                          TabOrder = 17
                          Width = 28
                        end
                        object cxLabel58: TcxLabel
                          Left = 315
                          Top = 3
                          Caption = 'Weeks'
                          Transparent = True
                        end
                        object seSSEDDGADays1: TcxSpinEdit
                          Left = 352
                          Top = 1
                          Properties.SpinButtons.Visible = False
                          TabOrder = 19
                          Width = 28
                        end
                        object cxLabel59: TcxLabel
                          Left = 383
                          Top = 2
                          Caption = 'Days'
                          Transparent = True
                        end
                        object cxLabel271: TcxLabel
                          Left = 267
                          Top = 37
                          Caption = 'mm'
                          Transparent = True
                        end
                        object cxLabel272: TcxLabel
                          Left = 4
                          Top = 73
                          Caption = 'Embryo visualised'
                          Transparent = True
                        end
                        object cxLabel274: TcxLabel
                          Left = 5
                          Top = 112
                          Caption = 'Yolk Sac Present'
                          Transparent = True
                        end
                        object seSSEDDTotalDays1: TcxSpinEdit
                          Left = 417
                          Top = 1
                          Properties.SpinButtons.Visible = False
                          TabOrder = 24
                          Visible = False
                          Width = 28
                        end
                      end
                    end
                  end
                  object cxGroupBox22: TcxGroupBox
                    Tag = 2
                    Left = 0
                    Top = 285
                    Align = alTop
                    Caption = ' Perigestational haemorrhage'
                    Style.BorderStyle = ebsNone
                    Style.Edges = []
                    Style.LookAndFeel.NativeStyle = True
                    StyleDisabled.LookAndFeel.NativeStyle = True
                    StyleFocused.LookAndFeel.NativeStyle = True
                    StyleHot.LookAndFeel.NativeStyle = True
                    TabOrder = 2
                    Transparent = True
                    ExplicitWidth = 427
                    Height = 80
                    Width = 1380
                    object cbPreigHeamYes: TcxCheckBox
                      Left = 3
                      Top = 12
                      Caption = 'Yes'
                      TabOrder = 0
                      Transparent = True
                      Width = 52
                    end
                    object cbPreigHeamNo: TcxCheckBox
                      Left = 50
                      Top = 13
                      Caption = 'No'
                      TabOrder = 1
                      Transparent = True
                      Width = 71
                    end
                    object sePGHLen: TcxSpinEdit
                      Left = 121
                      Top = 14
                      Properties.AssignedValues.MinValue = True
                      TabOrder = 2
                      Width = 45
                    end
                    object cxLabel150: TcxLabel
                      Left = 166
                      Top = 14
                      Caption = 'x'
                      Transparent = True
                    end
                    object sePGHWid: TcxSpinEdit
                      Left = 176
                      Top = 14
                      Properties.AssignedValues.MinValue = True
                      TabOrder = 4
                      Width = 45
                    end
                    object cxLabel151: TcxLabel
                      Left = 220
                      Top = 14
                      Caption = 'x'
                      Transparent = True
                    end
                    object sePGHDep: TcxSpinEdit
                      Left = 231
                      Top = 14
                      Properties.AssignedValues.MinValue = True
                      TabOrder = 6
                      Width = 45
                    end
                    object cxLabel203: TcxLabel
                      Left = 276
                      Top = 14
                      Caption = 'mm'
                      Transparent = True
                    end
                    object sePGHVol: TcxSpinEdit
                      Left = 298
                      Top = 14
                      Properties.AssignedValues.MinValue = True
                      Properties.DisplayFormat = '#0.0'
                      Properties.EditFormat = '#0.0'
                      Properties.ValueType = vtFloat
                      TabOrder = 8
                      Width = 50
                    end
                    object cxLabel226: TcxLabel
                      Left = 350
                      Top = 14
                      Caption = 'cc'
                      Transparent = True
                    end
                  end
                  object cxGroupBox41: TcxGroupBox
                    Left = 0
                    Top = 267
                    Align = alTop
                    PanelStyle.Active = True
                    Style.BorderStyle = ebsNone
                    Style.Edges = []
                    Style.LookAndFeel.NativeStyle = False
                    StyleDisabled.LookAndFeel.NativeStyle = False
                    StyleFocused.LookAndFeel.NativeStyle = False
                    StyleHot.LookAndFeel.NativeStyle = False
                    TabOrder = 3
                    ExplicitWidth = 427
                    Height = 18
                    Width = 1380
                    object Bevel15: TBevel
                      Left = 6
                      Top = 7
                      Width = 502
                      Height = 3
                    end
                  end
                end
              end
            end
            object tsOvaries: TcxTabSheet
              Tag = 1
              Caption = 'Ovaries'
              ImageIndex = 0
              object cxLabel33: TcxLabel
                Left = 1
                Top = 0
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
              object cxLabel70: TcxLabel
                Left = 290
                Top = 1
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
              object cbRightOvaryIdentified: TcxCheckBox
                Left = 77
                Top = 0
                Caption = 'Not Identified'
                TabOrder = 0
                Transparent = True
                Width = 94
              end
              object cbLeftOvaryIdentified: TcxCheckBox
                Left = 376
                Top = 0
                Caption = 'Not Identified'
                TabOrder = 1
                Transparent = True
                Width = 93
              end
              object cbRightOvaryNormal: TcxCheckBox
                Left = 4
                Top = 23
                Caption = 'Normal'
                TabOrder = 4
                Transparent = True
                Width = 60
              end
              object cbLeftOvaryNormal: TcxCheckBox
                Left = 306
                Top = 24
                Caption = 'Normal'
                TabOrder = 5
                Transparent = True
                Width = 61
              end
              object cbRightOvaryAbnormal: TcxCheckBox
                Left = 70
                Top = 23
                Caption = 'Abnormal'
                TabOrder = 6
                Transparent = True
                Width = 90
              end
              object cbLeftOvaryAbnormal: TcxCheckBox
                Left = 366
                Top = 24
                Caption = 'Abnormal'
                TabOrder = 7
                Transparent = True
                Width = 84
              end
              object cbRightOvaryCL: TcxCheckBox
                Left = 158
                Top = 24
                Caption = 'Corpus Luteum'
                TabOrder = 8
                Transparent = True
                Width = 96
              end
              object cbLeftOvaryCL: TcxCheckBox
                Left = 462
                Top = 23
                Caption = 'Corpus Luteum'
                TabOrder = 9
                Transparent = True
                Width = 99
              end
            end
            object tsFibroids: TcxTabSheet
              Tag = 1
              Caption = 'Fibroids'
              ImageIndex = 2
              object cxGroupBox26: TcxGroupBox
                Left = 0
                Top = 0
                Align = alTop
                PanelStyle.Active = True
                TabOrder = 0
                Height = 27
                Width = 1380
                object cxLabel153: TcxLabel
                  Left = 119
                  Top = 5
                  Caption = 'Count'
                  Transparent = True
                end
                object spFibroidCount: TcxSpinEdit
                  Left = 160
                  Top = 2
                  Properties.AssignedValues.MinValue = True
                  Properties.LargeIncrement = 2.000000000000000000
                  Properties.MaxValue = 10.000000000000000000
                  TabOrder = 1
                  Width = 44
                end
                object cbFibroidsVisualised: TcxCheckBox
                  Left = 1
                  Top = 3
                  Caption = 'Fibroids visualised'
                  TabOrder = 2
                  Transparent = True
                  Width = 111
                end
              end
              object gbFibroid10: TcxGroupBox
                Left = 0
                Top = 263
                PanelStyle.Active = True
                Style.BorderStyle = ebsNone
                Style.Edges = []
                Style.LookAndFeel.NativeStyle = True
                StyleDisabled.LookAndFeel.NativeStyle = True
                StyleFocused.LookAndFeel.NativeStyle = True
                StyleHot.LookAndFeel.NativeStyle = True
                TabOrder = 1
                Transparent = True
                Height = 24
                Width = 591
                object cxLabel4: TcxLabel
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
                object cxLabel5: TcxLabel
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
                  Left = 415
                  Top = 3
                  Caption = 'Close to Cervix'
                  TabOrder = 8
                  Transparent = True
                  Width = 110
                end
                object edtFibroiddepth10: TcxSpinEdit
                  Left = 318
                  Top = 3
                  Properties.AssignedValues.MinValue = True
                  Properties.SpinButtons.Visible = False
                  TabOrder = 6
                  Width = 30
                end
                object cxLabel6: TcxLabel
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
                object cxLabel7: TcxLabel
                  Left = 347
                  Top = 5
                  Caption = 'mm'
                  Transparent = True
                end
                object cxLabel8: TcxLabel
                  Left = 403
                  Top = 5
                  Caption = 'cc'
                  Transparent = True
                end
                object seCloseToCrevix10: TcxSpinEdit
                  Left = 514
                  Top = 3
                  Properties.AssignedValues.MinValue = True
                  Properties.SpinButtons.Visible = False
                  TabOrder = 13
                  Width = 30
                end
                object cxLabel9: TcxLabel
                  Left = 543
                  Top = 6
                  Caption = 'mm'
                  Transparent = True
                end
              end
              object gbFibroid9: TcxGroupBox
                Left = 0
                Top = 236
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
                object cxLabel10: TcxLabel
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
                object cxLabel11: TcxLabel
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
                  Left = 415
                  Top = 3
                  Caption = 'Close to Cervix'
                  TabOrder = 8
                  Transparent = True
                  Width = 110
                end
                object edtFibroiddepth9: TcxSpinEdit
                  Left = 318
                  Top = 3
                  Properties.AssignedValues.MinValue = True
                  Properties.SpinButtons.Visible = False
                  TabOrder = 6
                  Width = 30
                end
                object cxLabel12: TcxLabel
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
                object cxLabel13: TcxLabel
                  Left = 347
                  Top = 5
                  Caption = 'mm'
                  Transparent = True
                end
                object cxLabel14: TcxLabel
                  Left = 403
                  Top = 5
                  Caption = 'cc'
                  Transparent = True
                end
                object seCloseToCrevix9: TcxSpinEdit
                  Left = 514
                  Top = 3
                  Properties.AssignedValues.MinValue = True
                  Properties.SpinButtons.Visible = False
                  TabOrder = 13
                  Width = 30
                end
                object cxLabel16: TcxLabel
                  Left = 543
                  Top = 6
                  Caption = 'mm'
                  Transparent = True
                end
              end
              object gbFibroid8: TcxGroupBox
                Left = 0
                Top = 210
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
                object cxLabel17: TcxLabel
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
                object cxLabel18: TcxLabel
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
                  Left = 415
                  Top = 3
                  Caption = 'Close to Cervix'
                  TabOrder = 8
                  Transparent = True
                  Width = 110
                end
                object edtFibroiddepth8: TcxSpinEdit
                  Left = 318
                  Top = 3
                  Properties.AssignedValues.MinValue = True
                  Properties.SpinButtons.Visible = False
                  TabOrder = 6
                  Width = 30
                end
                object cxLabel19: TcxLabel
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
                object cxLabel20: TcxLabel
                  Left = 347
                  Top = 5
                  Caption = 'mm'
                  Transparent = True
                end
                object cxLabel21: TcxLabel
                  Left = 403
                  Top = 5
                  Caption = 'cc'
                  Transparent = True
                end
                object seCloseToCrevix8: TcxSpinEdit
                  Left = 514
                  Top = 3
                  Properties.AssignedValues.MinValue = True
                  Properties.SpinButtons.Visible = False
                  TabOrder = 13
                  Width = 30
                end
                object cxLabel22: TcxLabel
                  Left = 543
                  Top = 6
                  Caption = 'mm'
                  Transparent = True
                end
              end
              object gbFibroid7: TcxGroupBox
                Left = 0
                Top = 184
                PanelStyle.Active = True
                Style.BorderStyle = ebsNone
                Style.Edges = []
                Style.LookAndFeel.NativeStyle = True
                StyleDisabled.LookAndFeel.NativeStyle = True
                StyleFocused.LookAndFeel.NativeStyle = True
                StyleHot.LookAndFeel.NativeStyle = True
                TabOrder = 4
                Transparent = True
                Height = 25
                Width = 591
                object cxLabel24: TcxLabel
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
                object cxLabel25: TcxLabel
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
                  Left = 415
                  Top = 3
                  Caption = 'Close to Cervix'
                  TabOrder = 8
                  Transparent = True
                  Width = 110
                end
                object edtFibroiddepth7: TcxSpinEdit
                  Left = 318
                  Top = 3
                  Properties.AssignedValues.MinValue = True
                  Properties.SpinButtons.Visible = False
                  TabOrder = 6
                  Width = 30
                end
                object cxLabel26: TcxLabel
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
                object cxLabel27: TcxLabel
                  Left = 347
                  Top = 5
                  Caption = 'mm'
                  Transparent = True
                end
                object cxLabel28: TcxLabel
                  Left = 403
                  Top = 5
                  Caption = 'cc'
                  Transparent = True
                end
                object seCloseToCrevix7: TcxSpinEdit
                  Left = 514
                  Top = 3
                  Properties.AssignedValues.MinValue = True
                  Properties.SpinButtons.Visible = False
                  TabOrder = 13
                  Width = 30
                end
                object cxLabel29: TcxLabel
                  Left = 543
                  Top = 6
                  Caption = 'mm'
                  Transparent = True
                end
              end
              object gbFibroid6: TcxGroupBox
                Left = 0
                Top = 158
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
                object cxLabel30: TcxLabel
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
                object cxLabel31: TcxLabel
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
                  Left = 415
                  Top = 3
                  Caption = 'Close to Cervix'
                  TabOrder = 8
                  Transparent = True
                  Width = 110
                end
                object edtFibroiddepth6: TcxSpinEdit
                  Left = 318
                  Top = 3
                  Properties.AssignedValues.MinValue = True
                  Properties.SpinButtons.Visible = False
                  TabOrder = 6
                  Width = 30
                end
                object cxLabel37: TcxLabel
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
                object cxLabel38: TcxLabel
                  Left = 347
                  Top = 5
                  Caption = 'mm'
                  Transparent = True
                end
                object cxLabel57: TcxLabel
                  Left = 403
                  Top = 5
                  Caption = 'cc'
                  Transparent = True
                end
                object seCloseToCrevix6: TcxSpinEdit
                  Left = 514
                  Top = 3
                  Properties.AssignedValues.MinValue = True
                  Properties.SpinButtons.Visible = False
                  TabOrder = 13
                  Width = 30
                end
                object cxLabel60: TcxLabel
                  Left = 543
                  Top = 6
                  Caption = 'mm'
                  Transparent = True
                end
              end
              object gbFibroid5: TcxGroupBox
                Left = 0
                Top = 132
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
                object cxLabel61: TcxLabel
                  Left = 2
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
                object cxLabel62: TcxLabel
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
                  Left = 415
                  Top = 3
                  Caption = 'Close to Cervix'
                  TabOrder = 8
                  Transparent = True
                  Width = 110
                end
                object edtFibroiddepth5: TcxSpinEdit
                  Left = 318
                  Top = 3
                  Properties.AssignedValues.MinValue = True
                  Properties.SpinButtons.Visible = False
                  TabOrder = 6
                  Width = 30
                end
                object cxLabel63: TcxLabel
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
                object cxLabel64: TcxLabel
                  Left = 347
                  Top = 5
                  Caption = 'mm'
                  Transparent = True
                end
                object cxLabel65: TcxLabel
                  Left = 403
                  Top = 5
                  Caption = 'cc'
                  Transparent = True
                end
                object cxseCloseToCrevix5: TcxSpinEdit
                  Left = 514
                  Top = 3
                  Properties.AssignedValues.MinValue = True
                  Properties.SpinButtons.Visible = False
                  TabOrder = 13
                  Width = 30
                end
                object cxLabel66: TcxLabel
                  Left = 543
                  Top = 6
                  Caption = 'mm'
                  Transparent = True
                end
              end
              object gbFibroid4: TcxGroupBox
                Left = 0
                Top = 106
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
                object cxLabel67: TcxLabel
                  Left = 3
                  Top = 5
                  Caption = '4'
                  Transparent = True
                end
                object cbFibriodPosition4: TcxComboBox
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
                object cbFibroidsType4: TcxComboBox
                  Tag = 4
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
                object edtFibroidLength4: TcxSpinEdit
                  Left = 224
                  Top = 3
                  Properties.AssignedValues.MinValue = True
                  Properties.SpinButtons.Visible = False
                  TabOrder = 4
                  Width = 30
                end
                object cxLabel68: TcxLabel
                  Left = 256
                  Top = 5
                  Caption = 'x'
                  Transparent = True
                end
                object edtFibroidWidth4: TcxSpinEdit
                  Left = 271
                  Top = 3
                  Properties.AssignedValues.MinValue = True
                  Properties.SpinButtons.Visible = False
                  TabOrder = 5
                  Width = 30
                end
                object cbFibroidsLeftRight4: TcxComboBox
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
                object cbCavityDistortion4: TcxCheckBox
                  Left = 415
                  Top = 2
                  Caption = 'Close to Cervix'
                  TabOrder = 8
                  Transparent = True
                  Width = 110
                end
                object edtFibroiddepth4: TcxSpinEdit
                  Left = 318
                  Top = 3
                  Properties.AssignedValues.MinValue = True
                  Properties.SpinButtons.Visible = False
                  TabOrder = 6
                  Width = 30
                end
                object cxLabel71: TcxLabel
                  Left = 305
                  Top = 5
                  Caption = 'x'
                  Transparent = True
                end
                object edtFibroidVolume4: TcxSpinEdit
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
                object cxLabel72: TcxLabel
                  Left = 347
                  Top = 5
                  Caption = 'mm'
                  Transparent = True
                end
                object cxLabel73: TcxLabel
                  Left = 403
                  Top = 5
                  Caption = 'cc'
                  Transparent = True
                end
                object seCloseToCrevix4: TcxSpinEdit
                  Left = 514
                  Top = 3
                  Properties.AssignedValues.MinValue = True
                  Properties.SpinButtons.Visible = False
                  TabOrder = 13
                  Width = 30
                end
                object cxLabel74: TcxLabel
                  Left = 543
                  Top = 6
                  Caption = 'mm'
                  Transparent = True
                end
              end
              object gbFibroid3: TcxGroupBox
                Left = 0
                Top = 80
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
                object cxLabel75: TcxLabel
                  Left = 2
                  Top = 6
                  Caption = '3'
                  Transparent = True
                end
                object cbFibriodPosition3: TcxComboBox
                  Left = 64
                  Top = 4
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
                  Left = 134
                  Top = 4
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
                  Left = 224
                  Top = 4
                  Properties.AssignedValues.MinValue = True
                  Properties.SpinButtons.Visible = False
                  TabOrder = 4
                  Width = 30
                end
                object cxLabel76: TcxLabel
                  Left = 256
                  Top = 6
                  Caption = 'x'
                  Transparent = True
                end
                object edtFibroidWidth3: TcxSpinEdit
                  Left = 271
                  Top = 4
                  Properties.AssignedValues.MinValue = True
                  Properties.SpinButtons.Visible = False
                  TabOrder = 5
                  Width = 30
                end
                object cbFibroidsLeftRight3: TcxComboBox
                  Left = 13
                  Top = 4
                  Properties.Items.Strings = (
                    ''
                    'Right'
                    'Left'
                    'Fundal')
                  TabOrder = 1
                  Width = 50
                end
                object cbCavityDistortion3: TcxCheckBox
                  Left = 415
                  Top = 4
                  Caption = 'Close to Cervix'
                  TabOrder = 8
                  Transparent = True
                  Width = 110
                end
                object edtFibroiddepth3: TcxSpinEdit
                  Left = 318
                  Top = 4
                  Properties.AssignedValues.MinValue = True
                  Properties.SpinButtons.Visible = False
                  TabOrder = 6
                  Width = 30
                end
                object cxLabel77: TcxLabel
                  Left = 305
                  Top = 6
                  Caption = 'x'
                  Transparent = True
                end
                object edtFibroidVolume3: TcxSpinEdit
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
                object cxLabel78: TcxLabel
                  Left = 347
                  Top = 6
                  Caption = 'mm'
                  Transparent = True
                end
                object cxLabel79: TcxLabel
                  Left = 403
                  Top = 6
                  Caption = 'cc'
                  Transparent = True
                end
                object seCloseToCrevix3: TcxSpinEdit
                  Left = 514
                  Top = 3
                  Properties.AssignedValues.MinValue = True
                  Properties.SpinButtons.Visible = False
                  TabOrder = 13
                  Width = 30
                end
                object cxLabel80: TcxLabel
                  Left = 543
                  Top = 6
                  Caption = 'mm'
                  Transparent = True
                end
              end
              object gbFibroid2: TcxGroupBox
                Left = 0
                Top = 54
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
                object cxLabel81: TcxLabel
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
                object cxLabel82: TcxLabel
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
                  Left = 415
                  Top = 3
                  Caption = 'Close to Cervix'
                  TabOrder = 8
                  Transparent = True
                  Width = 110
                end
                object edtFibroiddepth2: TcxSpinEdit
                  Left = 318
                  Top = 3
                  Properties.AssignedValues.MinValue = True
                  Properties.SpinButtons.Visible = False
                  TabOrder = 6
                  Width = 30
                end
                object cxLabel83: TcxLabel
                  Left = 305
                  Top = 5
                  Caption = 'x'
                  Transparent = True
                end
                object edtFibroidVolume2: TcxSpinEdit
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
                object cxLabel84: TcxLabel
                  Left = 347
                  Top = 5
                  Caption = 'mm'
                  Transparent = True
                end
                object cxLabel85: TcxLabel
                  Left = 403
                  Top = 5
                  Caption = 'cc'
                  Transparent = True
                end
                object seCloseToCrevix2: TcxSpinEdit
                  Left = 514
                  Top = 3
                  Properties.AssignedValues.MinValue = True
                  Properties.SpinButtons.Visible = False
                  TabOrder = 13
                  Width = 30
                end
                object cxLabel86: TcxLabel
                  Left = 543
                  Top = 6
                  Caption = 'mm'
                  Transparent = True
                end
              end
              object gbFibroid1: TcxGroupBox
                Left = 1
                Top = 28
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
                object lblFibroid1: TcxLabel
                  Left = 1
                  Top = 5
                  Caption = '1'
                  Transparent = True
                end
                object cbFibriodPosition1: TcxComboBox
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
                object cbFibroidsType1: TcxComboBox
                  Tag = 1
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
                object edtFibroidLength1: TcxSpinEdit
                  Left = 224
                  Top = 3
                  Properties.AssignedValues.MinValue = True
                  Properties.SpinButtons.Visible = False
                  TabOrder = 4
                  Width = 30
                end
                object cxLabel87: TcxLabel
                  Left = 256
                  Top = 5
                  Caption = 'x'
                  Transparent = True
                end
                object edtFibroidWidth1: TcxSpinEdit
                  Left = 270
                  Top = 3
                  Properties.AssignedValues.MinValue = True
                  Properties.SpinButtons.Visible = False
                  TabOrder = 5
                  Width = 30
                end
                object cbFibroidsLeftRight1: TcxComboBox
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
                object cbCavityDistortion1: TcxCheckBox
                  Left = 415
                  Top = 3
                  Caption = 'Close to Cervix'
                  TabOrder = 8
                  Transparent = True
                  Width = 110
                end
                object cxLabel88: TcxLabel
                  Left = 305
                  Top = 5
                  Caption = 'x'
                  Transparent = True
                end
                object edtFibroiddepth1: TcxSpinEdit
                  Left = 318
                  Top = 3
                  Properties.AssignedValues.MinValue = True
                  Properties.SpinButtons.Visible = False
                  TabOrder = 6
                  Width = 30
                end
                object edtFibroidVolume1: TcxSpinEdit
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
                object cxLabel89: TcxLabel
                  Left = 347
                  Top = 5
                  Caption = 'mm'
                  Transparent = True
                end
                object cxLabel90: TcxLabel
                  Left = 403
                  Top = 5
                  Caption = 'cc'
                  Transparent = True
                end
                object seCloseToCrevix1: TcxSpinEdit
                  Left = 514
                  Top = 3
                  Properties.AssignedValues.MinValue = True
                  Properties.SpinButtons.Visible = False
                  TabOrder = 13
                  Width = 30
                end
                object cxLabel91: TcxLabel
                  Left = 543
                  Top = 6
                  Caption = 'mm'
                  Transparent = True
                end
              end
            end
          end
          object gbEDDDating: TcxGroupBox
            Left = 2
            Top = 128
            Margins.Left = 0
            Margins.Top = 0
            Margins.Right = 0
            Margins.Bottom = 0
            Align = alTop
            Caption = 'Dating'
            Style.BorderStyle = ebsNone
            Style.Edges = []
            TabOrder = 2
            ExplicitWidth = 427
            Height = 115
            Width = 1380
            object cxGroupBox38: TcxGroupBox
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
              ExplicitWidth = 423
              Height = 26
              Width = 1376
              object cbEDDPrinciple: TcxComboBox
                Left = 75
                Top = -1
                Properties.Items.Strings = (
                  'Stated EDD'
                  'No Dates'
                  'Menstrual EDD'
                  'City established EDD'
                  'Timed ovulation'
                  'IVF Embryo transfer'
                  'IVF Frozen embryo transfer')
                Style.BorderColor = clRed
                Style.BorderStyle = ebsThick
                Style.Edges = [bLeft, bTop, bRight, bBottom]
                Style.Shadow = True
                TabOrder = 0
                Width = 155
              end
              object cxLabel3: TcxLabel
                Left = 3
                Top = 4
                Caption = 'EDD Principle'
                Transparent = True
              end
              object btnPregnancyRedated: TcxButton
                Left = 245
                Top = 0
                Width = 139
                Height = 20
                Caption = 'Re-Date Pregnancy'
                TabOrder = 2
              end
              object cbPregnancyRedatedYes: TcxCheckBox
                Left = 405
                Top = 0
                Caption = 'Pregnancy Re-dated'
                Enabled = False
                TabOrder = 3
                Transparent = True
                Width = 144
              end
            end
            object pcEDDPrinciple: TcxPageControl
              Left = 2
              Top = 44
              Width = 1376
              Height = 69
              Align = alClient
              TabOrder = 1
              Properties.ActivePage = tsEstEDD
              Properties.CustomButtons.Buttons = <>
              Properties.TabPosition = tpRight
              ExplicitWidth = 423
              ClientRectBottom = 69
              ClientRectRight = 1352
              ClientRectTop = 0
              object tsMenstrualEDD: TcxTabSheet
                Caption = 'tsMenstrualEDD'
                ImageIndex = 0
                object cxLabel225: TcxLabel
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
                object cxLabel43: TcxLabel
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
                object cxLabel44: TcxLabel
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
                object cxLabel45: TcxLabel
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
                object cxLabel41: TcxLabel
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
                object cxLabel46: TcxLabel
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
                object cxLabel47: TcxLabel
                  Left = 405
                  Top = 3
                  Caption = 'D'
                  Transparent = True
                end
              end
              object tsEstEDD: TcxTabSheet
                Caption = 'tsEstEDD'
                ImageIndex = 2
                ExplicitWidth = 399
                object cxLabel48: TcxLabel
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
                object cxLabel49: TcxLabel
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
                object cxLabel235: TcxLabel
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
                object cxLabel236: TcxLabel
                  Left = 405
                  Top = 3
                  Caption = 'D'
                  Transparent = True
                end
              end
              object tsTimedEDD: TcxTabSheet
                Caption = 'tsTimedEDD'
                ImageIndex = 3
                object cxLabel237: TcxLabel
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
                object cxLabel238: TcxLabel
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
                object cxLabel239: TcxLabel
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
                object cxLabel240: TcxLabel
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
                object cxLabel241: TcxLabel
                  Left = 515
                  Top = 4
                  Caption = 'D'
                  Transparent = True
                end
              end
              object tsIVFEDD: TcxTabSheet
                Caption = 'tsIVFEDD'
                ImageIndex = 4
                object cxLabel50: TcxLabel
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
                object cxLabel51: TcxLabel
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
                object cxLabel228: TcxLabel
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
                object cxLabel229: TcxLabel
                  Left = 341
                  Top = 25
                  Caption = 'Number Transferred'
                  Transparent = True
                end
                object cxLabel52: TcxLabel
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
                object cxLabel53: TcxLabel
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
                object cxLabel54: TcxLabel
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
                object cxLabel231: TcxLabel
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
          object cxGroupBox11: TcxGroupBox
            Left = 2
            Top = 243
            Align = alTop
            Style.BorderStyle = ebsNone
            Style.Edges = []
            TabOrder = 3
            ExplicitWidth = 427
            Height = 31
            Width = 1380
            object cxLabel291: TcxLabel
              Left = 3
              Top = 3
              Caption = 'Gestation Type'
              Transparent = True
            end
            object cbGestationType: TcxComboBox
              Left = 81
              Top = 1
              Properties.DropDownRows = 20
              Properties.Items.Strings = (
                ''
                'Singleton')
              Style.BorderColor = clRed
              Style.BorderStyle = ebsThick
              Style.Shadow = True
              TabOrder = 0
              Width = 196
            end
            object cxLabel292: TcxLabel
              Left = 283
              Top = 2
              Caption = 'Pregnancy Outcome'
              Transparent = True
            end
            object cbPregnancyOutcome: TcxComboBox
              Left = 390
              Top = 1
              Properties.DropDownRows = 20
              Properties.Items.Strings = (
                ''
                'Live intrauterine gestation'
                'Too early to identify embryo'
                'Too early to confirm embryonic viability'
                'Missed miscarriage'
                'Pregnancy of unknown location'
                'Ectopic pregnancy')
              Style.BorderColor = clRed
              Style.BorderStyle = ebsThick
              Style.Shadow = True
              TabOrder = 3
              Width = 214
            end
          end
        end
      end
    end
  end
end