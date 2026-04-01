inherited Gynae: TGynae
  Width = 1225
  Height = 666
  Align = alClient
  ExplicitWidth = 451
  ExplicitHeight = 304
  inherited cxpcReportMainPage: TcxPageControl
    Width = 1225
    Height = 666
    Properties.ActivePage = cxtsReportDetails
    ExplicitWidth = 451
    ExplicitHeight = 304
    ClientRectBottom = 666
    ClientRectRight = 1225
    ClientRectTop = 24
    object cxtsReportDetails: TcxTabSheet
      Caption = 'Details'
      ImageIndex = 1
      ExplicitWidth = 451
      ExplicitHeight = 280
      object cxScrollBox1: TcxScrollBox
        Left = 0
        Top = 0
        Width = 1225
        Height = 642
        Align = alClient
        TabOrder = 0
        ExplicitWidth = 451
        ExplicitHeight = 280
        object cxGroupBox5: TcxGroupBox
          Left = 4
          Top = 0
          Style.Edges = [bBottom]
          TabOrder = 0
          Height = 247
          Width = 817
          object cxLabel20: TcxLabel
            Left = 84
            Top = 213
            Caption = 'Day'
            Transparent = True
          end
          object spStartDay: TcxSpinEdit
            Left = 109
            Top = 211
            Properties.AssignedValues.MinValue = True
            Properties.MaxValue = 45.000000000000000000
            TabOrder = 17
            Width = 41
          end
          object cxLabel21: TcxLabel
            Left = 154
            Top = 213
            Caption = 'Of'
            Transparent = True
          end
          object seCycleMinDays: TcxSpinEdit
            Left = 176
            Top = 211
            Properties.MaxValue = 45.000000000000000000
            Properties.MinValue = 1.000000000000000000
            TabOrder = 18
            Value = 28
            Width = 41
          end
          object lblCycleDays: TcxLabel
            Left = 276
            Top = 213
            Caption = 'day cycle'
            Transparent = True
          end
          object cxLabel24: TcxLabel
            Left = 52
            Top = 151
            Caption = 'Medication'
            Transparent = True
          end
          object cbMedication: TcxComboBox
            Left = 697
            Top = 220
            Properties.DropDownListStyle = lsFixedList
            Properties.DropDownRows = 25
            Properties.DropDownSizeable = True
            Properties.Items.Strings = (
              ''
              'Oral contraceptive pill'
              'Progesterione only pill'
              'Implanon'
              'Progesterone (Provera)'
              'IUCD (copper)'
              'IUS (Mirena)'
              'Clomiphene citrate'
              'Metformin'
              'HRT cyclical (sequential)'
              'HRT continuous'
              'HRT vaginal oestrogen'
              'HRT oestrogen patch'
              'HRT oestrogen and progesterone patch'
              'HRT  - Tibolone (Livial)'
              'Tamoxifen'
              'Anastrozole (Armidex)'
              'Other')
            Properties.ReadOnly = False
            TabOrder = 22
            Visible = False
            Width = 177
          end
          object edtOtherMedication: TcxTextEdit
            Left = 287
            Top = 150
            Enabled = False
            TabOrder = 11
            Width = 204
          end
          object cxLabel25: TcxLabel
            Left = 52
            Top = 7
            Caption = 'Exam date'
            Transparent = True
          end
          object deExamDate: TcxDateEdit
            Left = 109
            Top = 3
            Properties.ImmediatePost = True
            Properties.ShowTime = False
            TabOrder = 0
            Width = 121
          end
          object deLMPDate: TcxDateEdit
            Left = 109
            Top = 186
            Properties.ImmediatePost = True
            Properties.SaveTime = False
            Properties.ShowTime = False
            TabOrder = 12
            Width = 108
          end
          object cxLabel26: TcxLabel
            Left = 58
            Top = 190
            Caption = 'LMP date'
            Transparent = True
          end
          object seCycleMaxDays: TcxSpinEdit
            Left = 234
            Top = 211
            Properties.MaxValue = 45.000000000000000000
            Properties.MinValue = 1.000000000000000000
            TabOrder = 19
            Value = 1
            Width = 41
          end
          object cxLabel154: TcxLabel
            Left = 218
            Top = 213
            Caption = 'to'
            Transparent = True
          end
          object cxLabel176: TcxLabel
            Left = 459
            Top = 4
            Caption = 'v (23.43.26) 28/08/2016 Gynae'
            Transparent = True
          end
          object cxLabel177: TcxLabel
            Left = 30
            Top = 106
            Caption = 'Gynae Surgery'
            Transparent = True
          end
          object cbPastSurgery: TcxComboBox
            Left = 724
            Top = 195
            Properties.DropDownListStyle = lsFixedList
            Properties.DropDownRows = 25
            Properties.DropDownSizeable = True
            Properties.Items.Strings = (
              ''
              'Hysterectomy'
              'Subtotal hysterectomy'
              'TAH &BSO'
              'Myomectomy'
              'Right oophorectomy'
              'Left oophorectomy'
              'Bilateral oophorectomy'
              'Tubal ligation'
              'LLETZ'
              'Cervical cone biopsy'
              'Polypectomy'
              'Ovarian cystectomy'
              'Other')
            Properties.ReadOnly = False
            TabOrder = 21
            Visible = False
            Width = 163
          end
          object edtOtherPastSurgery: TcxTextEdit
            Left = 415
            Top = 102
            Enabled = False
            TabOrder = 7
            Width = 205
          end
          object cxLabel178: TcxLabel
            Left = 685
            Top = 35
            Caption = 'Additional Gynae history'
            Transparent = True
            Visible = False
          end
          object mmoAdditionalGynaeHistory: TcxMemo
            Left = 688
            Top = 58
            Properties.ScrollBars = ssVertical
            TabOrder = 33
            Visible = False
            Height = 106
            Width = 121
          end
          object cbIndicatorType1: TcxCheckComboBox
            Left = 244
            Top = 4
            Properties.DropDownRows = 20
            Properties.Items = <
              item
                Description = 'Pre IVF baseline pelvic scan'
                ShortDescription = 'Pre IVF baseline pelvic scan'
              end
              item
                Description = 'Antral Follicle tracking'
                ShortDescription = 'Antral Follicle tracking'
              end
              item
                Description = 'General pelvic scan'
                ShortDescription = 'General pelvic scan'
              end
              item
                Description = 'Evaluate the endometrium'
                ShortDescription = 'Evaluate the endometrium'
              end
              item
                Description = 'Review uterine fibroids'
                ShortDescription = 'Review uterine fibroids'
              end
              item
                Description = 'Review right ovarian cyst'
                ShortDescription = 'Review right ovarian cyst'
              end
              item
                Description = 'Review left ovarian cyst'
                ShortDescription = 'Review left ovarian cyst'
              end
              item
                Description = 'Review bilateral ovarian cysts'
                ShortDescription = 'Review bilateral ovarian cysts'
              end
              item
                Description = 'Exclude RPOC'
                ShortDescription = 'Exclude RPOC'
              end
              item
                Description = 'Exclude polycystic ovaries'
                ShortDescription = 'Exclude polycystic ovaries'
              end
              item
                Description = 'Ovarian cancer screen'
                ShortDescription = 'Ovarian cancer screen'
              end
              item
                Description = 'Check position of IUCD'
                ShortDescription = 'Check position of IUCD'
              end
              item
                Description = 'Check position of IUS (Mirena)'
                ShortDescription = 'Check position of IUS (Mirena)'
              end
              item
                Description = 'Tubal patency test'
                ShortDescription = 'Tubal patency test'
              end
              item
                Description = 'Saline hysterography'
                ShortDescription = 'Saline hysterography'
              end
              item
                Description = 'Other'
                ShortDescription = 'Other'
              end>
            Style.BorderColor = clRed
            Style.BorderStyle = ebsThick
            Style.Edges = [bLeft, bTop, bRight, bBottom]
            Style.Shadow = False
            TabOrder = 34
            Visible = False
            Width = 163
          end
          object cbLMPUnknown: TcxCheckBox
            Left = 258
            Top = 187
            Caption = 'LMP unknown'
            TabOrder = 13
            Transparent = True
            Width = 104
          end
          object cbAmenorrhoea: TcxCheckBox
            Left = 362
            Top = 188
            Caption = 'Amenorrhoea'
            TabOrder = 14
            Transparent = True
            Width = 99
          end
          object cbPostMenopausal: TcxCheckBox
            Left = 467
            Top = 188
            Caption = 'Postmenopausal'
            TabOrder = 15
            Transparent = True
            Width = 102
          end
          object cxGroupBox8: TcxGroupBox
            Left = 352
            Top = 207
            Style.BorderStyle = ebsUltraFlat
            Style.Edges = []
            Style.LookAndFeel.NativeStyle = True
            StyleDisabled.LookAndFeel.NativeStyle = True
            StyleFocused.LookAndFeel.NativeStyle = True
            StyleHot.LookAndFeel.NativeStyle = True
            TabOrder = 20
            Transparent = True
            Height = 30
            Width = 296
            object cbOligomenorrhoea: TcxCheckBox
              Left = 115
              Top = 7
              Caption = 'Oligomenorrhoea'
              TabOrder = 1
              Transparent = True
              Width = 106
            end
            object cbIrregularCycle: TcxCheckBox
              Left = 9
              Top = 6
              Caption = 'Irregular menses'
              TabOrder = 0
              Transparent = True
              Width = 106
            end
          end
          object edtPresentComplaintOther: TcxTextEdit
            Left = 413
            Top = 31
            Enabled = False
            TabOrder = 2
            Width = 269
          end
          object cxLabel1: TcxLabel
            Left = 12
            Top = 35
            Caption = 'Referral indication'
            Transparent = True
          end
          object cxLabel23: TcxLabel
            Left = 32
            Top = 84
            Caption = 'Gynae history'
            Transparent = True
          end
          object edtOtherPastHistory: TcxTextEdit
            Left = 416
            Top = 80
            Enabled = False
            TabOrder = 5
            Width = 202
          end
          object cxccbReferralIndication: TcxCheckComboBox
            Left = 109
            Top = 30
            Properties.DropDownRows = 20
            Properties.Items = <
              item
              end
              item
                Description = 'Pre IVF baseline pelvic scan'
                ShortDescription = 'Pre IVF baseline pelvic scan'
              end
              item
                Description = 'Antral Follicle tracking'
                ShortDescription = 'Antral Follicle tracking'
              end
              item
                Description = 'General pelvic scan'
                ShortDescription = 'General pelvic scan'
              end
              item
                Description = 'Evaluate the endometrium'
                ShortDescription = 'Evaluate the endometrium'
              end
              item
                Description = 'Evaluate ovarian/adnexal mass'
                ShortDescription = 'Evaluate ovarian/adnexal mass'
              end
              item
                Description = 'Review right ovarian cyst'
                ShortDescription = 'Review right ovarian cyst'
              end
              item
                Description = 'Review left ovarian cyst'
                ShortDescription = 'Review left ovarian cyst'
              end
              item
                Description = 'Review bilateral ovarian cysts'
                ShortDescription = 'Review bilateral ovarian cysts'
              end
              item
                Description = 'Ovarian cancer screen'
                ShortDescription = 'Ovarian cancer screen'
              end
              item
                Description = 'Assess uterine fibroids'
                ShortDescription = 'Assess uterine fibroids'
              end
              item
                Description = 'Exclude RPOC '
                ShortDescription = 'Exclude retained products of conception'
              end
              item
                Description = 'Check position of IUCD'
                ShortDescription = 'Check position of IUCD'
              end
              item
                Description = 'Check position of IUS (Mirena)'
                ShortDescription = 'Check position of IUS (Mirena)'
              end
              item
                Description = 'Tubal patency test'
                ShortDescription = 'Tubal patency test'
              end
              item
                Description = 'Saline hysterography'
                ShortDescription = 'Saline hysterography'
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
            Width = 299
          end
          object cxccbClinicalHistory: TcxCheckComboBox
            Left = 109
            Top = 80
            Properties.DropDownRows = 20
            Properties.Items = <
              item
                ShortDescription = 'Nil'
              end
              item
                Description = 'Primary infertility'
                ShortDescription = 'Primary infertility'
              end
              item
                Description = 'Secondary infertility'
                ShortDescription = 'Secondary infertility'
              end
              item
                Description = 'Endometriosis'
                ShortDescription = 'Endometriosis'
              end
              item
                Description = 'Endometrial polyps'
                ShortDescription = 'Endometrial polyps'
              end
              item
                Description = 'IUCD in situ'
                ShortDescription = 'IUCD in situ'
              end
              item
                Description = 'IUS (Mirena) in situ'
                ShortDescription = 'IUS (Mirena) in situ'
              end
              item
                Description = 'Fibroids'
                ShortDescription = 'Fibroids'
              end
              item
                Description = 'Multifollicular ovaries'
                ShortDescription = 'Multifollicular ovaries'
              end
              item
                Description = 'Hyperandrogenic amenorrhoea'
                ShortDescription = 'Hyperandrogenic amenorrhoea'
              end
              item
                Description = 'Polycystic ovarian syndrome'
                ShortDescription = 'Polycystic ovarian syndrome'
              end
              item
                Description = 'Dysmenorrhoea'
                ShortDescription = 'Dysmenorrhoea'
              end
              item
                Description = 'Other'
                ShortDescription = 'Other'
              end>
            Style.BorderColor = clWindowFrame
            Style.Edges = [bLeft, bTop, bRight, bBottom]
            Style.Shadow = False
            StyleDisabled.BorderColor = clMaroon
            StyleDisabled.Color = clMaroon
            StyleDisabled.TextColor = clMaroon
            StyleDisabled.TextStyle = [fsBold]
            TabOrder = 4
            Width = 301
          end
          object cxccbMensturalBleeding: TcxCheckComboBox
            Left = 109
            Top = 56
            Properties.DropDownRows = 20
            Properties.Items = <
              item
                ShortDescription = 'Nil'
              end
              item
                Description = 'Menorrhagia'
                ShortDescription = 'Menorrhagia'
              end
              item
                Description = 'Intermenstrual bleeding'
                ShortDescription = 'Intermenstrual bleeding'
              end
              item
                Description = 'Breakthrough bleeding on OCP'
                ShortDescription = 'Breakthrough bleeding on OCP'
              end
              item
                Description = 'Postmenopausal bleeding'
                ShortDescription = 'Postmenopausal bleeding'
              end
              item
                Description = 'Postcoital bleeding'
                ShortDescription = 'Postcoital bleeding'
              end
              item
                Description = 'Abnormal vaginal bleeding'
                ShortDescription = 'Abnormal vaginal bleeding'
              end>
            Style.BorderColor = clWindowFrame
            Style.Edges = [bLeft, bTop, bRight, bBottom]
            Style.Shadow = False
            StyleDisabled.Color = clMaroon
            StyleDisabled.TextColor = clMaroon
            StyleDisabled.TextStyle = [fsBold]
            TabOrder = 3
            Width = 301
          end
          object cxLabel253: TcxLabel
            Left = 13
            Top = 53
            Caption = 'Menstural Bleeding'
            Transparent = True
          end
          object cxLabel254: TcxLabel
            Left = 63
            Top = 67
            Caption = 'Pattern'
            Transparent = True
          end
          object cxcbFamilyHistory: TcxCheckComboBox
            Left = 109
            Top = 127
            Properties.DropDownRows = 20
            Properties.Items = <
              item
                ShortDescription = 'Nil'
              end
              item
                Description = 'Breast Cancer'
                ShortDescription = 'Breast Cancer'
              end
              item
                Description = 'Ovarian Cancer'
                ShortDescription = 'Ovarian Cancer'
              end
              item
                Description = 'Other'
                ShortDescription = 'Other'
              end>
            Style.BorderColor = clWindowFrame
            Style.Edges = [bLeft, bTop, bRight, bBottom]
            Style.Shadow = False
            TabOrder = 8
            Width = 177
          end
          object cxLabel255: TcxLabel
            Left = 35
            Top = 128
            Caption = 'Family History'
            Transparent = True
          end
          object edtOtherFamilyHistory: TcxTextEdit
            Left = 286
            Top = 127
            Enabled = False
            TabOrder = 9
            Width = 205
          end
          object cxcbGynaeSurgery: TcxCheckComboBox
            Left = 109
            Top = 101
            Properties.DropDownRows = 22
            Properties.GlyphCount = 1
            Properties.Items = <
              item
                ShortDescription = 'Nil'
              end
              item
                Description = 'Hysterectomy'
                Enabled = False
                ShortDescription = 'Hysterectomy'
              end
              item
                Description = 'Total abdominal hysterectomy'
                ShortDescription = 'Total abdominal hysterectomy'
              end
              item
                Description = 'Subtotal hysterectomy'
                ShortDescription = 'Subtotal hysterectomy'
              end
              item
                Description = 'Vaginal hysterectomy'
                ShortDescription = 'Vaginal hysterectomy'
              end
              item
                Description = 'Hysterectomy (not specified)'
                ShortDescription = 'Hysterectomy'
              end
              item
                Description = 'Oophorectomy'
                Enabled = False
                ShortDescription = 'Oophorectomy'
              end
              item
                Description = 'Right oophorectomy'
                ShortDescription = 'Right oophorectomy'
              end
              item
                Description = 'Left oophorectomy'
                ShortDescription = 'Left oophorectomy'
              end
              item
                Description = 'Bilateral oophorectomy'
                ShortDescription = 'Bilateral oophorectomy'
              end
              item
                Description = 'Ovarian Cystectomy'
                Enabled = False
                ShortDescription = 'Ovarian Cystectomy'
              end
              item
                Description = 'Right ovarian cystectomy'
                ShortDescription = 'Right ovarian cystectomy'
              end
              item
                Description = 'Left ovarian cystectomy'
                ShortDescription = 'Left ovarian cystectomy'
              end
              item
                Description = 'Bilateral ovarian cystectomy'
                ShortDescription = 'Bilateral ovarian cystectomy'
              end
              item
                Description = 'Cervical sugery'
                Enabled = False
                ShortDescription = 'Cervical sugery'
              end
              item
                Description = 'LLETZ'
                ShortDescription = 'LLETZ'
              end
              item
                Description = 'Cervical cone biopsy'
                ShortDescription = 'Cervical cone biopsy'
              end
              item
                Description = 'Tubal surgery'
                Enabled = False
                ShortDescription = 'Tubal surgery'
              end
              item
                Description = 'Ectopic Pregnancy'
                ShortDescription = 'Ectopic Pregnancy'
              end
              item
                Description = 'Salpingectomy'
                ShortDescription = 'Salpingectomy'
              end
              item
                Description = 'Tubal ligation'
                ShortDescription = 'Tubal ligation'
              end
              item
                Description = 'Other'
                ShortDescription = 'Other'
              end>
            Style.BorderColor = clWindowFrame
            Style.Edges = [bLeft, bTop, bRight, bBottom]
            Style.Shadow = False
            Style.TextStyle = []
            Style.ButtonStyle = bts3D
            StyleDisabled.BorderColor = clGreen
            StyleDisabled.BorderStyle = ebs3D
            StyleDisabled.Color = clGreen
            StyleDisabled.TextColor = clGreen
            StyleDisabled.TextStyle = [fsBold, fsItalic]
            StyleDisabled.ButtonStyle = bts3D
            TabOrder = 6
            Width = 301
          end
          object tcbMedication: TAdvTreeComboBox
            Left = 108
            Top = 150
            Width = 178
            Height = 21
            DropHeight = 100
            DropWidth = 200
            Flat = True
            Items.NodeData = {
              0108000000190000000000000001000000FFFFFFFFFFFFFFFF00000000000000
              0000330000000000000002000000FFFFFFFFFFFFFFFF00000000050000000D43
              006F006E00740072006100630065007000740069006F006E0047000000000000
              0000000000FFFFFFFFFFFFFFFF0000000000000000174F00720061006C002000
              43006F006E007400720061006300650070007400690076006500200070006900
              6C006C00450000000000000000000000FFFFFFFFFFFFFFFF0000000000000000
              16500072006F006700650073007400650072006F006E00650020006F006E006C
              0079002000700069006C006C00290000000000000000000000FFFFFFFFFFFFFF
              FF00000000000000000849006D0070006C0061006E006F006E00330000000000
              000000000000FFFFFFFFFFFFFFFF00000000000000000D4400650070006F0074
              002000500072006F007600650072006100330000000000000000000000FFFFFF
              FFFFFFFFFF00000000000000000D49005500430044002000280063006F007000
              7000650072002900310000000000000007000000FFFFFFFFFFFFFFFF00000000
              000000000C490055005300200028004D006900720065006E0061002900310000
              000000000008000000FFFFFFFFFFFFFFFF00000000000000000C500072006F00
              6700650073007400650072006F006E0065003F0000000000000009000000FFFF
              FFFFFFFFFFFF0000000002000000134F00760075006C006100740069006F006E
              00200069006E00640075006300740069006F006E003D00000000000000000000
              00FFFFFFFFFFFFFFFF00000000000000001243006C006F006D00690070006800
              65006E0065002000630069007400720061007400650033000000000000000000
              0000FFFFFFFFFFFFFFFF00000000000000000D47006F006E00610064006F0074
              0072006F007000680069006E0035000000000000000A000000FFFFFFFFFFFFFF
              FF00000000020000000E41006E00740069002D006F0065007300740072006F00
              670065006E002B0000000000000000000000FFFFFFFFFFFFFFFF000000000000
              000009540061006D006F0078006900660065006E004300000000000000000000
              00FFFFFFFFFFFFFFFF00000000000000001541006E0061007300740072006F00
              7A006F006C00650020002800410072006D00690064006500780029001F000000
              000000000B000000FFFFFFFFFFFFFFFF00000000060000000348005200540043
              0000000000000000000000FFFFFFFFFFFFFFFF00000000000000001543007900
              63006C006900630061006C0020002800730065007100750065006E0074006900
              61006C0029002D0000000000000000000000FFFFFFFFFFFFFFFF000000000000
              00000A43006F006E00740069006E0075006F00750073003B0000000000000000
              000000FFFFFFFFFFFFFFFF00000000000000001156006100670069006E006100
              6C0020006F0065007300740072006F00670065006E0037000000000000000000
              0000FFFFFFFFFFFFFFFF00000000000000000F4F0065007300740072006F0067
              0065006E00200070006100740063006800590000000000000000000000FFFFFF
              FFFFFFFFFF0000000000000000204F0065007300740072006F00670065006E00
              200061006E00640020007000720065006700650073007400650072006F006E00
              65002000700061007400630068003B0000000000000000000000FFFFFFFFFFFF
              FFFF0000000000000000115400690062006F006C006F006E006500200028004C
              0069007600690061006C002900230000000000000000000000FFFFFFFFFFFFFF
              FF0000000000000000054F007400680065007200}
            LabelFont.Charset = DEFAULT_CHARSET
            LabelFont.Color = clWindowText
            LabelFont.Height = -11
            LabelFont.Name = 'Tahoma'
            LabelFont.Style = []
            SelectMode = smSingleClick
            Indent = 19
            TreeFont.Charset = DEFAULT_CHARSET
            TreeFont.Color = clWindowText
            TreeFont.Height = -11
            TreeFont.Name = 'Tahoma'
            TreeFont.Style = []
            TreeColor = clWindow
            TreeBorder = bsSingle
            Selection = 0
            Version = '1.2.0.1'
            TabOrder = 10
          end
          object gbHRT: TcxGroupBox
            Left = 578
            Top = 185
            Style.BorderStyle = ebsNone
            Style.Edges = []
            Style.LookAndFeel.NativeStyle = True
            StyleDisabled.LookAndFeel.NativeStyle = True
            StyleFocused.LookAndFeel.NativeStyle = True
            StyleHot.LookAndFeel.NativeStyle = True
            TabOrder = 16
            Transparent = True
            Height = 22
            Width = 132
            object cbHRTYes: TcxCheckBox
              Left = 36
              Top = 3
              Caption = 'Yes'
              Enabled = False
              Style.LookAndFeel.NativeStyle = True
              StyleDisabled.LookAndFeel.NativeStyle = True
              StyleFocused.LookAndFeel.NativeStyle = True
              StyleHot.LookAndFeel.NativeStyle = True
              TabOrder = 0
              Transparent = True
              Width = 45
            end
            object cbHRTNo: TcxCheckBox
              Left = 78
              Top = 3
              Caption = 'No'
              Enabled = False
              Style.LookAndFeel.NativeStyle = True
              StyleDisabled.LookAndFeel.NativeStyle = True
              StyleFocused.LookAndFeel.NativeStyle = True
              StyleHot.LookAndFeel.NativeStyle = True
              TabOrder = 1
              Transparent = True
              Width = 42
            end
            object lblHRT: TcxLabel
              Left = 6
              Top = 4
              Caption = 'HRT'
              Enabled = False
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
        object pcReportBody: TcxPageControl
          Left = 4
          Top = 247
          Width = 888
          Height = 516
          TabOrder = 1
          Properties.ActivePage = cxtsGeneral
          Properties.CustomButtons.Buttons = <>
          ClientRectBottom = 516
          ClientRectRight = 888
          ClientRectTop = 24
          object cxtsGeneral: TcxTabSheet
            Caption = 'General'
            ImageIndex = 5
            object Bevel7: TBevel
              Left = -2
              Top = 98
              Width = 533
              Height = 1
            end
            object Bevel8: TBevel
              Left = 3
              Top = 294
              Width = 533
              Height = 1
            end
            object Bevel9: TBevel
              Left = 0
              Top = 375
              Width = 533
              Height = 1
            end
            object cxLabel2: TcxLabel
              Left = 67
              Top = 48
              Caption = 'Uterus'
              Transparent = True
            end
            object cbUterus: TcxComboBox
              Left = 109
              Top = 46
              Properties.Items.Strings = (
                ''
                'anteverted'
                'retroverted'
                'axial')
              TabOrder = 2
              Width = 136
            end
            object cxLabel3: TcxLabel
              Left = 280
              Top = 48
              Caption = 'Measured'
              Transparent = True
            end
            object seUterusLength: TcxSpinEdit
              Left = 330
              Top = 47
              Properties.AssignedValues.MinValue = True
              Properties.SpinButtons.Visible = False
              TabOrder = 3
              Width = 26
            end
            object cxLabel4: TcxLabel
              Left = 39
              Top = 107
              Caption = 'Endometrium'
              Transparent = True
            end
            object cbEndometrium: TcxComboBox
              Left = 111
              Top = 103
              Properties.DropDownRows = 9
              Properties.Items.Strings = (
                ''
                'menstrual'
                'proliferative phase'
                'late proliferative'
                'secretory phase'
                'non specific type'
                'thin regular'
                'thickened cystic'
                'postmenopausal (<4 mm)')
              TabOrder = 9
              Width = 136
            end
            object cxLabel5: TcxLabel
              Left = 750
              Top = 347
              Caption = 'Cervical length'
              Transparent = True
              Visible = False
            end
            object seCervicalLength: TcxSpinEdit
              Left = 839
              Top = 345
              Properties.AssignedValues.MinValue = True
              Properties.SpinButtons.Visible = False
              TabOrder = 47
              Visible = False
              Width = 35
            end
            object cxLabel6: TcxLabel
              Left = 730
              Top = 428
              Caption = 'Uterine cavity length'
              Transparent = True
              Visible = False
            end
            object seUterineCavityLength: TcxSpinEdit
              Left = 852
              Top = 427
              Properties.AssignedValues.MinValue = True
              Properties.Increment = 0.100000000000000000
              Properties.SpinButtons.Visible = False
              TabOrder = 46
              Visible = False
              Width = 33
            end
            object seUterusWidth: TcxSpinEdit
              Left = 373
              Top = 46
              Properties.AssignedValues.MinValue = True
              Properties.SpinButtons.Visible = False
              TabOrder = 4
              Width = 26
            end
            object seUterusHeight: TcxSpinEdit
              Left = 418
              Top = 46
              Properties.AssignedValues.MinValue = True
              Properties.SpinButtons.Visible = False
              TabOrder = 5
              Width = 26
            end
            object seUterusCC: TcxSpinEdit
              Left = 465
              Top = 46
              Properties.AssignedValues.MinValue = True
              Properties.DisplayFormat = '#0.0'
              Properties.EditFormat = '#0.0'
              Properties.SpinButtons.Visible = False
              Properties.ValueType = vtFloat
              TabOrder = 6
              Width = 40
            end
            object cxLabel30: TcxLabel
              Left = 505
              Top = 48
              Caption = 'cc'
              Transparent = True
            end
            object cxLabel31: TcxLabel
              Left = 887
              Top = 428
              Caption = 'mm'
              Transparent = True
              Visible = False
            end
            object cxLabel32: TcxLabel
              Left = 875
              Top = 347
              Caption = 'mm'
              Transparent = True
              Visible = False
            end
            object cbLUSCSscar: TcxCheckBox
              Left = 106
              Top = 206
              Caption = 'LUSCS scar identified'
              TabOrder = 22
              Transparent = True
              Width = 137
            end
            object cbCorrectPlacementIUCD: TcxCheckBox
              Left = 106
              Top = 223
              Caption = 'Correct placement of IUCD'
              TabOrder = 23
              Transparent = True
              Width = 156
            end
            object cxLabel17: TcxLabel
              Left = 228
              Top = 128
              Caption = 'Dimensions'
              Transparent = True
            end
            object edtpolypLength1: TcxSpinEdit
              Left = 286
              Top = 126
              Enabled = False
              Properties.AssignedValues.MinValue = True
              Properties.SpinButtons.Visible = False
              TabOrder = 12
              Width = 26
            end
            object edtpolypWidth1: TcxSpinEdit
              Left = 331
              Top = 126
              Enabled = False
              Properties.AssignedValues.MinValue = True
              Properties.SpinButtons.Visible = False
              TabOrder = 13
              Width = 26
            end
            object cxLabel61: TcxLabel
              Left = 62
              Top = 340
              Caption = 'Uterus'
              Transparent = True
            end
            object cbAntiFlexed: TcxCheckBox
              Left = 105
              Top = 65
              Caption = 'Anteflexed'
              TabOrder = 7
              Transparent = True
              Width = 81
            end
            object cbRetroFlexed: TcxCheckBox
              Left = 183
              Top = 65
              Caption = 'Retroflexed'
              TabOrder = 8
              Transparent = True
              Width = 81
            end
            object edtpolypDepth1: TcxSpinEdit
              Left = 375
              Top = 126
              Enabled = False
              Properties.AssignedValues.MinValue = True
              Properties.SpinButtons.Visible = False
              TabOrder = 14
              Width = 26
            end
            object cbUterusMobile: TcxCheckBox
              Left = 106
              Top = 338
              Caption = 'Mobile'
              TabOrder = 30
              Transparent = True
              Width = 64
            end
            object cbUterusLimitedMobile: TcxCheckBox
              Left = 183
              Top = 338
              Caption = 'Limited mobility'
              TabOrder = 31
              Transparent = True
              Width = 102
            end
            object cbUterusNonTender: TcxCheckBox
              Left = 106
              Top = 354
              Caption = 'Non tender'
              TabOrder = 32
              Transparent = True
              Width = 86
            end
            object cbUterusTender: TcxCheckBox
              Left = 183
              Top = 354
              Caption = 'Tender'
              TabOrder = 33
              Transparent = True
              Width = 64
            end
            object cxLabel27: TcxLabel
              Left = 355
              Top = 48
              Caption = 'mm'
              Transparent = True
            end
            object cxLabel28: TcxLabel
              Left = 399
              Top = 48
              Caption = 'mm'
              Transparent = True
            end
            object cxLabel29: TcxLabel
              Left = 444
              Top = 48
              Caption = 'mm'
              Transparent = True
            end
            object cxLabel18: TcxLabel
              Left = 312
              Top = 128
              Caption = 'mm'
              Transparent = True
            end
            object cxLabel74: TcxLabel
              Left = 356
              Top = 128
              Caption = 'mm'
              Transparent = True
            end
            object cxLabel83: TcxLabel
              Left = 401
              Top = 128
              Caption = 'mm'
              Transparent = True
            end
            object cbCorrectPlacementIUS: TcxCheckBox
              Left = 106
              Top = 239
              Caption = 'Correct placement of IUS'
              TabOrder = 24
              Transparent = True
              Width = 162
            end
            object cxLabel163: TcxLabel
              Left = 280
              Top = 105
              Caption = 'Measured'
              Transparent = True
            end
            object seEdometriumThickness: TcxSpinEdit
              Left = 330
              Top = 104
              Properties.AssignedValues.MinValue = True
              Properties.DisplayFormat = '#0.0'
              Properties.EditFormat = '#0.0'
              Properties.Increment = 0.100000000000000000
              Properties.MaxValue = 50.000000000000000000
              Properties.SpinButtons.Visible = False
              Properties.ValueType = vtFloat
              Style.BorderColor = clRed
              Style.BorderStyle = ebsThick
              TabOrder = 10
              Width = 39
            end
            object cxLabel164: TcxLabel
              Left = 370
              Top = 106
              Caption = 'mm'
              Transparent = True
            end
            object cbInCorrectPlacementIUCD: TcxCheckBox
              Left = 267
              Top = 223
              Caption = 'Incorrect placement of IUCD'
              TabOrder = 25
              Transparent = True
              Width = 178
            end
            object cbInCorrectPlacementIUS: TcxCheckBox
              Left = 267
              Top = 239
              Caption = 'Incorrect placement of IUS'
              TabOrder = 26
              Transparent = True
              Width = 162
            end
            object cxLabel165: TcxLabel
              Left = 33
              Top = 303
              Caption = 'Uterine shape'
              Transparent = True
            end
            object cbUterineShape: TcxComboBox
              Left = 109
              Top = 301
              Properties.DropDownRows = 9
              Properties.Items.Strings = (
                ''
                'normal'
                'arcuate (10 - 15 mm)'
                'septate partial'
                'septate complete'
                'bicornuate'
                'didelphys'
                'left unicornuate'
                'right unicornuate')
              TabOrder = 28
              Width = 136
            end
            object cxLabel166: TcxLabel
              Left = 251
              Top = 303
              Caption = 'Septum length'
              Transparent = True
            end
            object spSeptumlength: TcxSpinEdit
              Left = 327
              Top = 301
              Properties.AssignedValues.MinValue = True
              Properties.SpinButtons.Visible = False
              TabOrder = 29
              Width = 33
            end
            object cxLabel167: TcxLabel
              Left = 360
              Top = 303
              Caption = 'mm'
              Transparent = True
            end
            object spRightCerivalLength: TcxSpinEdit
              Left = 839
              Top = 367
              Properties.AssignedValues.MinValue = True
              Properties.SpinButtons.Visible = False
              TabOrder = 48
              Visible = False
              Width = 35
            end
            object lblRCervixMM: TcxLabel
              Left = 875
              Top = 369
              Caption = 'mm'
              Transparent = True
              Visible = False
            end
            object lblLeftCervix: TcxLabel
              Left = 823
              Top = 347
              Caption = '(L)'
              Transparent = True
              Visible = False
            end
            object lblRightCervix: TcxLabel
              Left = 821
              Top = 369
              Caption = '(R)'
              Transparent = True
              Visible = False
            end
            object lblLeftUterine: TcxLabel
              Left = 833
              Top = 427
              Caption = '(L)'
              Transparent = True
              Visible = False
            end
            object lblRightUterine: TcxLabel
              Left = 831
              Top = 450
              Caption = '(R)'
              Transparent = True
              Visible = False
            end
            object seRightUterineCavityLength: TcxSpinEdit
              Left = 853
              Top = 448
              Properties.AssignedValues.MinValue = True
              Properties.Increment = 0.100000000000000000
              Properties.SpinButtons.Visible = False
              TabOrder = 49
              Visible = False
              Width = 33
            end
            object lblRUterineCavityMM: TcxLabel
              Left = 888
              Top = 450
              Caption = 'mm'
              Transparent = True
              Visible = False
            end
            object cxLabel168: TcxLabel
              Left = 35
              Top = 380
              Caption = 'Adenomyosis '
              ParentFont = False
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -12
              Style.Font.Name = 'Tahoma'
              Style.Font.Style = [fsBold]
              Style.IsFontAssigned = True
              Transparent = True
            end
            object cbAdenomyosisPresent: TcxCheckBox
              Left = 128
              Top = 379
              Caption = 'Present'
              TabOrder = 34
              Transparent = True
              Width = 64
            end
            object cbAdenomyosisNotPresent: TcxCheckBox
              Left = 191
              Top = 379
              Caption = 'Not present'
              TabOrder = 35
              Transparent = True
              Width = 87
            end
            object lblVenetianBlindShadowing: TcxLabel
              Left = 292
              Top = 404
              Caption = 'Venetian blind shadowing'
              Transparent = True
            end
            object cbVBShadowingPresent: TcxCheckBox
              Left = 415
              Top = 402
              Caption = 'Present'
              TabOrder = 38
              Transparent = True
              Width = 65
            end
            object cbVBShadowingNotPresent: TcxCheckBox
              Left = 476
              Top = 402
              Caption = 'Not present'
              TabOrder = 39
              Transparent = True
              Width = 98
            end
            object lblincVascularity: TcxLabel
              Left = 305
              Top = 424
              Caption = 'Increased vascularity'
              Transparent = True
            end
            object cbIncVasPresent: TcxCheckBox
              Left = 415
              Top = 422
              Caption = 'Present'
              TabOrder = 41
              Transparent = True
              Width = 64
            end
            object cbIncVasNotPresent: TcxCheckBox
              Left = 476
              Top = 422
              Caption = 'Not present'
              TabOrder = 42
              Transparent = True
              Width = 89
            end
            object lblApdiameterAnt: TcxLabel
              Left = 23
              Top = 454
              Caption = 'AP diameter anterior'
              Transparent = True
            end
            object spAPAnterior: TcxSpinEdit
              Left = 132
              Top = 453
              Properties.AssignedValues.MinValue = True
              Properties.SpinButtons.Visible = False
              TabOrder = 43
              Width = 26
            end
            object spAPPosterior: TcxSpinEdit
              Left = 227
              Top = 453
              Properties.AssignedValues.MinValue = True
              Properties.SpinButtons.Visible = False
              TabOrder = 44
              Width = 26
            end
            object lblAPDiameterposterior: TcxLabel
              Left = 160
              Top = 455
              Caption = 'mm posterior'
              Transparent = True
            end
            object lblMyometrium: TcxLabel
              Left = 253
              Top = 455
              Caption = 'mm myometrium'
              Transparent = True
            end
            object cbPerformedTransAbdom: TcxCheckBox
              Left = 107
              Top = 0
              Caption = 'Whole examination was performed transabdominally '
              TabOrder = 0
              Transparent = True
              Width = 287
            end
            object cbHysterectomy: TcxCheckBox
              Left = 106
              Top = 19
              Caption = 'Hysterectomy'
              TabOrder = 1
              Transparent = True
              Width = 120
            end
            object cxLabel174: TcxLabel
              Left = 212
              Top = 21
              Caption = 'Cervix Present '
              Transparent = True
            end
            object cbCervixPresentYes: TcxCheckBox
              Left = 288
              Top = 19
              Caption = 'Yes'
              Enabled = False
              TabOrder = 83
              Transparent = True
              Width = 45
            end
            object cbCervixPresentNo: TcxCheckBox
              Left = 327
              Top = 19
              Caption = 'No'
              Enabled = False
              TabOrder = 84
              Transparent = True
              Width = 38
            end
            object cxLabel175: TcxLabel
              Left = 371
              Top = 21
              Caption = 'Vault Normal'
              Transparent = True
            end
            object cbVaultNormalYes: TcxCheckBox
              Left = 436
              Top = 19
              Caption = 'Yes'
              Enabled = False
              TabOrder = 86
              Transparent = True
              Width = 45
            end
            object cbVaultNormalNo: TcxCheckBox
              Left = 478
              Top = 19
              Caption = 'No'
              Enabled = False
              TabOrder = 87
              Transparent = True
              Width = 38
            end
            object cbLossEMInterface: TcxCheckBox
              Left = 128
              Top = 422
              Caption = 'Loss of E/M interface '
              TabOrder = 40
              Transparent = True
              Width = 136
            end
            object edtpolypLength2: TcxSpinEdit
              Left = 285
              Top = 149
              Enabled = False
              Properties.AssignedValues.MinValue = True
              Properties.SpinButtons.Visible = False
              TabOrder = 15
              Width = 26
            end
            object edtpolypWidth2: TcxSpinEdit
              Left = 331
              Top = 150
              Enabled = False
              Properties.AssignedValues.MinValue = True
              Properties.SpinButtons.Visible = False
              TabOrder = 16
              Width = 26
            end
            object edtpolypDepth2: TcxSpinEdit
              Left = 375
              Top = 150
              Enabled = False
              Properties.AssignedValues.MinValue = True
              Properties.SpinButtons.Visible = False
              TabOrder = 17
              Width = 26
            end
            object cxLabel200: TcxLabel
              Left = 312
              Top = 152
              Caption = 'mm'
              Transparent = True
            end
            object cxLabel201: TcxLabel
              Left = 356
              Top = 152
              Caption = 'mm'
              Transparent = True
            end
            object cxLabel202: TcxLabel
              Left = 401
              Top = 152
              Caption = 'mm'
              Transparent = True
            end
            object sePolypCount: TcxSpinEdit
              Left = 174
              Top = 127
              Properties.AssignedValues.MinValue = True
              Properties.LargeIncrement = 2.000000000000000000
              Properties.MaxValue = 2.000000000000000000
              TabOrder = 11
              Width = 44
            end
            object cxLabel203: TcxLabel
              Left = 39
              Top = 130
              Caption = 'Endometrial Polyp Count'
              Transparent = True
            end
            object cbEndometrialPolyp: TcxCheckBox
              Left = 750
              Top = 320
              Caption = 'Endometrial polyp identified  '#9
              TabOrder = 92
              Transparent = True
              Visible = False
              Width = 160
            end
            object lblMyometrialCysts: TcxLabel
              Left = 38
              Top = 404
              Caption = 'Myometrial cysts'
              Transparent = True
            end
            object cbMyometrialCystsPresent: TcxCheckBox
              Left = 128
              Top = 402
              Caption = 'Present'
              TabOrder = 36
              Transparent = True
              Width = 64
            end
            object cbMyometrialCystsNotPresent: TcxCheckBox
              Left = 191
              Top = 402
              Caption = 'Not present'
              TabOrder = 37
              Transparent = True
              Width = 89
            end
            object cxLabel256: TcxLabel
              Left = 33
              Top = 266
              Caption = 'Focal endometrial lesion identified '
              Transparent = True
            end
            object cxGroupBox17: TcxGroupBox
              Left = 207
              Top = 262
              Style.BorderStyle = ebsNone
              Style.Edges = []
              Style.LookAndFeel.NativeStyle = True
              StyleDisabled.LookAndFeel.NativeStyle = True
              StyleFocused.LookAndFeel.NativeStyle = True
              StyleHot.LookAndFeel.NativeStyle = True
              TabOrder = 27
              Transparent = True
              Height = 22
              Width = 125
              object cbEndometrialLensionYes: TcxCheckBox
                Left = -3
                Top = 3
                Caption = 'Yes'
                Style.LookAndFeel.NativeStyle = True
                StyleDisabled.LookAndFeel.NativeStyle = True
                StyleFocused.LookAndFeel.NativeStyle = True
                StyleHot.LookAndFeel.NativeStyle = True
                TabOrder = 0
                Transparent = True
                Width = 45
              end
              object cbEndometrialLensionNo: TcxCheckBox
                Left = 48
                Top = 3
                Caption = 'No'
                Style.LookAndFeel.NativeStyle = True
                StyleDisabled.LookAndFeel.NativeStyle = True
                StyleFocused.LookAndFeel.NativeStyle = True
                StyleHot.LookAndFeel.NativeStyle = True
                TabOrder = 1
                Transparent = True
                Width = 42
              end
            end
            object cbCervicalPolyp: TcxCheckBox
              Left = 106
              Top = 176
              Caption = 'Cervical polyp identified  '#9
              TabOrder = 18
              Transparent = True
              Width = 137
            end
            object edtcervicalpolypLength1: TcxSpinEdit
              Left = 251
              Top = 175
              Enabled = False
              Properties.AssignedValues.MinValue = True
              Properties.SpinButtons.Visible = False
              TabOrder = 19
              Width = 26
            end
            object edtCervicalpolypWidth1: TcxSpinEdit
              Left = 297
              Top = 176
              Enabled = False
              Properties.AssignedValues.MinValue = True
              Properties.SpinButtons.Visible = False
              TabOrder = 20
              Width = 26
            end
            object edtCervicalpolypDepth1: TcxSpinEdit
              Left = 341
              Top = 176
              Enabled = False
              Properties.AssignedValues.MinValue = True
              Properties.SpinButtons.Visible = False
              TabOrder = 21
              Width = 26
            end
            object cxLabel257: TcxLabel
              Left = 278
              Top = 178
              Caption = 'mm'
              Transparent = True
            end
            object cxLabel258: TcxLabel
              Left = 322
              Top = 178
              Caption = 'mm'
              Transparent = True
            end
            object cxLabel259: TcxLabel
              Left = 367
              Top = 178
              Caption = 'mm'
              Transparent = True
            end
          end
          object tsFibroids: TcxTabSheet
            Tag = 1
            Caption = 'Fibroids'
            ImageIndex = 2
            object cxGroupBox4: TcxGroupBox
              Left = 0
              Top = 0
              Align = alTop
              PanelStyle.Active = True
              TabOrder = 12
              Height = 27
              Width = 888
              object cxLabel42: TcxLabel
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
                Properties.MaxValue = 12.000000000000000000
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
              Top = 250
              Align = alTop
              PanelStyle.Active = True
              Style.BorderStyle = ebsNone
              Style.Edges = []
              Style.LookAndFeel.NativeStyle = True
              StyleDisabled.LookAndFeel.NativeStyle = True
              StyleFocused.LookAndFeel.NativeStyle = True
              StyleHot.LookAndFeel.NativeStyle = True
              TabOrder = 9
              Transparent = True
              Height = 24
              Width = 888
              object cxLabel62: TcxLabel
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
              object cxLabel63: TcxLabel
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
                Caption = 'Cavity distortion'
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
              object cxLabel73: TcxLabel
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
              object cxLabel94: TcxLabel
                Left = 347
                Top = 5
                Caption = 'mm'
                Transparent = True
              end
              object cxLabel103: TcxLabel
                Left = 403
                Top = 5
                Caption = 'cc'
                Transparent = True
              end
              object cbProjection10: TcxComboBox
                Left = 518
                Top = 2
                Properties.DropDownRows = 25
                Properties.Items.Strings = (
                  'more than 50%'
                  'less than 50%'
                  'minimally')
                Properties.ReadOnly = False
                TabOrder = 13
                Visible = False
                Width = 124
              end
            end
            object gbFibroid9: TcxGroupBox
              Left = 0
              Top = 226
              Align = alTop
              PanelStyle.Active = True
              Style.BorderStyle = ebsNone
              Style.Edges = []
              Style.LookAndFeel.NativeStyle = True
              StyleDisabled.LookAndFeel.NativeStyle = True
              StyleFocused.LookAndFeel.NativeStyle = True
              StyleHot.LookAndFeel.NativeStyle = True
              TabOrder = 8
              Transparent = True
              Height = 24
              Width = 888
              object cxLabel58: TcxLabel
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
              object cxLabel59: TcxLabel
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
                Caption = 'Cavity distortion'
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
              object cxLabel72: TcxLabel
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
              object cxLabel93: TcxLabel
                Left = 347
                Top = 5
                Caption = 'mm'
                Transparent = True
              end
              object cxLabel102: TcxLabel
                Left = 403
                Top = 5
                Caption = 'cc'
                Transparent = True
              end
              object cbProjection9: TcxComboBox
                Left = 518
                Top = 2
                Properties.DropDownRows = 25
                Properties.Items.Strings = (
                  'more than 50%'
                  'less than 50%'
                  'minimally')
                Properties.ReadOnly = False
                TabOrder = 13
                Visible = False
                Width = 124
              end
            end
            object gbFibroid8: TcxGroupBox
              Left = 0
              Top = 202
              Align = alTop
              PanelStyle.Active = True
              Style.BorderStyle = ebsNone
              Style.Edges = []
              Style.LookAndFeel.NativeStyle = True
              StyleDisabled.LookAndFeel.NativeStyle = True
              StyleFocused.LookAndFeel.NativeStyle = True
              StyleHot.LookAndFeel.NativeStyle = True
              TabOrder = 7
              Transparent = True
              Height = 24
              Width = 888
              object cxLabel56: TcxLabel
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
              object cxLabel57: TcxLabel
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
                Caption = 'Cavity distortion'
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
              object cxLabel71: TcxLabel
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
              object cxLabel101: TcxLabel
                Left = 403
                Top = 5
                Caption = 'cc'
                Transparent = True
              end
              object cbProjection8: TcxComboBox
                Left = 518
                Top = 2
                Properties.DropDownRows = 25
                Properties.Items.Strings = (
                  'more than 50%'
                  'less than 50%'
                  'minimally')
                Properties.ReadOnly = False
                TabOrder = 13
                Visible = False
                Width = 124
              end
            end
            object gbFibroid7: TcxGroupBox
              Left = 0
              Top = 177
              Align = alTop
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
              Width = 888
              object cxLabel54: TcxLabel
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
              object cxLabel55: TcxLabel
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
                Caption = 'Cavity distortion'
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
              object cxLabel70: TcxLabel
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
              object cxLabel91: TcxLabel
                Left = 347
                Top = 5
                Caption = 'mm'
                Transparent = True
              end
              object cxLabel114: TcxLabel
                Left = 406
                Top = 3
                Caption = 'cc'
                Transparent = True
              end
              object cbProjection7: TcxComboBox
                Left = 518
                Top = 2
                Properties.DropDownRows = 25
                Properties.Items.Strings = (
                  'more than 50%'
                  'less than 50%'
                  'minimally')
                Properties.ReadOnly = False
                TabOrder = 13
                Visible = False
                Width = 124
              end
            end
            object gbFibroid6: TcxGroupBox
              Left = 0
              Top = 152
              Align = alTop
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
              Width = 888
              object cxLabel52: TcxLabel
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
              object cxLabel53: TcxLabel
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
                Caption = 'Cavity distortion'
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
              object cxLabel69: TcxLabel
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
              object cxLabel90: TcxLabel
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
              object cbProjection6: TcxComboBox
                Left = 518
                Top = 2
                Properties.DropDownRows = 25
                Properties.Items.Strings = (
                  'more than 50%'
                  'less than 50%'
                  'minimally')
                Properties.ReadOnly = False
                TabOrder = 13
                Visible = False
                Width = 124
              end
            end
            object gbFibroid5: TcxGroupBox
              Left = 0
              Top = 127
              Align = alTop
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
              Width = 888
              object cxLabel50: TcxLabel
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
              object cxLabel51: TcxLabel
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
                Caption = 'Cavity distortion'
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
              object cxLabel68: TcxLabel
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
              object cxLabel89: TcxLabel
                Left = 347
                Top = 5
                Caption = 'mm'
                Transparent = True
              end
              object cxLabel99: TcxLabel
                Left = 403
                Top = 5
                Caption = 'cc'
                Transparent = True
              end
              object cbProjection5: TcxComboBox
                Left = 518
                Top = 2
                Properties.DropDownRows = 25
                Properties.Items.Strings = (
                  'more than 50%'
                  'less than 50%'
                  'minimally')
                Properties.ReadOnly = False
                TabOrder = 13
                Visible = False
                Width = 124
              end
            end
            object gbFibroid4: TcxGroupBox
              Left = 0
              Top = 102
              Align = alTop
              PanelStyle.Active = True
              Style.BorderStyle = ebsNone
              Style.Edges = []
              Style.LookAndFeel.NativeStyle = True
              StyleDisabled.LookAndFeel.NativeStyle = True
              StyleFocused.LookAndFeel.NativeStyle = True
              StyleHot.LookAndFeel.NativeStyle = True
              TabOrder = 3
              Transparent = True
              Height = 25
              Width = 888
              object cxLabel48: TcxLabel
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
              object cxLabel49: TcxLabel
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
                Top = 3
                Caption = 'Cavity distortion'
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
              object cxLabel67: TcxLabel
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
              object cxLabel88: TcxLabel
                Left = 347
                Top = 5
                Caption = 'mm'
                Transparent = True
              end
              object cxLabel98: TcxLabel
                Left = 403
                Top = 5
                Caption = 'cc'
                Transparent = True
              end
              object cbProjection4: TcxComboBox
                Left = 518
                Top = 2
                Properties.DropDownRows = 25
                Properties.Items.Strings = (
                  'more than 50%'
                  'less than 50%'
                  'minimally')
                Properties.ReadOnly = False
                TabOrder = 13
                Visible = False
                Width = 124
              end
            end
            object gbFibroid3: TcxGroupBox
              Left = 0
              Top = 77
              Align = alTop
              PanelStyle.Active = True
              Style.BorderStyle = ebsNone
              Style.Edges = []
              Style.LookAndFeel.NativeStyle = True
              StyleDisabled.LookAndFeel.NativeStyle = True
              StyleFocused.LookAndFeel.NativeStyle = True
              StyleHot.LookAndFeel.NativeStyle = True
              TabOrder = 2
              Transparent = True
              Height = 25
              Width = 888
              object cxLabel46: TcxLabel
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
              object cxLabel47: TcxLabel
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
                Caption = 'Cavity distortion'
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
              object cxLabel66: TcxLabel
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
              object cxLabel87: TcxLabel
                Left = 347
                Top = 6
                Caption = 'mm'
                Transparent = True
              end
              object cxLabel97: TcxLabel
                Left = 403
                Top = 6
                Caption = 'cc'
                Transparent = True
              end
              object cbProjection3: TcxComboBox
                Left = 518
                Top = 2
                Properties.DropDownRows = 25
                Properties.Items.Strings = (
                  'more than 50%'
                  'less than 50%'
                  'minimally')
                Properties.ReadOnly = False
                TabOrder = 13
                Visible = False
                Width = 124
              end
            end
            object gbFibroid2: TcxGroupBox
              Left = 0
              Top = 52
              Align = alTop
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
              Width = 888
              object cxLabel44: TcxLabel
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
              object cxLabel45: TcxLabel
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
                Caption = 'Cavity distortion'
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
              object cxLabel65: TcxLabel
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
              object cxLabel86: TcxLabel
                Left = 347
                Top = 5
                Caption = 'mm'
                Transparent = True
              end
              object cxLabel96: TcxLabel
                Left = 403
                Top = 5
                Caption = 'cc'
                Transparent = True
              end
              object cbProjection2: TcxComboBox
                Left = 518
                Top = 2
                Properties.DropDownRows = 25
                Properties.Items.Strings = (
                  'more than 50%'
                  'less than 50%'
                  'minimally')
                Properties.ReadOnly = False
                TabOrder = 13
                Visible = False
                Width = 124
              end
            end
            object gbFibroid1: TcxGroupBox
              Left = 0
              Top = 27
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
              Height = 25
              Width = 888
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
              object cxLabel43: TcxLabel
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
                Caption = 'Cavity distortion'
                TabOrder = 8
                Transparent = True
                Width = 110
              end
              object cxLabel64: TcxLabel
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
              object cxLabel85: TcxLabel
                Left = 347
                Top = 5
                Caption = 'mm'
                Transparent = True
              end
              object cxLabel95: TcxLabel
                Left = 403
                Top = 6
                Caption = 'cc'
                Transparent = True
              end
              object cbProjection1: TcxComboBox
                Left = 518
                Top = 2
                Properties.DropDownRows = 25
                Properties.Items.Strings = (
                  'more than 50%'
                  'less than 50%'
                  'minimally')
                Properties.ReadOnly = False
                TabOrder = 13
                Visible = False
                Width = 124
              end
            end
            object gbFibroid11: TcxGroupBox
              Left = 0
              Top = 274
              Align = alTop
              PanelStyle.Active = True
              Style.BorderStyle = ebsNone
              Style.Edges = []
              Style.LookAndFeel.NativeStyle = True
              StyleDisabled.LookAndFeel.NativeStyle = True
              StyleFocused.LookAndFeel.NativeStyle = True
              StyleHot.LookAndFeel.NativeStyle = True
              TabOrder = 10
              Transparent = True
              Height = 24
              Width = 888
              object cxLabel181: TcxLabel
                Left = 0
                Top = 5
                Caption = '11'
                Transparent = True
              end
              object cbFibriodPosition11: TcxComboBox
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
              object cbFibroidsType11: TcxComboBox
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
              object edtFibroidLength11: TcxSpinEdit
                Left = 224
                Top = 3
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                TabOrder = 4
                Width = 30
              end
              object cxLabel183: TcxLabel
                Left = 256
                Top = 5
                Caption = 'x'
                Transparent = True
              end
              object edtFibroidWidth11: TcxSpinEdit
                Left = 271
                Top = 3
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                TabOrder = 5
                Width = 30
              end
              object cbFibroidsLeftRight11: TcxComboBox
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
              object cbCavityDistortion11: TcxCheckBox
                Left = 415
                Top = 3
                Caption = 'Cavity distortion'
                TabOrder = 8
                Transparent = True
                Width = 110
              end
              object edtFibroiddepth11: TcxSpinEdit
                Left = 318
                Top = 3
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                TabOrder = 6
                Width = 30
              end
              object cxLabel184: TcxLabel
                Left = 305
                Top = 5
                Caption = 'x'
                Transparent = True
              end
              object edtFibroidVolume11: TcxSpinEdit
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
              object cxLabel185: TcxLabel
                Left = 347
                Top = 5
                Caption = 'mm'
                Transparent = True
              end
              object cxLabel186: TcxLabel
                Left = 403
                Top = 5
                Caption = 'cc'
                Transparent = True
              end
              object cbProjection11: TcxComboBox
                Left = 518
                Top = 2
                Properties.DropDownRows = 25
                Properties.Items.Strings = (
                  'more than 50%'
                  'less than 50%'
                  'minimally')
                Properties.ReadOnly = False
                TabOrder = 13
                Visible = False
                Width = 124
              end
            end
            object gbFibroid12: TcxGroupBox
              Left = 0
              Top = 298
              Align = alTop
              PanelStyle.Active = True
              Style.BorderStyle = ebsNone
              Style.Edges = []
              Style.LookAndFeel.NativeStyle = True
              StyleDisabled.LookAndFeel.NativeStyle = True
              StyleFocused.LookAndFeel.NativeStyle = True
              StyleHot.LookAndFeel.NativeStyle = True
              TabOrder = 11
              Transparent = True
              Height = 24
              Width = 888
              object cxLabel187: TcxLabel
                Left = 0
                Top = 5
                Caption = '12'
                Transparent = True
              end
              object cbFibriodPosition12: TcxComboBox
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
              object cbFibroidsType12: TcxComboBox
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
              object edtFibroidLength12: TcxSpinEdit
                Left = 224
                Top = 3
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                TabOrder = 4
                Width = 30
              end
              object cxLabel188: TcxLabel
                Left = 256
                Top = 5
                Caption = 'x'
                Transparent = True
              end
              object edtFibroidWidth12: TcxSpinEdit
                Left = 271
                Top = 3
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                TabOrder = 5
                Width = 30
              end
              object cbFibroidsLeftRight12: TcxComboBox
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
              object cbCavityDistortion12: TcxCheckBox
                Left = 415
                Top = 3
                Caption = 'Cavity distortion'
                TabOrder = 8
                Transparent = True
                Width = 110
              end
              object edtFibroiddepth12: TcxSpinEdit
                Left = 318
                Top = 3
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                TabOrder = 6
                Width = 30
              end
              object cxLabel189: TcxLabel
                Left = 305
                Top = 5
                Caption = 'x'
                Transparent = True
              end
              object edtFibroidVolume12: TcxSpinEdit
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
              object cxLabel190: TcxLabel
                Left = 347
                Top = 5
                Caption = 'mm'
                Transparent = True
              end
              object cxLabel191: TcxLabel
                Left = 403
                Top = 5
                Caption = 'cc'
                Transparent = True
              end
              object cbProjection12: TcxComboBox
                Left = 518
                Top = 2
                Properties.DropDownRows = 25
                Properties.Items.Strings = (
                  'more than 50%'
                  'less than 50%'
                  'minimally')
                Properties.ReadOnly = False
                TabOrder = 13
                Visible = False
                Width = 124
              end
            end
          end
          object tsOvaries: TcxTabSheet
            Tag = 1
            Caption = 'Ovaries'
            ImageIndex = 0
            object Bevel1: TBevel
              Left = 11
              Top = 271
              Width = 641
              Height = 3
            end
            object Bevel2: TBevel
              Left = 8
              Top = 171
              Width = 652
              Height = 3
            end
            object Bevel3: TBevel
              Left = 331
              Top = -19
              Width = 4
              Height = 429
            end
            object gbRightOvarianCyst1: TcxGroupBox
              Left = 3
              Top = 307
              PanelStyle.Active = True
              Style.BorderStyle = ebsNone
              TabOrder = 28
              Transparent = True
              Height = 24
              Width = 325
              object cxLabel78: TcxLabel
                Left = 156
                Top = 4
                Caption = 'cc'
                Transparent = True
              end
              object seRightOvaryCystVolume1: TcxSpinEdit
                Left = 126
                Top = 3
                Properties.AssignedValues.MinValue = True
                Properties.DisplayFormat = '#0.0'
                Properties.EditFormat = '#0.0'
                Properties.SpinButtons.Visible = False
                Properties.ValueType = vtFloat
                TabOrder = 3
                Width = 30
              end
              object cxLabel77: TcxLabel
                Left = 106
                Top = 5
                Caption = 'mm'
                Transparent = True
              end
              object seRightOvaryCystDepth1: TcxSpinEdit
                Left = 77
                Top = 3
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                TabOrder = 2
                Width = 30
              end
              object cxLabel76: TcxLabel
                Left = 67
                Top = 4
                Caption = 'x'
                Transparent = True
              end
              object seRightOvaryCystWidth1: TcxSpinEdit
                Left = 38
                Top = 3
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                TabOrder = 1
                Width = 30
              end
              object cxLabel75: TcxLabel
                Left = 29
                Top = 5
                Caption = 'x'
                Transparent = True
              end
              object seRightOvaryCystLength1: TcxSpinEdit
                Left = 1
                Top = 3
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                TabOrder = 0
                Width = 30
              end
              object cbRightOvaryCystType1: TAdvTreeComboBox
                Left = 170
                Top = 4
                Width = 155
                Height = 21
                DropHeight = 215
                DropWidth = 200
                ExpandOnDrop = True
                Flat = True
		Items.NodeData = {
                  0107000000190000000000000001000000FFFFFFFFFFFFFFFF00000000000000
                  0000250000000000000002000000FFFFFFFFFFFFFFFF00000000000000000653
                  0069006D0070006C006500310000000000000007000000FFFFFFFFFFFFFFFF00
                  000000040000000C4800610065006D006F007200720068006100670069006300
                  430000000000000000000000FFFFFFFFFFFFFFFF00000000000000001546006F
                  006C006C006900630075006C00610072002000630079007300740020003C0032
                  0030006D006D002F0000000000000000000000FFFFFFFFFFFFFFFF0000000000
                  0000000B46006C0075006900640020006C006500760065006C00490000000000
                  000000000000FFFFFFFFFFFFFFFF000000000000000018520065007400720061
                  006300740065006400200063006C006F007400200061006E0064002000730065
                  00720075006D00490000000000000000000000FFFFFFFFFFFFFFFF0000000000
                  000000185300740065006C006C00610074006500200066006900620072006900
                  6E00200073007400720061006E00640073002000310000000000000008000000
                  FFFFFFFFFFFFFFFF00000000000000000C45006E0064006F006D006500740072
                  0069006F006D006100310000000000000009000000FFFFFFFFFFFFFFFF000000
                  00020000000C4400650072006D006F0069006400200063007900730074003300
                  00000000000000000000FFFFFFFFFFFFFFFF00000000000000000D4D0075006C
                  007400690065006C0065006D0065006E00740073002900000000000000000000
                  00FFFFFFFFFFFFFFFF00000000000000000846006100740020006F006E006C00
                  790031000000000000000A000000FFFFFFFFFFFFFFFF00000000000000000C44
                  00650072006D006F0069006400200070006C007500670041000000000000000B
                  000000FFFFFFFFFFFFFFFF0000000000000000144F0074006800650072002000
                  20002D00200067006F00200074006F00200049004F00540041002000}
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'Tahoma'
                LabelFont.Style = []
                SelectMode = smSingleClick
                Indent = 19
                TreeFont.Charset = DEFAULT_CHARSET
                TreeFont.Color = clWindowText
                TreeFont.Height = -11
                TreeFont.Name = 'Tahoma'
                TreeFont.Style = []
                TreeColor = clWindow
                TreeBorder = bsSingle
                Selection = 0
                Version = '1.2.0.1'
                TabOrder = 4
              end
            end
            object cxLabel7: TcxLabel
              Left = 8
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
            object cxLabel8: TcxLabel
              Left = 343
              Top = 0
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
            object cxLabel9: TcxLabel
              Left = 16
              Top = 28
              Caption = 'Measured'
              Transparent = True
            end
            object seRightOvaryLength: TcxSpinEdit
              Left = 17
              Top = 48
              Enabled = False
              Properties.AssignedValues.MinValue = True
              Properties.SpinButtons.Visible = False
              TabOrder = 5
              Width = 30
            end
            object seRightOvaryWidth: TcxSpinEdit
              Left = 66
              Top = 48
              Enabled = False
              Properties.AssignedValues.MinValue = True
              Properties.SpinButtons.Visible = False
              TabOrder = 6
              Width = 30
            end
            object seRightOvaryHeight: TcxSpinEdit
              Left = 116
              Top = 48
              Enabled = False
              Properties.AssignedValues.MinValue = True
              Properties.SpinButtons.Visible = False
              TabOrder = 7
              Width = 30
            end
            object seRightOvaryCC: TcxSpinEdit
              Left = 173
              Top = 48
              Enabled = False
              Properties.AssignedValues.MinValue = True
              Properties.DisplayFormat = '#0.0'
              Properties.EditFormat = '#0.0'
              Properties.SpinButtons.Visible = False
              Properties.ValueType = vtFloat
              TabOrder = 8
              Width = 30
            end
            object cxLabel36: TcxLabel
              Left = 201
              Top = 50
              Caption = 'cc'
              Transparent = True
            end
            object seLeftOvaryLength: TcxSpinEdit
              Left = 343
              Top = 49
              Enabled = False
              Properties.AssignedValues.MinValue = True
              Properties.SpinButtons.Visible = False
              TabOrder = 37
              Width = 30
            end
            object seLeftOvaryWidth: TcxSpinEdit
              Left = 392
              Top = 49
              Enabled = False
              Properties.AssignedValues.MinValue = True
              Properties.SpinButtons.Visible = False
              TabOrder = 38
              Width = 30
            end
            object seLeftOvaryHeight: TcxSpinEdit
              Left = 441
              Top = 49
              Enabled = False
              Properties.AssignedValues.MinValue = True
              Properties.SpinButtons.Visible = False
              TabOrder = 39
              Width = 30
            end
            object seLeftOvaryCC: TcxSpinEdit
              Left = 499
              Top = 49
              Enabled = False
              Properties.AssignedValues.MinValue = True
              Properties.DisplayFormat = '#0.0'
              Properties.EditFormat = '#0.0'
              Properties.SpinButtons.Visible = False
              Properties.ValueType = vtFloat
              TabOrder = 40
              Width = 30
            end
            object cxLabel40: TcxLabel
              Left = 525
              Top = 50
              Caption = 'cc'
              Transparent = True
            end
            object cxLabel41: TcxLabel
              Left = 343
              Top = 28
              Caption = 'Measured'
              Transparent = True
            end
            object seRightFolCount: TcxSpinEdit
              Left = 10
              Top = 82
              Enabled = False
              Properties.AssignedValues.MinValue = True
              TabOrder = 9
              Width = 35
            end
            object lblRightFollicleRange: TcxLabel
              Left = 48
              Top = 84
              Caption = 'Antral follicle(s) count'
              Enabled = False
              Transparent = True
            end
            object seRightFolSize: TcxSpinEdit
              Left = 219
              Top = 81
              Enabled = False
              Properties.AssignedValues.MinValue = True
              TabOrder = 11
              Value = 9
              Width = 35
            end
            object cxLabel14: TcxLabel
              Left = 265
              Top = 85
              Caption = 'mm'
              Transparent = True
            end
            object seLeftFolCount: TcxSpinEdit
              Left = 343
              Top = 82
              Enabled = False
              Properties.AssignedValues.MinValue = True
              TabOrder = 41
              Width = 35
            end
            object lblLeftFollicleRange: TcxLabel
              Left = 379
              Top = 84
              Caption = 'Antral follicle(s) count'
              Enabled = False
              Transparent = True
            end
            object seLeftFolSize: TcxSpinEdit
              Left = 549
              Top = 82
              Enabled = False
              Properties.AssignedValues.MinValue = True
              TabOrder = 43
              Value = 9
              Width = 35
            end
            object cxLabel11: TcxLabel
              Left = 585
              Top = 84
              Caption = 'mm'
              Transparent = True
            end
            object cbRightLeadFollicle: TcxCheckBox
              Left = 69
              Top = 409
              Caption = 'LF'
              Enabled = False
              TabOrder = 79
              Transparent = True
              Visible = False
              Width = 38
            end
            object seRightLeadFollicleSize: TcxSpinEdit
              Left = 166
              Top = 104
              Enabled = False
              Properties.AssignedValues.MinValue = True
              TabOrder = 13
              Width = 35
            end
            object cxLabel15: TcxLabel
              Left = 309
              Top = 105
              Caption = 'mm'
              Transparent = True
            end
            object cbLeftLeadFollicle: TcxCheckBox
              Left = 385
              Top = 405
              Caption = 'LF'
              Enabled = False
              TabOrder = 66
              Transparent = True
              Visible = False
              Width = 38
            end
            object seLeftLeadFollicleSize2: TcxSpinEdit
              Left = 549
              Top = 103
              Enabled = False
              Properties.AssignedValues.MinValue = True
              TabOrder = 46
              Width = 35
            end
            object cxLabel12: TcxLabel
              Left = 640
              Top = 105
              Caption = 'mm'
              Transparent = True
            end
            object cbRightCorpusLuteum: TcxCheckBox
              Left = 113
              Top = 409
              Caption = 'Cl'
              Enabled = False
              TabOrder = 17
              Transparent = True
              Visible = False
              Width = 36
            end
            object cbRightCorpusLuteumSize: TcxSpinEdit
              Left = 166
              Top = 126
              Enabled = False
              Properties.AssignedValues.MinValue = True
              TabOrder = 18
              Width = 35
            end
            object cxLabel19: TcxLabel
              Left = 201
              Top = 130
              Caption = 'mm'
              Transparent = True
            end
            object cbLeftCorpusLuteum: TcxCheckBox
              Left = 421
              Top = 405
              Caption = 'CL'
              Enabled = False
              TabOrder = 72
              Transparent = True
              Visible = False
              Width = 38
            end
            object cbLeftCorpusLuteumSize: TcxSpinEdit
              Left = 496
              Top = 128
              Enabled = False
              TabOrder = 49
              Width = 35
            end
            object cxLabel16: TcxLabel
              Left = 530
              Top = 130
              Caption = 'mm'
              Transparent = True
            end
            object cbRightOvaryIdentified: TcxCheckBox
              Left = 82
              Top = -2
              Caption = 'Identified'
              TabOrder = 0
              Transparent = True
              Width = 73
            end
            object cbLeftOvaryIdentified: TcxCheckBox
              Left = 408
              Top = -2
              Caption = 'Identified'
              TabOrder = 32
              Transparent = True
              Width = 101
            end
            object cbRightMobile: TcxCheckBox
              Left = 12
              Top = 181
              Caption = 'Mobile'
              Enabled = False
              TabOrder = 21
              Transparent = True
              Width = 64
            end
            object cbRightLimitedMobility: TcxCheckBox
              Left = 92
              Top = 181
              Caption = 'Limited mobility'
              Enabled = False
              TabOrder = 22
              Transparent = True
              Width = 102
            end
            object cbLeftLimitedMobility: TcxCheckBox
              Left = 426
              Top = 181
              Caption = 'Limited mobility'
              Enabled = False
              TabOrder = 53
              Transparent = True
              Width = 102
            end
            object cbLeftMobile: TcxCheckBox
              Left = 340
              Top = 181
              Caption = 'Mobile'
              Enabled = False
              TabOrder = 52
              Transparent = True
              Width = 64
            end
            object seRightFollicle1Size: TcxSpinEdit
              Left = 166
              Top = 81
              Enabled = False
              Properties.AssignedValues.MinValue = True
              TabOrder = 10
              Value = 2
              Width = 35
            end
            object cxLabel10: TcxLabel
              Left = 207
              Top = 85
              Caption = '-'
              Transparent = True
            end
            object cxLabel13: TcxLabel
              Left = 537
              Top = 84
              Caption = '-'
              Transparent = True
            end
            object seLeftFollicle1Size: TcxSpinEdit
              Left = 496
              Top = 82
              Enabled = False
              Properties.AssignedValues.MinValue = True
              TabOrder = 42
              Value = 2
              Width = 35
            end
            object cbRightOvarianCyst: TcxCheckBox
              Left = 9
              Top = 280
              Caption = 'Ovarian cyst visualised'
              Enabled = False
              TabOrder = 26
              Transparent = True
              Width = 146
            end
            object cbLeftOvarianCyst: TcxCheckBox
              Left = 342
              Top = 278
              Caption = 'Ovarian cyst visualised'
              Enabled = False
              TabOrder = 57
              Transparent = True
              Width = 146
            end
            object cbRightTender: TcxCheckBox
              Left = 92
              Top = 199
              Caption = 'Tender'
              Enabled = False
              TabOrder = 23
              Transparent = True
              Width = 64
            end
            object cbRightNonTender: TcxCheckBox
              Left = 12
              Top = 199
              Caption = 'Non tender'
              Enabled = False
              TabOrder = 24
              Transparent = True
              Width = 82
            end
            object cbLeftTender: TcxCheckBox
              Left = 426
              Top = 199
              Caption = 'Tender'
              Enabled = False
              TabOrder = 54
              Transparent = True
              Width = 64
            end
            object cbLeftNonTender: TcxCheckBox
              Left = 340
              Top = 199
              Caption = 'Non tender'
              Enabled = False
              TabOrder = 55
              Transparent = True
              Width = 84
            end
            object cxLabel33: TcxLabel
              Left = 147
              Top = 50
              Caption = 'mm'
              Transparent = True
            end
            object cxLabel35: TcxLabel
              Left = 51
              Top = 50
              Caption = 'x'
              Transparent = True
            end
            object cxLabel37: TcxLabel
              Left = 376
              Top = 51
              Caption = 'x'
              Transparent = True
            end
            object cxLabel38: TcxLabel
              Left = 424
              Top = 51
              Caption = 'x'
              Transparent = True
            end
            object cxLabel39: TcxLabel
              Left = 473
              Top = 51
              Caption = 'mm'
              Transparent = True
            end
            object cxLabel34: TcxLabel
              Left = 100
              Top = 50
              Caption = 'x'
              Transparent = True
            end
            object cbRightPCO: TcxCheckBox
              Left = 159
              Top = 407
              Caption = 'PCO'
              Enabled = False
              TabOrder = 75
              Transparent = True
              Visible = False
              Width = 42
            end
            object seRightLeadFollicleSize2: TcxSpinEdit
              Left = 220
              Top = 104
              Enabled = False
              Properties.AssignedValues.MinValue = True
              TabOrder = 14
              Width = 35
            end
            object seRightLeadFollicleSize3: TcxSpinEdit
              Left = 273
              Top = 104
              Enabled = False
              Properties.AssignedValues.MinValue = True
              TabOrder = 15
              Width = 35
            end
            object seLeftLeadFollicleSize: TcxSpinEdit
              Left = 496
              Top = 103
              Enabled = False
              Properties.AssignedValues.MinValue = True
              TabOrder = 45
              Width = 35
            end
            object seLeftLeadFollicleSize3: TcxSpinEdit
              Left = 604
              Top = 103
              Enabled = False
              Properties.AssignedValues.MinValue = True
              TabOrder = 47
              Width = 35
            end
            object cxLabel134: TcxLabel
              Left = 585
              Top = 105
              Caption = 'mm'
              Transparent = True
            end
            object cxLabel135: TcxLabel
              Left = 530
              Top = 105
              Caption = 'mm'
              Transparent = True
            end
            object cxLabel136: TcxLabel
              Left = 255
              Top = 105
              Caption = 'mm'
              Transparent = True
            end
            object cxLabel137: TcxLabel
              Left = 200
              Top = 105
              Caption = 'mm'
              Transparent = True
            end
            object cbRightCorpusLuteumSize2: TcxSpinEdit
              Left = 220
              Top = 128
              Enabled = False
              Properties.AssignedValues.MinValue = True
              TabOrder = 19
              Width = 35
            end
            object cxLabel138: TcxLabel
              Left = 255
              Top = 130
              Caption = 'mm'
              Transparent = True
            end
            object cbLeftCorpusLuteumSize2: TcxSpinEdit
              Left = 549
              Top = 128
              Enabled = False
              TabOrder = 50
              Width = 35
            end
            object cxLabel139: TcxLabel
              Left = 585
              Top = 130
              Caption = 'mm'
              Transparent = True
            end
            object seRightOvarianCystsCount: TcxSpinEdit
              Left = 161
              Top = 281
              Enabled = False
              Properties.AssignedValues.MinValue = True
              Properties.LargeIncrement = 2.000000000000000000
              Properties.MaxValue = 4.000000000000000000
              TabOrder = 27
              Width = 44
            end
            object seLeftOvarianCystsCount: TcxSpinEdit
              Left = 499
              Top = 279
              Enabled = False
              Properties.AssignedValues.MinValue = True
              Properties.LargeIncrement = 2.000000000000000000
              Properties.MaxValue = 4.000000000000000000
              TabOrder = 58
              Width = 44
            end
            object cbRightOvaryVisualisedTA: TcxCheckBox
              Left = 82
              Top = 27
              Caption = 'Visualised  TA'
              Enabled = False
              TabOrder = 3
              Transparent = True
              Width = 92
            end
            object cbLeftOvaryVisualisedTA: TcxCheckBox
              Left = 408
              Top = 27
              Caption = 'Visualised  TA'
              Enabled = False
              TabOrder = 35
              Transparent = True
              Width = 95
            end
            object cbRightOvaryVisualisedTV: TcxCheckBox
              Left = 169
              Top = 27
              Caption = 'Visualised  TV'
              Enabled = False
              TabOrder = 4
              Transparent = True
              Width = 87
            end
            object cbLeftOvaryVisualisedTV: TcxCheckBox
              Left = 499
              Top = 27
              Caption = 'Visualised  TV'
              Enabled = False
              TabOrder = 36
              Transparent = True
              Width = 87
            end
            object gbRightVaginalAccess: TcxGroupBox
              Left = 7
              Top = 229
              Caption = 'Vaginal Access (Pre-IVF assessment only)'
              Enabled = False
              Style.BorderStyle = ebsNone
              Style.Edges = []
              Style.LookAndFeel.NativeStyle = True
              StyleDisabled.LookAndFeel.NativeStyle = True
              StyleFocused.LookAndFeel.NativeStyle = True
              StyleHot.LookAndFeel.NativeStyle = True
              TabOrder = 25
              Transparent = True
              Height = 36
              Width = 254
              object cbRightVaginalAccessYes: TcxCheckBox
                Left = 2
                Top = 13
                Caption = 'Yes'
                Enabled = False
                TabOrder = 0
                Transparent = True
                Width = 49
              end
              object cbRightVaginalAccessNo: TcxCheckBox
                Left = 52
                Top = 13
                Caption = 'No'
                Enabled = False
                TabOrder = 1
                Transparent = True
                Width = 49
              end
              object cbRightVaginalNA: TcxCheckBox
                Left = 100
                Top = 13
                Caption = 'Pre-IVF assessment only'
                Enabled = False
                TabOrder = 2
                Transparent = True
                Visible = False
                Width = 144
              end
            end
            object gbLeftVaginalAccess: TcxGroupBox
              Left = 338
              Top = 229
              Caption = 'Vaginal Access (Pre-IVF assessment only)'
              Enabled = False
              Style.BorderStyle = ebsNone
              Style.Edges = []
              Style.LookAndFeel.NativeStyle = True
              StyleDisabled.LookAndFeel.NativeStyle = True
              StyleFocused.LookAndFeel.NativeStyle = True
              StyleHot.LookAndFeel.NativeStyle = True
              TabOrder = 56
              Transparent = True
              Height = 34
              Width = 254
              object cbLeftVaginalAccessYes: TcxCheckBox
                Left = 3
                Top = 13
                Caption = 'Yes'
                Enabled = False
                TabOrder = 0
                Transparent = True
                Width = 49
              end
              object cbLeftVaginalAccessNo: TcxCheckBox
                Left = 52
                Top = 13
                Caption = 'No'
                Enabled = False
                TabOrder = 1
                Transparent = True
                Width = 49
              end
              object cbLeftVaginalNA: TcxCheckBox
                Left = 100
                Top = 13
                Caption = 'Pre-IVF assessment only'
                Enabled = False
                TabOrder = 2
                Transparent = True
                Visible = False
                Width = 144
              end
            end
            object cbRightOvaryNormal: TcxCheckBox
              Left = 169
              Top = -2
              Caption = 'Normal'
              Enabled = False
              TabOrder = 1
              Transparent = True
              Width = 73
            end
            object cbLeftOvaryNormal: TcxCheckBox
              Left = 499
              Top = -2
              Caption = 'Normal'
              Enabled = False
              TabOrder = 33
              Transparent = True
              Width = 73
            end
            object gbRightOvarianCyst2: TcxGroupBox
              Left = 3
              Top = 333
              PanelStyle.Active = True
              Style.BorderStyle = ebsNone
              TabOrder = 29
              Transparent = True
              Height = 24
              Width = 325
              object cxLabel132: TcxLabel
                Left = 155
                Top = 5
                Caption = 'cc'
                Transparent = True
              end
              object seRightOvaryCystVolume2: TcxSpinEdit
                Left = 126
                Top = 3
                Properties.AssignedValues.MinValue = True
                Properties.DisplayFormat = '#0.0'
                Properties.EditFormat = '#0.0'
                Properties.SpinButtons.Visible = False
                Properties.ValueType = vtFloat
                TabOrder = 3
                Width = 30
              end
              object cxLabel133: TcxLabel
                Left = 106
                Top = 5
                Caption = 'mm'
                Transparent = True
              end
              object seRightOvaryCystDepth2: TcxSpinEdit
                Left = 77
                Top = 3
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                TabOrder = 2
                Width = 30
              end
              object cxLabel140: TcxLabel
                Left = 67
                Top = 4
                Caption = 'x'
                Transparent = True
              end
              object seRightOvaryCystWidth2: TcxSpinEdit
                Left = 38
                Top = 3
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                TabOrder = 1
                Width = 30
              end
              object cxLabel141: TcxLabel
                Left = 29
                Top = 5
                Caption = 'x'
                Transparent = True
              end
              object seRightOvaryCystLength2: TcxSpinEdit
                Left = 1
                Top = 3
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                TabOrder = 0
                Width = 30
              end
              object cbRightOvaryCystType2: TAdvTreeComboBox
                Left = 170
                Top = 3
                Width = 155
                Height = 21
                DropHeight = 215
                DropWidth = 200
                ExpandOnDrop = True
                Flat = True
		Items.NodeData = {
                  0107000000190000000000000001000000FFFFFFFFFFFFFFFF00000000000000
                  0000250000000000000002000000FFFFFFFFFFFFFFFF00000000000000000653
                  0069006D0070006C006500310000000000000007000000FFFFFFFFFFFFFFFF00
                  000000040000000C4800610065006D006F007200720068006100670069006300
                  430000000000000000000000FFFFFFFFFFFFFFFF00000000000000001546006F
                  006C006C006900630075006C00610072002000630079007300740020003C0032
                  0030006D006D002F0000000000000000000000FFFFFFFFFFFFFFFF0000000000
                  0000000B46006C0075006900640020006C006500760065006C00490000000000
                  000000000000FFFFFFFFFFFFFFFF000000000000000018520065007400720061
                  006300740065006400200063006C006F007400200061006E0064002000730065
                  00720075006D00490000000000000000000000FFFFFFFFFFFFFFFF0000000000
                  000000185300740065006C006C00610074006500200066006900620072006900
                  6E00200073007400720061006E00640073002000310000000000000008000000
                  FFFFFFFFFFFFFFFF00000000000000000C45006E0064006F006D006500740072
                  0069006F006D006100310000000000000009000000FFFFFFFFFFFFFFFF000000
                  00020000000C4400650072006D006F0069006400200063007900730074003300
                  00000000000000000000FFFFFFFFFFFFFFFF00000000000000000D4D0075006C
                  007400690065006C0065006D0065006E00740073002900000000000000000000
                  00FFFFFFFFFFFFFFFF00000000000000000846006100740020006F006E006C00
                  790031000000000000000A000000FFFFFFFFFFFFFFFF00000000000000000C44
                  00650072006D006F0069006400200070006C007500670041000000000000000B
                  000000FFFFFFFFFFFFFFFF0000000000000000144F0074006800650072002000
                  20002D00200067006F00200074006F00200049004F00540041002000}
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'Tahoma'
                LabelFont.Style = []
                SelectMode = smSingleClick
                Indent = 19
                TreeFont.Charset = DEFAULT_CHARSET
                TreeFont.Color = clWindowText
                TreeFont.Height = -11
                TreeFont.Name = 'Tahoma'
                TreeFont.Style = []
                TreeColor = clWindow
                TreeBorder = bsSingle
                Selection = 0
                Version = '1.2.0.1'
                TabOrder = 4
              end
            end
            object gbRightOvarianCyst3: TcxGroupBox
              Left = 3
              Top = 357
              PanelStyle.Active = True
              Style.BorderStyle = ebsNone
              TabOrder = 30
              Transparent = True
              Height = 24
              Width = 325
              object cxLabel142: TcxLabel
                Left = 155
                Top = 4
                Caption = 'cc'
                Transparent = True
              end
              object seRightOvaryCystVolume3: TcxSpinEdit
                Left = 126
                Top = 3
                Properties.AssignedValues.MinValue = True
                Properties.DisplayFormat = '#0.0'
                Properties.EditFormat = '#0.0'
                Properties.SpinButtons.Visible = False
                Properties.ValueType = vtFloat
                TabOrder = 3
                Width = 30
              end
              object cxLabel143: TcxLabel
                Left = 106
                Top = 5
                Caption = 'mm'
                Transparent = True
              end
              object seRightOvaryCystDepth3: TcxSpinEdit
                Left = 77
                Top = 3
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                TabOrder = 2
                Width = 30
              end
              object cxLabel144: TcxLabel
                Left = 67
                Top = 4
                Caption = 'x'
                Transparent = True
              end
              object seRightOvaryCystWidth3: TcxSpinEdit
                Left = 38
                Top = 3
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                TabOrder = 1
                Width = 30
              end
              object cxLabel145: TcxLabel
                Left = 29
                Top = 5
                Caption = 'x'
                Transparent = True
              end
              object seRightOvaryCystLength3: TcxSpinEdit
                Left = 1
                Top = 3
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                TabOrder = 0
                Width = 30
              end
              object cbRightOvaryCystType3: TAdvTreeComboBox
                Left = 170
                Top = 3
                Width = 155
                Height = 21
                DropHeight = 215
                DropWidth = 200
                ExpandOnDrop = True
                Flat = True
		Items.NodeData = {
                  0107000000190000000000000001000000FFFFFFFFFFFFFFFF00000000000000
                  0000250000000000000002000000FFFFFFFFFFFFFFFF00000000000000000653
                  0069006D0070006C006500310000000000000007000000FFFFFFFFFFFFFFFF00
                  000000040000000C4800610065006D006F007200720068006100670069006300
                  430000000000000000000000FFFFFFFFFFFFFFFF00000000000000001546006F
                  006C006C006900630075006C00610072002000630079007300740020003C0032
                  0030006D006D002F0000000000000000000000FFFFFFFFFFFFFFFF0000000000
                  0000000B46006C0075006900640020006C006500760065006C00490000000000
                  000000000000FFFFFFFFFFFFFFFF000000000000000018520065007400720061
                  006300740065006400200063006C006F007400200061006E0064002000730065
                  00720075006D00490000000000000000000000FFFFFFFFFFFFFFFF0000000000
                  000000185300740065006C006C00610074006500200066006900620072006900
                  6E00200073007400720061006E00640073002000310000000000000008000000
                  FFFFFFFFFFFFFFFF00000000000000000C45006E0064006F006D006500740072
                  0069006F006D006100310000000000000009000000FFFFFFFFFFFFFFFF000000
                  00020000000C4400650072006D006F0069006400200063007900730074003300
                  00000000000000000000FFFFFFFFFFFFFFFF00000000000000000D4D0075006C
                  007400690065006C0065006D0065006E00740073002900000000000000000000
                  00FFFFFFFFFFFFFFFF00000000000000000846006100740020006F006E006C00
                  790031000000000000000A000000FFFFFFFFFFFFFFFF00000000000000000C44
                  00650072006D006F0069006400200070006C007500670041000000000000000B
                  000000FFFFFFFFFFFFFFFF0000000000000000144F0074006800650072002000
                  20002D00200067006F00200074006F00200049004F00540041002000}
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'Tahoma'
                LabelFont.Style = []
                SelectMode = smSingleClick
                Indent = 19
                TreeFont.Charset = DEFAULT_CHARSET
                TreeFont.Color = clWindowText
                TreeFont.Height = -11
                TreeFont.Name = 'Tahoma'
                TreeFont.Style = []
                TreeColor = clWindow
                TreeBorder = bsSingle
                Selection = 0
                Version = '1.2.0.1'
                TabOrder = 4
              end
            end
            object gbLeftOvarianCyst1: TcxGroupBox
              Left = 342
              Top = 306
              PanelStyle.Active = True
              Style.BorderStyle = ebsNone
              TabOrder = 59
              Transparent = True
              Height = 24
              Width = 317
              object cxLabel79: TcxLabel
                Left = 156
                Top = 5
                Caption = 'cc'
                Transparent = True
              end
              object seLeftOvaryCystVolume1: TcxSpinEdit
                Left = 126
                Top = 3
                Properties.AssignedValues.MinValue = True
                Properties.DisplayFormat = '#0.0'
                Properties.EditFormat = '#0.0'
                Properties.SpinButtons.Visible = False
                Properties.ValueType = vtFloat
                TabOrder = 3
                Width = 30
              end
              object cxLabel80: TcxLabel
                Left = 106
                Top = 5
                Caption = 'mm'
                Transparent = True
              end
              object seLeftOvaryCystDepth1: TcxSpinEdit
                Left = 77
                Top = 3
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                TabOrder = 2
                Width = 30
              end
              object cxLabel81: TcxLabel
                Left = 67
                Top = 4
                Caption = 'x'
                Transparent = True
              end
              object seLeftOvaryCystWidth1: TcxSpinEdit
                Left = 38
                Top = 3
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                TabOrder = 1
                Width = 30
              end
              object cxLabel82: TcxLabel
                Left = 29
                Top = 5
                Caption = 'x'
                Transparent = True
              end
              object seLeftOvaryCystLength1: TcxSpinEdit
                Left = 1
                Top = 3
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                TabOrder = 0
                Width = 30
              end
              object cbLeftOvaryCystType1: TAdvTreeComboBox
                Left = 170
                Top = 3
                Width = 146
                Height = 21
                DropHeight = 215
                DropWidth = 200
                ExpandOnDrop = True
                Flat = True
		Items.NodeData = {
                  0107000000190000000000000001000000FFFFFFFFFFFFFFFF00000000000000
                  0000250000000000000002000000FFFFFFFFFFFFFFFF00000000000000000653
                  0069006D0070006C006500310000000000000007000000FFFFFFFFFFFFFFFF00
                  000000040000000C4800610065006D006F007200720068006100670069006300
                  430000000000000000000000FFFFFFFFFFFFFFFF00000000000000001546006F
                  006C006C006900630075006C00610072002000630079007300740020003C0032
                  0030006D006D002F0000000000000000000000FFFFFFFFFFFFFFFF0000000000
                  0000000B46006C0075006900640020006C006500760065006C00490000000000
                  000000000000FFFFFFFFFFFFFFFF000000000000000018520065007400720061
                  006300740065006400200063006C006F007400200061006E0064002000730065
                  00720075006D00490000000000000000000000FFFFFFFFFFFFFFFF0000000000
                  000000185300740065006C006C00610074006500200066006900620072006900
                  6E00200073007400720061006E00640073002000310000000000000008000000
                  FFFFFFFFFFFFFFFF00000000000000000C45006E0064006F006D006500740072
                  0069006F006D006100310000000000000009000000FFFFFFFFFFFFFFFF000000
                  00020000000C4400650072006D006F0069006400200063007900730074003300
                  00000000000000000000FFFFFFFFFFFFFFFF00000000000000000D4D0075006C
                  007400690065006C0065006D0065006E00740073002900000000000000000000
                  00FFFFFFFFFFFFFFFF00000000000000000846006100740020006F006E006C00
                  790031000000000000000A000000FFFFFFFFFFFFFFFF00000000000000000C44
                  00650072006D006F0069006400200070006C007500670041000000000000000B
                  000000FFFFFFFFFFFFFFFF0000000000000000144F0074006800650072002000
                  20002D00200067006F00200074006F00200049004F00540041002000}
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'Tahoma'
                LabelFont.Style = []
                SelectMode = smSingleClick
                Indent = 19
                TreeFont.Charset = DEFAULT_CHARSET
                TreeFont.Color = clWindowText
                TreeFont.Height = -11
                TreeFont.Name = 'Tahoma'
                TreeFont.Style = []
                TreeColor = clWindow
                TreeBorder = bsSingle
                Selection = 0
                Version = '1.2.0.1'
                TabOrder = 4
              end
            end
            object gbLeftOvarianCyst2: TcxGroupBox
              Left = 342
              Top = 329
              PanelStyle.Active = True
              Style.BorderStyle = ebsNone
              TabOrder = 60
              Transparent = True
              Height = 24
              Width = 317
              object cxLabel146: TcxLabel
                Left = 156
                Top = 5
                Caption = 'cc'
                Transparent = True
              end
              object seLeftOvaryCystVolume2: TcxSpinEdit
                Left = 126
                Top = 3
                Properties.AssignedValues.MinValue = True
                Properties.DisplayFormat = '#0.0'
                Properties.EditFormat = '#0.0'
                Properties.SpinButtons.Visible = False
                Properties.ValueType = vtFloat
                TabOrder = 3
                Width = 30
              end
              object cxLabel147: TcxLabel
                Left = 106
                Top = 5
                Caption = 'mm'
                Transparent = True
              end
              object seLeftOvaryCystDepth2: TcxSpinEdit
                Left = 77
                Top = 3
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                TabOrder = 2
                Width = 30
              end
              object cxLabel148: TcxLabel
                Left = 67
                Top = 4
                Caption = 'x'
                Transparent = True
              end
              object seLeftOvaryCystWidth2: TcxSpinEdit
                Left = 38
                Top = 3
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                TabOrder = 1
                Width = 30
              end
              object cxLabel149: TcxLabel
                Left = 29
                Top = 5
                Caption = 'x'
                Transparent = True
              end
              object seLeftOvaryCystLength2: TcxSpinEdit
                Left = 1
                Top = 3
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                TabOrder = 0
                Width = 30
              end
              object cbLeftOvaryCystType2: TAdvTreeComboBox
                Left = 170
                Top = 4
                Width = 146
                Height = 21
                DropHeight = 215
                DropWidth = 200
                ExpandOnDrop = True
                Flat = True
    		Items.NodeData = {
                  0107000000190000000000000001000000FFFFFFFFFFFFFFFF00000000000000
                  0000250000000000000002000000FFFFFFFFFFFFFFFF00000000000000000653
                  0069006D0070006C006500310000000000000007000000FFFFFFFFFFFFFFFF00
                  000000040000000C4800610065006D006F007200720068006100670069006300
                  430000000000000000000000FFFFFFFFFFFFFFFF00000000000000001546006F
                  006C006C006900630075006C00610072002000630079007300740020003C0032
                  0030006D006D002F0000000000000000000000FFFFFFFFFFFFFFFF0000000000
                  0000000B46006C0075006900640020006C006500760065006C00490000000000
                  000000000000FFFFFFFFFFFFFFFF000000000000000018520065007400720061
                  006300740065006400200063006C006F007400200061006E0064002000730065
                  00720075006D00490000000000000000000000FFFFFFFFFFFFFFFF0000000000
                  000000185300740065006C006C00610074006500200066006900620072006900
                  6E00200073007400720061006E00640073002000310000000000000008000000
                  FFFFFFFFFFFFFFFF00000000000000000C45006E0064006F006D006500740072
                  0069006F006D006100310000000000000009000000FFFFFFFFFFFFFFFF000000
                  00020000000C4400650072006D006F0069006400200063007900730074003300
                  00000000000000000000FFFFFFFFFFFFFFFF00000000000000000D4D0075006C
                  007400690065006C0065006D0065006E00740073002900000000000000000000
                  00FFFFFFFFFFFFFFFF00000000000000000846006100740020006F006E006C00
                  790031000000000000000A000000FFFFFFFFFFFFFFFF00000000000000000C44
                  00650072006D006F0069006400200070006C007500670041000000000000000B
                  000000FFFFFFFFFFFFFFFF0000000000000000144F0074006800650072002000
                  20002D00200067006F00200074006F00200049004F00540041002000}
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'Tahoma'
                LabelFont.Style = []
                SelectMode = smSingleClick
                Indent = 19
                TreeFont.Charset = DEFAULT_CHARSET
                TreeFont.Color = clWindowText
                TreeFont.Height = -11
                TreeFont.Name = 'Tahoma'
                TreeFont.Style = []
                TreeColor = clWindow
                TreeBorder = bsSingle
                Selection = 0
                Version = '1.2.0.1'
                TabOrder = 4
              end
            end
            object gbLeftOvarianCyst3: TcxGroupBox
              Left = 342
              Top = 353
              PanelStyle.Active = True
              Style.BorderStyle = ebsNone
              TabOrder = 61
              Transparent = True
              Height = 24
              Width = 317
              object cxLabel150: TcxLabel
                Left = 156
                Top = 5
                Caption = 'cc'
                Transparent = True
              end
              object seLeftOvaryCystVolume3: TcxSpinEdit
                Left = 126
                Top = 3
                Properties.AssignedValues.MinValue = True
                Properties.DisplayFormat = '#0.0'
                Properties.EditFormat = '#0.0'
                Properties.SpinButtons.Visible = False
                Properties.ValueType = vtFloat
                TabOrder = 3
                Width = 30
              end
              object cxLabel151: TcxLabel
                Left = 106
                Top = 5
                Caption = 'mm'
                Transparent = True
              end
              object seLeftOvaryCystDepth3: TcxSpinEdit
                Left = 77
                Top = 3
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                TabOrder = 2
                Width = 30
              end
              object cxLabel152: TcxLabel
                Left = 67
                Top = 4
                Caption = 'x'
                Transparent = True
              end
              object seLeftOvaryCystWidth3: TcxSpinEdit
                Left = 38
                Top = 3
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                TabOrder = 1
                Width = 30
              end
              object cxLabel153: TcxLabel
                Left = 29
                Top = 5
                Caption = 'x'
                Transparent = True
              end
              object seLeftOvaryCystLength3: TcxSpinEdit
                Left = 1
                Top = 3
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                TabOrder = 0
                Width = 30
              end
              object cbLeftOvaryCystType3: TAdvTreeComboBox
                Left = 170
                Top = 3
                Width = 146
                Height = 21
                DropHeight = 215
                DropWidth = 200
                ExpandOnDrop = True
                Flat = True
		Items.NodeData = {
                  0107000000190000000000000001000000FFFFFFFFFFFFFFFF00000000000000
                  0000250000000000000002000000FFFFFFFFFFFFFFFF00000000000000000653
                  0069006D0070006C006500310000000000000007000000FFFFFFFFFFFFFFFF00
                  000000040000000C4800610065006D006F007200720068006100670069006300
                  430000000000000000000000FFFFFFFFFFFFFFFF00000000000000001546006F
                  006C006C006900630075006C00610072002000630079007300740020003C0032
                  0030006D006D002F0000000000000000000000FFFFFFFFFFFFFFFF0000000000
                  0000000B46006C0075006900640020006C006500760065006C00490000000000
                  000000000000FFFFFFFFFFFFFFFF000000000000000018520065007400720061
                  006300740065006400200063006C006F007400200061006E0064002000730065
                  00720075006D00490000000000000000000000FFFFFFFFFFFFFFFF0000000000
                  000000185300740065006C006C00610074006500200066006900620072006900
                  6E00200073007400720061006E00640073002000310000000000000008000000
                  FFFFFFFFFFFFFFFF00000000000000000C45006E0064006F006D006500740072
                  0069006F006D006100310000000000000009000000FFFFFFFFFFFFFFFF000000
                  00020000000C4400650072006D006F0069006400200063007900730074003300
                  00000000000000000000FFFFFFFFFFFFFFFF00000000000000000D4D0075006C
                  007400690065006C0065006D0065006E00740073002900000000000000000000
                  00FFFFFFFFFFFFFFFF00000000000000000846006100740020006F006E006C00
                  790031000000000000000A000000FFFFFFFFFFFFFFFF00000000000000000C44
                  00650072006D006F0069006400200070006C007500670041000000000000000B
                  000000FFFFFFFFFFFFFFFF0000000000000000144F0074006800650072002000
                  20002D00200067006F00200074006F00200049004F00540041002000}
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'Tahoma'
                LabelFont.Style = []
                SelectMode = smSingleClick
                Indent = 19
                TreeFont.Charset = DEFAULT_CHARSET
                TreeFont.Color = clWindowText
                TreeFont.Height = -11
                TreeFont.Name = 'Tahoma'
                TreeFont.Style = []
                TreeColor = clWindow
                TreeBorder = bsSingle
                Selection = 0
                Version = '1.2.0.1'
                TabOrder = 4
              end
            end
            object cbRightCorpusLuteumSize3: TcxSpinEdit
              Left = 274
              Top = 126
              Enabled = False
              Properties.AssignedValues.MinValue = True
              TabOrder = 20
              Width = 35
            end
            object cxLabel180: TcxLabel
              Left = 310
              Top = 130
              Caption = 'mm'
              Transparent = True
            end
            object cbLeftCorpusLuteumSize3: TcxSpinEdit
              Left = 604
              Top = 128
              Enabled = False
              TabOrder = 51
              Width = 35
            end
            object cxLabel182: TcxLabel
              Left = 638
              Top = 130
              Caption = 'mm'
              Transparent = True
            end
            object cbRightOFO: TcxCheckBox
              Left = 201
              Top = 408
              Caption = 'OFO'
              Enabled = False
              TabOrder = 97
              Transparent = True
              Visible = False
              Width = 49
            end
            object cbRightAFO: TcxCheckBox
              Left = 247
              Top = 409
              Caption = 'AFO'
              Enabled = False
              TabOrder = 98
              Transparent = True
              Visible = False
              Width = 52
            end
            object seRightLeadFollicle: TcxSpinEdit
              Left = 10
              Top = 104
              Enabled = False
              Properties.AssignedValues.MinValue = True
              TabOrder = 12
              Width = 35
            end
            object seRightCorpusLuteum: TcxSpinEdit
              Left = 10
              Top = 126
              Enabled = False
              Properties.AssignedValues.MinValue = True
              TabOrder = 16
              Width = 35
            end
            object lblLeadFollicleRight: TcxLabel
              Left = 48
              Top = 106
              Caption = 'Lead follicle(s)(>9mm)'
              Enabled = False
              Transparent = True
            end
            object lblCLRight: TcxLabel
              Left = 49
              Top = 125
              Caption = 'Corpus lutenum'
              Enabled = False
              Transparent = True
            end
            object cbLeftPCO: TcxCheckBox
              Left = 461
              Top = 404
              Caption = 'PCO'
              Enabled = False
              TabOrder = 101
              Transparent = True
              Visible = False
              Width = 93
            end
            object cbLeftOFO: TcxCheckBox
              Left = 508
              Top = 406
              Caption = 'OFO'
              Enabled = False
              TabOrder = 102
              Transparent = True
              Visible = False
              Width = 93
            end
            object cbLeftAFO: TcxCheckBox
              Left = 555
              Top = 406
              Caption = 'AFO'
              Enabled = False
              TabOrder = 103
              Transparent = True
              Visible = False
              Width = 93
            end
            object seLeftLeadFollicle: TcxSpinEdit
              Left = 343
              Top = 104
              Enabled = False
              Properties.AssignedValues.MinValue = True
              TabOrder = 44
              Width = 35
            end
            object seLeftCorpusLuteum: TcxSpinEdit
              Left = 343
              Top = 126
              Enabled = False
              Properties.AssignedValues.MinValue = True
              TabOrder = 48
              Width = 35
            end
            object lblLeadFollicleLeft: TcxLabel
              Left = 380
              Top = 106
              Caption = 'Lead follicle(s)(>9mm)'
              Enabled = False
              Transparent = True
            end
            object lblCLLeft: TcxLabel
              Left = 380
              Top = 125
              Caption = 'Corpus lutenum'
              Enabled = False
              Transparent = True
            end
            object cbRightOvaryCyst2: TcxComboBox
              Left = 783
              Top = 277
              Properties.DropDownRows = 25
              Properties.Items.Strings = (
                ''
                'Simple cyst '
                'Haemorrhagic cyst < 20mm'
                'Haemorrhagic cyst'
                'Endometrioma '
                'Dermoid cyst'
                'Dermoid plug'
                'Other'
                '')
              TabOrder = 106
              Visible = False
              Width = 102
            end
            object cbRightOvaryCyst3: TcxComboBox
              Left = 777
              Top = 304
              Properties.DropDownRows = 25
              Properties.Items.Strings = (
                ''
                'Simple cyst '
                'Haemorrhagic cyst < 20mm'
                'Haemorrhagic cyst'
                'Endometrioma '
                'Dermoid cyst'
                'Dermoid plug'
                'Other')
              TabOrder = 107
              Visible = False
              Width = 102
            end
            object cbLeftOvaryCyst1: TcxComboBox
              Left = 780
              Top = 331
              Properties.DropDownRows = 25
              Properties.Items.Strings = (
                ''
                'Simple cyst '
                'Haemorrhagic cyst < 20mm'
                'Haemorrhagic cyst'
                'Endometrioma '
                'Dermoid cyst'
                'Dermoid plug'
                'Other'
                '')
              TabOrder = 108
              Visible = False
              Width = 102
            end
            object cbLeftOvaryCyst2: TcxComboBox
              Left = 783
              Top = 355
              Properties.DropDownRows = 25
              Properties.Items.Strings = (
                ''
                'Simple cyst '
                'Haemorrhagic cyst < 20mm'
                'Haemorrhagic cyst'
                'Endometrioma '
                'Dermoid cyst'
                'Dermoid plug'
                'Other')
              TabOrder = 109
              Visible = False
              Width = 102
            end
            object cbLeftOvaryCyst3: TcxComboBox
              Left = 777
              Top = 256
              Properties.DropDownRows = 25
              Properties.Items.Strings = (
                ''
                'Simple cyst '
                'Haemorrhagic cyst < 20mm'
                'Haemorrhagic cyst'
                'Endometrioma '
                'Dermoid cyst'
                'Dermoid plug'
                'Other')
              TabOrder = 110
              Visible = False
              Width = 102
            end
            object gbRightOvarianCyst4: TcxGroupBox
              Left = 3
              Top = 378
              PanelStyle.Active = True
              Style.BorderStyle = ebsNone
              TabOrder = 31
              Transparent = True
              Visible = False
              Height = 24
              Width = 325
              object cxLabel192: TcxLabel
                Left = 156
                Top = 5
                Caption = 'cc'
                Transparent = True
              end
              object seRightOvaryCystVolume4: TcxSpinEdit
                Left = 125
                Top = 4
                Properties.AssignedValues.MinValue = True
                Properties.DisplayFormat = '#0.0'
                Properties.EditFormat = '#0.0'
                Properties.SpinButtons.Visible = False
                Properties.ValueType = vtFloat
                TabOrder = 3
                Width = 30
              end
              object cxLabel193: TcxLabel
                Left = 106
                Top = 5
                Caption = 'mm'
                Transparent = True
              end
              object seRightOvaryCystDepth4: TcxSpinEdit
                Left = 77
                Top = 3
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                TabOrder = 2
                Width = 30
              end
              object cxLabel194: TcxLabel
                Left = 67
                Top = 4
                Caption = 'x'
                Transparent = True
              end
              object seRightOvaryCystWidth4: TcxSpinEdit
                Left = 38
                Top = 3
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                TabOrder = 1
                Width = 30
              end
              object cxLabel195: TcxLabel
                Left = 29
                Top = 5
                Caption = 'x'
                Transparent = True
              end
              object seRightOvaryCystLength4: TcxSpinEdit
                Left = 1
                Top = 3
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                TabOrder = 0
                Width = 30
              end
              object cbRightOvaryCystType4: TAdvTreeComboBox
                Left = 170
                Top = 3
                Width = 155
                Height = 21
                DropHeight = 215
                DropWidth = 200
                ExpandOnDrop = True
                Flat = True
		Items.NodeData = {
                  0107000000190000000000000001000000FFFFFFFFFFFFFFFF00000000000000
                  0000250000000000000002000000FFFFFFFFFFFFFFFF00000000000000000653
                  0069006D0070006C006500310000000000000007000000FFFFFFFFFFFFFFFF00
                  000000040000000C4800610065006D006F007200720068006100670069006300
                  430000000000000000000000FFFFFFFFFFFFFFFF00000000000000001546006F
                  006C006C006900630075006C00610072002000630079007300740020003C0032
                  0030006D006D002F0000000000000000000000FFFFFFFFFFFFFFFF0000000000
                  0000000B46006C0075006900640020006C006500760065006C00490000000000
                  000000000000FFFFFFFFFFFFFFFF000000000000000018520065007400720061
                  006300740065006400200063006C006F007400200061006E0064002000730065
                  00720075006D00490000000000000000000000FFFFFFFFFFFFFFFF0000000000
                  000000185300740065006C006C00610074006500200066006900620072006900
                  6E00200073007400720061006E00640073002000310000000000000008000000
                  FFFFFFFFFFFFFFFF00000000000000000C45006E0064006F006D006500740072
                  0069006F006D006100310000000000000009000000FFFFFFFFFFFFFFFF000000
                  00020000000C4400650072006D006F0069006400200063007900730074003300
                  00000000000000000000FFFFFFFFFFFFFFFF00000000000000000D4D0075006C
                  007400690065006C0065006D0065006E00740073002900000000000000000000
                  00FFFFFFFFFFFFFFFF00000000000000000846006100740020006F006E006C00
                  790031000000000000000A000000FFFFFFFFFFFFFFFF00000000000000000C44
                  00650072006D006F0069006400200070006C007500670041000000000000000B
                  000000FFFFFFFFFFFFFFFF0000000000000000144F0074006800650072002000
                  20002D00200067006F00200074006F00200049004F00540041002000}
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'Tahoma'
                LabelFont.Style = []
                SelectMode = smSingleClick
                Indent = 19
                TreeFont.Charset = DEFAULT_CHARSET
                TreeFont.Color = clWindowText
                TreeFont.Height = -11
                TreeFont.Name = 'Tahoma'
                TreeFont.Style = []
                TreeColor = clWindow
                TreeBorder = bsSingle
                Selection = 0
                Version = '1.2.0.1'
                TabOrder = 4
              end
            end
            object gbLeftOvarianCyst4: TcxGroupBox
              Left = 343
              Top = 377
              PanelStyle.Active = True
              Style.BorderStyle = ebsNone
              TabOrder = 62
              Transparent = True
              Visible = False
              Height = 24
              Width = 316
              object cxLabel196: TcxLabel
                Left = 156
                Top = 5
                Caption = 'cc'
                Transparent = True
              end
              object seLeftOvaryCystVolume4: TcxSpinEdit
                Left = 126
                Top = 3
                Properties.AssignedValues.MinValue = True
                Properties.DisplayFormat = '#0.0'
                Properties.EditFormat = '#0.0'
                Properties.SpinButtons.Visible = False
                Properties.ValueType = vtFloat
                TabOrder = 3
                Width = 30
              end
              object cxLabel197: TcxLabel
                Left = 106
                Top = 5
                Caption = 'mm'
                Transparent = True
              end
              object seLeftOvaryCystDepth4: TcxSpinEdit
                Left = 77
                Top = 3
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                TabOrder = 2
                Width = 30
              end
              object cxLabel198: TcxLabel
                Left = 67
                Top = 4
                Caption = 'x'
                Transparent = True
              end
              object seLeftOvaryCystWidth4: TcxSpinEdit
                Left = 38
                Top = 3
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                TabOrder = 1
                Width = 30
              end
              object cxLabel199: TcxLabel
                Left = 29
                Top = 5
                Caption = 'x'
                Transparent = True
              end
              object seLeftOvaryCystLength4: TcxSpinEdit
                Left = 1
                Top = 3
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                TabOrder = 0
                Width = 30
              end
              object cbLeftOvaryCystType4: TAdvTreeComboBox
                Left = 170
                Top = 3
                Width = 145
                Height = 21
                DropHeight = 215
                DropWidth = 200
                ExpandOnDrop = True
                Flat = True
		Items.NodeData = {
                  0107000000190000000000000001000000FFFFFFFFFFFFFFFF00000000000000
                  0000250000000000000002000000FFFFFFFFFFFFFFFF00000000000000000653
                  0069006D0070006C006500310000000000000007000000FFFFFFFFFFFFFFFF00
                  000000040000000C4800610065006D006F007200720068006100670069006300
                  430000000000000000000000FFFFFFFFFFFFFFFF00000000000000001546006F
                  006C006C006900630075006C00610072002000630079007300740020003C0032
                  0030006D006D002F0000000000000000000000FFFFFFFFFFFFFFFF0000000000
                  0000000B46006C0075006900640020006C006500760065006C00490000000000
                  000000000000FFFFFFFFFFFFFFFF000000000000000018520065007400720061
                  006300740065006400200063006C006F007400200061006E0064002000730065
                  00720075006D00490000000000000000000000FFFFFFFFFFFFFFFF0000000000
                  000000185300740065006C006C00610074006500200066006900620072006900
                  6E00200073007400720061006E00640073002000310000000000000008000000
                  FFFFFFFFFFFFFFFF00000000000000000C45006E0064006F006D006500740072
                  0069006F006D006100310000000000000009000000FFFFFFFFFFFFFFFF000000
                  00020000000C4400650072006D006F0069006400200063007900730074003300
                  00000000000000000000FFFFFFFFFFFFFFFF00000000000000000D4D0075006C
                  007400690065006C0065006D0065006E00740073002900000000000000000000
                  00FFFFFFFFFFFFFFFF00000000000000000846006100740020006F006E006C00
                  790031000000000000000A000000FFFFFFFFFFFFFFFF00000000000000000C44
                  00650072006D006F0069006400200070006C007500670041000000000000000B
                  000000FFFFFFFFFFFFFFFF0000000000000000144F0074006800650072002000
                  20002D00200067006F00200074006F00200049004F00540041002000}
                LabelFont.Charset = DEFAULT_CHARSET
                LabelFont.Color = clWindowText
                LabelFont.Height = -11
                LabelFont.Name = 'Tahoma'
                LabelFont.Style = []
                SelectMode = smSingleClick
                Indent = 19
                TreeFont.Charset = DEFAULT_CHARSET
                TreeFont.Color = clWindowText
                TreeFont.Height = -11
                TreeFont.Name = 'Tahoma'
                TreeFont.Style = []
                TreeColor = clWindow
                TreeBorder = bsSingle
                Selection = 0
                Version = '1.2.0.1'
                TabOrder = 4
              end
            end
            object cbRightOoporectomy: TcxCheckBox
              Left = 230
              Top = -2
              Caption = 'Oophorectomy'
              TabOrder = 2
              Transparent = True
              Width = 95
            end
            object cbLeftOoporectomy: TcxCheckBox
              Left = 564
              Top = -2
              Caption = 'Oophorectomy'
              TabOrder = 34
              Transparent = True
              Width = 99
            end
            object seRightResidualFolCount: TcxSpinEdit
              Left = 9
              Top = 83
              Properties.AssignedValues.MinValue = True
              TabOrder = 111
              Visible = False
              Width = 35
            end
            object lblResidualFollicleCount: TcxLabel
              Left = 47
              Top = 83
              Caption = 'Residual follicle(s) count'
              Transparent = True
              Visible = False
            end
            object seLeftResidualFolCount: TcxSpinEdit
              Left = 344
              Top = 81
              Properties.AssignedValues.MinValue = True
              TabOrder = 113
              Visible = False
              Width = 35
            end
            object lblLeftResidualFollicleCount: TcxLabel
              Left = 378
              Top = 83
              Caption = 'Residual follicle(s) count'
              Transparent = True
              Visible = False
            end
          end
          object cxTabSheet5: TcxTabSheet
            Caption = 'IOTA'
            ImageIndex = 6
            object pgIOTA: TcxPageControl
              Left = 3
              Top = 2
              Width = 871
              Height = 516
              TabOrder = 0
              Properties.ActivePage = tsRightOvaryIOTA
              Properties.CustomButtons.Buttons = <>
              ClientRectBottom = 516
              ClientRectRight = 871
              ClientRectTop = 24
              object tsRightOvaryIOTA: TcxTabSheet
                Caption = 'IOTA - Right Ovary'
                ImageIndex = 0
                object Bevel10: TBevel
                  Left = 0
                  Top = 192
                  Width = 502
                  Height = 3
                end
                object Bevel11: TBevel
                  Left = 0
                  Top = 82
                  Width = 502
                  Height = 3
                end
                object Bevel12: TBevel
                  Left = 0
                  Top = 412
                  Width = 502
                  Height = 3
                end
                object Bevel19: TBevel
                  Left = -3
                  Top = 308
                  Width = 502
                  Height = 3
                end
                object cxLabel204: TcxLabel
                  Left = 8
                  Top = 101
                  Caption = 'Cyst Wall'
                  ParentFont = False
                  Style.Font.Charset = DEFAULT_CHARSET
                  Style.Font.Color = clWindowText
                  Style.Font.Height = -11
                  Style.Font.Name = 'Tahoma'
                  Style.Font.Style = [fsBold]
                  Style.IsFontAssigned = True
                  Transparent = True
                end
                object cxLabel205: TcxLabel
                  Left = 8
                  Top = 0
                  Caption = 'IOTA classification for ovarian and adnexal cysts.'
                  ParentFont = False
                  Style.Font.Charset = DEFAULT_CHARSET
                  Style.Font.Color = clWindowText
                  Style.Font.Height = -11
                  Style.Font.Name = 'Tahoma'
                  Style.Font.Style = [fsBold]
                  Style.IsFontAssigned = True
                  Transparent = True
                end
                object cxLabel206: TcxLabel
                  Left = 27
                  Top = 23
                  Caption = 'Classification'
                  Transparent = True
                end
                object ccbROClassification: TcxComboBox
                  Left = 109
                  Top = 19
                  Properties.DropDownRows = 25
                  Properties.Items.Strings = (
                    'Unilocular cyst'
                    'Unilocular-solid cyst*'
                    'Multilocular cyst'
                    'Multilocular solid cyst'
                    'Solid tumour**'
                    'not classifiable')
                  TabOrder = 0
                  Width = 163
                end
                object cxMemo1: TcxMemo
                  Left = 108
                  Top = 42
                  Lines.Strings = (
                    
                      '*unilocular cyst with measurable solid component or at least one' +
                      ' papillary structure'
                    '**solid omponents comprise 80% or more of the tumour  ')
                  ParentFont = False
                  Style.BorderColor = clNone
                  Style.Color = clWindow
                  Style.Edges = []
                  Style.Font.Charset = DEFAULT_CHARSET
                  Style.Font.Color = clWindowText
                  Style.Font.Height = -12
                  Style.Font.Name = 'Times New Roman'
                  Style.Font.Style = []
                  Style.Shadow = False
                  Style.TextStyle = [fsItalic]
                  Style.IsFontAssigned = True
                  TabOrder = 32
                  Height = 38
                  Width = 555
                end
                object cxLabel207: TcxLabel
                  Left = 78
                  Top = 100
                  Caption = 'Smooth'
                  Transparent = True
                end
                object cxROGBSmooth: TcxGroupBox
                  Left = 127
                  Top = 100
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
                  object cbROSmoothYes: TcxCheckBox
                    Left = -3
                    Top = -2
                    Caption = 'Yes'
                    Style.LookAndFeel.NativeStyle = True
                    StyleDisabled.LookAndFeel.NativeStyle = True
                    StyleFocused.LookAndFeel.NativeStyle = True
                    StyleHot.LookAndFeel.NativeStyle = True
                    TabOrder = 0
                    Transparent = True
                    Width = 45
                  end
                  object cbROSmoothNo: TcxCheckBox
                    Left = 48
                    Top = -2
                    Caption = 'No'
                    Style.LookAndFeel.NativeStyle = True
                    StyleDisabled.LookAndFeel.NativeStyle = True
                    StyleFocused.LookAndFeel.NativeStyle = True
                    StyleHot.LookAndFeel.NativeStyle = True
                    TabOrder = 1
                    Transparent = True
                    Width = 42
                  end
                end
                object cxLabel208: TcxLabel
                  Left = 36
                  Top = 122
                  Caption = 'Mural irregularity'
                  Transparent = True
                end
                object gbMuralIrregularity: TcxGroupBox
                  Left = 127
                  Top = 123
                  Style.BorderStyle = ebsNone
                  Style.Edges = []
                  Style.LookAndFeel.NativeStyle = True
                  StyleDisabled.LookAndFeel.NativeStyle = True
                  StyleFocused.LookAndFeel.NativeStyle = True
                  StyleHot.LookAndFeel.NativeStyle = True
                  TabOrder = 2
                  Transparent = True
                  Visible = False
                  Height = 22
                  Width = 125
                  object cbMuralIrregularityYes: TcxCheckBox
                    Left = -3
                    Top = -2
                    Caption = 'Yes'
                    Style.LookAndFeel.NativeStyle = True
                    StyleDisabled.LookAndFeel.NativeStyle = True
                    StyleFocused.LookAndFeel.NativeStyle = True
                    StyleHot.LookAndFeel.NativeStyle = True
                    TabOrder = 0
                    Transparent = True
                    Width = 45
                  end
                  object cbMuralIrregularityNo: TcxCheckBox
                    Left = 48
                    Top = -2
                    Caption = 'No'
                    Style.LookAndFeel.NativeStyle = True
                    StyleDisabled.LookAndFeel.NativeStyle = True
                    StyleFocused.LookAndFeel.NativeStyle = True
                    StyleHot.LookAndFeel.NativeStyle = True
                    TabOrder = 1
                    Transparent = True
                    Width = 42
                  end
                end
                object cxLabel209: TcxLabel
                  Left = 26
                  Top = 145
                  Caption = 'Papillary projection'
                  Transparent = True
                end
                object cxROGBMI: TcxGroupBox
                  Left = 129
                  Top = 125
                  Style.BorderStyle = ebsNone
                  Style.Edges = []
                  Style.LookAndFeel.NativeStyle = True
                  StyleDisabled.LookAndFeel.NativeStyle = True
                  StyleFocused.LookAndFeel.NativeStyle = True
                  StyleHot.LookAndFeel.NativeStyle = True
                  TabOrder = 3
                  Transparent = True
                  Height = 22
                  Width = 125
                  object cbROMIYes: TcxCheckBox
                    Left = -5
                    Top = -2
                    Caption = 'Yes'
                    Style.LookAndFeel.NativeStyle = True
                    StyleDisabled.LookAndFeel.NativeStyle = True
                    StyleFocused.LookAndFeel.NativeStyle = True
                    StyleHot.LookAndFeel.NativeStyle = True
                    TabOrder = 0
                    Transparent = True
                    Width = 45
                  end
                  object cbROMINo: TcxCheckBox
                    Left = 46
                    Top = -2
                    Caption = 'No'
                    Style.LookAndFeel.NativeStyle = True
                    StyleDisabled.LookAndFeel.NativeStyle = True
                    StyleFocused.LookAndFeel.NativeStyle = True
                    StyleHot.LookAndFeel.NativeStyle = True
                    TabOrder = 1
                    Transparent = True
                    Width = 42
                  end
                end
                object cxROGBPP: TcxGroupBox
                  Left = 127
                  Top = 142
                  Style.BorderStyle = ebsNone
                  Style.Edges = []
                  Style.LookAndFeel.NativeStyle = True
                  StyleDisabled.LookAndFeel.NativeStyle = True
                  StyleFocused.LookAndFeel.NativeStyle = True
                  StyleHot.LookAndFeel.NativeStyle = True
                  TabOrder = 4
                  Transparent = True
                  Height = 22
                  Width = 125
                  object cbROPPYes: TcxCheckBox
                    Left = -3
                    Top = 4
                    Caption = 'Yes'
                    Style.LookAndFeel.NativeStyle = True
                    StyleDisabled.LookAndFeel.NativeStyle = True
                    StyleFocused.LookAndFeel.NativeStyle = True
                    StyleHot.LookAndFeel.NativeStyle = True
                    TabOrder = 0
                    Transparent = True
                    Width = 45
                  end
                  object cbROPPNo: TcxCheckBox
                    Left = 48
                    Top = 3
                    Caption = 'No'
                    Style.LookAndFeel.NativeStyle = True
                    StyleDisabled.LookAndFeel.NativeStyle = True
                    StyleFocused.LookAndFeel.NativeStyle = True
                    StyleHot.LookAndFeel.NativeStyle = True
                    TabOrder = 1
                    Transparent = True
                    Width = 42
                  end
                end
                object lblNumber: TcxLabel
                  Left = 218
                  Top = 148
                  Caption = 'Number'
                  Enabled = False
                  Transparent = True
                end
                object seROPPNumber: TcxSpinEdit
                  Left = 262
                  Top = 144
                  Enabled = False
                  Properties.AssignedValues.MinValue = True
                  TabOrder = 5
                  Width = 35
                end
                object lblPPLargest: TcxLabel
                  Left = 306
                  Top = 146
                  Caption = 'Largest'
                  Enabled = False
                  Transparent = True
                end
                object lblVascularity: TcxLabel
                  Left = 65
                  Top = 165
                  Caption = 'Vascularity'
                  Transparent = True
                  Visible = False
                end
                object cxROGBVascularity: TcxGroupBox
                  Left = 127
                  Top = 164
                  Style.BorderStyle = ebsNone
                  Style.Edges = []
                  Style.LookAndFeel.NativeStyle = True
                  StyleDisabled.LookAndFeel.NativeStyle = True
                  StyleFocused.LookAndFeel.NativeStyle = True
                  StyleHot.LookAndFeel.NativeStyle = True
                  TabOrder = 9
                  Transparent = True
                  Height = 22
                  Width = 125
                  object cbROVascularityYes: TcxCheckBox
                    Left = -3
                    Top = 2
                    Caption = 'Yes'
                    Style.LookAndFeel.NativeStyle = True
                    StyleDisabled.LookAndFeel.NativeStyle = True
                    StyleFocused.LookAndFeel.NativeStyle = True
                    StyleHot.LookAndFeel.NativeStyle = True
                    TabOrder = 0
                    Transparent = True
                    Visible = False
                    Width = 45
                  end
                  object cbROVascularityNo: TcxCheckBox
                    Left = 48
                    Top = 3
                    Caption = 'No'
                    Style.LookAndFeel.NativeStyle = True
                    StyleDisabled.LookAndFeel.NativeStyle = True
                    StyleFocused.LookAndFeel.NativeStyle = True
                    StyleHot.LookAndFeel.NativeStyle = True
                    TabOrder = 1
                    Transparent = True
                    Visible = False
                    Width = 42
                  end
                end
                object cxLabel210: TcxLabel
                  Left = 67
                  Top = 207
                  Caption = 'Septum:'
                  ParentFont = False
                  Style.Font.Charset = DEFAULT_CHARSET
                  Style.Font.Color = clWindowText
                  Style.Font.Height = -11
                  Style.Font.Name = 'Tahoma'
                  Style.Font.Style = [fsBold]
                  Style.IsFontAssigned = True
                  Transparent = True
                end
                object lblROThickestSeptum: TcxLabel
                  Left = 127
                  Top = 207
                  Caption = 'Thickest septum'
                  Transparent = True
                end
                object seROThickestSeptum: TcxSpinEdit
                  Left = 211
                  Top = 204
                  Properties.AssignedValues.MinValue = True
                  Properties.SpinButtons.Visible = False
                  TabOrder = 10
                  Width = 35
                end
                object lblROThickestSeptumMeasure: TcxLabel
                  Left = 247
                  Top = 206
                  Caption = 'mm'
                  Transparent = True
                end
                object cxLabel213: TcxLabel
                  Left = 32
                  Top = 230
                  Caption = 'Solid Elements'
                  ParentFont = False
                  Style.Font.Charset = DEFAULT_CHARSET
                  Style.Font.Color = clWindowText
                  Style.Font.Height = -11
                  Style.Font.Name = 'Tahoma'
                  Style.Font.Style = [fsBold]
                  Style.IsFontAssigned = True
                  Transparent = True
                end
                object cxGBROSolidElements: TcxGroupBox
                  Left = 127
                  Top = 225
                  Style.BorderStyle = ebsNone
                  Style.Edges = []
                  Style.LookAndFeel.NativeStyle = True
                  StyleDisabled.LookAndFeel.NativeStyle = True
                  StyleFocused.LookAndFeel.NativeStyle = True
                  StyleHot.LookAndFeel.NativeStyle = True
                  TabOrder = 11
                  Transparent = True
                  Height = 22
                  Width = 125
                  object cbROSolidElementsYes: TcxCheckBox
                    Left = -3
                    Top = 2
                    Caption = 'Yes'
                    Style.LookAndFeel.NativeStyle = True
                    StyleDisabled.LookAndFeel.NativeStyle = True
                    StyleFocused.LookAndFeel.NativeStyle = True
                    StyleHot.LookAndFeel.NativeStyle = True
                    TabOrder = 0
                    Transparent = True
                    Width = 45
                  end
                  object cbROSolidElementsNo: TcxCheckBox
                    Left = 48
                    Top = 3
                    Caption = 'No'
                    Style.LookAndFeel.NativeStyle = True
                    StyleDisabled.LookAndFeel.NativeStyle = True
                    StyleFocused.LookAndFeel.NativeStyle = True
                    StyleHot.LookAndFeel.NativeStyle = True
                    TabOrder = 1
                    Transparent = True
                    Width = 42
                  end
                end
                object lblSolidNumber: TcxLabel
                  Left = 220
                  Top = 231
                  Caption = 'Number'
                  Enabled = False
                  Transparent = True
                end
                object seRoSolidElementsNumber: TcxSpinEdit
                  Left = 264
                  Top = 227
                  Enabled = False
                  Properties.AssignedValues.MinValue = True
                  Properties.ValueType = vtFloat
                  TabOrder = 12
                  Width = 35
                end
                object lblSolidLargest: TcxLabel
                  Left = 307
                  Top = 230
                  Caption = 'Largest'
                  Enabled = False
                  Transparent = True
                end
                object lblSolidVolMeasure: TcxLabel
                  Left = 508
                  Top = 229
                  Caption = 'cc'
                  Enabled = False
                  Transparent = True
                end
                object seROSoliEleVol: TcxSpinEdit
                  Left = 478
                  Top = 227
                  Enabled = False
                  Properties.AssignedValues.MinValue = True
                  Properties.DisplayFormat = '#0.0'
                  Properties.EditFormat = '#0.0'
                  Properties.SpinButtons.Visible = False
                  Properties.ValueType = vtFloat
                  TabOrder = 16
                  Width = 30
                end
                object lblSolidMeasure: TcxLabel
                  Left = 458
                  Top = 229
                  Caption = 'mm'
                  Enabled = False
                  Transparent = True
                end
                object seROSolidEleD: TcxSpinEdit
                  Left = 429
                  Top = 227
                  Enabled = False
                  Properties.AssignedValues.MinValue = True
                  Properties.SpinButtons.Visible = False
                  TabOrder = 15
                  Width = 30
                end
                object cxLabel214: TcxLabel
                  Left = 419
                  Top = 228
                  Caption = 'x'
                  Transparent = True
                end
                object seROSolidEleW: TcxSpinEdit
                  Left = 390
                  Top = 227
                  Enabled = False
                  Properties.AssignedValues.MinValue = True
                  Properties.SpinButtons.Visible = False
                  TabOrder = 14
                  Width = 30
                end
                object cxLabel215: TcxLabel
                  Left = 381
                  Top = 229
                  Caption = 'x'
                  Transparent = True
                end
                object seRoSolidEleL: TcxSpinEdit
                  Left = 353
                  Top = 227
                  Enabled = False
                  Properties.AssignedValues.MinValue = True
                  Properties.SpinButtons.Visible = False
                  TabOrder = 13
                  Width = 30
                end
                object lblInternalContents: TcxLabel
                  Left = 14
                  Top = 253
                  Caption = 'Internal Contents'
                  ParentFont = False
                  Style.Font.Charset = DEFAULT_CHARSET
                  Style.Font.Color = clWindowText
                  Style.Font.Height = -11
                  Style.Font.Name = 'Tahoma'
                  Style.Font.Style = [fsBold]
                  Style.IsFontAssigned = True
                  Transparent = True
                end
                object ccbROInternalContents: TcxComboBox
                  Left = 127
                  Top = 253
                  Properties.DropDownRows = 25
                  Properties.Items.Strings = (
                    'Anechoic'
                    'Low level'
                    'Ground glass'
                    'Haemorrhagic '
                    'Mixed'
                    'Solid hypoechoic'
                    'Solid hyperechoic ')
                  TabOrder = 17
                  Width = 140
                end
                object ccbROMixed: TcxComboBox
                  Left = 273
                  Top = 252
                  Enabled = False
                  Properties.DropDownListStyle = lsFixedList
                  Properties.DropDownRows = 25
                  Properties.DropDownSizeable = True
                  Properties.Items.Strings = (
                    ''
                    'mixed with blood fluid level'
                    'mixed with fat fluid level'
                    'mixed _abcess')
                  Properties.ReadOnly = False
                  TabOrder = 18
                  Width = 140
                end
                object cxLabel216: TcxLabel
                  Left = 294
                  Top = 281
                  Caption = 'Free fluid'
                  ParentFont = False
                  Style.Font.Charset = DEFAULT_CHARSET
                  Style.Font.Color = clWindowText
                  Style.Font.Height = -11
                  Style.Font.Name = 'Tahoma'
                  Style.Font.Style = [fsBold]
                  Style.IsFontAssigned = True
                  Transparent = True
                  Visible = False
                end
                object cxLabel217: TcxLabel
                  Left = 359
                  Top = 282
                  Caption = 'Pouch of Douglas depth'
                  Transparent = True
                  Visible = False
                end
                object seROPODD: TcxSpinEdit
                  Left = 479
                  Top = 280
                  Properties.AssignedValues.MinValue = True
                  Properties.SpinButtons.Visible = False
                  TabOrder = 20
                  Visible = False
                  Width = 35
                end
                object cxLabel218: TcxLabel
                  Left = 515
                  Top = 282
                  Caption = 'mm'
                  Transparent = True
                  Visible = False
                end
                object cxLabel219: TcxLabel
                  Left = 76
                  Top = 281
                  Caption = 'Ascites'
                  ParentFont = False
                  Style.Font.Charset = DEFAULT_CHARSET
                  Style.Font.Color = clWindowText
                  Style.Font.Height = -11
                  Style.Font.Name = 'Tahoma'
                  Style.Font.Style = [fsBold]
                  Style.IsFontAssigned = True
                  Transparent = True
                end
                object cxGroupBox9: TcxGroupBox
                  Left = 127
                  Top = 275
                  Style.BorderStyle = ebsNone
                  Style.Edges = []
                  Style.LookAndFeel.NativeStyle = True
                  StyleDisabled.LookAndFeel.NativeStyle = True
                  StyleFocused.LookAndFeel.NativeStyle = True
                  StyleHot.LookAndFeel.NativeStyle = True
                  TabOrder = 19
                  Transparent = True
                  Height = 22
                  Width = 125
                  object cbROAscitesYes: TcxCheckBox
                    Left = -3
                    Top = 3
                    Caption = 'Yes'
                    Style.LookAndFeel.NativeStyle = True
                    StyleDisabled.LookAndFeel.NativeStyle = True
                    StyleFocused.LookAndFeel.NativeStyle = True
                    StyleHot.LookAndFeel.NativeStyle = True
                    TabOrder = 0
                    Transparent = True
                    Width = 45
                  end
                  object cbROAscitesNo: TcxCheckBox
                    Left = 48
                    Top = 3
                    Caption = 'No'
                    Style.LookAndFeel.NativeStyle = True
                    StyleDisabled.LookAndFeel.NativeStyle = True
                    StyleFocused.LookAndFeel.NativeStyle = True
                    StyleHot.LookAndFeel.NativeStyle = True
                    TabOrder = 1
                    Transparent = True
                    Width = 42
                  end
                end
                object lblPPMeasure: TcxLabel
                  Left = 455
                  Top = 146
                  Caption = 'mm'
                  Enabled = False
                  Transparent = True
                end
                object seROPPD: TcxSpinEdit
                  Left = 423
                  Top = 144
                  Enabled = False
                  Properties.AssignedValues.MinValue = True
                  Properties.SpinButtons.Visible = False
                  TabOrder = 8
                  Width = 30
                end
                object cxLabel221: TcxLabel
                  Left = 416
                  Top = 145
                  Caption = 'x'
                  Transparent = True
                end
                object seROPPW: TcxSpinEdit
                  Left = 387
                  Top = 144
                  Enabled = False
                  Properties.AssignedValues.MinValue = True
                  Properties.SpinButtons.Visible = False
                  TabOrder = 7
                  Width = 30
                end
                object cxLabel222: TcxLabel
                  Left = 378
                  Top = 146
                  Caption = 'x'
                  Transparent = True
                end
                object seROPPL: TcxSpinEdit
                  Left = 350
                  Top = 144
                  Enabled = False
                  Properties.AssignedValues.MinValue = True
                  Properties.SpinButtons.Visible = False
                  TabOrder = 6
                  Width = 30
                end
                object lblROIOTAVascularity: TcxLabel
                  Left = 51
                  Top = 310
                  Caption = 'Vascularity: '
                  ParentFont = False
                  Style.Font.Charset = DEFAULT_CHARSET
                  Style.Font.Color = clWindowText
                  Style.Font.Height = -11
                  Style.Font.Name = 'Tahoma'
                  Style.Font.Style = [fsBold]
                  Style.IsFontAssigned = True
                  Transparent = True
                end
                object gbROPPVascularity: TcxGroupBox
                  Left = 130
                  Top = 325
                  Style.BorderStyle = ebsNone
                  Style.Edges = []
                  Style.LookAndFeel.NativeStyle = True
                  StyleDisabled.LookAndFeel.NativeStyle = True
                  StyleFocused.LookAndFeel.NativeStyle = True
                  StyleHot.LookAndFeel.NativeStyle = True
                  TabOrder = 21
                  Transparent = True
                  Height = 22
                  Width = 101
                  object cbROVSYes: TcxCheckBox
                    Left = -3
                    Top = 3
                    Caption = 'Yes'
                    Enabled = False
                    Style.LookAndFeel.NativeStyle = True
                    StyleDisabled.LookAndFeel.NativeStyle = True
                    StyleFocused.LookAndFeel.NativeStyle = True
                    StyleHot.LookAndFeel.NativeStyle = True
                    TabOrder = 0
                    Transparent = True
                    Width = 45
                  end
                  object cbROVSNo: TcxCheckBox
                    Left = 55
                    Top = 3
                    Caption = 'No'
                    Enabled = False
                    Style.LookAndFeel.NativeStyle = True
                    StyleDisabled.LookAndFeel.NativeStyle = True
                    StyleFocused.LookAndFeel.NativeStyle = True
                    StyleHot.LookAndFeel.NativeStyle = True
                    TabOrder = 1
                    Transparent = True
                    Width = 42
                  end
                end
                object gbROVascularitySeptum: TcxGroupBox
                  Left = 128
                  Top = 356
                  Style.BorderStyle = ebsNone
                  Style.Edges = []
                  Style.LookAndFeel.NativeStyle = True
                  StyleDisabled.LookAndFeel.NativeStyle = True
                  StyleFocused.LookAndFeel.NativeStyle = True
                  StyleHot.LookAndFeel.NativeStyle = True
                  TabOrder = 23
                  Transparent = True
                  Height = 21
                  Width = 95
                  object cbROSeptumYes: TcxCheckBox
                    Left = -1
                    Top = 2
                    Caption = 'Yes'
                    Enabled = False
                    Style.LookAndFeel.NativeStyle = True
                    StyleDisabled.LookAndFeel.NativeStyle = True
                    StyleFocused.LookAndFeel.NativeStyle = True
                    StyleHot.LookAndFeel.NativeStyle = True
                    TabOrder = 0
                    Transparent = True
                    Width = 59
                  end
                  object cbROSeptumNo: TcxCheckBox
                    Left = 58
                    Top = 3
                    Caption = 'No'
                    Enabled = False
                    Style.LookAndFeel.NativeStyle = True
                    StyleDisabled.LookAndFeel.NativeStyle = True
                    StyleFocused.LookAndFeel.NativeStyle = True
                    StyleHot.LookAndFeel.NativeStyle = True
                    TabOrder = 1
                    Transparent = True
                    Width = 76
                  end
                end
                object lblROVascularPP: TcxLabel
                  Left = 29
                  Top = 331
                  Caption = 'Papillary projection'
                  Enabled = False
                  Transparent = True
                end
                object lblROSeptum: TcxLabel
                  Left = 81
                  Top = 361
                  Caption = 'Septum'
                  Enabled = False
                  Transparent = True
                end
                object gbROVascularitySolidArea1: TcxGroupBox
                  Left = 131
                  Top = 383
                  Style.BorderStyle = ebsNone
                  Style.Edges = []
                  Style.LookAndFeel.NativeStyle = True
                  StyleDisabled.LookAndFeel.NativeStyle = True
                  StyleFocused.LookAndFeel.NativeStyle = True
                  StyleHot.LookAndFeel.NativeStyle = True
                  TabOrder = 25
                  Transparent = True
                  Height = 26
                  Width = 90
                  object cbROSolidYes: TcxCheckBox
                    Left = -4
                    Top = 0
                    Caption = 'Yes'
                    Enabled = False
                    Style.LookAndFeel.NativeStyle = True
                    StyleDisabled.LookAndFeel.NativeStyle = True
                    StyleFocused.LookAndFeel.NativeStyle = True
                    StyleHot.LookAndFeel.NativeStyle = True
                    TabOrder = 0
                    Transparent = True
                    Width = 59
                  end
                  object cbROSolidNo: TcxCheckBox
                    Left = 55
                    Top = 2
                    Caption = 'No'
                    Enabled = False
                    Style.LookAndFeel.NativeStyle = True
                    StyleDisabled.LookAndFeel.NativeStyle = True
                    StyleFocused.LookAndFeel.NativeStyle = True
                    StyleHot.LookAndFeel.NativeStyle = True
                    TabOrder = 1
                    Transparent = True
                    Width = 76
                  end
                end
                object lblROSolid: TcxLabel
                  Left = 74
                  Top = 389
                  Caption = 'Solid Area'
                  Enabled = False
                  Transparent = True
                end
                object cxLabel220: TcxLabel
                  Left = 21
                  Top = 419
                  Caption = 'Cyst Appearance'
                  ParentFont = False
                  Style.Font.Charset = DEFAULT_CHARSET
                  Style.Font.Color = clWindowText
                  Style.Font.Height = -11
                  Style.Font.Name = 'Tahoma'
                  Style.Font.Style = [fsBold]
                  Style.IsFontAssigned = True
                  Transparent = True
                end
                object ccbROAppearance: TcxComboBox
                  Left = 132
                  Top = 420
                  Properties.DropDownRows = 25
                  Properties.Items.Strings = (
                    'Benign'
                    'Malignant'
                    'Unclassifiable')
                  TabOrder = 27
                  Width = 140
                end
                object cxLabel179: TcxLabel
                  Left = 6
                  Top = 435
                  Caption = '(See IOTA Simple Rules)'
                  Transparent = True
                end
                object cxgbROPPDoppler: TcxGroupBox
                  Left = 229
                  Top = 313
                  Style.Edges = []
                  TabOrder = 22
                  Transparent = True
                  Height = 39
                  Width = 443
                  object ccbROPPDoppler: TcxComboBox
                    Left = 45
                    Top = 14
                    Enabled = False
                    Properties.DropDownListStyle = lsFixedList
                    Properties.DropDownRows = 25
                    Properties.DropDownSizeable = True
                    Properties.Items.Strings = (
                      ''
                      'Minimal flow'
                      'Moderate flow'
                      'Highly vascular')
                    Properties.ReadOnly = False
                    TabOrder = 0
                    Width = 140
                  end
                  object lblROPPRI: TcxLabel
                    Left = 192
                    Top = 16
                    Caption = ' RI'
                    Enabled = False
                    Transparent = True
                  end
                  object seROPPRI: TcxSpinEdit
                    Left = 216
                    Top = 12
                    Enabled = False
                    Properties.AssignedValues.MinValue = True
                    Properties.ValueType = vtFloat
                    TabOrder = 2
                    Width = 51
                  end
                  object lblROPPPSV: TcxLabel
                    Left = 276
                    Top = 17
                    Caption = 'PSV'
                    Enabled = False
                    Transparent = True
                  end
                  object seROPPPSV: TcxSpinEdit
                    Left = 299
                    Top = 14
                    Enabled = False
                    Properties.AssignedValues.MinValue = True
                    Properties.SpinButtons.Visible = False
                    TabOrder = 4
                    Width = 35
                  end
                  object lblPPPSVMeasure: TcxLabel
                    Left = 337
                    Top = 17
                    Caption = 'cm/s'
                    Enabled = False
                    Transparent = True
                  end
                  object lblROPPColour: TcxLabel
                    Left = 6
                    Top = 17
                    Caption = 'Colour:'
                    Enabled = False
                    Transparent = True
                  end
                end
                object cxgbROSeptumDoppler: TcxGroupBox
                  Left = 229
                  Top = 348
                  Style.Edges = []
                  TabOrder = 24
                  Transparent = True
                  Height = 31
                  Width = 443
                  object ccbROSepDoppler: TcxComboBox
                    Left = 47
                    Top = 9
                    Enabled = False
                    Properties.DropDownListStyle = lsFixedList
                    Properties.DropDownRows = 25
                    Properties.DropDownSizeable = True
                    Properties.Items.Strings = (
                      ''
                      'Minimal flow'
                      'Moderate flow'
                      'Highly vascular')
                    Properties.ReadOnly = False
                    TabOrder = 0
                    Width = 140
                  end
                  object lblROSepRI: TcxLabel
                    Left = 193
                    Top = 10
                    Caption = ' RI'
                    Enabled = False
                    Transparent = True
                  end
                  object seROSepRI: TcxSpinEdit
                    Left = 217
                    Top = 7
                    Enabled = False
                    Properties.AssignedValues.MinValue = True
                    Properties.ValueType = vtFloat
                    TabOrder = 2
                    Width = 50
                  end
                  object lblROSepPSV: TcxLabel
                    Left = 276
                    Top = 9
                    Caption = 'PSV'
                    Enabled = False
                    Transparent = True
                  end
                  object seROSepPSV: TcxSpinEdit
                    Left = 299
                    Top = 5
                    Enabled = False
                    Properties.AssignedValues.MinValue = True
                    Properties.SpinButtons.Visible = False
                    TabOrder = 4
                    Width = 35
                  end
                  object lblSepPSVMeasure: TcxLabel
                    Left = 337
                    Top = 9
                    Caption = 'cm/s'
                    Enabled = False
                    Transparent = True
                  end
                  object lblROSepColour: TcxLabel
                    Left = 6
                    Top = 11
                    Caption = 'Colour:'
                    Enabled = False
                    Transparent = True
                  end
                end
                object cxgbROSplidAreaDoppler: TcxGroupBox
                  Left = 229
                  Top = 378
                  Style.Edges = []
                  TabOrder = 26
                  Transparent = True
                  Height = 31
                  Width = 443
                  object ccbROSolidDoppler: TcxComboBox
                    Left = 47
                    Top = 9
                    Enabled = False
                    Properties.DropDownListStyle = lsFixedList
                    Properties.DropDownRows = 25
                    Properties.DropDownSizeable = True
                    Properties.Items.Strings = (
                      ''
                      'Minimal flow'
                      'Moderate flow'
                      'Highly vascular')
                    Properties.ReadOnly = False
                    TabOrder = 0
                    Width = 140
                  end
                  object lblROSolidRI: TcxLabel
                    Left = 197
                    Top = 8
                    Caption = ' RI'
                    Enabled = False
                    Transparent = True
                  end
                  object seROSolidRI: TcxSpinEdit
                    Left = 218
                    Top = 7
                    Enabled = False
                    Properties.AssignedValues.MinValue = True
                    Properties.ValueType = vtFloat
                    TabOrder = 2
                    Width = 50
                  end
                  object lblROSolidPSV: TcxLabel
                    Left = 274
                    Top = 9
                    Caption = 'PSV'
                    Enabled = False
                    Transparent = True
                  end
                  object seROSolidPSV: TcxSpinEdit
                    Left = 299
                    Top = 5
                    Enabled = False
                    Properties.AssignedValues.MinValue = True
                    Properties.SpinButtons.Visible = False
                    TabOrder = 4
                    Width = 35
                  end
                  object lblSolidPSVMeasure: TcxLabel
                    Left = 337
                    Top = 9
                    Caption = 'cm/s'
                    Enabled = False
                    Transparent = True
                  end
                  object lblROSolidColour: TcxLabel
                    Left = 8
                    Top = 9
                    Caption = 'Colour:'
                    Enabled = False
                    Transparent = True
                  end
                end
              end
              object tsLeftOvaryIOTA: TcxTabSheet
                Caption = 'IOTA - Left Ovary'
                ImageIndex = 1
                object Bevel13: TBevel
                  Left = 0
                  Top = 192
                  Width = 502
                  Height = 3
                end
                object Bevel14: TBevel
                  Left = 0
                  Top = 82
                  Width = 502
                  Height = 3
                end
                object Bevel15: TBevel
                  Left = -1
                  Top = 307
                  Width = 502
                  Height = 3
                end
                object Bevel20: TBevel
                  Left = -5
                  Top = 409
                  Width = 502
                  Height = 3
                end
                object cxLabel223: TcxLabel
                  Left = 8
                  Top = 101
                  Caption = 'Cyst Wall'
                  ParentFont = False
                  Style.Font.Charset = DEFAULT_CHARSET
                  Style.Font.Color = clWindowText
                  Style.Font.Height = -11
                  Style.Font.Name = 'Tahoma'
                  Style.Font.Style = [fsBold]
                  Style.IsFontAssigned = True
                  Transparent = True
                end
                object cxLabel224: TcxLabel
                  Left = 8
                  Top = 0
                  Caption = 'IOTA classification for ovarian and adnexal cysts.'
                  ParentFont = False
                  Style.Font.Charset = DEFAULT_CHARSET
                  Style.Font.Color = clWindowText
                  Style.Font.Height = -11
                  Style.Font.Name = 'Tahoma'
                  Style.Font.Style = [fsBold]
                  Style.IsFontAssigned = True
                  Transparent = True
                end
                object cxLabel225: TcxLabel
                  Left = 27
                  Top = 23
                  Caption = 'Classification'
                  Transparent = True
                end
                object ccbLOClassification: TcxComboBox
                  Left = 109
                  Top = 19
                  Properties.DropDownRows = 25
                  Properties.Items.Strings = (
                    'Unilocular cyst'
                    'Unilocular-solid cyst*'
                    'Multilocular cyst'
                    'Multilocular solid cyst'
                    'Solid tumour**'
                    'not classifiable')
                  TabOrder = 0
                  Width = 163
                end
                object cxMemo2: TcxMemo
                  Left = 109
                  Top = 43
                  Lines.Strings = (
                    
                      '*unilocular cyst with measurable solid component or at least one' +
                      ' papillary structure'
                    '**solid omponents comprise 80% or more of the tumour  ')
                  ParentFont = False
                  Style.BorderColor = clNone
                  Style.Color = clWindow
                  Style.Edges = []
                  Style.Font.Charset = DEFAULT_CHARSET
                  Style.Font.Color = clWindowText
                  Style.Font.Height = -12
                  Style.Font.Name = 'Times New Roman'
                  Style.Font.Style = []
                  Style.Shadow = False
                  Style.TextStyle = [fsItalic]
                  Style.IsFontAssigned = True
                  TabOrder = 33
                  Height = 38
                  Width = 555
                end
                object cxLabel226: TcxLabel
                  Left = 78
                  Top = 100
                  Caption = 'Smooth'
                  Transparent = True
                end
                object cxLOGBSmooth: TcxGroupBox
                  Left = 127
                  Top = 100
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
                  object cbLOSmoothYes: TcxCheckBox
                    Left = -3
                    Top = -2
                    Caption = 'Yes'
                    Style.LookAndFeel.NativeStyle = True
                    StyleDisabled.LookAndFeel.NativeStyle = True
                    StyleFocused.LookAndFeel.NativeStyle = True
                    StyleHot.LookAndFeel.NativeStyle = True
                    TabOrder = 0
                    Transparent = True
                    Width = 45
                  end
                  object cbLOSmoothNo: TcxCheckBox
                    Left = 48
                    Top = -2
                    Caption = 'No'
                    Style.LookAndFeel.NativeStyle = True
                    StyleDisabled.LookAndFeel.NativeStyle = True
                    StyleFocused.LookAndFeel.NativeStyle = True
                    StyleHot.LookAndFeel.NativeStyle = True
                    TabOrder = 1
                    Transparent = True
                    Width = 42
                  end
                end
                object cxLabel227: TcxLabel
                  Left = 36
                  Top = 122
                  Caption = 'Mural irregularity'
                  Transparent = True
                end
                object cxGroupBox14: TcxGroupBox
                  Left = 127
                  Top = 123
                  Style.BorderStyle = ebsNone
                  Style.Edges = []
                  Style.LookAndFeel.NativeStyle = True
                  StyleDisabled.LookAndFeel.NativeStyle = True
                  StyleFocused.LookAndFeel.NativeStyle = True
                  StyleHot.LookAndFeel.NativeStyle = True
                  TabOrder = 59
                  Transparent = True
                  Visible = False
                  Height = 22
                  Width = 125
                  object cxCheckBox2: TcxCheckBox
                    Left = -3
                    Top = -2
                    Caption = 'Yes'
                    Style.LookAndFeel.NativeStyle = True
                    StyleDisabled.LookAndFeel.NativeStyle = True
                    StyleFocused.LookAndFeel.NativeStyle = True
                    StyleHot.LookAndFeel.NativeStyle = True
                    TabOrder = 0
                    Transparent = True
                    Width = 45
                  end
                  object cxCheckBox3: TcxCheckBox
                    Left = 48
                    Top = -2
                    Caption = 'No'
                    Style.LookAndFeel.NativeStyle = True
                    StyleDisabled.LookAndFeel.NativeStyle = True
                    StyleFocused.LookAndFeel.NativeStyle = True
                    StyleHot.LookAndFeel.NativeStyle = True
                    TabOrder = 1
                    Transparent = True
                    Width = 42
                  end
                end
                object cxLabel228: TcxLabel
                  Left = 26
                  Top = 145
                  Caption = 'Papillary projection'
                  Transparent = True
                end
                object cxLOGBMI: TcxGroupBox
                  Left = 129
                  Top = 125
                  Style.BorderStyle = ebsNone
                  Style.Edges = []
                  Style.LookAndFeel.NativeStyle = True
                  StyleDisabled.LookAndFeel.NativeStyle = True
                  StyleFocused.LookAndFeel.NativeStyle = True
                  StyleHot.LookAndFeel.NativeStyle = True
                  TabOrder = 2
                  Transparent = True
                  Height = 22
                  Width = 125
                  object cbLOMIYes: TcxCheckBox
                    Left = -5
                    Top = -2
                    Caption = 'Yes'
                    Style.LookAndFeel.NativeStyle = True
                    StyleDisabled.LookAndFeel.NativeStyle = True
                    StyleFocused.LookAndFeel.NativeStyle = True
                    StyleHot.LookAndFeel.NativeStyle = True
                    TabOrder = 0
                    Transparent = True
                    Width = 45
                  end
                  object cbLOMINo: TcxCheckBox
                    Left = 46
                    Top = -2
                    Caption = 'No'
                    Style.LookAndFeel.NativeStyle = True
                    StyleDisabled.LookAndFeel.NativeStyle = True
                    StyleFocused.LookAndFeel.NativeStyle = True
                    StyleHot.LookAndFeel.NativeStyle = True
                    TabOrder = 1
                    Transparent = True
                    Width = 42
                  end
                end
                object cxLOGBPP: TcxGroupBox
                  Left = 127
                  Top = 142
                  Style.BorderStyle = ebsNone
                  Style.Edges = []
                  Style.LookAndFeel.NativeStyle = True
                  StyleDisabled.LookAndFeel.NativeStyle = True
                  StyleFocused.LookAndFeel.NativeStyle = True
                  StyleHot.LookAndFeel.NativeStyle = True
                  TabOrder = 3
                  Transparent = True
                  Height = 22
                  Width = 125
                  object cbLOPPYes: TcxCheckBox
                    Left = -3
                    Top = 4
                    Caption = 'Yes'
                    Style.LookAndFeel.NativeStyle = True
                    StyleDisabled.LookAndFeel.NativeStyle = True
                    StyleFocused.LookAndFeel.NativeStyle = True
                    StyleHot.LookAndFeel.NativeStyle = True
                    TabOrder = 0
                    Transparent = True
                    Width = 45
                  end
                  object cbLOPPNo: TcxCheckBox
                    Left = 48
                    Top = 3
                    Caption = 'No'
                    Style.LookAndFeel.NativeStyle = True
                    StyleDisabled.LookAndFeel.NativeStyle = True
                    StyleFocused.LookAndFeel.NativeStyle = True
                    StyleHot.LookAndFeel.NativeStyle = True
                    TabOrder = 1
                    Transparent = True
                    Width = 42
                  end
                end
                object lblLONumber: TcxLabel
                  Left = 218
                  Top = 148
                  Caption = 'Number'
                  Enabled = False
                  Transparent = True
                end
                object seLOPPNumber: TcxSpinEdit
                  Left = 262
                  Top = 144
                  Enabled = False
                  Properties.AssignedValues.MinValue = True
                  TabOrder = 4
                  Width = 35
                end
                object lblLOPPLargest: TcxLabel
                  Left = 306
                  Top = 146
                  Caption = 'Largest'
                  Enabled = False
                  Transparent = True
                end
                object cxLabel229: TcxLabel
                  Left = 65
                  Top = 165
                  Caption = 'Vascularity'
                  Transparent = True
                  Visible = False
                end
                object cxLOGBVascularity: TcxGroupBox
                  Left = 127
                  Top = 164
                  Style.BorderStyle = ebsNone
                  Style.Edges = []
                  Style.LookAndFeel.NativeStyle = True
                  StyleDisabled.LookAndFeel.NativeStyle = True
                  StyleFocused.LookAndFeel.NativeStyle = True
                  StyleHot.LookAndFeel.NativeStyle = True
                  TabOrder = 8
                  Transparent = True
                  Visible = False
                  Height = 22
                  Width = 125
                  object cbLOVascularityYes: TcxCheckBox
                    Left = -3
                    Top = 2
                    Caption = 'Yes'
                    Style.LookAndFeel.NativeStyle = True
                    StyleDisabled.LookAndFeel.NativeStyle = True
                    StyleFocused.LookAndFeel.NativeStyle = True
                    StyleHot.LookAndFeel.NativeStyle = True
                    TabOrder = 0
                    Transparent = True
                    Visible = False
                    Width = 45
                  end
                  object cbLOVascularityNo: TcxCheckBox
                    Left = 48
                    Top = 3
                    Caption = 'No'
                    Style.LookAndFeel.NativeStyle = True
                    StyleDisabled.LookAndFeel.NativeStyle = True
                    StyleFocused.LookAndFeel.NativeStyle = True
                    StyleHot.LookAndFeel.NativeStyle = True
                    TabOrder = 1
                    Transparent = True
                    Visible = False
                    Width = 42
                  end
                end
                object cxLabel230: TcxLabel
                  Left = 67
                  Top = 205
                  Caption = 'Septum:'
                  ParentFont = False
                  Style.Font.Charset = DEFAULT_CHARSET
                  Style.Font.Color = clWindowText
                  Style.Font.Height = -11
                  Style.Font.Name = 'Tahoma'
                  Style.Font.Style = [fsBold]
                  Style.IsFontAssigned = True
                  Transparent = True
                end
                object lblLOThickestSeptum: TcxLabel
                  Left = 127
                  Top = 205
                  Caption = 'Thickest septum'
                  Transparent = True
                end
                object seLOThickestSeptum: TcxSpinEdit
                  Left = 211
                  Top = 202
                  Properties.AssignedValues.MinValue = True
                  Properties.SpinButtons.Visible = False
                  TabOrder = 9
                  Width = 35
                end
                object lblLOThickestSeptumMeasure: TcxLabel
                  Left = 247
                  Top = 204
                  Caption = 'mm'
                  Transparent = True
                end
                object cxLabel233: TcxLabel
                  Left = 32
                  Top = 228
                  Caption = 'Solid Elements'
                  ParentFont = False
                  Style.Font.Charset = DEFAULT_CHARSET
                  Style.Font.Color = clWindowText
                  Style.Font.Height = -11
                  Style.Font.Name = 'Tahoma'
                  Style.Font.Style = [fsBold]
                  Style.IsFontAssigned = True
                  Transparent = True
                end
                object cxGBLOSolidElements: TcxGroupBox
                  Left = 127
                  Top = 223
                  Style.BorderStyle = ebsNone
                  Style.Edges = []
                  Style.LookAndFeel.NativeStyle = True
                  StyleDisabled.LookAndFeel.NativeStyle = True
                  StyleFocused.LookAndFeel.NativeStyle = True
                  StyleHot.LookAndFeel.NativeStyle = True
                  TabOrder = 10
                  Transparent = True
                  Height = 22
                  Width = 125
                  object cbLOSolidElementsYes: TcxCheckBox
                    Left = -3
                    Top = 2
                    Caption = 'Yes'
                    Style.LookAndFeel.NativeStyle = True
                    StyleDisabled.LookAndFeel.NativeStyle = True
                    StyleFocused.LookAndFeel.NativeStyle = True
                    StyleHot.LookAndFeel.NativeStyle = True
                    TabOrder = 0
                    Transparent = True
                    Width = 45
                  end
                  object cbLOSolidElementsNo: TcxCheckBox
                    Left = 48
                    Top = 3
                    Caption = 'No'
                    Style.LookAndFeel.NativeStyle = True
                    StyleDisabled.LookAndFeel.NativeStyle = True
                    StyleFocused.LookAndFeel.NativeStyle = True
                    StyleHot.LookAndFeel.NativeStyle = True
                    TabOrder = 1
                    Transparent = True
                    Width = 42
                  end
                end
                object lblLOSolidNumber: TcxLabel
                  Left = 220
                  Top = 229
                  Caption = 'Number'
                  Enabled = False
                  Transparent = True
                end
                object seLoSolidElementsNumber: TcxSpinEdit
                  Left = 264
                  Top = 225
                  Enabled = False
                  Properties.AssignedValues.MinValue = True
                  TabOrder = 11
                  Width = 35
                end
                object lblLOSolidLargest: TcxLabel
                  Left = 308
                  Top = 227
                  Caption = 'Largest'
                  Enabled = False
                  Transparent = True
                end
                object lblLOSolidVolMeasure: TcxLabel
                  Left = 508
                  Top = 227
                  Caption = 'cc'
                  Enabled = False
                  Transparent = True
                end
                object seLoSolidEleVol: TcxSpinEdit
                  Left = 478
                  Top = 225
                  Enabled = False
                  Properties.AssignedValues.MinValue = True
                  Properties.DisplayFormat = '#0.0'
                  Properties.EditFormat = '#0.0'
                  Properties.SpinButtons.Visible = False
                  Properties.ValueType = vtFloat
                  TabOrder = 15
                  Width = 30
                end
                object lblLOSolidMeasure: TcxLabel
                  Left = 458
                  Top = 227
                  Caption = 'mm'
                  Enabled = False
                  Transparent = True
                end
                object seLoSolidEleD: TcxSpinEdit
                  Left = 429
                  Top = 225
                  Enabled = False
                  Properties.AssignedValues.MinValue = True
                  Properties.SpinButtons.Visible = False
                  TabOrder = 14
                  Width = 30
                end
                object cxLabel235: TcxLabel
                  Left = 419
                  Top = 226
                  Caption = 'x'
                  Transparent = True
                end
                object seLoSolidEleW: TcxSpinEdit
                  Left = 390
                  Top = 225
                  Enabled = False
                  Properties.AssignedValues.MinValue = True
                  Properties.SpinButtons.Visible = False
                  TabOrder = 13
                  Width = 30
                end
                object cxLabel236: TcxLabel
                  Left = 381
                  Top = 227
                  Caption = 'x'
                  Transparent = True
                end
                object seLoSolidEleL: TcxSpinEdit
                  Left = 353
                  Top = 225
                  Enabled = False
                  Properties.AssignedValues.MinValue = True
                  Properties.SpinButtons.Visible = False
                  TabOrder = 12
                  Width = 30
                end
                object cxLabel237: TcxLabel
                  Left = 14
                  Top = 251
                  Caption = 'Internal Contents'
                  ParentFont = False
                  Style.Font.Charset = DEFAULT_CHARSET
                  Style.Font.Color = clWindowText
                  Style.Font.Height = -11
                  Style.Font.Name = 'Tahoma'
                  Style.Font.Style = [fsBold]
                  Style.IsFontAssigned = True
                  Transparent = True
                end
                object ccbLOInternalContents: TcxComboBox
                  Left = 127
                  Top = 251
                  Properties.DropDownRows = 25
                  Properties.Items.Strings = (
                    'Anechoic'
                    'Low level'
                    'Ground glass'
                    'Haemorrhagic '
                    'Mixed'
                    'Solid hypoechoic'
                    'Solid hyperechoic ')
                  TabOrder = 16
                  Width = 140
                end
                object ccbLOMixed: TcxComboBox
                  Left = 273
                  Top = 250
                  Enabled = False
                  Properties.DropDownListStyle = lsFixedList
                  Properties.DropDownRows = 25
                  Properties.DropDownSizeable = True
                  Properties.Items.Strings = (
                    'mixed'
                    'mixed with blood fluid level'
                    'mixed with fat fluid level'
                    'mixed _abcess')
                  Properties.ReadOnly = False
                  TabOrder = 17
                  Width = 140
                end
                object cxLabel238: TcxLabel
                  Left = 242
                  Top = 281
                  Caption = 'Free fluid'
                  ParentFont = False
                  Style.Font.Charset = DEFAULT_CHARSET
                  Style.Font.Color = clWindowText
                  Style.Font.Height = -11
                  Style.Font.Name = 'Tahoma'
                  Style.Font.Style = [fsBold]
                  Style.IsFontAssigned = True
                  Transparent = True
                  Visible = False
                end
                object cxLabel239: TcxLabel
                  Left = 307
                  Top = 282
                  Caption = 'Pouch of Douglas depth'
                  Transparent = True
                  Visible = False
                end
                object seLOPODD: TcxSpinEdit
                  Left = 424
                  Top = 280
                  Properties.AssignedValues.MinValue = True
                  Properties.SpinButtons.Visible = False
                  TabOrder = 19
                  Visible = False
                  Width = 35
                end
                object cxLabel240: TcxLabel
                  Left = 463
                  Top = 282
                  Caption = 'mm'
                  Transparent = True
                  Visible = False
                end
                object cxLabel241: TcxLabel
                  Left = 74
                  Top = 280
                  Caption = 'Ascites'
                  ParentFont = False
                  Style.Font.Charset = DEFAULT_CHARSET
                  Style.Font.Color = clWindowText
                  Style.Font.Height = -11
                  Style.Font.Name = 'Tahoma'
                  Style.Font.Style = [fsBold]
                  Style.IsFontAssigned = True
                  Transparent = True
                end
                object cxGroupBox16: TcxGroupBox
                  Left = 129
                  Top = 276
                  Style.BorderStyle = ebsNone
                  Style.Edges = []
                  Style.LookAndFeel.NativeStyle = True
                  StyleDisabled.LookAndFeel.NativeStyle = True
                  StyleFocused.LookAndFeel.NativeStyle = True
                  StyleHot.LookAndFeel.NativeStyle = True
                  TabOrder = 18
                  Transparent = True
                  Height = 22
                  Width = 101
                  object cbLOAscitesYes: TcxCheckBox
                    Left = -3
                    Top = 3
                    Caption = 'Yes'
                    Style.LookAndFeel.NativeStyle = True
                    StyleDisabled.LookAndFeel.NativeStyle = True
                    StyleFocused.LookAndFeel.NativeStyle = True
                    StyleHot.LookAndFeel.NativeStyle = True
                    TabOrder = 0
                    Transparent = True
                    Width = 45
                  end
                  object cbLOAscitesNo: TcxCheckBox
                    Left = 48
                    Top = 3
                    Caption = 'No'
                    Style.LookAndFeel.NativeStyle = True
                    StyleDisabled.LookAndFeel.NativeStyle = True
                    StyleFocused.LookAndFeel.NativeStyle = True
                    StyleHot.LookAndFeel.NativeStyle = True
                    TabOrder = 1
                    Transparent = True
                    Width = 42
                  end
                end
                object lblLOPPMeasure: TcxLabel
                  Left = 455
                  Top = 145
                  Caption = 'mm'
                  Enabled = False
                  Transparent = True
                end
                object seLOPPD: TcxSpinEdit
                  Left = 423
                  Top = 144
                  Enabled = False
                  Properties.AssignedValues.MinValue = True
                  Properties.SpinButtons.Visible = False
                  TabOrder = 7
                  Width = 30
                end
                object cxLabel244: TcxLabel
                  Left = 416
                  Top = 145
                  Caption = 'x'
                  Transparent = True
                end
                object seLOPPW: TcxSpinEdit
                  Left = 387
                  Top = 144
                  Enabled = False
                  Properties.AssignedValues.MinValue = True
                  Properties.SpinButtons.Visible = False
                  TabOrder = 6
                  Width = 30
                end
                object cxLabel245: TcxLabel
                  Left = 378
                  Top = 146
                  Caption = 'x'
                  Transparent = True
                end
                object seLOPPL: TcxSpinEdit
                  Left = 350
                  Top = 144
                  Enabled = False
                  Properties.AssignedValues.MinValue = True
                  Properties.SpinButtons.Visible = False
                  TabOrder = 5
                  Width = 30
                end
                object cxLabel246: TcxLabel
                  Left = 57
                  Top = 310
                  Caption = 'Vascularity: '
                  ParentFont = False
                  Style.Font.Charset = DEFAULT_CHARSET
                  Style.Font.Color = clWindowText
                  Style.Font.Height = -11
                  Style.Font.Name = 'Tahoma'
                  Style.Font.Style = [fsBold]
                  Style.IsFontAssigned = True
                  Transparent = True
                end
                object cxGroupBox10: TcxGroupBox
                  Left = 130
                  Top = 325
                  Style.BorderStyle = ebsNone
                  Style.Edges = []
                  Style.LookAndFeel.NativeStyle = True
                  StyleDisabled.LookAndFeel.NativeStyle = True
                  StyleFocused.LookAndFeel.NativeStyle = True
                  StyleHot.LookAndFeel.NativeStyle = True
                  TabOrder = 21
                  Transparent = True
                  Height = 22
                  Width = 93
                  object cbLOVSYes: TcxCheckBox
                    Left = -3
                    Top = 3
                    Caption = 'Yes'
                    Enabled = False
                    Style.LookAndFeel.NativeStyle = True
                    StyleDisabled.LookAndFeel.NativeStyle = True
                    StyleFocused.LookAndFeel.NativeStyle = True
                    StyleHot.LookAndFeel.NativeStyle = True
                    TabOrder = 0
                    Transparent = True
                    Width = 45
                  end
                  object cbLOVSNo: TcxCheckBox
                    Left = 55
                    Top = 3
                    Caption = 'No'
                    Enabled = False
                    Style.LookAndFeel.NativeStyle = True
                    StyleDisabled.LookAndFeel.NativeStyle = True
                    StyleFocused.LookAndFeel.NativeStyle = True
                    StyleHot.LookAndFeel.NativeStyle = True
                    TabOrder = 1
                    Transparent = True
                    Width = 42
                  end
                end
                object cxGroupBox12: TcxGroupBox
                  Left = 333
                  Top = 320
                  Style.BorderStyle = ebsNone
                  Style.Edges = []
                  Style.LookAndFeel.NativeStyle = True
                  StyleDisabled.LookAndFeel.NativeStyle = True
                  StyleFocused.LookAndFeel.NativeStyle = True
                  StyleHot.LookAndFeel.NativeStyle = True
                  TabOrder = 30
                  Transparent = True
                  Height = 22
                  Width = 106
                  object cxCheckBox4: TcxCheckBox
                    Left = -340
                    Top = -285
                    Caption = 'Colour'
                    Style.LookAndFeel.NativeStyle = True
                    StyleDisabled.LookAndFeel.NativeStyle = True
                    StyleFocused.LookAndFeel.NativeStyle = True
                    StyleHot.LookAndFeel.NativeStyle = True
                    TabOrder = 0
                    Transparent = True
                    Width = 58
                  end
                end
                object cxGroupBox11: TcxGroupBox
                  Left = 130
                  Top = 353
                  Style.BorderStyle = ebsNone
                  Style.Edges = []
                  Style.LookAndFeel.NativeStyle = True
                  StyleDisabled.LookAndFeel.NativeStyle = True
                  StyleFocused.LookAndFeel.NativeStyle = True
                  StyleHot.LookAndFeel.NativeStyle = True
                  TabOrder = 23
                  Transparent = True
                  Height = 22
                  Width = 93
                  object cbLOSeptumYes: TcxCheckBox
                    Left = -3
                    Top = 2
                    Caption = 'Yes'
                    Enabled = False
                    Style.LookAndFeel.NativeStyle = True
                    StyleDisabled.LookAndFeel.NativeStyle = True
                    StyleFocused.LookAndFeel.NativeStyle = True
                    StyleHot.LookAndFeel.NativeStyle = True
                    TabOrder = 0
                    Transparent = True
                    Width = 45
                  end
                  object cbLOSeptumNo: TcxCheckBox
                    Left = 55
                    Top = 2
                    Caption = 'No'
                    Enabled = False
                    Style.LookAndFeel.NativeStyle = True
                    StyleDisabled.LookAndFeel.NativeStyle = True
                    StyleFocused.LookAndFeel.NativeStyle = True
                    StyleHot.LookAndFeel.NativeStyle = True
                    TabOrder = 1
                    Transparent = True
                    Width = 42
                  end
                end
                object cxGroupBox15: TcxGroupBox
                  Left = 130
                  Top = 381
                  Style.BorderStyle = ebsNone
                  Style.Edges = []
                  Style.LookAndFeel.NativeStyle = True
                  StyleDisabled.LookAndFeel.NativeStyle = True
                  StyleFocused.LookAndFeel.NativeStyle = True
                  StyleHot.LookAndFeel.NativeStyle = True
                  TabOrder = 25
                  Transparent = True
                  Height = 22
                  Width = 93
                  object cbLOSolidYes: TcxCheckBox
                    Left = -3
                    Top = 2
                    Caption = 'Yes'
                    Enabled = False
                    Style.LookAndFeel.NativeStyle = True
                    StyleDisabled.LookAndFeel.NativeStyle = True
                    StyleFocused.LookAndFeel.NativeStyle = True
                    StyleHot.LookAndFeel.NativeStyle = True
                    TabOrder = 0
                    Transparent = True
                    Width = 45
                  end
                  object cbLOSolidNo: TcxCheckBox
                    Left = 55
                    Top = 3
                    Caption = 'No'
                    Enabled = False
                    Style.LookAndFeel.NativeStyle = True
                    StyleDisabled.LookAndFeel.NativeStyle = True
                    StyleFocused.LookAndFeel.NativeStyle = True
                    StyleHot.LookAndFeel.NativeStyle = True
                    TabOrder = 1
                    Transparent = True
                    Width = 42
                  end
                end
                object lblLOSeptum: TcxLabel
                  Left = 84
                  Top = 359
                  Caption = 'Septum'
                  Enabled = False
                  Transparent = True
                end
                object lblLOSolid: TcxLabel
                  Left = 72
                  Top = 384
                  Caption = 'Solid Area'
                  Enabled = False
                  Transparent = True
                end
                object lblLOVascularPP: TcxLabel
                  Left = 32
                  Top = 328
                  Caption = 'Papillary projection'
                  Enabled = False
                  Transparent = True
                end
                object cxLabel242: TcxLabel
                  Left = 23
                  Top = 419
                  Caption = 'Cyst Appearance'
                  ParentFont = False
                  Style.Font.Charset = DEFAULT_CHARSET
                  Style.Font.Color = clWindowText
                  Style.Font.Height = -11
                  Style.Font.Name = 'Tahoma'
                  Style.Font.Style = [fsBold]
                  Style.IsFontAssigned = True
                  Transparent = True
                end
                object ccbLOAppearance: TcxComboBox
                  Left = 127
                  Top = 417
                  Properties.DropDownRows = 25
                  Properties.Items.Strings = (
                    'Benign'
                    'Malignant'
                    'Unclassifiable')
                  TabOrder = 27
                  Width = 140
                end
                object cxLabel260: TcxLabel
                  Left = 6
                  Top = 434
                  Caption = '(See IOTA Simple Rules)'
                  Transparent = True
                end
                object cxgbLOPPDoppler: TcxGroupBox
                  Left = 229
                  Top = 311
                  Style.Edges = []
                  TabOrder = 22
                  Transparent = True
                  Height = 39
                  Width = 443
                  object ccbLOPPDoppler: TcxComboBox
                    Left = 45
                    Top = 14
                    Enabled = False
                    Properties.DropDownListStyle = lsFixedList
                    Properties.DropDownRows = 25
                    Properties.DropDownSizeable = True
                    Properties.Items.Strings = (
                      ''
                      'Minimal flow'
                      'Moderate flow'
                      'Highly vascular')
                    Properties.ReadOnly = False
                    TabOrder = 0
                    Width = 140
                  end
                  object lblLOPPRI: TcxLabel
                    Left = 194
                    Top = 14
                    Caption = ' RI'
                    Enabled = False
                    Transparent = True
                  end
                  object seLOPPRI: TcxSpinEdit
                    Left = 213
                    Top = 13
                    Enabled = False
                    Properties.AssignedValues.MinValue = True
                    Properties.ValueType = vtFloat
                    TabOrder = 2
                    Width = 48
                  end
                  object lblLOPPPSV: TcxLabel
                    Left = 274
                    Top = 17
                    Caption = 'PSV'
                    Enabled = False
                    Transparent = True
                  end
                  object seLOPPPSV: TcxSpinEdit
                    Left = 299
                    Top = 14
                    Enabled = False
                    Properties.AssignedValues.MinValue = True
                    Properties.SpinButtons.Visible = False
                    TabOrder = 4
                    Width = 35
                  end
                  object lblLOPPPSVMeasure: TcxLabel
                    Left = 337
                    Top = 17
                    Caption = 'cm/s'
                    Enabled = False
                    Transparent = True
                  end
                  object lblLOPPColour: TcxLabel
                    Left = 6
                    Top = 17
                    Caption = 'Colour:'
                    Enabled = False
                    Transparent = True
                  end
                end
                object cxgbLOSeptumDoppler: TcxGroupBox
                  Left = 229
                  Top = 346
                  Style.Edges = []
                  TabOrder = 24
                  Transparent = True
                  Height = 31
                  Width = 443
                  object ccbLOSepDoppler: TcxComboBox
                    Left = 47
                    Top = 9
                    Enabled = False
                    Properties.DropDownListStyle = lsFixedList
                    Properties.DropDownRows = 25
                    Properties.DropDownSizeable = True
                    Properties.Items.Strings = (
                      ''
                      'Minimal flow'
                      'Moderate flow'
                      'Highly vascular')
                    Properties.ReadOnly = False
                    TabOrder = 0
                    Width = 140
                  end
                  object lblLOSepRI: TcxLabel
                    Left = 194
                    Top = 8
                    Caption = ' RI'
                    Enabled = False
                    Transparent = True
                  end
                  object seLOSepRI: TcxSpinEdit
                    Left = 213
                    Top = 7
                    Enabled = False
                    Properties.AssignedValues.MinValue = True
                    Properties.ValueType = vtFloat
                    TabOrder = 2
                    Width = 50
                  end
                  object lblLOSepPSV: TcxLabel
                    Left = 276
                    Top = 9
                    Caption = 'PSV'
                    Enabled = False
                    Transparent = True
                  end
                  object seLOSepPSV: TcxSpinEdit
                    Left = 300
                    Top = 8
                    Enabled = False
                    Properties.AssignedValues.MinValue = True
                    Properties.SpinButtons.Visible = False
                    TabOrder = 4
                    Width = 35
                  end
                  object lblLOSepPSVMeasure: TcxLabel
                    Left = 337
                    Top = 9
                    Caption = 'cm/s'
                    Enabled = False
                    Transparent = True
                  end
                  object lblLOSepColour: TcxLabel
                    Left = 6
                    Top = 11
                    Caption = 'Colour:'
                    Enabled = False
                    Transparent = True
                  end
                end
                object cxgbLOSplidAreaDoppler: TcxGroupBox
                  Left = 229
                  Top = 376
                  Style.Edges = []
                  TabOrder = 26
                  Transparent = True
                  Height = 31
                  Width = 443
                  object ccbLOSolidDoppler: TcxComboBox
                    Left = 47
                    Top = 9
                    Enabled = False
                    Properties.DropDownListStyle = lsFixedList
                    Properties.DropDownRows = 25
                    Properties.DropDownSizeable = True
                    Properties.Items.Strings = (
                      ''
                      'Minimal flow'
                      'Moderate flow'
                      'Highly vascular')
                    Properties.ReadOnly = False
                    TabOrder = 0
                    Width = 140
                  end
                  object lblLOSolidRI: TcxLabel
                    Left = 194
                    Top = 9
                    Caption = ' RI'
                    Enabled = False
                    Transparent = True
                  end
                  object seLOSolidRI: TcxSpinEdit
                    Left = 214
                    Top = 7
                    Enabled = False
                    Properties.AssignedValues.MinValue = True
                    Properties.ValueType = vtFloat
                    TabOrder = 2
                    Width = 49
                  end
                  object lblLOSolidPSV: TcxLabel
                    Left = 274
                    Top = 9
                    Caption = 'PSV'
                    Enabled = False
                    Transparent = True
                  end
                  object seLOSolidPSV: TcxSpinEdit
                    Left = 299
                    Top = 5
                    Enabled = False
                    Properties.AssignedValues.MinValue = True
                    Properties.SpinButtons.Visible = False
                    TabOrder = 4
                    Width = 35
                  end
                  object lblLOSolidPSVMeasure: TcxLabel
                    Left = 337
                    Top = 9
                    Caption = 'cm/s'
                    Enabled = False
                    Transparent = True
                  end
                  object lblLOSolidColour: TcxLabel
                    Left = 8
                    Top = 9
                    Caption = 'Colour:'
                    Enabled = False
                    Transparent = True
                  end
                end
              end
            end
          end
          object cxTabSheet6: TcxTabSheet
            Caption = 'IOTA Simple Rules'
            ImageIndex = 7
            object Bevel16: TBevel
              Left = 240
              Top = 86
              Width = 2
              Height = 184
            end
            object Bevel17: TBevel
              Left = 37
              Top = 272
              Width = 400
              Height = 3
            end
            object Bevel18: TBevel
              Left = 37
              Top = 108
              Width = 400
              Height = 3
            end
            object cxMemo3: TcxMemo
              Left = 32
              Top = 6
              Lines.Strings = (
                
                  'The simple rules classify tumours as benign, inconclusive (non c' +
                  'lassfiable) or malignant.  A mass is classified as '
                
                  'malignant if at least one malignant feature and none of the beni' +
                  'gn features are present, and vice versa.  If no '
                
                  'benign or malignant features are present or if both benign and m' +
                  'alignant features are present, then the rules are '
                'considered inconclusive.')
              ParentFont = False
              Style.BorderColor = clNone
              Style.Color = clWindow
              Style.Edges = []
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -12
              Style.Font.Name = 'Times New Roman'
              Style.Font.Style = []
              Style.Shadow = False
              Style.TextStyle = [fsItalic]
              Style.IsFontAssigned = True
              TabOrder = 0
              Height = 71
              Width = 555
            end
            object cxLabel248: TcxLabel
              Left = 71
              Top = 86
              Caption = 'Benign Features'
              ParentFont = False
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -11
              Style.Font.Name = 'Tahoma'
              Style.Font.Style = [fsBold]
              Style.IsFontAssigned = True
              Transparent = True
            end
            object cxLabel249: TcxLabel
              Left = 266
              Top = 86
              Caption = 'Malignant Features'
              ParentFont = False
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -11
              Style.Font.Name = 'Tahoma'
              Style.Font.Style = [fsBold]
              Style.IsFontAssigned = True
              Transparent = True
            end
            object cxCheckBox5: TcxCheckBox
              Left = 61
              Top = 121
              Caption = 'Unilocular cyst'
              TabOrder = 3
              Transparent = True
              Width = 105
            end
            object cxCheckBox6: TcxCheckBox
              Left = 61
              Top = 143
              Caption = 'Presence of solid components,'
              TabOrder = 4
              Transparent = True
              Width = 172
            end
            object cxLabel250: TcxLabel
              Left = 78
              Top = 162
              Caption = 'with largest diameter < 7 mm'
              Transparent = True
            end
            object cxCheckBox7: TcxCheckBox
              Left = 61
              Top = 179
              Caption = 'Presence of acoustic shadows'
              TabOrder = 6
              Transparent = True
              Width = 172
            end
            object cxCheckBox8: TcxCheckBox
              Left = 61
              Top = 202
              Caption = 'Smooth multilocular tumor, with'
              TabOrder = 7
              Transparent = True
              Width = 177
            end
            object cxLabel251: TcxLabel
              Left = 78
              Top = 222
              Caption = ' largest diameter < 100 mm'
              Transparent = True
            end
            object cxCheckBox9: TcxCheckBox
              Left = 61
              Top = 238
              Caption = 'No blood flow'
              TabOrder = 9
              Transparent = True
              Width = 172
            end
            object cxCheckBox10: TcxCheckBox
              Left = 256
              Top = 123
              Caption = 'Irregular solid tumor'
              TabOrder = 10
              Transparent = True
              Width = 145
            end
            object cxCheckBox11: TcxCheckBox
              Left = 256
              Top = 146
              Caption = 'Presence of ascites'
              TabOrder = 11
              Transparent = True
              Width = 145
            end
            object cxCheckBox12: TcxCheckBox
              Left = 256
              Top = 178
              Caption = 'At least four papillary structures'
              TabOrder = 12
              Transparent = True
              Width = 184
            end
            object cxCheckBox13: TcxCheckBox
              Left = 256
              Top = 205
              Caption = 'Irregular multilocular solid tumor'
              TabOrder = 13
              Transparent = True
              Width = 184
            end
            object cxLabel252: TcxLabel
              Left = 274
              Top = 224
              Caption = 'with largest diameter >= 100 mm'
              Transparent = True
            end
            object cxCheckBox14: TcxCheckBox
              Left = 256
              Top = 238
              Caption = 'Very strong blood flow '
              TabOrder = 15
              Transparent = True
              Width = 172
            end
            object cxMemo4: TcxMemo
              Left = 37
              Top = 276
              Lines.Strings = (
                
                  'Improving strategies for diagnosing ovarian cancer: a summary of' +
                  ' the International Ovarian Tumour Analysis '
                '(IOTA) studies.  Kaijser et al, UOG 2015: 41: 9-20   ')
              ParentFont = False
              Style.BorderColor = clNone
              Style.Color = clWindow
              Style.Edges = []
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -12
              Style.Font.Name = 'Times New Roman'
              Style.Font.Style = []
              Style.Shadow = False
              Style.TextStyle = [fsItalic]
              Style.IsFontAssigned = True
              TabOrder = 16
              Height = 38
              Width = 555
            end
          end
          object tsPelvis: TcxTabSheet
            Tag = 1
            Caption = 'Pelvis'
            ImageIndex = 1
            object Bevel4: TBevel
              Left = 11
              Top = 160
              Width = 501
              Height = 1
            end
            object Bevel5: TBevel
              Left = 10
              Top = 92
              Width = 502
              Height = 3
            end
            object Bevel6: TBevel
              Left = 13
              Top = 212
              Width = 501
              Height = 1
            end
            object cxLabel105: TcxLabel
              Left = 13
              Top = 95
              Caption = 'Excess free fluid'
              Transparent = True
            end
            object cbEFFNormal: TcxCheckBox
              Left = 9
              Top = 114
              Caption = 'Present'
              TabOrder = 5
              Transparent = True
              Width = 64
            end
            object cbEFFAbnormal: TcxCheckBox
              Left = 98
              Top = 114
              Caption = 'Not Present'
              TabOrder = 6
              Transparent = True
              Width = 102
            end
            object lblPODDEpth: TcxLabel
              Left = 13
              Top = 136
              Caption = 'POD Depth'
              Enabled = False
              Transparent = True
            end
            object sePODDepth: TcxSpinEdit
              Left = 98
              Top = 134
              Enabled = False
              Properties.AssignedValues.MinValue = True
              TabOrder = 7
              Value = 2
              Width = 38
            end
            object cxLabel84: TcxLabel
              Left = 137
              Top = 136
              Caption = 'mm'
              Transparent = True
            end
            object cxGroupBox6: TcxGroupBox
              Left = 7
              Top = 219
              Caption = 'Right Kidney Visualised'
              Style.BorderStyle = ebsNone
              Style.Edges = []
              Style.LookAndFeel.NativeStyle = True
              StyleDisabled.LookAndFeel.NativeStyle = True
              StyleFocused.LookAndFeel.NativeStyle = True
              StyleHot.LookAndFeel.NativeStyle = True
              TabOrder = 14
              Transparent = True
              Height = 107
              Width = 254
              object cbRightKidneyYes: TcxCheckBox
                Left = 4
                Top = 13
                Caption = 'Yes'
                TabOrder = 0
                Transparent = True
                Width = 85
              end
              object cbRightKidneyNo: TcxCheckBox
                Left = 89
                Top = 13
                Caption = 'No'
                TabOrder = 1
                Transparent = True
                Width = 71
              end
              object teRightKidney: TcxTextEdit
                Left = 6
                Top = 72
                Enabled = False
                TabOrder = 2
                Visible = False
                Width = 239
              end
              object cxGroupBox3: TcxGroupBox
                Left = 1
                Top = 34
                Caption = 'Renal abnormality'
                Style.BorderStyle = ebsNone
                Style.Edges = []
                Style.LookAndFeel.NativeStyle = True
                StyleDisabled.LookAndFeel.NativeStyle = True
                StyleFocused.LookAndFeel.NativeStyle = True
                StyleHot.LookAndFeel.NativeStyle = True
                TabOrder = 3
                Transparent = True
                Height = 36
                Width = 179
                object cbRightReanalAbnormalYes: TcxCheckBox
                  Left = 3
                  Top = 14
                  Caption = 'Yes'
                  Enabled = False
                  Style.LookAndFeel.NativeStyle = True
                  StyleDisabled.LookAndFeel.NativeStyle = True
                  StyleFocused.LookAndFeel.NativeStyle = True
                  StyleHot.LookAndFeel.NativeStyle = True
                  TabOrder = 0
                  Transparent = True
                  Width = 41
                end
                object cbRightReanalAbnormalNo: TcxCheckBox
                  Left = 88
                  Top = 14
                  Caption = 'No'
                  Enabled = False
                  Style.LookAndFeel.NativeStyle = True
                  StyleDisabled.LookAndFeel.NativeStyle = True
                  StyleFocused.LookAndFeel.NativeStyle = True
                  StyleHot.LookAndFeel.NativeStyle = True
                  TabOrder = 1
                  Transparent = True
                  Width = 45
                end
              end
            end
            object cxGroupBox2: TcxGroupBox
              Left = 258
              Top = 219
              Caption = 'Left Kidney Visualised'
              Style.BorderStyle = ebsNone
              Style.Edges = []
              Style.LookAndFeel.NativeStyle = True
              StyleDisabled.LookAndFeel.NativeStyle = True
              StyleFocused.LookAndFeel.NativeStyle = True
              StyleHot.LookAndFeel.NativeStyle = True
              TabOrder = 15
              Transparent = True
              Height = 107
              Width = 254
              object cbLeftKidneyYes: TcxCheckBox
                Left = 4
                Top = 13
                Caption = 'Yes'
                TabOrder = 0
                Transparent = True
                Width = 85
              end
              object cbLeftKidneyNo: TcxCheckBox
                Left = 89
                Top = 13
                Caption = 'No'
                TabOrder = 1
                Transparent = True
                Width = 71
              end
              object teLeftKidney: TcxTextEdit
                Left = 6
                Top = 72
                Enabled = False
                TabOrder = 2
                Visible = False
                Width = 249
              end
              object cxGroupBox7: TcxGroupBox
                Left = 1
                Top = 34
                Caption = 'Renal abnormality'
                Style.BorderStyle = ebsNone
                Style.Edges = []
                Style.LookAndFeel.NativeStyle = True
                StyleDisabled.LookAndFeel.NativeStyle = True
                StyleFocused.LookAndFeel.NativeStyle = True
                StyleHot.LookAndFeel.NativeStyle = True
                TabOrder = 3
                Transparent = True
                Height = 36
                Width = 179
                object cbLeftReanalAbnormalYes: TcxCheckBox
                  Left = 3
                  Top = 14
                  Caption = 'Yes'
                  Enabled = False
                  Style.LookAndFeel.NativeStyle = True
                  StyleDisabled.LookAndFeel.NativeStyle = True
                  StyleFocused.LookAndFeel.NativeStyle = True
                  StyleHot.LookAndFeel.NativeStyle = True
                  TabOrder = 0
                  Transparent = True
                  Width = 41
                end
                object cbLeftReanalAbnormalNo: TcxCheckBox
                  Left = 88
                  Top = 14
                  Caption = 'No'
                  Enabled = False
                  Style.LookAndFeel.NativeStyle = True
                  StyleDisabled.LookAndFeel.NativeStyle = True
                  StyleFocused.LookAndFeel.NativeStyle = True
                  StyleHot.LookAndFeel.NativeStyle = True
                  TabOrder = 1
                  Transparent = True
                  Width = 45
                end
              end
            end
            object seRightAdnexalMasses: TcxSpinEdit
              Left = 177
              Top = 3
              Enabled = False
              Properties.AssignedValues.MinValue = True
              Properties.LargeIncrement = 2.000000000000000000
              Properties.MaxValue = 3.000000000000000000
              TabOrder = 1
              Width = 44
            end
            object seLeftAdnexalMasses: TcxSpinEdit
              Left = 446
              Top = 2
              Enabled = False
              Properties.AssignedValues.MinValue = True
              Properties.LargeIncrement = 2.000000000000000000
              Properties.MaxValue = 3.000000000000000000
              TabOrder = 10
              Width = 44
            end
            object gbRightCyst1: TcxGroupBox
              Left = 7
              Top = 23
              PanelStyle.Active = True
              Style.BorderStyle = ebsNone
              TabOrder = 2
              Height = 24
              Width = 262
              object seRightAdnexalLength1: TcxSpinEdit
                Left = 1
                Top = 1
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                TabOrder = 1
                Width = 30
              end
              object cxLabel106: TcxLabel
                Left = 30
                Top = 3
                Caption = 'x'
                Transparent = True
              end
              object seRightAdnexalWidth1: TcxSpinEdit
                Left = 39
                Top = 1
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                TabOrder = 2
                Width = 30
              end
              object cxLabel107: TcxLabel
                Left = 68
                Top = 3
                Caption = 'x'
                Transparent = True
              end
              object seRightAdnexalDepth1: TcxSpinEdit
                Left = 77
                Top = 1
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                TabOrder = 3
                Width = 30
              end
              object cxLabel108: TcxLabel
                Left = 106
                Top = 3
                Caption = 'mm'
                Transparent = True
              end
              object seRightAdnexalVolume1: TcxSpinEdit
                Left = 131
                Top = 1
                Properties.AssignedValues.MinValue = True
                Properties.DisplayFormat = '#0.0'
                Properties.EditFormat = '#0.0'
                Properties.SpinButtons.Visible = False
                Properties.ValueType = vtFloat
                TabOrder = 4
                Width = 30
              end
              object cxLabel109: TcxLabel
                Left = 159
                Top = 3
                Caption = 'cc'
                Transparent = True
              end
              object cbRightAdnexalAppearance1: TcxComboBox
                Left = 170
                Top = 1
                Properties.Items.Strings = (
                  ''
                  'fimbrial cyst'
                  'hydrosalpinx'
                  'loculated fluid'
                  'other')
                TabOrder = 5
                Width = 90
              end
            end
            object gbRightCyst2: TcxGroupBox
              Left = 7
              Top = 45
              PanelStyle.Active = True
              Style.BorderStyle = ebsNone
              TabOrder = 3
              Height = 24
              Width = 262
              object cbRightAdnexalAppearance2: TcxComboBox
                Left = 170
                Top = 1
                Properties.Items.Strings = (
                  ''
                  'fimbrial cyst'
                  'hydrosalpinx'
                  'loculated fluid'
                  'other')
                TabOrder = 5
                Width = 90
              end
              object cxLabel118: TcxLabel
                Left = 159
                Top = 3
                Caption = 'cc'
                Transparent = True
              end
              object seRightAdnexalVolume2: TcxSpinEdit
                Left = 131
                Top = 1
                Properties.AssignedValues.MinValue = True
                Properties.DisplayFormat = '#0.0'
                Properties.EditFormat = '#0.0'
                Properties.SpinButtons.Visible = False
                Properties.ValueType = vtFloat
                TabOrder = 3
                Width = 30
              end
              object cxLabel117: TcxLabel
                Left = 106
                Top = 3
                Caption = 'mm'
                Transparent = True
              end
              object seRightAdnexalDepth2: TcxSpinEdit
                Left = 77
                Top = 1
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                TabOrder = 2
                Width = 30
              end
              object cxLabel116: TcxLabel
                Left = 68
                Top = 3
                Caption = 'x'
                Transparent = True
              end
              object seRightAdnexalWidth2: TcxSpinEdit
                Left = 39
                Top = 1
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                TabOrder = 1
                Width = 30
              end
              object cxLabel115: TcxLabel
                Left = 30
                Top = 3
                Caption = 'x'
                Transparent = True
              end
              object seRightAdnexalLength2: TcxSpinEdit
                Left = 1
                Top = 1
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                TabOrder = 0
                Width = 30
              end
            end
            object gbRightCyst3: TcxGroupBox
              Left = 7
              Top = 67
              PanelStyle.Active = True
              Style.BorderStyle = ebsNone
              TabOrder = 4
              Height = 24
              Width = 262
              object seRightAdnexalLength3: TcxSpinEdit
                Left = 1
                Top = 1
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                TabOrder = 1
                Width = 30
              end
              object cxLabel123: TcxLabel
                Left = 30
                Top = 3
                Caption = 'x'
                Transparent = True
              end
              object seRightAdnexalWidth3: TcxSpinEdit
                Left = 39
                Top = 1
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                TabOrder = 2
                Width = 30
              end
              object cxLabel124: TcxLabel
                Left = 68
                Top = 3
                Caption = 'x'
                Transparent = True
              end
              object seRightAdnexalDepth3: TcxSpinEdit
                Left = 77
                Top = 1
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                TabOrder = 3
                Width = 30
              end
              object cxLabel125: TcxLabel
                Left = 108
                Top = 3
                Caption = 'mm'
                Transparent = True
              end
              object seRightAdnexalVolume3: TcxSpinEdit
                Left = 131
                Top = 1
                Properties.AssignedValues.MinValue = True
                Properties.DisplayFormat = '#0.0'
                Properties.EditFormat = '#0.0'
                Properties.SpinButtons.Visible = False
                Properties.ValueType = vtFloat
                TabOrder = 4
                Width = 30
              end
              object cxLabel126: TcxLabel
                Left = 159
                Top = 3
                Caption = 'cc'
                Transparent = True
              end
              object cbRightAdnexalAppearance3: TcxComboBox
                Left = 170
                Top = 1
                Properties.Items.Strings = (
                  ''
                  'fimbrial cyst'
                  'hydrosalpinx'
                  'loculated fluid'
                  'other')
                TabOrder = 5
                Width = 90
              end
            end
            object gbLeftCyst1: TcxGroupBox
              Left = 270
              Top = 22
              PanelStyle.Active = True
              Style.BorderStyle = ebsNone
              TabOrder = 11
              Height = 25
              Width = 273
              object seLeftAdnexalLength1: TcxSpinEdit
                Left = 0
                Top = 1
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                TabOrder = 1
                Width = 30
              end
              object cxLabel110: TcxLabel
                Left = 66
                Top = 3
                Caption = 'x'
                Transparent = True
              end
              object seLeftAdnexalWidth1: TcxSpinEdit
                Left = 38
                Top = 1
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                TabOrder = 2
                Width = 30
              end
              object cxLabel111: TcxLabel
                Left = 29
                Top = 3
                Caption = 'x'
                Transparent = True
              end
              object seLeftAdnexalDepth1: TcxSpinEdit
                Left = 76
                Top = 1
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                TabOrder = 3
                Width = 30
              end
              object cxLabel112: TcxLabel
                Left = 105
                Top = 3
                Caption = 'mm'
                Transparent = True
              end
              object seLeftAdnexalVolume1: TcxSpinEdit
                Left = 133
                Top = 1
                Properties.AssignedValues.MinValue = True
                Properties.DisplayFormat = '#0.0'
                Properties.EditFormat = '#0.0'
                Properties.SpinButtons.Visible = False
                Properties.ValueType = vtFloat
                TabOrder = 4
                Width = 30
              end
              object cxLabel113: TcxLabel
                Left = 161
                Top = 3
                Caption = 'cc'
                Transparent = True
              end
              object cbLeftAdnexalAppearance1: TcxComboBox
                Left = 175
                Top = 1
                Properties.Items.Strings = (
                  ''
                  'fimbrial cyst'
                  'hydrosalpinx'
                  'loculated fluid'
                  'other')
                TabOrder = 5
                Width = 90
              end
            end
            object gbLeftCyst2: TcxGroupBox
              Left = 270
              Top = 45
              PanelStyle.Active = True
              Style.BorderStyle = ebsNone
              TabOrder = 12
              Height = 24
              Width = 273
              object seLeftAdnexalLength2: TcxSpinEdit
                Left = 0
                Top = 1
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                TabOrder = 1
                Width = 30
              end
              object cxLabel119: TcxLabel
                Left = 29
                Top = 3
                Caption = 'x'
                Transparent = True
              end
              object seLeftAdnexalWidth2: TcxSpinEdit
                Left = 38
                Top = 1
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                TabOrder = 2
                Width = 30
              end
              object cxLabel120: TcxLabel
                Left = 67
                Top = 3
                Caption = 'x'
                Transparent = True
              end
              object seLeftAdnexalDepth2: TcxSpinEdit
                Left = 76
                Top = 1
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                TabOrder = 3
                Width = 30
              end
              object seLeftAdnexalVolume2: TcxSpinEdit
                Left = 133
                Top = 1
                Properties.AssignedValues.MinValue = True
                Properties.DisplayFormat = '#0.0'
                Properties.EditFormat = '#0.0'
                Properties.SpinButtons.Visible = False
                Properties.ValueType = vtFloat
                TabOrder = 4
                Width = 30
              end
              object cxLabel121: TcxLabel
                Left = 105
                Top = 3
                Caption = 'mm'
                Transparent = True
              end
              object cxLabel122: TcxLabel
                Left = 161
                Top = 3
                Caption = 'cc'
                Transparent = True
              end
              object cbLeftAdnexalAppearance2: TcxComboBox
                Left = 175
                Top = 1
                Properties.Items.Strings = (
                  ''
                  'fimbrial cyst'
                  'hydrosalpinx'
                  'loculated fluid'
                  'other')
                TabOrder = 5
                Width = 90
              end
            end
            object gbLeftCyst3: TcxGroupBox
              Left = 270
              Top = 67
              PanelStyle.Active = True
              Style.BorderStyle = ebsNone
              TabOrder = 13
              Height = 24
              Width = 273
              object seLeftAdnexalLength3: TcxSpinEdit
                Left = 0
                Top = 1
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                TabOrder = 1
                Width = 30
              end
              object cxLabel127: TcxLabel
                Left = 29
                Top = 3
                Caption = 'x'
                Transparent = True
              end
              object seLeftAdnexalWidth3: TcxSpinEdit
                Left = 38
                Top = 1
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                TabOrder = 2
                Width = 30
              end
              object cxLabel128: TcxLabel
                Left = 67
                Top = 3
                Caption = 'x'
                Transparent = True
              end
              object seLeftAdnexalDepth3: TcxSpinEdit
                Left = 76
                Top = 1
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                TabOrder = 3
                Width = 30
              end
              object cxLabel129: TcxLabel
                Left = 105
                Top = 3
                Caption = 'mm'
                Transparent = True
              end
              object seLeftAdnexalVolume3: TcxSpinEdit
                Left = 133
                Top = 1
                Properties.AssignedValues.MinValue = True
                Properties.DisplayFormat = '#0.0'
                Properties.EditFormat = '#0.0'
                Properties.SpinButtons.Visible = False
                Properties.ValueType = vtFloat
                TabOrder = 4
                Width = 30
              end
              object cxLabel130: TcxLabel
                Left = 161
                Top = 3
                Caption = 'cc'
                Transparent = True
              end
              object cbLeftAdnexalAppearance3: TcxComboBox
                Left = 175
                Top = 1
                Properties.Items.Strings = (
                  ''
                  'fimbrial cyst'
                  'hydrosalpinx'
                  'loculated fluid'
                  'other')
                TabOrder = 5
                Width = 90
              end
            end
            object cbRightAdnexalMass: TcxCheckBox
              Left = 4
              Top = 2
              Caption = 'Right adnexal masses or cysts'
              TabOrder = 0
              Transparent = True
              Width = 171
            end
            object cbLeftAdnexalMass: TcxCheckBox
              Left = 266
              Top = 1
              Caption = 'Left adnexal masses or cysts'
              TabOrder = 9
              Transparent = True
              Width = 171
            end
            object gbBladder: TcxGroupBox
              Left = 9
              Top = 167
              Caption = 'Bladder'
              Style.BorderStyle = ebsNone
              Style.Edges = []
              Style.LookAndFeel.NativeStyle = True
              StyleDisabled.LookAndFeel.NativeStyle = True
              StyleFocused.LookAndFeel.NativeStyle = True
              StyleHot.LookAndFeel.NativeStyle = True
              TabOrder = 8
              Transparent = True
              Height = 39
              Width = 254
              object cbBladderNormal: TcxCheckBox
                Left = 2
                Top = 15
                Caption = 'Normal'
                TabOrder = 0
                Transparent = True
                Width = 64
              end
              object cbBladderAbnormal: TcxCheckBox
                Left = 90
                Top = 15
                Caption = 'Abnormal'
                TabOrder = 1
                Transparent = True
                Width = 102
              end
            end
          end
          object cxTabSheet4: TcxTabSheet
            Caption = 'Procedures'
            ImageIndex = 4
            object cbSalinehysterograph: TcxComboBox
              Left = 165
              Top = 5
              Properties.Items.Strings = (
                ''
                'Normal'
                'Endometrial polyp'
                'Two endometrial polyps'
                'Submucosal fibroid'
                '')
              TabOrder = 0
              Width = 136
            end
            object cxLabel104: TcxLabel
              Left = 11
              Top = 7
              Caption = 'Saline hysterography '
              Transparent = True
            end
            object cxLabel155: TcxLabel
              Left = 11
              Top = 218
              Caption = 'Tubal patency test-Saline  '
              Transparent = True
              Visible = False
            end
            object cbTubalPatencyTestSaline: TcxComboBox
              Left = 165
              Top = 216
              Properties.Items.Strings = (
                ''
                'bilateral tubal patency'
                'right tube patent'
                'left tube patent'
                'unsuccessful cannulation'
                'bilateral tubal blockage')
              TabOrder = 10
              Visible = False
              Width = 136
            end
            object cxLabel156: TcxLabel
              Left = 11
              Top = 33
              Caption = 'Tubal Patency Test-Contrast'
              Transparent = True
            end
            object cbTubalPatencyTestLevovist: TcxComboBox
              Left = 165
              Top = 31
              Properties.Items.Strings = (
                ''
                'bilateral tubal patency'
                'right tube patent'
                'left tube patent'
                'unsuccessful cannulation'
                'bilateral tubal blockage')
              TabOrder = 2
              Width = 136
            end
            object cxLabel157: TcxLabel
              Left = 11
              Top = 76
              Caption = 'Right Ovarian cyst aspiration'
              Transparent = True
            end
            object cxLabel158: TcxLabel
              Left = 11
              Top = 99
              Caption = 'Left Ovarian cyst aspiration '
              Transparent = True
            end
            object cxLabel159: TcxLabel
              Left = 11
              Top = 122
              Caption = 'Ascites Drainage '
              Transparent = True
            end
            object seRightOvarianCystAspiration: TcxSpinEdit
              Left = 165
              Top = 74
              Properties.AssignedValues.MinValue = True
              Properties.DisplayFormat = '#0.0'
              Properties.EditFormat = '#0.0'
              Properties.SpinButtons.Visible = False
              Properties.ValueType = vtFloat
              TabOrder = 4
              Width = 30
            end
            object cxLabel160: TcxLabel
              Left = 201
              Top = 76
              Caption = 'ml'
              Transparent = True
            end
            object seLeftOvarianCystAspiration: TcxSpinEdit
              Left = 165
              Top = 97
              Properties.AssignedValues.MinValue = True
              Properties.DisplayFormat = '#0.0'
              Properties.EditFormat = '#0.0'
              Properties.SpinButtons.Visible = False
              Properties.ValueType = vtFloat
              TabOrder = 6
              Width = 30
            end
            object cxLabel161: TcxLabel
              Left = 201
              Top = 99
              Caption = 'ml'
              Transparent = True
            end
            object seAscitesDrainage: TcxSpinEdit
              Left = 165
              Top = 120
              Properties.AssignedValues.MinValue = True
              Properties.DisplayFormat = '#0.0'
              Properties.EditFormat = '#0.0'
              Properties.SpinButtons.Visible = False
              Properties.ValueType = vtFloat
              TabOrder = 8
              Width = 30
            end
            object cxLabel162: TcxLabel
              Left = 201
              Top = 122
              Caption = 'ml'
              Transparent = True
            end
            object cbSalinePerformed: TcxCheckBox
              Left = 307
              Top = 5
              Caption = 'Performed'
              TabOrder = 1
              Transparent = True
              Width = 90
            end
            object cbTubalPerformed: TcxCheckBox
              Left = 307
              Top = 216
              Caption = 'Performed'
              TabOrder = 11
              Transparent = True
              Visible = False
              Width = 90
            end
            object cbTubalLevovistPerformed: TcxCheckBox
              Left = 307
              Top = 31
              Caption = 'Performed'
              TabOrder = 3
              Transparent = True
              Width = 90
            end
            object cbRightCystAspirationPerf: TcxCheckBox
              Left = 221
              Top = 74
              Caption = 'Performed'
              TabOrder = 5
              Transparent = True
              Width = 90
            end
            object cbLeftCystAspirationPerf: TcxCheckBox
              Left = 221
              Top = 97
              Caption = 'Performed'
              TabOrder = 7
              Transparent = True
              Width = 90
            end
            object cbAscitesPerformed: TcxCheckBox
              Left = 221
              Top = 120
              Caption = 'Performed'
              TabOrder = 9
              Transparent = True
              Width = 90
            end
          end
          object tsCommentsAndDiagnosis: TcxTabSheet
            Tag = 1
            Caption = 'Comments and Diagnosis'
            ImageIndex = 3
            object reDiagnosisComments: TcxRichEdit
              Left = 0
              Top = 25
              Align = alClient
              ParentFont = False
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -13
              Style.Font.Name = 'Tahoma'
              Style.Font.Style = []
              Style.IsFontAssigned = True
              TabOrder = 1
              Height = 467
              Width = 888
            end
            object cxGroupBox1: TcxGroupBox
              Left = 0
              Top = 0
              Align = alTop
              PanelStyle.Active = True
              TabOrder = 0
              Height = 25
              Width = 888
              object cxLabel22: TcxLabel
                Left = 4
                Top = 4
                Caption = 'Primary diagnosis'
                Transparent = True
              end
              object cxLabel60: TcxLabel
                Left = 241
                Top = 4
                Caption = 'Secondary diagnosis'
                Transparent = True
              end
              object cbPrimaryDiagnosis: TcxComboBox
                Left = 93
                Top = 2
                Properties.DropDownRows = 20
                Properties.Items.Strings = (
                  ''
                  'NAD'
                  'Adenomyosis'
                  'Endometrial polyp'
                  'Endometrial hyperplasia/carcinoma'
                  'Endometrioma'
                  'Dermoid cyst'
                  'Fibroid(s)'
                  'Hydrosalpinx - unilateral'
                  'Hydrosalpinx - bilateral'
                  'IUCD correctly placed'
                  'IUCD incorrectly placed'
                  'IUS (Mirena) correctly placed'
                  'IUS (Mirena) incorrectly placed'
                  'Loculated fluid'
                  'Ovarian cyst - simple follicular cyst'
                  'Ovarian cyst - haemorrhagic follicular cyst'
                  'Ovarian cyst  - cystadenoma'
                  'Ovarian cyst  - cystadenocarcinoma'
                  'Ovarian cyst  - solid'
                  'Para ovarian cyst'
                  'Polycystic ovary - unilateral'
                  'Polycystic ovary - bilateral'
                  'Retained products of conception'
                  'Uterine venous malformation (UVM)'
                  'Uterus bicornuate'
                  'Uterus Didelphys'
                  'Uterus Septate'
                  'Uterus Subseptate')
                TabOrder = 0
                Width = 145
              end
              object cbSecondaryDiagnosis: TcxComboBox
                Left = 348
                Top = 2
                Properties.DropDownRows = 20
                Properties.Items.Strings = (
                  ''
                  'NAD'
                  'Adenomyosis'
                  'Endometrial polyp'
                  'Endometrial hyperplasia/carcinoma'
                  'Endometrioma'
                  'Dermoid cyst'
                  'Fibroid(s)'
                  'Hydrosalpinx - unilateral'
                  'Hydrosalpinx - bilateral'
                  'IUCD correctly placed'
                  'IUCD incorrectly placed'
                  'IUS (Mirena) correctly placed'
                  'IUS (Mirena) incorrectly placed'
                  'Loculated fluid'
                  'Ovarian cyst - simple follicular cyst'
                  'Ovarian cyst - haemorrhagic follicular cyst'
                  'Ovarian cyst  - cystadenoma'
                  'Ovarian cyst  - cystadenocarcinoma'
                  'Ovarian cyst  - solid'
                  'Para ovarian cyst'
                  'Polycystic ovary - unilateral'
                  'Polycystic ovary - bilateral'
                  'Retained products of conception'
                  'Uterine venous malformation (UVM)'
                  'Uterus bicornuate'
                  'Uterus Didelphys'
                  'Uterus Septate'
                  'Uterus Subseptate')
                TabOrder = 1
                Width = 145
              end
            end
          end
        end
        object cbRightOvaryCystType: TcxComboBox
          Left = 790
          Top = 662
          Properties.DropDownRows = 25
          Properties.Items.Strings = (
            ''
            'Simple cyst '
            'Haemorrhagic cyst < 20mm'
            'Haemorrhagic cyst'
            'Endometrioma '
            'Dermoid cyst'
            'Dermoid plug'
            'Other'
            '')
          TabOrder = 2
          Visible = False
          Width = 102
        end
      end
    end
  end
end