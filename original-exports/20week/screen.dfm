inherited Third_Trimester: TThird_Trimester
Width = 1198
Height = 721
Align = alClient
ExplicitWidth = 451
ExplicitHeight = 304
  inherited cxpcReportMainPage: TcxPageControl
    Left = 0
    Top = 0
    Width = 883
    Height = 752
    TabOrder = 0
    Properties.ActivePage = cxtsReportDetails
    Properties.CustomButtons.Buttons = <>
    ClientRectBottom = 752
    ClientRectRight = 883
    ClientRectTop = 24
    object cxtsReportDetails: TcxTabSheet
      Caption = 'Details'
      ImageIndex = 1
      ExplicitTop = 0
      ExplicitWidth = 451
      ExplicitHeight = 280
      object cxScrollBox1: TcxScrollBox
        Left = 0
        Top = 0
        Width = 883
        Height = 728
        Align = alClient
        TabOrder = 0
        ExplicitWidth = 451
        ExplicitHeight = 280
        object cxGroupBox1: TcxGroupBox
          Left = 10
          Top = -4
          PanelStyle.Active = True
          Style.Edges = [bBottom]
          TabOrder = 0
          Height = 181
          Width = 649
          object cxLabel2: TcxLabel
            Tag = -1
            Left = 59
            Top = 6
            Caption = 'Exam date'
            Transparent = True
          end
          object deExamDate: TcxDateEdit
            Left = 115
            Top = 3
            Properties.ImmediatePost = True
            Properties.ShowTime = False
            TabOrder = 0
            Width = 121
          end
          object cxLabel1: TcxLabel
            Tag = -1
            Left = 15
            Top = 27
            Caption = 'Referral indication '
            Transparent = True
          end
          object cxLabel4: TcxLabel
            Left = 22
            Top = 111
            Caption = 'Obstetric history '
            Transparent = True
          end
          object edtOtherPastHistory1: TcxTextEdit
            Left = 118
            Top = 130
            Enabled = False
            TabOrder = 10
            Width = 393
          end
          object edtReferralIndicator2: TcxTextEdit
            Left = 707
            Top = 54
            Enabled = False
            TabOrder = 17
            Visible = False
            Width = 202
          end
          object edtReferralIndicator1: TcxTextEdit
            Left = 115
            Top = 52
            Enabled = False
            TabOrder = 2
            Width = 393
          end
          object edtOtherPastHistory2: TcxTextEdit
            Left = 806
            Top = 107
            Enabled = False
            TabOrder = 12
            Visible = False
            Width = 202
          end
          object cxLabel6: TcxLabel
            Left = 6
            Top = 153
            Caption = 'Aneuploidy risk status'
            Transparent = True
          end
          object cbAneuploidy: TcxComboBox
            Left = 118
            Top = 152
            Properties.DropDownRows = 30
            Properties.Items.Strings = (
              'Normal NIPS'
              'Low risk combined screen'
              'Normal microarray'
              'Normal karyotype'
              'Increased risk NIPS'
              'Increased risk combined screen'
              'No aneuploidy screening')
            Style.BorderColor = clRed
            Style.BorderStyle = ebsThick
            Style.Edges = [bLeft, bTop, bRight, bBottom]
            Style.Shadow = True
            TabOrder = 11
            Width = 190
          end
          object cxLabel13: TcxLabel
            Left = 363
            Top = 6
            Caption = '20Week (7.8.8 22/05/2018)'
            Transparent = True
          end
          object edtOtherPastHistory3: TcxTextEdit
            Left = 806
            Top = 128
            Enabled = False
            TabOrder = 20
            Visible = False
            Width = 202
          end
          object cbRisksAssessedBy: TcxGroupBox
            Left = 308
            Top = 151
            TabStop = True
            Style.BorderStyle = ebsNone
            Style.Edges = []
            Style.LookAndFeel.NativeStyle = True
            StyleDisabled.LookAndFeel.NativeStyle = True
            StyleFocused.LookAndFeel.NativeStyle = True
            StyleHot.LookAndFeel.NativeStyle = True
            TabOrder = 13
            Transparent = True
            Visible = False
            Height = 22
            Width = 181
          end
          object cxccbReferralIndication: TcxCheckComboBox
            Left = 115
            Top = 29
            Properties.DropDownRows = 20
            Properties.Items = <
              item
                Description = 'Routine morphology scan'
                ShortDescription = 'Routine morphology scan'
              end
              item
                Description = 'Early anatomy review'
                ShortDescription = 'Early anatomy review'
              end
              item
                Description = ' Amniocentesis'
                ShortDescription = ' Amniocentesis'
              end
              item
                Description = 'Assess cervical length'
                ShortDescription = 'Assess cervical length'
              end
              item
                Description = 'Other'
                ShortDescription = 'Other'
              end>
            Style.BorderColor = clRed
            Style.BorderStyle = ebsThick
            Style.Edges = [bLeft, bTop, bRight, bBottom]
            Style.Shadow = False
            TabOrder = 1
            Width = 393
          end
          object cxccbObstetricHistory: TcxCheckComboBox
            Left = 118
            Top = 109
            Properties.DropDownRows = 20
            Properties.Items = <
              item
                Description = 'Cervical incompetence '
                ShortDescription = 'Cervical incompetence '
              end
              item
                Description = 'Cervical cerclage'
                ShortDescription = 'Cervical cerclage'
              end
              item
                Description = 'PPROM'
                ShortDescription = 'PPROM'
              end
              item
                Description = 'Pre-term labour'
                ShortDescription = 'Pre-term labour'
              end
              item
                Description = 'IUGR'
                ShortDescription = 'IUGR'
              end
              item
                Description = 'FDIU'
                ShortDescription = 'FDIU'
              end
              item
                Description = 'Previous abnormality'
                ShortDescription = 'Previous abnormality'
              end
              item
                Description = 'Previous stillbirth'
                ShortDescription = 'Previous stillbirth'
              end
              item
                Description = 'Other'
                ShortDescription = 'Other'
              end>
            Style.BorderColor = clWindowFrame
            Style.Edges = [bLeft, bTop, bRight, bBottom]
            Style.Shadow = False
            TabOrder = 9
            Width = 393
          end
          object cxLabel3: TcxLabel
            Left = 118
            Top = 80
            Caption = 'G'
            Transparent = True
          end
          object cxLabel5: TcxLabel
            Left = 167
            Top = 80
            Caption = 'P'
            Transparent = True
          end
          object cxLabel12: TcxLabel
            Left = 214
            Top = 80
            Caption = 'M'
            Transparent = True
          end
          object cxLabel27: TcxLabel
            Left = 267
            Top = 80
            Caption = 'T'
            Transparent = True
          end
          object cxLabel31: TcxLabel
            Left = 317
            Top = 80
            Caption = 'C/S'
            Transparent = True
          end
          object cxLabel36: TcxLabel
            Left = 383
            Top = 80
            Caption = 'IVF'
            Transparent = True
          end
          object edtG: TcxTextEdit
            Left = 131
            Top = 79
            TabOrder = 3
            Width = 26
          end
          object edtP: TcxTextEdit
            Left = 179
            Top = 79
            TabOrder = 4
            Width = 26
          end
          object edtM: TcxTextEdit
            Left = 228
            Top = 79
            TabOrder = 5
            Width = 26
          end
          object edtT: TcxTextEdit
            Left = 278
            Top = 79
            TabOrder = 6
            Width = 26
          end
          object edtCS: TcxTextEdit
            Left = 344
            Top = 79
            TabOrder = 7
            Width = 26
          end
          object edtIVF: TcxTextEdit
            Left = 409
            Top = 79
            TabOrder = 8
            Width = 26
          end
        end
        object cxGroupBox37: TcxGroupBox
          AlignWithMargins = True
          Left = 4
          Top = 226
          PanelStyle.Active = True
          Style.Edges = [bBottom]
          TabOrder = 4
          Height = 644
          Width = 1181
          object cxGroupBox40: TcxGroupBox
            Left = 2
            Top = 2
            Align = alTop
            Style.BorderStyle = ebsNone
            Style.Edges = []
            Style.LookAndFeel.NativeStyle = True
            StyleDisabled.LookAndFeel.NativeStyle = True
            StyleFocused.LookAndFeel.NativeStyle = True
            StyleHot.LookAndFeel.NativeStyle = True
            TabOrder = 0
            Transparent = True
            Height = 31
            Width = 1177
            object cxLabel375: TcxLabel
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
                'Singleton'
                '')
              Style.BorderColor = clRed
              Style.BorderStyle = ebsThick
              Style.Shadow = True
              TabOrder = 0
              Width = 163
            end
            object cxLabel376: TcxLabel
              Left = 250
              Top = 2
              Caption = 'Pregnancy Outcome'
              Transparent = True
              Visible = False
            end
            object cbPregnancyOutcome: TcxComboBox
              Left = 357
              Top = 1
              Properties.DropDownRows = 20
              Properties.Items.Strings = (
                ''
                'Live intrauterine gestation'
                'Fetal death in utero'
                '')
              Style.BorderColor = clRed
              Style.BorderStyle = ebsThick
              Style.Shadow = True
              TabOrder = 1
              Visible = False
              Width = 213
            end
          end
          object pcReportBody: TcxPageControl
            Left = 2
            Top = 33
            Width = 1177
            Height = 609
            Align = alClient
            TabOrder = 1
            Properties.ActivePage = cxtsFetus
            Properties.CustomButtons.Buttons = <>
            Properties.MultiLine = True
            ClientRectBottom = 609
            ClientRectRight = 1177
            ClientRectTop = 24
            object cxtsFetus: TcxTabSheet
              Caption = 'The Fetus'
              ImageIndex = 6
              ExplicitTop = 0
              ExplicitWidth = 0
              ExplicitHeight = 0
              object pgFetusMeasusements: TcxPageControl
                Left = 0
                Top = 0
                Width = 1177
                Height = 585
                Align = alClient
                TabOrder = 0
                Properties.ActivePage = cxtsFetus1
                Properties.CustomButtons.Buttons = <>
                Properties.Options = [pcoAlwaysShowGoDialogButton, pcoGradient, pcoGradientClientArea, pcoRedrawOnResize, pcoUsePageColorForTab]
                Properties.Style = 11
                ClientRectBottom = 583
                ClientRectLeft = 2
                ClientRectRight = 1175
                ClientRectTop = 22
                object cxtsFetus1: TcxTabSheet
                  Caption = 'Fetus 1'
                  Color = clBtnFace
                  ImageIndex = 0
                  ParentColor = False
                  ExplicitLeft = 0
                  ExplicitTop = 0
                  ExplicitWidth = 0
                  ExplicitHeight = 0
                  object cxpgFetus1: TcxPageControl
                    Left = 0
                    Top = 0
                    Width = 1173
                    Height = 561
                    Align = alClient
                    ParentBackground = False
                    TabOrder = 0
                    Properties.ActivePage = cxtsFetusGeneral1
                    Properties.CustomButtons.Buttons = <>
                    ClientRectBottom = 561
                    ClientRectRight = 1173
                    ClientRectTop = 24
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
                  end
                end
              end
            end
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
          end
        end
        object cxLabel7: TcxLabel
          Left = 49
          Top = 196
          Caption = ' EDD'
          Transparent = True
        end
        object deStatedEDD: TcxDateEdit
          Left = 85
          Top = 195
          Properties.SaveTime = False
          Properties.ShowTime = False
          TabOrder = 1
          Width = 105
        end
        object cxLabel8: TcxLabel
          Left = 196
          Top = 197
          Caption = 'Gestational Age'
          Transparent = True
        end
        object seEDDCalGAWeeks: TcxSpinEdit
          Left = 277
          Top = 195
          Properties.SpinButtons.Visible = False
          TabOrder = 2
          Width = 38
        end
        object cxLabel9: TcxLabel
          Left = 314
          Top = 197
          Caption = 'W'
          Transparent = True
        end
        object seEDDCalGADays: TcxSpinEdit
          Left = 328
          Top = 195
          Properties.SpinButtons.Visible = False
          TabOrder = 3
          Width = 38
        end
        object cxLabel10: TcxLabel
          Left = 365
          Top = 197
          Caption = 'D'
          Transparent = True
        end
      end
    end
  end
endLQ