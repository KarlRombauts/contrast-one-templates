inherited Gynae: TGynae
  Width = 1225
  Height = 700
  Align = alClient
  inherited cxpcReportMainPage: TcxPageControl
    Width = 1225
    Height = 700
    Properties.ActivePage = tsForm
    Properties.CustomButtons.Buttons = <>
    ClientRectBottom = 700
    ClientRectRight = 1225
    ClientRectTop = 24
    object tsForm: TcxTabSheet
      Caption = 'Form'
      ImageIndex = 1
      object pcReportBody: TcxPageControl
        Left = 0
        Top = 0
        Width = 1225
        Height = 676
        Align = alClient
        TabOrder = 0
        Properties.ActivePage = tsPatientDetails
        Properties.CustomButtons.Buttons = <>
        ClientRectBottom = 676
        ClientRectRight = 1225
        ClientRectTop = 24

        object tsPatientDetails: TcxTabSheet
          Caption = 'Details'
          ImageIndex = 1
          object lcPatientDetails: TdxLayoutControl
            Left = 0
            Top = 0
            Width = 1225
            Height = 652
            Align = alClient
            TabOrder = 0
            AutoSize = True
            LayoutLookAndFeel = dxLayoutSkinLookAndFeel1

            object chkTransabdominal: TcxCheckBox
              Left = 10000
              Top = 10000
              Caption = 'Transabdominal'
              TabOrder = 0
              Transparent = True
              Width = 120
            end
            object chkTransvaginal: TcxCheckBox
              Left = 10000
              Top = 10000
              Caption = 'Transvaginal'
              TabOrder = 1
              Transparent = True
              Width = 105
            end
            object chkPainWithProbe: TcxCheckBox
              Left = 10000
              Top = 10000
              Caption = 'Pain with probe insertion'
              Enabled = False
              TabOrder = 2
              Transparent = True
              Width = 180
            end
            object chkIncompleteReport: TcxCheckBox
              Left = 10000
              Top = 10000
              Caption = 'Incomplete report'
              TabOrder = 3
              Transparent = True
              Width = 130
            end
            object deExamDate: TcxDateEdit
              Left = 10000
              Top = 10000
              Properties.ImmediatePost = True
              Properties.ShowTime = False
              TabOrder = 4
              Width = 121
            end
            object deLMPDate: TcxDateEdit
              Left = 10000
              Top = 10000
              Properties.ImmediatePost = True
              Properties.ShowTime = False
              TabOrder = 5
              Width = 121
            end
            object chkLMPUnknown: TcxCheckBox
              Left = 10000
              Top = 10000
              Caption = 'LMP unknown'
              TabOrder = 6
              Transparent = True
              Width = 104
            end
            object chkAmenorrhoea: TcxCheckBox
              Left = 10000
              Top = 10000
              Caption = 'Amenorrhoea'
              TabOrder = 7
              Transparent = True
              Width = 104
            end
            object chkPostMenopausal: TcxCheckBox
              Left = 10000
              Top = 10000
              Caption = 'Postmenopausal'
              TabOrder = 8
              Transparent = True
              Width = 120
            end
            object seStartDay: TcxSpinEdit
              Left = 10000
              Top = 10000
              Properties.AssignedValues.MinValue = True
              Properties.MaxValue = 45.000000000000000000
              TabOrder = 9
              Width = 41
            end
            object seCycleMinDays: TcxSpinEdit
              Left = 10000
              Top = 10000
              Properties.MaxValue = 45.000000000000000000
              Properties.MinValue = 1.000000000000000000
              TabOrder = 10
              Value = 28
              Width = 41
            end
            object edtG: TcxSpinEdit
              Left = 10000
              Top = 10000
              Properties.AssignedValues.MinValue = True
              Properties.MaxValue = 20.000000000000000000
              TabOrder = 11
              Width = 35
            end
            object edtP: TcxSpinEdit
              Left = 10000
              Top = 10000
              Properties.AssignedValues.MinValue = True
              Properties.MaxValue = 20.000000000000000000
              TabOrder = 12
              Width = 35
            end
            object ccbMedication: TcxCheckComboBox
              Left = 10000
              Top = 10000
              Properties.DropDownRows = 15
              Properties.Items = <
                item
                  Description = 'Oral contraceptive pill'
                  ShortDescription = 'OCP'
                end
                item
                  Description = 'Progesterone only pill'
                  ShortDescription = 'POP'
                end
                item
                  Description = 'Implanon'
                  ShortDescription = 'Implanon'
                end
                item
                  Description = 'IUS (Mirena)'
                  ShortDescription = 'Mirena'
                end
                item
                  Description = 'Tamoxifen'
                  ShortDescription = 'Tamoxifen'
                end
                item
                  Description = 'GnRH agonist (Zoladex)'
                  ShortDescription = 'GnRH agonist'
                end
                item
                  Description = 'HRT'
                  ShortDescription = 'HRT'
                end
                item
                  Description = 'Ovarian stimulation'
                  ShortDescription = 'Ovarian stim'
                end
                item
                  Description = 'Other'
                  ShortDescription = 'Other'
                end>
              TabOrder = 13
              Width = 200
            end
            object edtOtherMedication: TcxTextEdit
              Left = 10000
              Top = 10000
              Enabled = False
              TabOrder = 14
              Width = 200
            end
            object ccbReferralIndication: TcxCheckComboBox
              Left = 10000
              Top = 10000
              Properties.DropDownRows = 20
              Properties.Items = <
                item
                  Description = 'Pelvic pain'
                  ShortDescription = 'Pelvic pain'
                end
                item
                  Description = 'Dysmenorrhoea'
                  ShortDescription = 'Dysmenorrhoea'
                end
                item
                  Description = 'Dyspareunia'
                  ShortDescription = 'Dyspareunia'
                end
                item
                  Description = 'Dyschezia'
                  ShortDescription = 'Dyschezia'
                end
                item
                  Description = 'Abnormal bleeding'
                  ShortDescription = 'Abnormal bleeding'
                end
                item
                  Description = 'Postmenopausal bleeding'
                  ShortDescription = 'PMB'
                end
                item
                  Description = 'Fertility assessment'
                  ShortDescription = 'Fertility'
                end
                item
                  Description = 'Ovarian cyst follow-up'
                  ShortDescription = 'Cyst F/U'
                end
                item
                  Description = 'Endometriosis assessment'
                  ShortDescription = 'Endometriosis'
                end
                item
                  Description = 'Fibroid assessment'
                  ShortDescription = 'Fibroids'
                end
                item
                  Description = 'IUD check'
                  ShortDescription = 'IUD check'
                end
                item
                  Description = 'RPOC assessment'
                  ShortDescription = 'RPOC'
                end
                item
                  Description = 'Other'
                  ShortDescription = 'Other'
                end>
              TabOrder = 15
              Width = 200
            end
            object ccbClinicalHistory: TcxCheckComboBox
              Left = 10000
              Top = 10000
              Properties.DropDownRows = 20
              Properties.Items = <
                item
                  Description = 'Endometriosis'
                  ShortDescription = 'Endometriosis'
                end
                item
                  Description = 'PCOS'
                  ShortDescription = 'PCOS'
                end
                item
                  Description = 'Fibroids'
                  ShortDescription = 'Fibroids'
                end
                item
                  Description = 'Previous ovarian cyst'
                  ShortDescription = 'Prev cyst'
                end
                item
                  Description = 'Infertility'
                  ShortDescription = 'Infertility'
                end
                item
                  Description = 'Recurrent miscarriage'
                  ShortDescription = 'Recurrent MC'
                end
                item
                  Description = 'Other'
                  ShortDescription = 'Other'
                end>
              TabOrder = 16
              Width = 200
            end
            object ccbPastSurgery: TcxCheckComboBox
              Left = 10000
              Top = 10000
              Properties.DropDownRows = 15
              Properties.Items = <
                item
                  Description = 'Hysterectomy'
                  ShortDescription = 'Hysterectomy'
                end
                item
                  Description = 'Oophorectomy'
                  ShortDescription = 'Oophorectomy'
                end
                item
                  Description = 'Salpingectomy'
                  ShortDescription = 'Salpingectomy'
                end
                item
                  Description = 'Endometrial ablation'
                  ShortDescription = 'Ablation'
                end
                item
                  Description = 'Myomectomy'
                  ShortDescription = 'Myomectomy'
                end
                item
                  Description = 'Caesarean section'
                  ShortDescription = 'CS'
                end
                item
                  Description = 'Laparoscopy for endometriosis'
                  ShortDescription = 'Lap for endo'
                end
                item
                  Description = 'Other'
                  ShortDescription = 'Other'
                end>
              TabOrder = 17
              Width = 200
            end
            object seLaparoscopyCount: TcxSpinEdit
              Left = 10000
              Top = 10000
              Properties.AssignedValues.MinValue = True
              Properties.MaxValue = 20.000000000000000000
              Properties.MinValue = 1.000000000000000000
              TabOrder = 18
              Width = 35
            end
            object seLaparoscopyYear: TcxSpinEdit
              Left = 10000
              Top = 10000
              Properties.MaxValue = 2040.000000000000000000
              Properties.MinValue = 1980.000000000000000000
              TabOrder = 19
              Width = 50
            end
            object lblVersion: TcxLabel
              Left = 10000
              Top = 10000
              Caption = 'v3.0 Gynae'
              Transparent = True
            end

            object lcPatientDetailsGroup_Root: TdxLayoutGroup
              AlignHorz = ahClient
              AlignVert = avTop
              ButtonOptions.Buttons = <>
              Hidden = True
              LayoutDirection = ldVertical
              ShowBorder = False

              object lgScanType: TdxLayoutGroup
                CaptionOptions.Text = 'Scan Type'
                CaptionOptions.Visible = True
                ButtonOptions.Buttons = <>
                LayoutDirection = ldHorizontal
                ShowBorder = True
                object liTransabdominal: TdxLayoutItem
                  CaptionOptions.Visible = False
                  Control = chkTransabdominal
                  ControlOptions.ShowBorder = False
                end
                object liTransvaginal: TdxLayoutItem
                  CaptionOptions.Visible = False
                  Control = chkTransvaginal
                  ControlOptions.ShowBorder = False
                end
                object liPainWithProbe: TdxLayoutItem
                  CaptionOptions.Visible = False
                  Control = chkPainWithProbe
                  ControlOptions.ShowBorder = False
                end
                object liIncomplete: TdxLayoutItem
                  CaptionOptions.Visible = False
                  Control = chkIncompleteReport
                  ControlOptions.ShowBorder = False
                end
              end

              object lgPatientInfo: TdxLayoutGroup
                CaptionOptions.Text = 'Patient Information'
                CaptionOptions.Visible = True
                ButtonOptions.Buttons = <>
                ShowBorder = True
                object liExamDate: TdxLayoutItem
                  CaptionOptions.Text = 'Exam date'
                  Control = deExamDate
                  ControlOptions.ShowBorder = False
                end
                object lgLMP: TdxLayoutGroup
                  CaptionOptions.Visible = False
                  ButtonOptions.Buttons = <>
                  LayoutDirection = ldHorizontal
                  ShowBorder = False
                  object liLMPDate: TdxLayoutItem
                    CaptionOptions.Text = 'LMP date'
                    Control = deLMPDate
                    ControlOptions.ShowBorder = False
                  end
                  object liLMPUnknown: TdxLayoutItem
                    CaptionOptions.Visible = False
                    Control = chkLMPUnknown
                    ControlOptions.ShowBorder = False
                  end
                  object liAmenorrhoea: TdxLayoutItem
                    CaptionOptions.Visible = False
                    Control = chkAmenorrhoea
                    ControlOptions.ShowBorder = False
                  end
                  object liPostMenopausal: TdxLayoutItem
                    CaptionOptions.Visible = False
                    Control = chkPostMenopausal
                    ControlOptions.ShowBorder = False
                  end
                end
                object lgCycle: TdxLayoutGroup
                  CaptionOptions.Visible = False
                  ButtonOptions.Buttons = <>
                  LayoutDirection = ldHorizontal
                  ShowBorder = False
                  object liStartDay: TdxLayoutItem
                    CaptionOptions.Text = 'Day'
                    Control = seStartDay
                    ControlOptions.ShowBorder = False
                  end
                  object liCycleOf: TdxLayoutLabeledItem
                    CaptionOptions.Text = 'of'
                  end
                  object liCycleMin: TdxLayoutItem
                    CaptionOptions.Visible = False
                    Control = seCycleMinDays
                    ControlOptions.ShowBorder = False
                  end
                  object liCycleDays: TdxLayoutLabeledItem
                    CaptionOptions.Text = 'day cycle'
                  end
                end
                object lgGP: TdxLayoutGroup
                  CaptionOptions.Visible = False
                  ButtonOptions.Buttons = <>
                  LayoutDirection = ldHorizontal
                  ShowBorder = False
                  object liG: TdxLayoutItem
                    CaptionOptions.Text = 'G'
                    Control = edtG
                    ControlOptions.ShowBorder = False
                  end
                  object liP: TdxLayoutItem
                    CaptionOptions.Text = 'P'
                    Control = edtP
                    ControlOptions.ShowBorder = False
                  end
                end
              end

              object lgClinical: TdxLayoutGroup
                CaptionOptions.Text = 'Clinical'
                CaptionOptions.Visible = True
                ButtonOptions.Buttons = <>
                ShowBorder = True
                object lgMedRow: TdxLayoutGroup
                  CaptionOptions.Visible = False
                  ButtonOptions.Buttons = <>
                  LayoutDirection = ldHorizontal
                  ShowBorder = False
                  object liMedication: TdxLayoutItem
                    CaptionOptions.Text = 'Medication'
                    Control = ccbMedication
                    ControlOptions.ShowBorder = False
                  end
                  object liOtherMed: TdxLayoutItem
                    CaptionOptions.Visible = False
                    Control = edtOtherMedication
                    ControlOptions.ShowBorder = False
                  end
                end
                object liReferral: TdxLayoutItem
                  CaptionOptions.Text = 'Referral indication'
                  Control = ccbReferralIndication
                  ControlOptions.ShowBorder = False
                end
                object liHistory: TdxLayoutItem
                  CaptionOptions.Text = 'Gynae history'
                  Control = ccbClinicalHistory
                  ControlOptions.ShowBorder = False
                end
              end

              object lgSurgery: TdxLayoutGroup
                CaptionOptions.Text = 'Surgery'
                CaptionOptions.Visible = True
                ButtonOptions.Buttons = <>
                ShowBorder = True
                object liSurgery: TdxLayoutItem
                  CaptionOptions.Text = 'Gynae surgery'
                  Control = ccbPastSurgery
                  ControlOptions.ShowBorder = False
                end
                object lgLaparoscopy: TdxLayoutGroup
                  CaptionOptions.Visible = False
                  ButtonOptions.Buttons = <>
                  LayoutDirection = ldHorizontal
                  ShowBorder = False
                  Visible = False
                  object liLapCount: TdxLayoutItem
                    CaptionOptions.Text = 'How many'
                    Control = seLaparoscopyCount
                    ControlOptions.ShowBorder = False
                  end
                  object liLapYear: TdxLayoutItem
                    CaptionOptions.Text = 'Year of last'
                    Control = seLaparoscopyYear
                    ControlOptions.ShowBorder = False
                  end
                end
              end

              object liVersion: TdxLayoutItem
                CaptionOptions.Visible = False
                Control = lblVersion
                ControlOptions.ShowBorder = False
              end
            end
          end
        end

          object tsUterus: TcxTabSheet
            Caption = 'Uterus'
            ImageIndex = 5
            object lcUterus: TdxLayoutControl
              Left = 0
              Top = 0
              Width = 888
              Height = 492
              Align = alClient
              TabOrder = 0
              AutoSize = True
              LayoutLookAndFeel = dxLayoutSkinLookAndFeel1

              object cmbUterusPosition: TcxComboBox
                Left = 10000
                Top = 10000
                Properties.DropDownListStyle = lsFixedList
                Properties.Items.Strings = (
                  ''
                  'anteverted'
                  'retroverted'
                  'axial'
                  'anteflexed'
                  'retroflexed')
                TabOrder = 0
                Width = 120
              end
              object seUterusLength: TcxSpinEdit
                Left = 10000
                Top = 10000
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                Properties.DisplayFormat = '#0.0'
                Properties.EditFormat = '#0.0'
                Properties.ValueType = vtFloat
                Enabled = False
                TabOrder = 0
                Width = 35
              end
              object seUterusWidth: TcxSpinEdit
                Left = 10000
                Top = 10000
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                Properties.DisplayFormat = '#0.0'
                Properties.EditFormat = '#0.0'
                Properties.ValueType = vtFloat
                Enabled = False
                TabOrder = 0
                Width = 35
              end
              object seUterusHeight: TcxSpinEdit
                Left = 10000
                Top = 10000
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                Properties.DisplayFormat = '#0.0'
                Properties.EditFormat = '#0.0'
                Properties.ValueType = vtFloat
                Enabled = False
                TabOrder = 0
                Width = 35
              end
              object seUterusVolume: TcxSpinEdit
                Left = 10000
                Top = 10000
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                Properties.DisplayFormat = '#0.0'
                Properties.EditFormat = '#0.0'
                Properties.ValueType = vtFloat
                Enabled = False
                TabOrder = 0
                Width = 35
              end
              object lblUterusSizeClass: TcxLabel
                Left = 10000
                Top = 10000
                Caption = ''
                Transparent = True
              end
              object chkHysterectomy: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Hysterectomy'
                TabOrder = 0
                Transparent = True
                Width = 110
              end
              object chkCervixPresent: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Cervix present'
                TabOrder = 0
                Transparent = True
                Width = 110
              end
              object chkCongenitalAbnormality: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Congenital abnormality'
                TabOrder = 0
                Transparent = True
                Width = 170
              end
              object cmbCongenitalType: TcxComboBox
                Left = 10000
                Top = 10000
                Properties.DropDownListStyle = lsFixedList
                Properties.Items.Strings = (
                  ''
                  'Arcuate'
                  'Septate'
                  'Subseptate'
                  'Bicornuate'
                  'Unicornuate'
                  'Didelphys'
                  'T-shaped'
                  'Hypoplastic'
                  'Aplastic')
                TabOrder = 0
                Width = 120
              end
              object seSeptumLength: TcxSpinEdit
                Left = 10000
                Top = 10000
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                Properties.DisplayFormat = '#0.0'
                Properties.EditFormat = '#0.0'
                Properties.ValueType = vtFloat
                TabOrder = 0
                Width = 35
              end
              object seSeptumWidth: TcxSpinEdit
                Left = 10000
                Top = 10000
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                Properties.DisplayFormat = '#0.0'
                Properties.EditFormat = '#0.0'
                Properties.ValueType = vtFloat
                TabOrder = 0
                Width = 35
              end
              object chkLSCSScar: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'LSCS scar identified'
                TabOrder = 0
                Transparent = True
                Width = 160
              end
              object chkAdenomyosis: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Adenomyosis present'
                TabOrder = 0
                Transparent = True
                Width = 160
              end
              object rbAdenoDiffuse: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Diffuse'
                TabOrder = 0
                Transparent = True
                Width = 80
              end
              object rbAdenoFocal: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Focal'
                TabOrder = 0
                Transparent = True
                Width = 60
              end
              object chkInfiltratingSerosa: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Infiltrating through serosa'
                Enabled = False
                TabOrder = 0
                Transparent = True
                Width = 195
              end
              object chkIrregularJunctionalZone: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Irregular junctional zone'
                TabOrder = 0
                Transparent = True
                Width = 180
              end
              object cmbAdenomyosisSeverity: TcxComboBox
                Left = 10000
                Top = 10000
                Properties.DropDownListStyle = lsFixedList
                Properties.Items.Strings = (
                  ''
                  'mild'
                  'moderate'
                  'severe')
                TabOrder = 0
                Width = 100
              end
              object chkEndometrialBuds: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Endometrial buds'
                TabOrder = 0
                Transparent = True
                Width = 130
              end
              object chkEndometrialIslets: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Endometrial islets'
                TabOrder = 0
                Transparent = True
                Width = 130
              end
              object chkMyometrialCysts: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Myometrial cysts'
                TabOrder = 0
                Transparent = True
                Width = 120
              end
              object chkVenetianBlind: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Venetian blind shadowing'
                TabOrder = 0
                Transparent = True
                Width = 180
              end
              object chkPriorAblation: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Prior ablation effects'
                TabOrder = 0
                Transparent = True
                Width = 160
              end
              object chkFibroidsPresent: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Fibroids present'
                TabOrder = 0
                Transparent = True
                Width = 120
              end
              object seFibroidCount: TcxSpinEdit
                Left = 10000
                Top = 10000
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                TabOrder = 0
                Width = 35
              end




              object gbFibroidTable: TcxGroupBox
                Left = 10000
                Top = 10000
                PanelStyle.Active = True
                Style.BorderStyle = ebsNone
                Style.Edges = []
                TabOrder = 0
                Transparent = True
                Height = 48
                Width = 620
                object lblFibHdrIdx: TcxLabel
                  Left = 7
                  Top = 1
                  Caption = '#'
                  ParentFont = False
                  Style.Font.Style = [fsBold]
                  Style.IsFontAssigned = True
                  Transparent = True
                end
                object lblFibHdrSide: TcxLabel
                  Left = 27
                  Top = 1
                  Caption = 'Side'
                  ParentFont = False
                  Style.Font.Style = [fsBold]
                  Style.IsFontAssigned = True
                  Transparent = True
                end
                object lblFibHdrPos: TcxLabel
                  Left = 112
                  Top = 1
                  Caption = 'Position'
                  ParentFont = False
                  Style.Font.Style = [fsBold]
                  Style.IsFontAssigned = True
                  Transparent = True
                end
                object lblFibHdrType: TcxLabel
                  Left = 207
                  Top = 1
                  Caption = 'Type'
                  ParentFont = False
                  Style.Font.Style = [fsBold]
                  Style.IsFontAssigned = True
                  Transparent = True
                end
                object lblFibHdrDims: TcxLabel
                  Left = 322
                  Top = 1
                  Caption = 'Dimensions'
                  ParentFont = False
                  Style.Font.Style = [fsBold]
                  Style.IsFontAssigned = True
                  Transparent = True
                end
                object lblFibHdrCav: TcxLabel
                  Left = 482
                  Top = 1
                  Caption = 'Cavity'
                  ParentFont = False
                  Style.Font.Style = [fsBold]
                  Style.IsFontAssigned = True
                  Transparent = True
                end
                object gbFibRow1: TcxGroupBox
                  Left = 2
                  Top = 20
                  Style.BorderStyle = ebsNone
                  Style.Edges = []
                  ParentBackground = True
                  TabOrder = 1
                  Height = 24
                  Width = 620
                  object lblFibIdx1: TcxLabel
                    Left = 5
                    Top = 3
                    Caption = '#1'
                    Transparent = True
                  end
                  object cmbFibroidSide1: TcxComboBox
                    Left = 25
                    Top = 1
                    Properties.DropDownListStyle = lsFixedList
                    Properties.Items.Strings = (
                      ''
                      'Left'
                      'Right'
                      'Fundal')
                    TabOrder = 0
                    Width = 80
                  end
                  object cmbFibroidPosition1: TcxComboBox
                    Left = 110
                    Top = 1
                    Properties.DropDownListStyle = lsFixedList
                    Properties.Items.Strings = (
                      ''
                      'anterior'
                      'posterior'
                      'lateral'
                      'cervical')
                    TabOrder = 1
                    Width = 90
                  end
                  object cmbFibroidType1: TcxComboBox
                    Left = 205
                    Top = 1
                    Properties.DropDownListStyle = lsFixedList
                    Properties.Items.Strings = (
                      ''
                      'intramural'
                      'subserosal'
                      'submucosal'
                      'pedunculated')
                    TabOrder = 2
                    Width = 110
                  end
                  object seFibroidLength1: TcxSpinEdit
                    Left = 320
                    Top = 1
                    Properties.AssignedValues.MinValue = True
                    Properties.SpinButtons.Visible = False
                    TabOrder = 3
                    Width = 35
                  end
                  object lblFibx1a: TcxLabel
                    Left = 357
                    Top = 3
                    Caption = 'x'
                    Transparent = True
                  end
                  object seFibroidWidth1: TcxSpinEdit
                    Left = 367
                    Top = 1
                    Properties.AssignedValues.MinValue = True
                    Properties.SpinButtons.Visible = False
                    TabOrder = 4
                    Width = 35
                  end
                  object lblFibx1b: TcxLabel
                    Left = 404
                    Top = 3
                    Caption = 'x'
                    Transparent = True
                  end
                  object seFibroidDepth1: TcxSpinEdit
                    Left = 414
                    Top = 1
                    Properties.AssignedValues.MinValue = True
                    Properties.SpinButtons.Visible = False
                    TabOrder = 5
                    Width = 35
                  end
                  object lblFibmm1: TcxLabel
                    Left = 451
                    Top = 3
                    Caption = 'mm'
                    Transparent = True
                  end
                  object chkCavityDistortion1: TcxCheckBox
                    Left = 480
                    Top = 1
                    Caption = 'Yes'
                    TabOrder = 6
                    Transparent = True
                    Width = 50
                  end
                end
                object gbFibRow2: TcxGroupBox
                  Left = 2
                  Top = 44
                  Style.BorderStyle = ebsNone
                  Style.Edges = []
                  Color = 15790320
                  ParentColor = False
                  TabOrder = 2
                  Visible = False
                  Height = 24
                  Width = 620
                  object lblFibIdx2: TcxLabel
                    Left = 5
                    Top = 3
                    Caption = '#2'
                    Transparent = True
                  end
                  object cmbFibroidSide2: TcxComboBox
                    Left = 25
                    Top = 1
                    Properties.DropDownListStyle = lsFixedList
                    Properties.Items.Strings = (
                      ''
                      'Left'
                      'Right'
                      'Fundal')
                    TabOrder = 0
                    Width = 80
                  end
                  object cmbFibroidPosition2: TcxComboBox
                    Left = 110
                    Top = 1
                    Properties.DropDownListStyle = lsFixedList
                    Properties.Items.Strings = (
                      ''
                      'anterior'
                      'posterior'
                      'lateral'
                      'cervical')
                    TabOrder = 1
                    Width = 90
                  end
                  object cmbFibroidType2: TcxComboBox
                    Left = 205
                    Top = 1
                    Properties.DropDownListStyle = lsFixedList
                    Properties.Items.Strings = (
                      ''
                      'intramural'
                      'subserosal'
                      'submucosal'
                      'pedunculated')
                    TabOrder = 2
                    Width = 110
                  end
                  object seFibroidLength2: TcxSpinEdit
                    Left = 320
                    Top = 1
                    Properties.AssignedValues.MinValue = True
                    Properties.SpinButtons.Visible = False
                    TabOrder = 3
                    Width = 35
                  end
                  object lblFibx2a: TcxLabel
                    Left = 357
                    Top = 3
                    Caption = 'x'
                    Transparent = True
                  end
                  object seFibroidWidth2: TcxSpinEdit
                    Left = 367
                    Top = 1
                    Properties.AssignedValues.MinValue = True
                    Properties.SpinButtons.Visible = False
                    TabOrder = 4
                    Width = 35
                  end
                  object lblFibx2b: TcxLabel
                    Left = 404
                    Top = 3
                    Caption = 'x'
                    Transparent = True
                  end
                  object seFibroidDepth2: TcxSpinEdit
                    Left = 414
                    Top = 1
                    Properties.AssignedValues.MinValue = True
                    Properties.SpinButtons.Visible = False
                    TabOrder = 5
                    Width = 35
                  end
                  object lblFibmm2: TcxLabel
                    Left = 451
                    Top = 3
                    Caption = 'mm'
                    Transparent = True
                  end
                  object chkCavityDistortion2: TcxCheckBox
                    Left = 480
                    Top = 1
                    Caption = 'Yes'
                    TabOrder = 6
                    Transparent = True
                    Width = 50
                  end
                end
                object gbFibRow3: TcxGroupBox
                  Left = 2
                  Top = 68
                  Style.BorderStyle = ebsNone
                  Style.Edges = []
                  ParentBackground = True
                  TabOrder = 3
                  Visible = False
                  Height = 24
                  Width = 620
                  object lblFibIdx3: TcxLabel
                    Left = 5
                    Top = 3
                    Caption = '#3'
                    Transparent = True
                  end
                  object cmbFibroidSide3: TcxComboBox
                    Left = 25
                    Top = 1
                    Properties.DropDownListStyle = lsFixedList
                    Properties.Items.Strings = (
                      ''
                      'Left'
                      'Right'
                      'Fundal')
                    TabOrder = 0
                    Width = 80
                  end
                  object cmbFibroidPosition3: TcxComboBox
                    Left = 110
                    Top = 1
                    Properties.DropDownListStyle = lsFixedList
                    Properties.Items.Strings = (
                      ''
                      'anterior'
                      'posterior'
                      'lateral'
                      'cervical')
                    TabOrder = 1
                    Width = 90
                  end
                  object cmbFibroidType3: TcxComboBox
                    Left = 205
                    Top = 1
                    Properties.DropDownListStyle = lsFixedList
                    Properties.Items.Strings = (
                      ''
                      'intramural'
                      'subserosal'
                      'submucosal'
                      'pedunculated')
                    TabOrder = 2
                    Width = 110
                  end
                  object seFibroidLength3: TcxSpinEdit
                    Left = 320
                    Top = 1
                    Properties.AssignedValues.MinValue = True
                    Properties.SpinButtons.Visible = False
                    TabOrder = 3
                    Width = 35
                  end
                  object lblFibx3a: TcxLabel
                    Left = 357
                    Top = 3
                    Caption = 'x'
                    Transparent = True
                  end
                  object seFibroidWidth3: TcxSpinEdit
                    Left = 367
                    Top = 1
                    Properties.AssignedValues.MinValue = True
                    Properties.SpinButtons.Visible = False
                    TabOrder = 4
                    Width = 35
                  end
                  object lblFibx3b: TcxLabel
                    Left = 404
                    Top = 3
                    Caption = 'x'
                    Transparent = True
                  end
                  object seFibroidDepth3: TcxSpinEdit
                    Left = 414
                    Top = 1
                    Properties.AssignedValues.MinValue = True
                    Properties.SpinButtons.Visible = False
                    TabOrder = 5
                    Width = 35
                  end
                  object lblFibmm3: TcxLabel
                    Left = 451
                    Top = 3
                    Caption = 'mm'
                    Transparent = True
                  end
                  object chkCavityDistortion3: TcxCheckBox
                    Left = 480
                    Top = 1
                    Caption = 'Yes'
                    TabOrder = 6
                    Transparent = True
                    Width = 50
                  end
                end
                object gbFibRow4: TcxGroupBox
                  Left = 2
                  Top = 92
                  Style.BorderStyle = ebsNone
                  Style.Edges = []
                  Color = 15790320
                  ParentColor = False
                  TabOrder = 4
                  Visible = False
                  Height = 24
                  Width = 620
                  object lblFibIdx4: TcxLabel
                    Left = 5
                    Top = 3
                    Caption = '#4'
                    Transparent = True
                  end
                  object cmbFibroidSide4: TcxComboBox
                    Left = 25
                    Top = 1
                    Properties.DropDownListStyle = lsFixedList
                    Properties.Items.Strings = (
                      ''
                      'Left'
                      'Right'
                      'Fundal')
                    TabOrder = 0
                    Width = 80
                  end
                  object cmbFibroidPosition4: TcxComboBox
                    Left = 110
                    Top = 1
                    Properties.DropDownListStyle = lsFixedList
                    Properties.Items.Strings = (
                      ''
                      'anterior'
                      'posterior'
                      'lateral'
                      'cervical')
                    TabOrder = 1
                    Width = 90
                  end
                  object cmbFibroidType4: TcxComboBox
                    Left = 205
                    Top = 1
                    Properties.DropDownListStyle = lsFixedList
                    Properties.Items.Strings = (
                      ''
                      'intramural'
                      'subserosal'
                      'submucosal'
                      'pedunculated')
                    TabOrder = 2
                    Width = 110
                  end
                  object seFibroidLength4: TcxSpinEdit
                    Left = 320
                    Top = 1
                    Properties.AssignedValues.MinValue = True
                    Properties.SpinButtons.Visible = False
                    TabOrder = 3
                    Width = 35
                  end
                  object lblFibx4a: TcxLabel
                    Left = 357
                    Top = 3
                    Caption = 'x'
                    Transparent = True
                  end
                  object seFibroidWidth4: TcxSpinEdit
                    Left = 367
                    Top = 1
                    Properties.AssignedValues.MinValue = True
                    Properties.SpinButtons.Visible = False
                    TabOrder = 4
                    Width = 35
                  end
                  object lblFibx4b: TcxLabel
                    Left = 404
                    Top = 3
                    Caption = 'x'
                    Transparent = True
                  end
                  object seFibroidDepth4: TcxSpinEdit
                    Left = 414
                    Top = 1
                    Properties.AssignedValues.MinValue = True
                    Properties.SpinButtons.Visible = False
                    TabOrder = 5
                    Width = 35
                  end
                  object lblFibmm4: TcxLabel
                    Left = 451
                    Top = 3
                    Caption = 'mm'
                    Transparent = True
                  end
                  object chkCavityDistortion4: TcxCheckBox
                    Left = 480
                    Top = 1
                    Caption = 'Yes'
                    TabOrder = 6
                    Transparent = True
                    Width = 50
                  end
                end
                object gbFibRow5: TcxGroupBox
                  Left = 2
                  Top = 116
                  Style.BorderStyle = ebsNone
                  Style.Edges = []
                  ParentBackground = True
                  TabOrder = 5
                  Visible = False
                  Height = 24
                  Width = 620
                  object lblFibIdx5: TcxLabel
                    Left = 5
                    Top = 3
                    Caption = '#5'
                    Transparent = True
                  end
                  object cmbFibroidSide5: TcxComboBox
                    Left = 25
                    Top = 1
                    Properties.DropDownListStyle = lsFixedList
                    Properties.Items.Strings = (
                      ''
                      'Left'
                      'Right'
                      'Fundal')
                    TabOrder = 0
                    Width = 80
                  end
                  object cmbFibroidPosition5: TcxComboBox
                    Left = 110
                    Top = 1
                    Properties.DropDownListStyle = lsFixedList
                    Properties.Items.Strings = (
                      ''
                      'anterior'
                      'posterior'
                      'lateral'
                      'cervical')
                    TabOrder = 1
                    Width = 90
                  end
                  object cmbFibroidType5: TcxComboBox
                    Left = 205
                    Top = 1
                    Properties.DropDownListStyle = lsFixedList
                    Properties.Items.Strings = (
                      ''
                      'intramural'
                      'subserosal'
                      'submucosal'
                      'pedunculated')
                    TabOrder = 2
                    Width = 110
                  end
                  object seFibroidLength5: TcxSpinEdit
                    Left = 320
                    Top = 1
                    Properties.AssignedValues.MinValue = True
                    Properties.SpinButtons.Visible = False
                    TabOrder = 3
                    Width = 35
                  end
                  object lblFibx5a: TcxLabel
                    Left = 357
                    Top = 3
                    Caption = 'x'
                    Transparent = True
                  end
                  object seFibroidWidth5: TcxSpinEdit
                    Left = 367
                    Top = 1
                    Properties.AssignedValues.MinValue = True
                    Properties.SpinButtons.Visible = False
                    TabOrder = 4
                    Width = 35
                  end
                  object lblFibx5b: TcxLabel
                    Left = 404
                    Top = 3
                    Caption = 'x'
                    Transparent = True
                  end
                  object seFibroidDepth5: TcxSpinEdit
                    Left = 414
                    Top = 1
                    Properties.AssignedValues.MinValue = True
                    Properties.SpinButtons.Visible = False
                    TabOrder = 5
                    Width = 35
                  end
                  object lblFibmm5: TcxLabel
                    Left = 451
                    Top = 3
                    Caption = 'mm'
                    Transparent = True
                  end
                  object chkCavityDistortion5: TcxCheckBox
                    Left = 480
                    Top = 1
                    Caption = 'Yes'
                    TabOrder = 6
                    Transparent = True
                    Width = 50
                  end
                end
                object gbFibRow6: TcxGroupBox
                  Left = 2
                  Top = 140
                  Style.BorderStyle = ebsNone
                  Style.Edges = []
                  Color = 15790320
                  ParentColor = False
                  TabOrder = 6
                  Visible = False
                  Height = 24
                  Width = 620
                  object lblFibIdx6: TcxLabel
                    Left = 5
                    Top = 3
                    Caption = '#6'
                    Transparent = True
                  end
                  object cmbFibroidSide6: TcxComboBox
                    Left = 25
                    Top = 1
                    Properties.DropDownListStyle = lsFixedList
                    Properties.Items.Strings = (
                      ''
                      'Left'
                      'Right'
                      'Fundal')
                    TabOrder = 0
                    Width = 80
                  end
                  object cmbFibroidPosition6: TcxComboBox
                    Left = 110
                    Top = 1
                    Properties.DropDownListStyle = lsFixedList
                    Properties.Items.Strings = (
                      ''
                      'anterior'
                      'posterior'
                      'lateral'
                      'cervical')
                    TabOrder = 1
                    Width = 90
                  end
                  object cmbFibroidType6: TcxComboBox
                    Left = 205
                    Top = 1
                    Properties.DropDownListStyle = lsFixedList
                    Properties.Items.Strings = (
                      ''
                      'intramural'
                      'subserosal'
                      'submucosal'
                      'pedunculated')
                    TabOrder = 2
                    Width = 110
                  end
                  object seFibroidLength6: TcxSpinEdit
                    Left = 320
                    Top = 1
                    Properties.AssignedValues.MinValue = True
                    Properties.SpinButtons.Visible = False
                    TabOrder = 3
                    Width = 35
                  end
                  object lblFibx6a: TcxLabel
                    Left = 357
                    Top = 3
                    Caption = 'x'
                    Transparent = True
                  end
                  object seFibroidWidth6: TcxSpinEdit
                    Left = 367
                    Top = 1
                    Properties.AssignedValues.MinValue = True
                    Properties.SpinButtons.Visible = False
                    TabOrder = 4
                    Width = 35
                  end
                  object lblFibx6b: TcxLabel
                    Left = 404
                    Top = 3
                    Caption = 'x'
                    Transparent = True
                  end
                  object seFibroidDepth6: TcxSpinEdit
                    Left = 414
                    Top = 1
                    Properties.AssignedValues.MinValue = True
                    Properties.SpinButtons.Visible = False
                    TabOrder = 5
                    Width = 35
                  end
                  object lblFibmm6: TcxLabel
                    Left = 451
                    Top = 3
                    Caption = 'mm'
                    Transparent = True
                  end
                  object chkCavityDistortion6: TcxCheckBox
                    Left = 480
                    Top = 1
                    Caption = 'Yes'
                    TabOrder = 6
                    Transparent = True
                    Width = 50
                  end
                end
                object gbFibRow7: TcxGroupBox
                  Left = 2
                  Top = 164
                  Style.BorderStyle = ebsNone
                  Style.Edges = []
                  ParentBackground = True
                  TabOrder = 7
                  Visible = False
                  Height = 24
                  Width = 620
                  object lblFibIdx7: TcxLabel
                    Left = 5
                    Top = 3
                    Caption = '#7'
                    Transparent = True
                  end
                  object cmbFibroidSide7: TcxComboBox
                    Left = 25
                    Top = 1
                    Properties.DropDownListStyle = lsFixedList
                    Properties.Items.Strings = (
                      ''
                      'Left'
                      'Right'
                      'Fundal')
                    TabOrder = 0
                    Width = 80
                  end
                  object cmbFibroidPosition7: TcxComboBox
                    Left = 110
                    Top = 1
                    Properties.DropDownListStyle = lsFixedList
                    Properties.Items.Strings = (
                      ''
                      'anterior'
                      'posterior'
                      'lateral'
                      'cervical')
                    TabOrder = 1
                    Width = 90
                  end
                  object cmbFibroidType7: TcxComboBox
                    Left = 205
                    Top = 1
                    Properties.DropDownListStyle = lsFixedList
                    Properties.Items.Strings = (
                      ''
                      'intramural'
                      'subserosal'
                      'submucosal'
                      'pedunculated')
                    TabOrder = 2
                    Width = 110
                  end
                  object seFibroidLength7: TcxSpinEdit
                    Left = 320
                    Top = 1
                    Properties.AssignedValues.MinValue = True
                    Properties.SpinButtons.Visible = False
                    TabOrder = 3
                    Width = 35
                  end
                  object lblFibx7a: TcxLabel
                    Left = 357
                    Top = 3
                    Caption = 'x'
                    Transparent = True
                  end
                  object seFibroidWidth7: TcxSpinEdit
                    Left = 367
                    Top = 1
                    Properties.AssignedValues.MinValue = True
                    Properties.SpinButtons.Visible = False
                    TabOrder = 4
                    Width = 35
                  end
                  object lblFibx7b: TcxLabel
                    Left = 404
                    Top = 3
                    Caption = 'x'
                    Transparent = True
                  end
                  object seFibroidDepth7: TcxSpinEdit
                    Left = 414
                    Top = 1
                    Properties.AssignedValues.MinValue = True
                    Properties.SpinButtons.Visible = False
                    TabOrder = 5
                    Width = 35
                  end
                  object lblFibmm7: TcxLabel
                    Left = 451
                    Top = 3
                    Caption = 'mm'
                    Transparent = True
                  end
                  object chkCavityDistortion7: TcxCheckBox
                    Left = 480
                    Top = 1
                    Caption = 'Yes'
                    TabOrder = 6
                    Transparent = True
                    Width = 50
                  end
                end
                object gbFibRow8: TcxGroupBox
                  Left = 2
                  Top = 188
                  Style.BorderStyle = ebsNone
                  Style.Edges = []
                  Color = 15790320
                  ParentColor = False
                  TabOrder = 8
                  Visible = False
                  Height = 24
                  Width = 620
                  object lblFibIdx8: TcxLabel
                    Left = 5
                    Top = 3
                    Caption = '#8'
                    Transparent = True
                  end
                  object cmbFibroidSide8: TcxComboBox
                    Left = 25
                    Top = 1
                    Properties.DropDownListStyle = lsFixedList
                    Properties.Items.Strings = (
                      ''
                      'Left'
                      'Right'
                      'Fundal')
                    TabOrder = 0
                    Width = 80
                  end
                  object cmbFibroidPosition8: TcxComboBox
                    Left = 110
                    Top = 1
                    Properties.DropDownListStyle = lsFixedList
                    Properties.Items.Strings = (
                      ''
                      'anterior'
                      'posterior'
                      'lateral'
                      'cervical')
                    TabOrder = 1
                    Width = 90
                  end
                  object cmbFibroidType8: TcxComboBox
                    Left = 205
                    Top = 1
                    Properties.DropDownListStyle = lsFixedList
                    Properties.Items.Strings = (
                      ''
                      'intramural'
                      'subserosal'
                      'submucosal'
                      'pedunculated')
                    TabOrder = 2
                    Width = 110
                  end
                  object seFibroidLength8: TcxSpinEdit
                    Left = 320
                    Top = 1
                    Properties.AssignedValues.MinValue = True
                    Properties.SpinButtons.Visible = False
                    TabOrder = 3
                    Width = 35
                  end
                  object lblFibx8a: TcxLabel
                    Left = 357
                    Top = 3
                    Caption = 'x'
                    Transparent = True
                  end
                  object seFibroidWidth8: TcxSpinEdit
                    Left = 367
                    Top = 1
                    Properties.AssignedValues.MinValue = True
                    Properties.SpinButtons.Visible = False
                    TabOrder = 4
                    Width = 35
                  end
                  object lblFibx8b: TcxLabel
                    Left = 404
                    Top = 3
                    Caption = 'x'
                    Transparent = True
                  end
                  object seFibroidDepth8: TcxSpinEdit
                    Left = 414
                    Top = 1
                    Properties.AssignedValues.MinValue = True
                    Properties.SpinButtons.Visible = False
                    TabOrder = 5
                    Width = 35
                  end
                  object lblFibmm8: TcxLabel
                    Left = 451
                    Top = 3
                    Caption = 'mm'
                    Transparent = True
                  end
                  object chkCavityDistortion8: TcxCheckBox
                    Left = 480
                    Top = 1
                    Caption = 'Yes'
                    TabOrder = 6
                    Transparent = True
                    Width = 50
                  end
                end
                object gbFibRow9: TcxGroupBox
                  Left = 2
                  Top = 212
                  Style.BorderStyle = ebsNone
                  Style.Edges = []
                  ParentBackground = True
                  TabOrder = 9
                  Visible = False
                  Height = 24
                  Width = 620
                  object lblFibIdx9: TcxLabel
                    Left = 5
                    Top = 3
                    Caption = '#9'
                    Transparent = True
                  end
                  object cmbFibroidSide9: TcxComboBox
                    Left = 25
                    Top = 1
                    Properties.DropDownListStyle = lsFixedList
                    Properties.Items.Strings = (
                      ''
                      'Left'
                      'Right'
                      'Fundal')
                    TabOrder = 0
                    Width = 80
                  end
                  object cmbFibroidPosition9: TcxComboBox
                    Left = 110
                    Top = 1
                    Properties.DropDownListStyle = lsFixedList
                    Properties.Items.Strings = (
                      ''
                      'anterior'
                      'posterior'
                      'lateral'
                      'cervical')
                    TabOrder = 1
                    Width = 90
                  end
                  object cmbFibroidType9: TcxComboBox
                    Left = 205
                    Top = 1
                    Properties.DropDownListStyle = lsFixedList
                    Properties.Items.Strings = (
                      ''
                      'intramural'
                      'subserosal'
                      'submucosal'
                      'pedunculated')
                    TabOrder = 2
                    Width = 110
                  end
                  object seFibroidLength9: TcxSpinEdit
                    Left = 320
                    Top = 1
                    Properties.AssignedValues.MinValue = True
                    Properties.SpinButtons.Visible = False
                    TabOrder = 3
                    Width = 35
                  end
                  object lblFibx9a: TcxLabel
                    Left = 357
                    Top = 3
                    Caption = 'x'
                    Transparent = True
                  end
                  object seFibroidWidth9: TcxSpinEdit
                    Left = 367
                    Top = 1
                    Properties.AssignedValues.MinValue = True
                    Properties.SpinButtons.Visible = False
                    TabOrder = 4
                    Width = 35
                  end
                  object lblFibx9b: TcxLabel
                    Left = 404
                    Top = 3
                    Caption = 'x'
                    Transparent = True
                  end
                  object seFibroidDepth9: TcxSpinEdit
                    Left = 414
                    Top = 1
                    Properties.AssignedValues.MinValue = True
                    Properties.SpinButtons.Visible = False
                    TabOrder = 5
                    Width = 35
                  end
                  object lblFibmm9: TcxLabel
                    Left = 451
                    Top = 3
                    Caption = 'mm'
                    Transparent = True
                  end
                  object chkCavityDistortion9: TcxCheckBox
                    Left = 480
                    Top = 1
                    Caption = 'Yes'
                    TabOrder = 6
                    Transparent = True
                    Width = 50
                  end
                end
                object gbFibRow10: TcxGroupBox
                  Left = 2
                  Top = 236
                  Style.BorderStyle = ebsNone
                  Style.Edges = []
                  Color = 15790320
                  ParentColor = False
                  TabOrder = 10
                  Visible = False
                  Height = 24
                  Width = 620
                  object lblFibIdx10: TcxLabel
                    Left = 5
                    Top = 3
                    Caption = '#10'
                    Transparent = True
                  end
                  object cmbFibroidSide10: TcxComboBox
                    Left = 25
                    Top = 1
                    Properties.DropDownListStyle = lsFixedList
                    Properties.Items.Strings = (
                      ''
                      'Left'
                      'Right'
                      'Fundal')
                    TabOrder = 0
                    Width = 80
                  end
                  object cmbFibroidPosition10: TcxComboBox
                    Left = 110
                    Top = 1
                    Properties.DropDownListStyle = lsFixedList
                    Properties.Items.Strings = (
                      ''
                      'anterior'
                      'posterior'
                      'lateral'
                      'cervical')
                    TabOrder = 1
                    Width = 90
                  end
                  object cmbFibroidType10: TcxComboBox
                    Left = 205
                    Top = 1
                    Properties.DropDownListStyle = lsFixedList
                    Properties.Items.Strings = (
                      ''
                      'intramural'
                      'subserosal'
                      'submucosal'
                      'pedunculated')
                    TabOrder = 2
                    Width = 110
                  end
                  object seFibroidLength10: TcxSpinEdit
                    Left = 320
                    Top = 1
                    Properties.AssignedValues.MinValue = True
                    Properties.SpinButtons.Visible = False
                    TabOrder = 3
                    Width = 35
                  end
                  object lblFibx10a: TcxLabel
                    Left = 357
                    Top = 3
                    Caption = 'x'
                    Transparent = True
                  end
                  object seFibroidWidth10: TcxSpinEdit
                    Left = 367
                    Top = 1
                    Properties.AssignedValues.MinValue = True
                    Properties.SpinButtons.Visible = False
                    TabOrder = 4
                    Width = 35
                  end
                  object lblFibx10b: TcxLabel
                    Left = 404
                    Top = 3
                    Caption = 'x'
                    Transparent = True
                  end
                  object seFibroidDepth10: TcxSpinEdit
                    Left = 414
                    Top = 1
                    Properties.AssignedValues.MinValue = True
                    Properties.SpinButtons.Visible = False
                    TabOrder = 5
                    Width = 35
                  end
                  object lblFibmm10: TcxLabel
                    Left = 451
                    Top = 3
                    Caption = 'mm'
                    Transparent = True
                  end
                  object chkCavityDistortion10: TcxCheckBox
                    Left = 480
                    Top = 1
                    Caption = 'Yes'
                    TabOrder = 6
                    Transparent = True
                    Width = 50
                  end
                end
              end

              object lcUterusGroup_Root: TdxLayoutGroup
                AlignHorz = ahClient
                AlignVert = avTop
                ButtonOptions.Buttons = <>
                Hidden = True
                LayoutDirection = ldVertical
                ShowBorder = False

                object lgGeneral: TdxLayoutGroup
                  CaptionOptions.Text = 'General'
                  CaptionOptions.Visible = True
                  ButtonOptions.Buttons = <>
                  ShowBorder = True
                  object liPosition: TdxLayoutItem
                    CaptionOptions.Text = 'Position'
                    Control = cmbUterusPosition
                    ControlOptions.ShowBorder = False
                  end
                  object lgMeasurements: TdxLayoutGroup
                    CaptionOptions.Visible = False
                    ButtonOptions.Buttons = <>
                    LayoutDirection = ldHorizontal
                    ShowBorder = False
                    object liUterusL: TdxLayoutItem
                      CaptionOptions.Text = 'Measured'
                      Control = seUterusLength
                      ControlOptions.ShowBorder = False
                    end
                    object liUxW: TdxLayoutLabeledItem
                      CaptionOptions.Text = 'x'
                    end
                    object liUterusW: TdxLayoutItem
                      CaptionOptions.Visible = False
                      Control = seUterusWidth
                      ControlOptions.ShowBorder = False
                    end
                    object liUxH: TdxLayoutLabeledItem
                      CaptionOptions.Text = 'x'
                    end
                    object liUterusH: TdxLayoutItem
                      CaptionOptions.Visible = False
                      Control = seUterusHeight
                      ControlOptions.ShowBorder = False
                    end
                    object liUmm: TdxLayoutLabeledItem
                      CaptionOptions.Text = 'mm'
                    end
                    object liUterusVol: TdxLayoutItem
                      CaptionOptions.Text = 'Vol'
                      Control = seUterusVolume
                      ControlOptions.ShowBorder = False
                    end
                    object liUcc: TdxLayoutLabeledItem
                      CaptionOptions.Text = 'cc'
                    end
                    object liSizeClass: TdxLayoutItem
                      CaptionOptions.Visible = False
                      Control = lblUterusSizeClass
                      ControlOptions.ShowBorder = False
                    end
                  end
                  object lgHysterectomy: TdxLayoutGroup
                    CaptionOptions.Visible = False
                    ButtonOptions.Buttons = <>
                    LayoutDirection = ldHorizontal
                    ShowBorder = False
                    object liHysterectomy: TdxLayoutItem
                      CaptionOptions.Visible = False
                      Control = chkHysterectomy
                      ControlOptions.ShowBorder = False
                    end
                    object liCervixPresent: TdxLayoutItem
                      CaptionOptions.Visible = False
                      Control = chkCervixPresent
                      ControlOptions.ShowBorder = False
                    end
                  end
                  object liCongenital: TdxLayoutItem
                    CaptionOptions.Visible = False
                    Control = chkCongenitalAbnormality
                    ControlOptions.ShowBorder = False
                  end
                  object lgCongenitalDetails: TdxLayoutGroup
                    CaptionOptions.Visible = False
                    ButtonOptions.Buttons = <>
                    ShowBorder = False
                    Visible = False
                    object liCongenitalType: TdxLayoutItem
                      CaptionOptions.Text = 'Type'
                      Control = cmbCongenitalType
                      ControlOptions.ShowBorder = False
                    end
                    object lgSeptum: TdxLayoutGroup
                      CaptionOptions.Visible = False
                      ButtonOptions.Buttons = <>
                      LayoutDirection = ldHorizontal
                      ShowBorder = False
                      object liSeptumLabel: TdxLayoutLabeledItem
                        CaptionOptions.Text = 'Septum'
                      end
                      object liSeptumL: TdxLayoutItem
                        CaptionOptions.Text = 'L'
                        Control = seSeptumLength
                        ControlOptions.ShowBorder = False
                      end
                      object liSeptumW: TdxLayoutItem
                        CaptionOptions.Text = 'W'
                        Control = seSeptumWidth
                        ControlOptions.ShowBorder = False
                      end
                      object liSeptumMM: TdxLayoutLabeledItem
                        CaptionOptions.Text = 'mm'
                      end
                    end
                  end
                  object liLSCS: TdxLayoutItem
                    CaptionOptions.Visible = False
                    Control = chkLSCSScar
                    ControlOptions.ShowBorder = False
                  end
                end

                object lgAdenomyosis: TdxLayoutGroup
                  CaptionOptions.Text = 'Adenomyosis'
                  CaptionOptions.Visible = True
                  ButtonOptions.Buttons = <>
                  ShowBorder = True
                  object liAdenomyosis: TdxLayoutItem
                    CaptionOptions.Visible = False
                    Control = chkAdenomyosis
                    ControlOptions.ShowBorder = False
                  end
                  object lgAdenomyosisDetails: TdxLayoutGroup
                    CaptionOptions.Visible = False
                    ButtonOptions.Buttons = <>
                    ShowBorder = False
                    Visible = False
                    object lgAdenoType: TdxLayoutGroup
                      CaptionOptions.Visible = False
                      ButtonOptions.Buttons = <>
                      LayoutDirection = ldHorizontal
                      ShowBorder = False
                      object liAdenoDiffuse: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = rbAdenoDiffuse
                        ControlOptions.ShowBorder = False
                      end
                      object liAdenoFocal: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = rbAdenoFocal
                        ControlOptions.ShowBorder = False
                      end
                      object liInfiltratingSerosa: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = chkInfiltratingSerosa
                        ControlOptions.ShowBorder = False
                      end
                    end
                    object liIrregularJZ: TdxLayoutItem
                      CaptionOptions.Visible = False
                      Control = chkIrregularJunctionalZone
                      ControlOptions.ShowBorder = False
                    end
                    object liAdenoSeverity: TdxLayoutItem
                      CaptionOptions.Text = 'Severity'
                      Control = cmbAdenomyosisSeverity
                      ControlOptions.ShowBorder = False
                    end
                    object lgAdenoFeatures: TdxLayoutGroup
                      CaptionOptions.Text = 'Associated features'
                      CaptionOptions.Visible = True
                      ButtonOptions.Buttons = <>
                      LayoutDirection = ldHorizontal
                      ShowBorder = False
                      object liEndoBuds: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = chkEndometrialBuds
                        ControlOptions.ShowBorder = False
                      end
                      object liEndoIslets: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = chkEndometrialIslets
                        ControlOptions.ShowBorder = False
                      end
                      object liMyoCysts: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = chkMyometrialCysts
                        ControlOptions.ShowBorder = False
                      end
                    end
                    object lgAdenoFeatures2: TdxLayoutGroup
                      CaptionOptions.Visible = False
                      ButtonOptions.Buttons = <>
                      LayoutDirection = ldHorizontal
                      ShowBorder = False
                      object liVenetian: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = chkVenetianBlind
                        ControlOptions.ShowBorder = False
                      end
                      object liPriorAblation: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = chkPriorAblation
                        ControlOptions.ShowBorder = False
                      end
                    end
                  end
                end

                object lgFibroids: TdxLayoutGroup
                  CaptionOptions.Text = 'Fibroids'
                  CaptionOptions.Visible = True
                  ButtonOptions.Buttons = <>
                  ShowBorder = True
                  object liFibroidsPresent: TdxLayoutItem
                    CaptionOptions.Visible = False
                    Control = chkFibroidsPresent
                    ControlOptions.ShowBorder = False
                  end
                  object lgFibroidsDetails: TdxLayoutGroup
                    CaptionOptions.Visible = False
                    ButtonOptions.Buttons = <>
                    ShowBorder = False
                    Visible = False
                    object liFibroidCount: TdxLayoutItem
                      CaptionOptions.Text = 'Count'
                      Control = seFibroidCount
                      ControlOptions.ShowBorder = False
                    end
                    object liFibroidTable: TdxLayoutItem
                      CaptionOptions.Visible = False
                      Control = gbFibroidTable
                      ControlOptions.ShowBorder = False
                    end
                  end
                end
              end
            end
          end

          object tsEndometrium: TcxTabSheet
            Caption = 'Endometrium'
            ImageIndex = 5
            object lcEndometrium: TdxLayoutControl
              Left = 0
              Top = 0
              Width = 888
              Height = 492
              Align = alClient
              TabOrder = 0
              AutoSize = True
              LayoutLookAndFeel = dxLayoutSkinLookAndFeel1

              object cmbEndometriumPhase: TcxComboBox
                Left = 10000
                Top = 10000
                Properties.DropDownListStyle = lsFixedList
                Properties.Items.Strings = (
                  ''
                  'non-specific'
                  'proliferative'
                  'late proliferative'
                  'early secretory'
                  'secretory'
                  'menstrual')
                TabOrder = 0
                Width = 140
              end
              object seEndometriumThickness: TcxSpinEdit
                Left = 10000
                Top = 10000
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                Properties.DisplayFormat = '#0.0'
                Properties.EditFormat = '#0.0'
                Properties.ValueType = vtFloat
                Enabled = False
                TabOrder = 1
                Width = 35
              end
              object chkInSync: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'In sync'
                TabOrder = 2
                Transparent = True
                Width = 70
              end
              object chkFocalLesion: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Endometrial polyp present'
                TabOrder = 3
                Transparent = True
                Width = 180
              end
              object sePolypCount: TcxSpinEdit
                Left = 10000
                Top = 10000
                Properties.MinValue = 1.000000000000000000
                Properties.MaxValue = 4.000000000000000000
                TabOrder = 4
                Value = 1
                Width = 35
              end
              object sePolypLength1: TcxSpinEdit
                Left = 10000
                Top = 10000
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                Properties.DisplayFormat = '#0.0'
                Properties.EditFormat = '#0.0'
                Properties.ValueType = vtFloat
                TabOrder = 5
                Width = 35
              end
              object sePolypWidth1: TcxSpinEdit
                Left = 10000
                Top = 10000
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                Properties.DisplayFormat = '#0.0'
                Properties.EditFormat = '#0.0'
                Properties.ValueType = vtFloat
                TabOrder = 6
                Width = 35
              end
              object sePolypDepth1: TcxSpinEdit
                Left = 10000
                Top = 10000
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                Properties.DisplayFormat = '#0.0'
                Properties.EditFormat = '#0.0'
                Properties.ValueType = vtFloat
                TabOrder = 7
                Width = 35
              end
              object cmbPolypLocation1: TcxComboBox
                Left = 10000
                Top = 10000
                Properties.DropDownListStyle = lsFixedList
                Properties.Items.Strings = (
                  ''
                  'anterior'
                  'posterior'
                  'fundal'
                  'left lateral'
                  'right lateral'
                  'cervical')
                TabOrder = 8
                Width = 110
              end
              object chkVascularStalk: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Vascular stalk'
                TabOrder = 9
                Transparent = True
                Width = 100
              end
              object sePolypLength2: TcxSpinEdit
                Left = 10000
                Top = 10000
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                Properties.DisplayFormat = '#0.0'
                Properties.EditFormat = '#0.0'
                Properties.ValueType = vtFloat
                TabOrder = 0
                Width = 35
              end
              object sePolypWidth2: TcxSpinEdit
                Left = 10000
                Top = 10000
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                Properties.DisplayFormat = '#0.0'
                Properties.EditFormat = '#0.0'
                Properties.ValueType = vtFloat
                TabOrder = 0
                Width = 35
              end
              object sePolypDepth2: TcxSpinEdit
                Left = 10000
                Top = 10000
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                Properties.DisplayFormat = '#0.0'
                Properties.EditFormat = '#0.0'
                Properties.ValueType = vtFloat
                TabOrder = 0
                Width = 35
              end
              object cmbPolypLocation2: TcxComboBox
                Left = 10000
                Top = 10000
                Properties.DropDownListStyle = lsFixedList
                Properties.Items.Strings = (
                  ''
                  'anterior'
                  'posterior'
                  'fundal'
                  'left lateral'
                  'right lateral'
                  'cervical')
                TabOrder = 0
                Width = 110
              end
              object sePolypLength3: TcxSpinEdit
                Left = 10000
                Top = 10000
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                Properties.DisplayFormat = '#0.0'
                Properties.EditFormat = '#0.0'
                Properties.ValueType = vtFloat
                TabOrder = 0
                Width = 35
              end
              object sePolypWidth3: TcxSpinEdit
                Left = 10000
                Top = 10000
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                Properties.DisplayFormat = '#0.0'
                Properties.EditFormat = '#0.0'
                Properties.ValueType = vtFloat
                TabOrder = 0
                Width = 35
              end
              object sePolypDepth3: TcxSpinEdit
                Left = 10000
                Top = 10000
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                Properties.DisplayFormat = '#0.0'
                Properties.EditFormat = '#0.0'
                Properties.ValueType = vtFloat
                TabOrder = 0
                Width = 35
              end
              object cmbPolypLocation3: TcxComboBox
                Left = 10000
                Top = 10000
                Properties.DropDownListStyle = lsFixedList
                Properties.Items.Strings = (
                  ''
                  'anterior'
                  'posterior'
                  'fundal'
                  'left lateral'
                  'right lateral'
                  'cervical')
                TabOrder = 0
                Width = 110
              end
              object sePolypLength4: TcxSpinEdit
                Left = 10000
                Top = 10000
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                Properties.DisplayFormat = '#0.0'
                Properties.EditFormat = '#0.0'
                Properties.ValueType = vtFloat
                TabOrder = 0
                Width = 35
              end
              object sePolypWidth4: TcxSpinEdit
                Left = 10000
                Top = 10000
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                Properties.DisplayFormat = '#0.0'
                Properties.EditFormat = '#0.0'
                Properties.ValueType = vtFloat
                TabOrder = 0
                Width = 35
              end
              object sePolypDepth4: TcxSpinEdit
                Left = 10000
                Top = 10000
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                Properties.DisplayFormat = '#0.0'
                Properties.EditFormat = '#0.0'
                Properties.ValueType = vtFloat
                TabOrder = 0
                Width = 35
              end
              object cmbPolypLocation4: TcxComboBox
                Left = 10000
                Top = 10000
                Properties.DropDownListStyle = lsFixedList
                Properties.Items.Strings = (
                  ''
                  'anterior'
                  'posterior'
                  'fundal'
                  'left lateral'
                  'right lateral'
                  'cervical')
                TabOrder = 0
                Width = 110
              end
              object chkIUDCorrect: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'IUD correct'
                TabOrder = 10
                Transparent = True
                Width = 90
              end
              object chkIUDIncorrect: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'IUD incorrectly positioned'
                TabOrder = 11
                Transparent = True
                Width = 185
              end
              object chkRPOC: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'RPOC present'
                TabOrder = 12
                Transparent = True
                Width = 110
              end
              object seRPOCLength: TcxSpinEdit
                Left = 10000
                Top = 10000
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                Properties.DisplayFormat = '#0.0'
                Properties.EditFormat = '#0.0'
                Properties.ValueType = vtFloat
                TabOrder = 13
                Width = 35
              end
              object seRPOCWidth: TcxSpinEdit
                Left = 10000
                Top = 10000
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                Properties.DisplayFormat = '#0.0'
                Properties.EditFormat = '#0.0'
                Properties.ValueType = vtFloat
                TabOrder = 14
                Width = 35
              end
              object seRPOCDepth: TcxSpinEdit
                Left = 10000
                Top = 10000
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                Properties.DisplayFormat = '#0.0'
                Properties.EditFormat = '#0.0'
                Properties.ValueType = vtFloat
                TabOrder = 15
                Width = 35
              end
              object cmbRPOCLocation: TcxComboBox
                Left = 10000
                Top = 10000
                Properties.DropDownListStyle = lsFixedList
                Properties.Items.Strings = (
                  ''
                  'fundal'
                  'anterior'
                  'posterior')
                TabOrder = 16
                Width = 100
              end
              object rbRPOCVascular: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Vascular'
                TabOrder = 17
                Transparent = True
                Width = 75
              end
              object rbRPOCAvascular: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Avascular'
                TabOrder = 18
                Transparent = True
                Width = 80
              end
              object chkRPOCSliding: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Sliding in cavity'
                TabOrder = 19
                Transparent = True
                Width = 120
              end
              object chkRPOCInflammatory: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Inflammatory response'
                TabOrder = 20
                Transparent = True
                Width = 160
              end

              object lcEndometriumGroup_Root: TdxLayoutGroup
                AlignHorz = ahClient
                AlignVert = avTop
                ButtonOptions.Buttons = <>
                Hidden = True
                LayoutDirection = ldVertical
                ShowBorder = False

                object liEndoPhase: TdxLayoutItem
                  CaptionOptions.Text = 'Phase'
                  Control = cmbEndometriumPhase
                  ControlOptions.ShowBorder = False
                end
                object lgEndoThickness: TdxLayoutGroup
                  CaptionOptions.Visible = False
                  ButtonOptions.Buttons = <>
                  LayoutDirection = ldHorizontal
                  ShowBorder = False
                  object liEndoThickness: TdxLayoutItem
                    CaptionOptions.Text = 'Thickness'
                    Control = seEndometriumThickness
                    ControlOptions.ShowBorder = False
                  end
                  object liEndoMM: TdxLayoutLabeledItem
                    CaptionOptions.Text = 'mm'
                  end
                  object liInSync: TdxLayoutItem
                    CaptionOptions.Visible = False
                    Control = chkInSync
                    ControlOptions.ShowBorder = False
                  end
                end

                object liPolypSep: TdxLayoutSeparatorItem
                  CaptionOptions.Text = 'Endometrial Polyp'
                end
                object liPolyp: TdxLayoutItem
                  CaptionOptions.Visible = False
                  Control = chkFocalLesion
                  ControlOptions.ShowBorder = False
                end
                object lgPolypDetails: TdxLayoutGroup
                  CaptionOptions.Visible = False
                  ButtonOptions.Buttons = <>
                  ShowBorder = False
                  Visible = False
                  object liPolypCount: TdxLayoutItem
                    CaptionOptions.Text = 'Count'
                    Control = sePolypCount
                    ControlOptions.ShowBorder = False
                  end
                  object lgPolyp1: TdxLayoutGroup
                    CaptionOptions.Text = '#1'
                    CaptionOptions.Visible = True
                    ButtonOptions.Buttons = <>
                    ShowBorder = True
                    object lgPolyp1Dims: TdxLayoutGroup
                      CaptionOptions.Visible = False
                      ButtonOptions.Buttons = <>
                      LayoutDirection = ldHorizontal
                      ShowBorder = False
                      object liPolyp1L: TdxLayoutItem
                        CaptionOptions.Text = 'Dims'
                        Control = sePolypLength1
                        ControlOptions.ShowBorder = False
                      end
                      object liPolyp1Sep1: TdxLayoutLabeledItem
                        CaptionOptions.Text = 'x'
                      end
                      object liPolyp1W: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = sePolypWidth1
                        ControlOptions.ShowBorder = False
                      end
                      object liPolyp1Sep2: TdxLayoutLabeledItem
                        CaptionOptions.Text = 'x'
                      end
                      object liPolyp1D: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = sePolypDepth1
                        ControlOptions.ShowBorder = False
                      end
                      object liPolyp1MM: TdxLayoutLabeledItem
                        CaptionOptions.Text = 'mm'
                      end
                      object liPolyp1Loc: TdxLayoutItem
                        CaptionOptions.Text = 'Location'
                        Control = cmbPolypLocation1
                        ControlOptions.ShowBorder = False
                      end
                    end
                    object liVascStalk1: TdxLayoutItem
                      CaptionOptions.Visible = False
                      Control = chkVascularStalk
                      ControlOptions.ShowBorder = False
                    end
                  end
object lgPolyp2: TdxLayoutGroup
                    CaptionOptions.Text = '#2'
                    CaptionOptions.Visible = True
                    ButtonOptions.Buttons = <>
                    ShowBorder = True
                    Visible = False
                    object lgPolyp2Dims: TdxLayoutGroup
                      CaptionOptions.Visible = False
                      ButtonOptions.Buttons = <>
                      LayoutDirection = ldHorizontal
                      ShowBorder = False
                      object liPolyp2L: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = sePolypLength2
                        ControlOptions.ShowBorder = False
                      end
                      object liPolyp2Sep1: TdxLayoutLabeledItem
                        CaptionOptions.Text = 'x'
                      end
                      object liPolyp2W: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = sePolypWidth2
                        ControlOptions.ShowBorder = False
                      end
                      object liPolyp2Sep2: TdxLayoutLabeledItem
                        CaptionOptions.Text = 'x'
                      end
                      object liPolyp2D: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = sePolypDepth2
                        ControlOptions.ShowBorder = False
                      end
                      object liPolyp2MM: TdxLayoutLabeledItem
                        CaptionOptions.Text = 'mm'
                      end
                      object liPolyp2Loc: TdxLayoutItem
                        CaptionOptions.Text = 'Location'
                        Control = cmbPolypLocation2
                        ControlOptions.ShowBorder = False
                      end
                    end
                  end
object lgPolyp3: TdxLayoutGroup
                    CaptionOptions.Text = '#3'
                    CaptionOptions.Visible = True
                    ButtonOptions.Buttons = <>
                    ShowBorder = True
                    Visible = False
                    object lgPolyp3Dims: TdxLayoutGroup
                      CaptionOptions.Visible = False
                      ButtonOptions.Buttons = <>
                      LayoutDirection = ldHorizontal
                      ShowBorder = False
                      object liPolyp3L: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = sePolypLength3
                        ControlOptions.ShowBorder = False
                      end
                      object liPolyp3Sep1: TdxLayoutLabeledItem
                        CaptionOptions.Text = 'x'
                      end
                      object liPolyp3W: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = sePolypWidth3
                        ControlOptions.ShowBorder = False
                      end
                      object liPolyp3Sep2: TdxLayoutLabeledItem
                        CaptionOptions.Text = 'x'
                      end
                      object liPolyp3D: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = sePolypDepth3
                        ControlOptions.ShowBorder = False
                      end
                      object liPolyp3MM: TdxLayoutLabeledItem
                        CaptionOptions.Text = 'mm'
                      end
                      object liPolyp3Loc: TdxLayoutItem
                        CaptionOptions.Text = 'Location'
                        Control = cmbPolypLocation3
                        ControlOptions.ShowBorder = False
                      end
                    end
                  end
object lgPolyp4: TdxLayoutGroup
                    CaptionOptions.Text = '#4'
                    CaptionOptions.Visible = True
                    ButtonOptions.Buttons = <>
                    ShowBorder = True
                    Visible = False
                    object lgPolyp4Dims: TdxLayoutGroup
                      CaptionOptions.Visible = False
                      ButtonOptions.Buttons = <>
                      LayoutDirection = ldHorizontal
                      ShowBorder = False
                      object liPolyp4L: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = sePolypLength4
                        ControlOptions.ShowBorder = False
                      end
                      object liPolyp4Sep1: TdxLayoutLabeledItem
                        CaptionOptions.Text = 'x'
                      end
                      object liPolyp4W: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = sePolypWidth4
                        ControlOptions.ShowBorder = False
                      end
                      object liPolyp4Sep2: TdxLayoutLabeledItem
                        CaptionOptions.Text = 'x'
                      end
                      object liPolyp4D: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = sePolypDepth4
                        ControlOptions.ShowBorder = False
                      end
                      object liPolyp4MM: TdxLayoutLabeledItem
                        CaptionOptions.Text = 'mm'
                      end
                      object liPolyp4Loc: TdxLayoutItem
                        CaptionOptions.Text = 'Location'
                        Control = cmbPolypLocation4
                        ControlOptions.ShowBorder = False
                      end
                    end
                  end
                end

                object liIUDSep: TdxLayoutSeparatorItem
                  CaptionOptions.Text = 'IUD'
                end
                object lgIUD: TdxLayoutGroup
                  CaptionOptions.Visible = False
                  ButtonOptions.Buttons = <>
                  LayoutDirection = ldHorizontal
                  ShowBorder = False
                  object liIUDCorrect: TdxLayoutItem
                    CaptionOptions.Visible = False
                    Control = chkIUDCorrect
                    ControlOptions.ShowBorder = False
                  end
                  object liIUDIncorrect: TdxLayoutItem
                    CaptionOptions.Visible = False
                    Control = chkIUDIncorrect
                    ControlOptions.ShowBorder = False
                  end
                end

                object liRPOCSep: TdxLayoutSeparatorItem
                  CaptionOptions.Text = 'RPOC'
                end
                object liRPOC: TdxLayoutItem
                  CaptionOptions.Visible = False
                  Control = chkRPOC
                  ControlOptions.ShowBorder = False
                end
                object lgRPOCDetails: TdxLayoutGroup
                  CaptionOptions.Visible = False
                  ButtonOptions.Buttons = <>
                  ShowBorder = False
                  Visible = False
                  object lgRPOCDims: TdxLayoutGroup
                    CaptionOptions.Visible = False
                    ButtonOptions.Buttons = <>
                    LayoutDirection = ldHorizontal
                    ShowBorder = False
                    object liRPOCDimLabel: TdxLayoutLabeledItem
                      CaptionOptions.Text = 'Dimensions'
                    end
                    object liRPOCL: TdxLayoutItem
                      CaptionOptions.Visible = False
                      Control = seRPOCLength
                      ControlOptions.ShowBorder = False
                    end
                    object liRPOCSep1: TdxLayoutLabeledItem
                      CaptionOptions.Text = 'x'
                    end
                    object liRPOCW: TdxLayoutItem
                      CaptionOptions.Visible = False
                      Control = seRPOCWidth
                      ControlOptions.ShowBorder = False
                    end
                    object liRPOCSep2: TdxLayoutLabeledItem
                      CaptionOptions.Text = 'x'
                    end
                    object liRPOCD: TdxLayoutItem
                      CaptionOptions.Visible = False
                      Control = seRPOCDepth
                      ControlOptions.ShowBorder = False
                    end
                    object liRPOCMM: TdxLayoutLabeledItem
                      CaptionOptions.Text = 'mm'
                    end
                  end
                  object liRPOCLoc: TdxLayoutItem
                    CaptionOptions.Text = 'Location'
                    Control = cmbRPOCLocation
                    ControlOptions.ShowBorder = False
                  end
                  object lgRPOCVasc: TdxLayoutGroup
                    CaptionOptions.Visible = False
                    ButtonOptions.Buttons = <>
                    LayoutDirection = ldHorizontal
                    ShowBorder = False
                    object liRPOCVascular: TdxLayoutItem
                      CaptionOptions.Visible = False
                      Control = rbRPOCVascular
                      ControlOptions.ShowBorder = False
                    end
                    object liRPOCAvascular: TdxLayoutItem
                      CaptionOptions.Visible = False
                      Control = rbRPOCAvascular
                      ControlOptions.ShowBorder = False
                    end
                  end
                  object lgRPOCExtra: TdxLayoutGroup
                    CaptionOptions.Visible = False
                    ButtonOptions.Buttons = <>
                    LayoutDirection = ldHorizontal
                    ShowBorder = False
                    object liRPOCSliding: TdxLayoutItem
                      CaptionOptions.Visible = False
                      Control = chkRPOCSliding
                      ControlOptions.ShowBorder = False
                    end
                    object liRPOCInflam: TdxLayoutItem
                      CaptionOptions.Visible = False
                      Control = chkRPOCInflammatory
                      ControlOptions.ShowBorder = False
                    end
                  end
                end
              end
            end
          end

          object tsOvaries: TcxTabSheet
            Caption = 'Ovaries'
            ImageIndex = 5
            object lcOvaries: TdxLayoutControl
              Left = 0
              Top = 0
              Width = 888
              Height = 492
              Align = alClient
              TabOrder = 0
              AutoSize = True
              LayoutLookAndFeel = dxLayoutSkinLookAndFeel1

              object chkRightOvaryIdentified: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Identified'
                TabOrder = 0
                Transparent = True
                Width = 110
              end
              object chkRightOvaryNotIdentified: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Not identified'
                TabOrder = 0
                Transparent = True
                Width = 110
              end
              object chkRightOvaryAbsent: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Absent'
                TabOrder = 0
                Transparent = True
                Width = 110
              end
              object seRightOvaryLength: TcxSpinEdit
                Left = 10000
                Top = 10000
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                Enabled = False
                TabOrder = 0
                Width = 35
              end
              object seRightOvaryWidth: TcxSpinEdit
                Left = 10000
                Top = 10000
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                Enabled = False
                TabOrder = 0
                Width = 35
              end
              object seRightOvaryHeight: TcxSpinEdit
                Left = 10000
                Top = 10000
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                Enabled = False
                TabOrder = 0
                Width = 35
              end
              object seRightOvaryCC: TcxSpinEdit
                Left = 10000
                Top = 10000
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                Properties.DisplayFormat = '#0.0'
                Properties.EditFormat = '#0.0'
                Properties.ValueType = vtFloat
                Enabled = False
                TabOrder = 0
                Width = 40
              end
              object cmbRightOvaryAppearance: TcxComboBox
                Left = 10000
                Top = 10000
                Properties.DropDownListStyle = lsFixedList
                Properties.Items.Strings = (
                  ''
                  'normal'
                  'inactive'
                  'postmenopausal'
                  'suppressed'
                  'polycystic morphology'
                  'multifollicular'
                  'oligofollicular')
                TabOrder = 0
                Width = 160
              end
              object seRightAFC: TcxSpinEdit
                Left = 10000
                Top = 10000
                Properties.AssignedValues.MinValue = True
                Properties.MaxValue = 50.000000000000000000
                TabOrder = 0
                Width = 35
              end
              object seRightMaxFollicle: TcxSpinEdit
                Left = 10000
                Top = 10000
                Properties.AssignedValues.MinValue = True
                TabOrder = 0
                Width = 35
              end
              object chkRightCorpusLuteum: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Corpus luteum'
                TabOrder = 0
                Transparent = True
                Width = 110
              end
              object chkRightHaemorrhagicCL: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Haemorrhagic CL'
                TabOrder = 0
                Transparent = True
                Width = 130
              end
              object seRightHaemCLSize: TcxSpinEdit
                Left = 10000
                Top = 10000
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                Enabled = False
                TabOrder = 0
                Width = 35
              end
              object chkRightResolvingCL: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Resolving CL'
                TabOrder = 0
                Transparent = True
                Width = 100
              end
              object chkRightMobile: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Mobile'
                TabOrder = 0
                Transparent = True
                Width = 80
              end
              object chkRightReducedMobility: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Reduced'
                TabOrder = 0
                Transparent = True
                Width = 80
              end
              object chkRightStuck: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Stuck'
                TabOrder = 0
                Transparent = True
                Width = 80
              end
              object chkRightRigid: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Rigid'
                TabOrder = 0
                Transparent = True
                Width = 80
              end
              object chkRightTender: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Tender'
                TabOrder = 0
                Transparent = True
                Width = 90
              end
              object chkRightNonTender: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Non-tender'
                TabOrder = 0
                Transparent = True
                Width = 90
              end
              object chkRightAccessible: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Accessible vaginally'
                TabOrder = 0
                Transparent = True
                Width = 150
              end
              object chkRightEchogenicFoci: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Echogenic foci'
                TabOrder = 0
                Transparent = True
                Width = 110
              end
              object chkRightScarring: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Scarring'
                TabOrder = 0
                Transparent = True
                Width = 75
              end
              object chkRightParaOvarianCyst: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Para-ovarian cyst'
                TabOrder = 0
                Transparent = True
                Width = 135
              end
              object seRightParaCystLength: TcxSpinEdit
                Left = 10000
                Top = 10000
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                Enabled = False
                TabOrder = 0
                Width = 35
              end
              object seRightParaCystWidth: TcxSpinEdit
                Left = 10000
                Top = 10000
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                Enabled = False
                TabOrder = 0
                Width = 35
              end
              object seRightParaCystDepth: TcxSpinEdit
                Left = 10000
                Top = 10000
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                Enabled = False
                TabOrder = 0
                Width = 35
              end
              object chkLeftOvaryIdentified: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Identified'
                TabOrder = 0
                Transparent = True
                Width = 110
              end
              object chkLeftOvaryNotIdentified: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Not identified'
                TabOrder = 0
                Transparent = True
                Width = 110
              end
              object chkLeftOvaryAbsent: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Absent'
                TabOrder = 0
                Transparent = True
                Width = 110
              end
              object seLeftOvaryLength: TcxSpinEdit
                Left = 10000
                Top = 10000
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                Enabled = False
                TabOrder = 0
                Width = 35
              end
              object seLeftOvaryWidth: TcxSpinEdit
                Left = 10000
                Top = 10000
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                Enabled = False
                TabOrder = 0
                Width = 35
              end
              object seLeftOvaryHeight: TcxSpinEdit
                Left = 10000
                Top = 10000
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                Enabled = False
                TabOrder = 0
                Width = 35
              end
              object seLeftOvaryCC: TcxSpinEdit
                Left = 10000
                Top = 10000
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                Properties.DisplayFormat = '#0.0'
                Properties.EditFormat = '#0.0'
                Properties.ValueType = vtFloat
                Enabled = False
                TabOrder = 0
                Width = 40
              end
              object cmbLeftOvaryAppearance: TcxComboBox
                Left = 10000
                Top = 10000
                Properties.DropDownListStyle = lsFixedList
                Properties.Items.Strings = (
                  ''
                  'normal'
                  'inactive'
                  'postmenopausal'
                  'suppressed'
                  'polycystic morphology'
                  'multifollicular'
                  'oligofollicular')
                TabOrder = 0
                Width = 160
              end
              object seLeftAFC: TcxSpinEdit
                Left = 10000
                Top = 10000
                Properties.AssignedValues.MinValue = True
                Properties.MaxValue = 50.000000000000000000
                TabOrder = 0
                Width = 35
              end
              object seLeftMaxFollicle: TcxSpinEdit
                Left = 10000
                Top = 10000
                Properties.AssignedValues.MinValue = True
                TabOrder = 0
                Width = 35
              end
              object chkLeftCorpusLuteum: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Corpus luteum'
                TabOrder = 0
                Transparent = True
                Width = 110
              end
              object chkLeftHaemorrhagicCL: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Haemorrhagic CL'
                TabOrder = 0
                Transparent = True
                Width = 130
              end
              object seLeftHaemCLSize: TcxSpinEdit
                Left = 10000
                Top = 10000
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                Enabled = False
                TabOrder = 0
                Width = 35
              end
              object chkLeftResolvingCL: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Resolving CL'
                TabOrder = 0
                Transparent = True
                Width = 100
              end
              object chkLeftMobile: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Mobile'
                TabOrder = 0
                Transparent = True
                Width = 80
              end
              object chkLeftReducedMobility: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Reduced'
                TabOrder = 0
                Transparent = True
                Width = 80
              end
              object chkLeftStuck: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Stuck'
                TabOrder = 0
                Transparent = True
                Width = 80
              end
              object chkLeftRigid: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Rigid'
                TabOrder = 0
                Transparent = True
                Width = 80
              end
              object chkLeftTender: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Tender'
                TabOrder = 0
                Transparent = True
                Width = 90
              end
              object chkLeftNonTender: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Non-tender'
                TabOrder = 0
                Transparent = True
                Width = 90
              end
              object chkLeftAccessible: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Accessible vaginally'
                TabOrder = 0
                Transparent = True
                Width = 150
              end
              object chkLeftEchogenicFoci: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Echogenic foci'
                TabOrder = 0
                Transparent = True
                Width = 110
              end
              object chkLeftScarring: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Scarring'
                TabOrder = 0
                Transparent = True
                Width = 75
              end
              object chkLeftParaOvarianCyst: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Para-ovarian cyst'
                TabOrder = 0
                Transparent = True
                Width = 135
              end
              object seLeftParaCystLength: TcxSpinEdit
                Left = 10000
                Top = 10000
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                Enabled = False
                TabOrder = 0
                Width = 35
              end
              object seLeftParaCystWidth: TcxSpinEdit
                Left = 10000
                Top = 10000
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                Enabled = False
                TabOrder = 0
                Width = 35
              end
              object seLeftParaCystDepth: TcxSpinEdit
                Left = 10000
                Top = 10000
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                Enabled = False
                TabOrder = 0
                Width = 35
              end
              object lblTotalAFC: TcxLabel
                Left = 10000
                Top = 10000
                Caption = ''
                Transparent = True
              end

              object lcOvariesGroup_Root: TdxLayoutGroup
                AlignHorz = ahClient
                AlignVert = avTop
                ButtonOptions.Buttons = <>
                Hidden = True
                LayoutDirection = ldHorizontal
                ShowBorder = False

                object lgRightOvary: TdxLayoutGroup
                  CaptionOptions.Text = 'Right Ovary'
                  CaptionOptions.Visible = True
                  ButtonOptions.Buttons = <>
                  ShowBorder = True
                  object lgRightStatus: TdxLayoutGroup
                    CaptionOptions.Visible = False
                    ButtonOptions.Buttons = <>
                    LayoutDirection = ldHorizontal
                    ShowBorder = False
                    object liRightIdentified: TdxLayoutItem
                      CaptionOptions.Visible = False
                      Control = chkRightOvaryIdentified
                      ControlOptions.ShowBorder = False
                    end
                    object liRightNotIdentified: TdxLayoutItem
                      CaptionOptions.Visible = False
                      Control = chkRightOvaryNotIdentified
                      ControlOptions.ShowBorder = False
                    end
                    object liRightAbsent: TdxLayoutItem
                      CaptionOptions.Visible = False
                      Control = chkRightOvaryAbsent
                      ControlOptions.ShowBorder = False
                    end
                  end
                  object lgRightOvaryDetails: TdxLayoutGroup
                    CaptionOptions.Visible = False
                    ButtonOptions.Buttons = <>
                    ShowBorder = False
                    Visible = False
                    object lgRightMeasurements: TdxLayoutGroup
                      CaptionOptions.Visible = False
                      ButtonOptions.Buttons = <>
                      LayoutDirection = ldHorizontal
                      ShowBorder = False
                      object liRightOvL: TdxLayoutItem
                        CaptionOptions.Text = 'Measured'
                        Control = seRightOvaryLength
                        ControlOptions.ShowBorder = False
                      end
                      object liRightOvx1: TdxLayoutLabeledItem
                        CaptionOptions.Text = 'x'
                      end
                      object liRightOvW: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = seRightOvaryWidth
                        ControlOptions.ShowBorder = False
                      end
                      object liRightOvx2: TdxLayoutLabeledItem
                        CaptionOptions.Text = 'x'
                      end
                      object liRightOvH: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = seRightOvaryHeight
                        ControlOptions.ShowBorder = False
                      end
                      object liRightOvmm: TdxLayoutLabeledItem
                        CaptionOptions.Text = 'mm'
                      end
                      object liRightOvVol: TdxLayoutItem
                        CaptionOptions.Text = 'Vol'
                        Control = seRightOvaryCC
                        ControlOptions.ShowBorder = False
                      end
                      object liRightOvcc: TdxLayoutLabeledItem
                        CaptionOptions.Text = 'cc'
                      end
                    end
                    object liRightAppearance: TdxLayoutItem
                      CaptionOptions.Text = 'Appearance'
                      Control = cmbRightOvaryAppearance
                      ControlOptions.ShowBorder = False
                    end
                    object lgRightAFC: TdxLayoutGroup
                      CaptionOptions.Visible = False
                      ButtonOptions.Buttons = <>
                      LayoutDirection = ldHorizontal
                      ShowBorder = False
                      object liRightAFC: TdxLayoutItem
                        CaptionOptions.Text = 'AFC'
                        Control = seRightAFC
                        ControlOptions.ShowBorder = False
                      end
                      object liRightMaxFol: TdxLayoutItem
                        CaptionOptions.Text = 'Max follicle'
                        Control = seRightMaxFollicle
                        ControlOptions.ShowBorder = False
                      end
                      object liRightFolMM: TdxLayoutLabeledItem
                        CaptionOptions.Text = 'mm'
                      end
                    end
                    object liRightCLSep: TdxLayoutSeparatorItem
                      CaptionOptions.Text = 'Corpus Luteum'
                    end
                    object lgRightCL: TdxLayoutGroup
                      CaptionOptions.Visible = False
                      ButtonOptions.Buttons = <>
                      LayoutDirection = ldHorizontal
                      ShowBorder = False
                      object liRightCL: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = chkRightCorpusLuteum
                        ControlOptions.ShowBorder = False
                      end
                      object liRightHaemCL: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = chkRightHaemorrhagicCL
                        ControlOptions.ShowBorder = False
                      end
                      object liRightHaemSize: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = seRightHaemCLSize
                        ControlOptions.ShowBorder = False
                      end
                      object liRightHaemMM: TdxLayoutLabeledItem
                        CaptionOptions.Text = 'mm'
                      end
                      object liRightResCL: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = chkRightResolvingCL
                        ControlOptions.ShowBorder = False
                      end
                    end
                    object liRightMobSep: TdxLayoutSeparatorItem
                      CaptionOptions.Text = 'Mobility'
                    end
                    object lgRightMobility: TdxLayoutGroup
                      CaptionOptions.Visible = False
                      ButtonOptions.Buttons = <>
                      LayoutDirection = ldHorizontal
                      ShowBorder = False
                      object liRightMobile: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = chkRightMobile
                        ControlOptions.ShowBorder = False
                      end
                      object liRightReduced: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = chkRightReducedMobility
                        ControlOptions.ShowBorder = False
                      end
                      object liRightStuck: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = chkRightStuck
                        ControlOptions.ShowBorder = False
                      end
                      object liRightRigid: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = chkRightRigid
                        ControlOptions.ShowBorder = False
                      end
                    end
                    object lgRightTender: TdxLayoutGroup
                      CaptionOptions.Visible = False
                      ButtonOptions.Buttons = <>
                      LayoutDirection = ldHorizontal
                      ShowBorder = False
                      object liRightTender: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = chkRightTender
                        ControlOptions.ShowBorder = False
                      end
                      object liRightNonTender: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = chkRightNonTender
                        ControlOptions.ShowBorder = False
                      end
                      object liRightAccessible: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = chkRightAccessible
                        ControlOptions.ShowBorder = False
                      end
                    end
                    object liRightOtherSep: TdxLayoutSeparatorItem
                      CaptionOptions.Text = 'Other'
                    end
                    object lgRightOther: TdxLayoutGroup
                      CaptionOptions.Visible = False
                      ButtonOptions.Buttons = <>
                      LayoutDirection = ldHorizontal
                      ShowBorder = False
                      object liRightEcho: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = chkRightEchogenicFoci
                        ControlOptions.ShowBorder = False
                      end
                      object liRightScar: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = chkRightScarring
                        ControlOptions.ShowBorder = False
                      end
                    end
                    object lgRightParaCyst: TdxLayoutGroup
                      CaptionOptions.Visible = False
                      ButtonOptions.Buttons = <>
                      ShowBorder = False
                      object liRightParaCyst: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = chkRightParaOvarianCyst
                        ControlOptions.ShowBorder = False
                      end
                      object lgRightParaDims: TdxLayoutGroup
                        CaptionOptions.Visible = False
                        ButtonOptions.Buttons = <>
                        LayoutDirection = ldHorizontal
                        ShowBorder = False
                        Visible = False
                        object liRightPCL: TdxLayoutItem
                          CaptionOptions.Visible = False
                          Control = seRightParaCystLength
                          ControlOptions.ShowBorder = False
                        end
                        object liRightPCx1: TdxLayoutLabeledItem
                          CaptionOptions.Text = 'x'
                        end
                        object liRightPCW: TdxLayoutItem
                          CaptionOptions.Visible = False
                          Control = seRightParaCystWidth
                          ControlOptions.ShowBorder = False
                        end
                        object liRightPCx2: TdxLayoutLabeledItem
                          CaptionOptions.Text = 'x'
                        end
                        object liRightPCD: TdxLayoutItem
                          CaptionOptions.Visible = False
                          Control = seRightParaCystDepth
                          ControlOptions.ShowBorder = False
                        end
                        object liRightPCmm: TdxLayoutLabeledItem
                          CaptionOptions.Text = 'mm'
                        end
                      end
                    end
                  end
                end
                object lgLeftOvary: TdxLayoutGroup
                  CaptionOptions.Text = 'Left Ovary'
                  CaptionOptions.Visible = True
                  ButtonOptions.Buttons = <>
                  ShowBorder = True
                  object lgLeftStatus: TdxLayoutGroup
                    CaptionOptions.Visible = False
                    ButtonOptions.Buttons = <>
                    LayoutDirection = ldHorizontal
                    ShowBorder = False
                    object liLeftIdentified: TdxLayoutItem
                      CaptionOptions.Visible = False
                      Control = chkLeftOvaryIdentified
                      ControlOptions.ShowBorder = False
                    end
                    object liLeftNotIdentified: TdxLayoutItem
                      CaptionOptions.Visible = False
                      Control = chkLeftOvaryNotIdentified
                      ControlOptions.ShowBorder = False
                    end
                    object liLeftAbsent: TdxLayoutItem
                      CaptionOptions.Visible = False
                      Control = chkLeftOvaryAbsent
                      ControlOptions.ShowBorder = False
                    end
                  end
                  object lgLeftOvaryDetails: TdxLayoutGroup
                    CaptionOptions.Visible = False
                    ButtonOptions.Buttons = <>
                    ShowBorder = False
                    Visible = False
                    object lgLeftMeasurements: TdxLayoutGroup
                      CaptionOptions.Visible = False
                      ButtonOptions.Buttons = <>
                      LayoutDirection = ldHorizontal
                      ShowBorder = False
                      object liLeftOvL: TdxLayoutItem
                        CaptionOptions.Text = 'Measured'
                        Control = seLeftOvaryLength
                        ControlOptions.ShowBorder = False
                      end
                      object liLeftOvx1: TdxLayoutLabeledItem
                        CaptionOptions.Text = 'x'
                      end
                      object liLeftOvW: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = seLeftOvaryWidth
                        ControlOptions.ShowBorder = False
                      end
                      object liLeftOvx2: TdxLayoutLabeledItem
                        CaptionOptions.Text = 'x'
                      end
                      object liLeftOvH: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = seLeftOvaryHeight
                        ControlOptions.ShowBorder = False
                      end
                      object liLeftOvmm: TdxLayoutLabeledItem
                        CaptionOptions.Text = 'mm'
                      end
                      object liLeftOvVol: TdxLayoutItem
                        CaptionOptions.Text = 'Vol'
                        Control = seLeftOvaryCC
                        ControlOptions.ShowBorder = False
                      end
                      object liLeftOvcc: TdxLayoutLabeledItem
                        CaptionOptions.Text = 'cc'
                      end
                    end
                    object liLeftAppearance: TdxLayoutItem
                      CaptionOptions.Text = 'Appearance'
                      Control = cmbLeftOvaryAppearance
                      ControlOptions.ShowBorder = False
                    end
                    object lgLeftAFC: TdxLayoutGroup
                      CaptionOptions.Visible = False
                      ButtonOptions.Buttons = <>
                      LayoutDirection = ldHorizontal
                      ShowBorder = False
                      object liLeftAFC: TdxLayoutItem
                        CaptionOptions.Text = 'AFC'
                        Control = seLeftAFC
                        ControlOptions.ShowBorder = False
                      end
                      object liLeftMaxFol: TdxLayoutItem
                        CaptionOptions.Text = 'Max follicle'
                        Control = seLeftMaxFollicle
                        ControlOptions.ShowBorder = False
                      end
                      object liLeftFolMM: TdxLayoutLabeledItem
                        CaptionOptions.Text = 'mm'
                      end
                    end
                    object liLeftCLSep: TdxLayoutSeparatorItem
                      CaptionOptions.Text = 'Corpus Luteum'
                    end
                    object lgLeftCL: TdxLayoutGroup
                      CaptionOptions.Visible = False
                      ButtonOptions.Buttons = <>
                      LayoutDirection = ldHorizontal
                      ShowBorder = False
                      object liLeftCL: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = chkLeftCorpusLuteum
                        ControlOptions.ShowBorder = False
                      end
                      object liLeftHaemCL: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = chkLeftHaemorrhagicCL
                        ControlOptions.ShowBorder = False
                      end
                      object liLeftHaemSize: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = seLeftHaemCLSize
                        ControlOptions.ShowBorder = False
                      end
                      object liLeftHaemMM: TdxLayoutLabeledItem
                        CaptionOptions.Text = 'mm'
                      end
                      object liLeftResCL: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = chkLeftResolvingCL
                        ControlOptions.ShowBorder = False
                      end
                    end
                    object liLeftMobSep: TdxLayoutSeparatorItem
                      CaptionOptions.Text = 'Mobility'
                    end
                    object lgLeftMobility: TdxLayoutGroup
                      CaptionOptions.Visible = False
                      ButtonOptions.Buttons = <>
                      LayoutDirection = ldHorizontal
                      ShowBorder = False
                      object liLeftMobile: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = chkLeftMobile
                        ControlOptions.ShowBorder = False
                      end
                      object liLeftReduced: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = chkLeftReducedMobility
                        ControlOptions.ShowBorder = False
                      end
                      object liLeftStuck: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = chkLeftStuck
                        ControlOptions.ShowBorder = False
                      end
                      object liLeftRigid: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = chkLeftRigid
                        ControlOptions.ShowBorder = False
                      end
                    end
                    object lgLeftTender: TdxLayoutGroup
                      CaptionOptions.Visible = False
                      ButtonOptions.Buttons = <>
                      LayoutDirection = ldHorizontal
                      ShowBorder = False
                      object liLeftTender: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = chkLeftTender
                        ControlOptions.ShowBorder = False
                      end
                      object liLeftNonTender: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = chkLeftNonTender
                        ControlOptions.ShowBorder = False
                      end
                      object liLeftAccessible: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = chkLeftAccessible
                        ControlOptions.ShowBorder = False
                      end
                    end
                    object liLeftOtherSep: TdxLayoutSeparatorItem
                      CaptionOptions.Text = 'Other'
                    end
                    object lgLeftOther: TdxLayoutGroup
                      CaptionOptions.Visible = False
                      ButtonOptions.Buttons = <>
                      LayoutDirection = ldHorizontal
                      ShowBorder = False
                      object liLeftEcho: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = chkLeftEchogenicFoci
                        ControlOptions.ShowBorder = False
                      end
                      object liLeftScar: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = chkLeftScarring
                        ControlOptions.ShowBorder = False
                      end
                    end
                    object lgLeftParaCyst: TdxLayoutGroup
                      CaptionOptions.Visible = False
                      ButtonOptions.Buttons = <>
                      ShowBorder = False
                      object liLeftParaCyst: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = chkLeftParaOvarianCyst
                        ControlOptions.ShowBorder = False
                      end
                      object lgLeftParaDims: TdxLayoutGroup
                        CaptionOptions.Visible = False
                        ButtonOptions.Buttons = <>
                        LayoutDirection = ldHorizontal
                        ShowBorder = False
                        Visible = False
                        object liLeftPCL: TdxLayoutItem
                          CaptionOptions.Visible = False
                          Control = seLeftParaCystLength
                          ControlOptions.ShowBorder = False
                        end
                        object liLeftPCx1: TdxLayoutLabeledItem
                          CaptionOptions.Text = 'x'
                        end
                        object liLeftPCW: TdxLayoutItem
                          CaptionOptions.Visible = False
                          Control = seLeftParaCystWidth
                          ControlOptions.ShowBorder = False
                        end
                        object liLeftPCx2: TdxLayoutLabeledItem
                          CaptionOptions.Text = 'x'
                        end
                        object liLeftPCD: TdxLayoutItem
                          CaptionOptions.Visible = False
                          Control = seLeftParaCystDepth
                          ControlOptions.ShowBorder = False
                        end
                        object liLeftPCmm: TdxLayoutLabeledItem
                          CaptionOptions.Text = 'mm'
                        end
                      end
                    end
                  end
                end
              end
              object lgTotalAFC: TdxLayoutGroup
                CaptionOptions.Visible = False
                ButtonOptions.Buttons = <>
                LayoutDirection = ldHorizontal
                ShowBorder = False
                object liTotalAFCLabel: TdxLayoutLabeledItem
                  CaptionOptions.Text = 'Total AFC:'
                end
                object liTotalAFC: TdxLayoutItem
                  CaptionOptions.Visible = False
                  Control = lblTotalAFC
                  ControlOptions.ShowBorder = False
                end
              end
            end
          end

          object tsOvarianLesions: TcxTabSheet
            Caption = 'Ovarian Lesions'
            ImageIndex = 6
            object pcOvarianLesions: TcxPageControl
              Left = 0
              Top = 0
              Width = 888
              Height = 492
              Align = alClient
              TabOrder = 0
              Properties.ActivePage = tsCommonPathology
              Properties.CustomButtons.Buttons = <>
              ClientRectBottom = 492
              ClientRectRight = 888
              ClientRectTop = 24

              object tsCommonPathology: TcxTabSheet
                Caption = 'Common Pathologies'
                ImageIndex = 0
                object lcCommonPath: TdxLayoutControl
                  Left = 0
                  Top = 0
                  Width = 888
                  Height = 468
                  Align = alClient
                  TabOrder = 0
                  AutoSize = True
                  LayoutLookAndFeel = dxLayoutSkinLookAndFeel1

                  object chkRightSimpleCyst: TcxCheckBox
                    Left = 10000
                    Top = 10000
                    Caption = 'Simple cyst'
                    TabOrder = 0
                    Transparent = True
                    Width = 90
                  end
                  object seRightSimpleCystL: TcxSpinEdit
                    Left = 10000
                    Top = 10000
                    Properties.AssignedValues.MinValue = True
                    Properties.SpinButtons.Visible = False
                    Enabled = False
                    TabOrder = 0
                    Width = 35
                  end
                  object seRightSimpleCystW: TcxSpinEdit
                    Left = 10000
                    Top = 10000
                    Properties.AssignedValues.MinValue = True
                    Properties.SpinButtons.Visible = False
                    Enabled = False
                    TabOrder = 0
                    Width = 35
                  end
                  object seRightSimpleCystD: TcxSpinEdit
                    Left = 10000
                    Top = 10000
                    Properties.AssignedValues.MinValue = True
                    Properties.SpinButtons.Visible = False
                    Enabled = False
                    TabOrder = 0
                    Width = 35
                  end
                  object chkRightEndometrioma: TcxCheckBox
                    Left = 10000
                    Top = 10000
                    Caption = 'Endometrioma'
                    TabOrder = 0
                    Transparent = True
                    Width = 110
                  end
                  object seRightEndometriomaCount: TcxSpinEdit
                    Left = 10000
                    Top = 10000
                    Properties.MinValue = 1.000000000000000000
                    Properties.MaxValue = 3.000000000000000000
                    Enabled = False
                    TabOrder = 0
                    Value = 1
                    Width = 35
                  end
                  object seRightEndo1L: TcxSpinEdit
                    Left = 10000
                    Top = 10000
                    Properties.AssignedValues.MinValue = True
                    Properties.SpinButtons.Visible = False
                    Enabled = False
                    TabOrder = 0
                    Width = 35
                  end
                  object seRightEndo1W: TcxSpinEdit
                    Left = 10000
                    Top = 10000
                    Properties.AssignedValues.MinValue = True
                    Properties.SpinButtons.Visible = False
                    Enabled = False
                    TabOrder = 0
                    Width = 35
                  end
                  object seRightEndo1D: TcxSpinEdit
                    Left = 10000
                    Top = 10000
                    Properties.AssignedValues.MinValue = True
                    Properties.SpinButtons.Visible = False
                    Enabled = False
                    TabOrder = 0
                    Width = 35
                  end
                  object seRightEndo2L: TcxSpinEdit
                    Left = 10000
                    Top = 10000
                    Properties.AssignedValues.MinValue = True
                    Properties.SpinButtons.Visible = False
                    Enabled = False
                    TabOrder = 0
                    Width = 35
                  end
                  object seRightEndo2W: TcxSpinEdit
                    Left = 10000
                    Top = 10000
                    Properties.AssignedValues.MinValue = True
                    Properties.SpinButtons.Visible = False
                    Enabled = False
                    TabOrder = 0
                    Width = 35
                  end
                  object seRightEndo2D: TcxSpinEdit
                    Left = 10000
                    Top = 10000
                    Properties.AssignedValues.MinValue = True
                    Properties.SpinButtons.Visible = False
                    Enabled = False
                    TabOrder = 0
                    Width = 35
                  end
                  object seRightEndo3L: TcxSpinEdit
                    Left = 10000
                    Top = 10000
                    Properties.AssignedValues.MinValue = True
                    Properties.SpinButtons.Visible = False
                    Enabled = False
                    TabOrder = 0
                    Width = 35
                  end
                  object seRightEndo3W: TcxSpinEdit
                    Left = 10000
                    Top = 10000
                    Properties.AssignedValues.MinValue = True
                    Properties.SpinButtons.Visible = False
                    Enabled = False
                    TabOrder = 0
                    Width = 35
                  end
                  object seRightEndo3D: TcxSpinEdit
                    Left = 10000
                    Top = 10000
                    Properties.AssignedValues.MinValue = True
                    Properties.SpinButtons.Visible = False
                    Enabled = False
                    TabOrder = 0
                    Width = 35
                  end
                  object chkRightDermoid: TcxCheckBox
                    Left = 10000
                    Top = 10000
                    Caption = 'Dermoid'
                    TabOrder = 0
                    Transparent = True
                    Width = 75
                  end
                  object seRightDermoidL: TcxSpinEdit
                    Left = 10000
                    Top = 10000
                    Properties.AssignedValues.MinValue = True
                    Properties.SpinButtons.Visible = False
                    Enabled = False
                    TabOrder = 0
                    Width = 35
                  end
                  object seRightDermoidW: TcxSpinEdit
                    Left = 10000
                    Top = 10000
                    Properties.AssignedValues.MinValue = True
                    Properties.SpinButtons.Visible = False
                    Enabled = False
                    TabOrder = 0
                    Width = 35
                  end
                  object seRightDermoidD: TcxSpinEdit
                    Left = 10000
                    Top = 10000
                    Properties.AssignedValues.MinValue = True
                    Properties.SpinButtons.Visible = False
                    Enabled = False
                    TabOrder = 0
                    Width = 35
                  end
                  object chkRightFibroma: TcxCheckBox
                    Left = 10000
                    Top = 10000
                    Caption = 'Fibroma'
                    TabOrder = 0
                    Transparent = True
                    Width = 75
                  end
                  object seRightFibromaL: TcxSpinEdit
                    Left = 10000
                    Top = 10000
                    Properties.AssignedValues.MinValue = True
                    Properties.SpinButtons.Visible = False
                    Enabled = False
                    TabOrder = 0
                    Width = 35
                  end
                  object seRightFibromaW: TcxSpinEdit
                    Left = 10000
                    Top = 10000
                    Properties.AssignedValues.MinValue = True
                    Properties.SpinButtons.Visible = False
                    Enabled = False
                    TabOrder = 0
                    Width = 35
                  end
                  object seRightFibromaD: TcxSpinEdit
                    Left = 10000
                    Top = 10000
                    Properties.AssignedValues.MinValue = True
                    Properties.SpinButtons.Visible = False
                    Enabled = False
                    TabOrder = 0
                    Width = 35
                  end
                  object chkLeftSimpleCyst: TcxCheckBox
                    Left = 10000
                    Top = 10000
                    Caption = 'Simple cyst'
                    TabOrder = 0
                    Transparent = True
                    Width = 90
                  end
                  object seLeftSimpleCystL: TcxSpinEdit
                    Left = 10000
                    Top = 10000
                    Properties.AssignedValues.MinValue = True
                    Properties.SpinButtons.Visible = False
                    Enabled = False
                    TabOrder = 0
                    Width = 35
                  end
                  object seLeftSimpleCystW: TcxSpinEdit
                    Left = 10000
                    Top = 10000
                    Properties.AssignedValues.MinValue = True
                    Properties.SpinButtons.Visible = False
                    Enabled = False
                    TabOrder = 0
                    Width = 35
                  end
                  object seLeftSimpleCystD: TcxSpinEdit
                    Left = 10000
                    Top = 10000
                    Properties.AssignedValues.MinValue = True
                    Properties.SpinButtons.Visible = False
                    Enabled = False
                    TabOrder = 0
                    Width = 35
                  end
                  object chkLeftEndometrioma: TcxCheckBox
                    Left = 10000
                    Top = 10000
                    Caption = 'Endometrioma'
                    TabOrder = 0
                    Transparent = True
                    Width = 110
                  end
                  object seLeftEndometriomaCount: TcxSpinEdit
                    Left = 10000
                    Top = 10000
                    Properties.MinValue = 1.000000000000000000
                    Properties.MaxValue = 3.000000000000000000
                    Enabled = False
                    TabOrder = 0
                    Value = 1
                    Width = 35
                  end
                  object seLeftEndo1L: TcxSpinEdit
                    Left = 10000
                    Top = 10000
                    Properties.AssignedValues.MinValue = True
                    Properties.SpinButtons.Visible = False
                    Enabled = False
                    TabOrder = 0
                    Width = 35
                  end
                  object seLeftEndo1W: TcxSpinEdit
                    Left = 10000
                    Top = 10000
                    Properties.AssignedValues.MinValue = True
                    Properties.SpinButtons.Visible = False
                    Enabled = False
                    TabOrder = 0
                    Width = 35
                  end
                  object seLeftEndo1D: TcxSpinEdit
                    Left = 10000
                    Top = 10000
                    Properties.AssignedValues.MinValue = True
                    Properties.SpinButtons.Visible = False
                    Enabled = False
                    TabOrder = 0
                    Width = 35
                  end
                  object seLeftEndo2L: TcxSpinEdit
                    Left = 10000
                    Top = 10000
                    Properties.AssignedValues.MinValue = True
                    Properties.SpinButtons.Visible = False
                    Enabled = False
                    TabOrder = 0
                    Width = 35
                  end
                  object seLeftEndo2W: TcxSpinEdit
                    Left = 10000
                    Top = 10000
                    Properties.AssignedValues.MinValue = True
                    Properties.SpinButtons.Visible = False
                    Enabled = False
                    TabOrder = 0
                    Width = 35
                  end
                  object seLeftEndo2D: TcxSpinEdit
                    Left = 10000
                    Top = 10000
                    Properties.AssignedValues.MinValue = True
                    Properties.SpinButtons.Visible = False
                    Enabled = False
                    TabOrder = 0
                    Width = 35
                  end
                  object seLeftEndo3L: TcxSpinEdit
                    Left = 10000
                    Top = 10000
                    Properties.AssignedValues.MinValue = True
                    Properties.SpinButtons.Visible = False
                    Enabled = False
                    TabOrder = 0
                    Width = 35
                  end
                  object seLeftEndo3W: TcxSpinEdit
                    Left = 10000
                    Top = 10000
                    Properties.AssignedValues.MinValue = True
                    Properties.SpinButtons.Visible = False
                    Enabled = False
                    TabOrder = 0
                    Width = 35
                  end
                  object seLeftEndo3D: TcxSpinEdit
                    Left = 10000
                    Top = 10000
                    Properties.AssignedValues.MinValue = True
                    Properties.SpinButtons.Visible = False
                    Enabled = False
                    TabOrder = 0
                    Width = 35
                  end
                  object chkLeftDermoid: TcxCheckBox
                    Left = 10000
                    Top = 10000
                    Caption = 'Dermoid'
                    TabOrder = 0
                    Transparent = True
                    Width = 75
                  end
                  object seLeftDermoidL: TcxSpinEdit
                    Left = 10000
                    Top = 10000
                    Properties.AssignedValues.MinValue = True
                    Properties.SpinButtons.Visible = False
                    Enabled = False
                    TabOrder = 0
                    Width = 35
                  end
                  object seLeftDermoidW: TcxSpinEdit
                    Left = 10000
                    Top = 10000
                    Properties.AssignedValues.MinValue = True
                    Properties.SpinButtons.Visible = False
                    Enabled = False
                    TabOrder = 0
                    Width = 35
                  end
                  object seLeftDermoidD: TcxSpinEdit
                    Left = 10000
                    Top = 10000
                    Properties.AssignedValues.MinValue = True
                    Properties.SpinButtons.Visible = False
                    Enabled = False
                    TabOrder = 0
                    Width = 35
                  end
                  object chkLeftFibroma: TcxCheckBox
                    Left = 10000
                    Top = 10000
                    Caption = 'Fibroma'
                    TabOrder = 0
                    Transparent = True
                    Width = 75
                  end
                  object seLeftFibromaL: TcxSpinEdit
                    Left = 10000
                    Top = 10000
                    Properties.AssignedValues.MinValue = True
                    Properties.SpinButtons.Visible = False
                    Enabled = False
                    TabOrder = 0
                    Width = 35
                  end
                  object seLeftFibromaW: TcxSpinEdit
                    Left = 10000
                    Top = 10000
                    Properties.AssignedValues.MinValue = True
                    Properties.SpinButtons.Visible = False
                    Enabled = False
                    TabOrder = 0
                    Width = 35
                  end
                  object seLeftFibromaD: TcxSpinEdit
                    Left = 10000
                    Top = 10000
                    Properties.AssignedValues.MinValue = True
                    Properties.SpinButtons.Visible = False
                    Enabled = False
                    TabOrder = 0
                    Width = 35
                  end

                  object lcCommonPathGroup_Root: TdxLayoutGroup
                    AlignHorz = ahClient
                    AlignVert = avTop
                    ButtonOptions.Buttons = <>
                    Hidden = True
                    LayoutDirection = ldHorizontal
                    ShowBorder = False
                    object lgRightPathology: TdxLayoutGroup
                      CaptionOptions.Text = 'Right Ovary'
                      CaptionOptions.Visible = True
                      ButtonOptions.Buttons = <>
                      ShowBorder = True
                      object liRightSimpleCyst: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = chkRightSimpleCyst
                        ControlOptions.ShowBorder = False
                      end
                      object lgRightSimpleCystDims: TdxLayoutGroup
                        CaptionOptions.Visible = False
                        ButtonOptions.Buttons = <>
                        ShowBorder = False
                        Visible = False
                        object lgRightSCDims: TdxLayoutGroup
                      CaptionOptions.Visible = False
                      ButtonOptions.Buttons = <>
                      LayoutDirection = ldHorizontal
                      ShowBorder = False
                      object liRightSCL: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = seRightSimpleCystL
                        ControlOptions.ShowBorder = False
                      end
                      object liRightSCx1: TdxLayoutLabeledItem
                        CaptionOptions.Text = 'x'
                      end
                      object liRightSCW: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = seRightSimpleCystW
                        ControlOptions.ShowBorder = False
                      end
                      object liRightSCx2: TdxLayoutLabeledItem
                        CaptionOptions.Text = 'x'
                      end
                      object liRightSCD: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = seRightSimpleCystD
                        ControlOptions.ShowBorder = False
                      end
                      object liRightSCmm: TdxLayoutLabeledItem
                        CaptionOptions.Text = 'mm'
                      end
                    end
                      end
                      object liRightEndometrioma: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = chkRightEndometrioma
                        ControlOptions.ShowBorder = False
                      end
                      object lgRightEndoDetails: TdxLayoutGroup
                        CaptionOptions.Visible = False
                        ButtonOptions.Buttons = <>
                        ShowBorder = False
                        Visible = False
                        object liRightEndoCount: TdxLayoutItem
                          CaptionOptions.Text = 'Count'
                          Control = seRightEndometriomaCount
                          ControlOptions.ShowBorder = False
                        end
                        object lgRightEndo1: TdxLayoutGroup
                          CaptionOptions.Text = '#1'
                          CaptionOptions.Visible = True
                          ButtonOptions.Buttons = <>
                          ShowBorder = False
                          Visible = True
                          object lgRightE1Dims: TdxLayoutGroup
                      CaptionOptions.Visible = False
                      ButtonOptions.Buttons = <>
                      LayoutDirection = ldHorizontal
                      ShowBorder = False
                      object liRightE1L: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = seRightEndo1L
                        ControlOptions.ShowBorder = False
                      end
                      object liRightE1x1: TdxLayoutLabeledItem
                        CaptionOptions.Text = 'x'
                      end
                      object liRightE1W: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = seRightEndo1W
                        ControlOptions.ShowBorder = False
                      end
                      object liRightE1x2: TdxLayoutLabeledItem
                        CaptionOptions.Text = 'x'
                      end
                      object liRightE1D: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = seRightEndo1D
                        ControlOptions.ShowBorder = False
                      end
                      object liRightE1mm: TdxLayoutLabeledItem
                        CaptionOptions.Text = 'mm'
                      end
                    end
                        end
                        object lgRightEndo2: TdxLayoutGroup
                          CaptionOptions.Text = '#2'
                          CaptionOptions.Visible = True
                          ButtonOptions.Buttons = <>
                          ShowBorder = False
                          Visible = False
                          object lgRightE2Dims: TdxLayoutGroup
                      CaptionOptions.Visible = False
                      ButtonOptions.Buttons = <>
                      LayoutDirection = ldHorizontal
                      ShowBorder = False
                      object liRightE2L: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = seRightEndo2L
                        ControlOptions.ShowBorder = False
                      end
                      object liRightE2x1: TdxLayoutLabeledItem
                        CaptionOptions.Text = 'x'
                      end
                      object liRightE2W: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = seRightEndo2W
                        ControlOptions.ShowBorder = False
                      end
                      object liRightE2x2: TdxLayoutLabeledItem
                        CaptionOptions.Text = 'x'
                      end
                      object liRightE2D: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = seRightEndo2D
                        ControlOptions.ShowBorder = False
                      end
                      object liRightE2mm: TdxLayoutLabeledItem
                        CaptionOptions.Text = 'mm'
                      end
                    end
                        end
                        object lgRightEndo3: TdxLayoutGroup
                          CaptionOptions.Text = '#3'
                          CaptionOptions.Visible = True
                          ButtonOptions.Buttons = <>
                          ShowBorder = False
                          Visible = False
                          object lgRightE3Dims: TdxLayoutGroup
                      CaptionOptions.Visible = False
                      ButtonOptions.Buttons = <>
                      LayoutDirection = ldHorizontal
                      ShowBorder = False
                      object liRightE3L: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = seRightEndo3L
                        ControlOptions.ShowBorder = False
                      end
                      object liRightE3x1: TdxLayoutLabeledItem
                        CaptionOptions.Text = 'x'
                      end
                      object liRightE3W: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = seRightEndo3W
                        ControlOptions.ShowBorder = False
                      end
                      object liRightE3x2: TdxLayoutLabeledItem
                        CaptionOptions.Text = 'x'
                      end
                      object liRightE3D: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = seRightEndo3D
                        ControlOptions.ShowBorder = False
                      end
                      object liRightE3mm: TdxLayoutLabeledItem
                        CaptionOptions.Text = 'mm'
                      end
                    end
                        end
                      end
                      object liRightDermoid: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = chkRightDermoid
                        ControlOptions.ShowBorder = False
                      end
                      object lgRightDermoidDims: TdxLayoutGroup
                        CaptionOptions.Visible = False
                        ButtonOptions.Buttons = <>
                        ShowBorder = False
                        Visible = False
                        object lgRightDDims: TdxLayoutGroup
                      CaptionOptions.Visible = False
                      ButtonOptions.Buttons = <>
                      LayoutDirection = ldHorizontal
                      ShowBorder = False
                      object liRightDL: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = seRightDermoidL
                        ControlOptions.ShowBorder = False
                      end
                      object liRightDx1: TdxLayoutLabeledItem
                        CaptionOptions.Text = 'x'
                      end
                      object liRightDW: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = seRightDermoidW
                        ControlOptions.ShowBorder = False
                      end
                      object liRightDx2: TdxLayoutLabeledItem
                        CaptionOptions.Text = 'x'
                      end
                      object liRightDD: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = seRightDermoidD
                        ControlOptions.ShowBorder = False
                      end
                      object liRightDmm: TdxLayoutLabeledItem
                        CaptionOptions.Text = 'mm'
                      end
                    end
                      end
                      object liRightFibroma: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = chkRightFibroma
                        ControlOptions.ShowBorder = False
                      end
                      object lgRightFibromaDims: TdxLayoutGroup
                        CaptionOptions.Visible = False
                        ButtonOptions.Buttons = <>
                        ShowBorder = False
                        Visible = False
                        object lgRightFDims: TdxLayoutGroup
                      CaptionOptions.Visible = False
                      ButtonOptions.Buttons = <>
                      LayoutDirection = ldHorizontal
                      ShowBorder = False
                      object liRightFL: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = seRightFibromaL
                        ControlOptions.ShowBorder = False
                      end
                      object liRightFx1: TdxLayoutLabeledItem
                        CaptionOptions.Text = 'x'
                      end
                      object liRightFW: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = seRightFibromaW
                        ControlOptions.ShowBorder = False
                      end
                      object liRightFx2: TdxLayoutLabeledItem
                        CaptionOptions.Text = 'x'
                      end
                      object liRightFD: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = seRightFibromaD
                        ControlOptions.ShowBorder = False
                      end
                      object liRightFmm: TdxLayoutLabeledItem
                        CaptionOptions.Text = 'mm'
                      end
                    end
                      end
                    end
                    object lgLeftPathology: TdxLayoutGroup
                      CaptionOptions.Text = 'Left Ovary'
                      CaptionOptions.Visible = True
                      ButtonOptions.Buttons = <>
                      ShowBorder = True
                      object liLeftSimpleCyst: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = chkLeftSimpleCyst
                        ControlOptions.ShowBorder = False
                      end
                      object lgLeftSimpleCystDims: TdxLayoutGroup
                        CaptionOptions.Visible = False
                        ButtonOptions.Buttons = <>
                        ShowBorder = False
                        Visible = False
                        object lgLeftSCDims: TdxLayoutGroup
                      CaptionOptions.Visible = False
                      ButtonOptions.Buttons = <>
                      LayoutDirection = ldHorizontal
                      ShowBorder = False
                      object liLeftSCL: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = seLeftSimpleCystL
                        ControlOptions.ShowBorder = False
                      end
                      object liLeftSCx1: TdxLayoutLabeledItem
                        CaptionOptions.Text = 'x'
                      end
                      object liLeftSCW: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = seLeftSimpleCystW
                        ControlOptions.ShowBorder = False
                      end
                      object liLeftSCx2: TdxLayoutLabeledItem
                        CaptionOptions.Text = 'x'
                      end
                      object liLeftSCD: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = seLeftSimpleCystD
                        ControlOptions.ShowBorder = False
                      end
                      object liLeftSCmm: TdxLayoutLabeledItem
                        CaptionOptions.Text = 'mm'
                      end
                    end
                      end
                      object liLeftEndometrioma: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = chkLeftEndometrioma
                        ControlOptions.ShowBorder = False
                      end
                      object lgLeftEndoDetails: TdxLayoutGroup
                        CaptionOptions.Visible = False
                        ButtonOptions.Buttons = <>
                        ShowBorder = False
                        Visible = False
                        object liLeftEndoCount: TdxLayoutItem
                          CaptionOptions.Text = 'Count'
                          Control = seLeftEndometriomaCount
                          ControlOptions.ShowBorder = False
                        end
                        object lgLeftEndo1: TdxLayoutGroup
                          CaptionOptions.Text = '#1'
                          CaptionOptions.Visible = True
                          ButtonOptions.Buttons = <>
                          ShowBorder = False
                          Visible = True
                          object lgLeftE1Dims: TdxLayoutGroup
                      CaptionOptions.Visible = False
                      ButtonOptions.Buttons = <>
                      LayoutDirection = ldHorizontal
                      ShowBorder = False
                      object liLeftE1L: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = seLeftEndo1L
                        ControlOptions.ShowBorder = False
                      end
                      object liLeftE1x1: TdxLayoutLabeledItem
                        CaptionOptions.Text = 'x'
                      end
                      object liLeftE1W: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = seLeftEndo1W
                        ControlOptions.ShowBorder = False
                      end
                      object liLeftE1x2: TdxLayoutLabeledItem
                        CaptionOptions.Text = 'x'
                      end
                      object liLeftE1D: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = seLeftEndo1D
                        ControlOptions.ShowBorder = False
                      end
                      object liLeftE1mm: TdxLayoutLabeledItem
                        CaptionOptions.Text = 'mm'
                      end
                    end
                        end
                        object lgLeftEndo2: TdxLayoutGroup
                          CaptionOptions.Text = '#2'
                          CaptionOptions.Visible = True
                          ButtonOptions.Buttons = <>
                          ShowBorder = False
                          Visible = False
                          object lgLeftE2Dims: TdxLayoutGroup
                      CaptionOptions.Visible = False
                      ButtonOptions.Buttons = <>
                      LayoutDirection = ldHorizontal
                      ShowBorder = False
                      object liLeftE2L: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = seLeftEndo2L
                        ControlOptions.ShowBorder = False
                      end
                      object liLeftE2x1: TdxLayoutLabeledItem
                        CaptionOptions.Text = 'x'
                      end
                      object liLeftE2W: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = seLeftEndo2W
                        ControlOptions.ShowBorder = False
                      end
                      object liLeftE2x2: TdxLayoutLabeledItem
                        CaptionOptions.Text = 'x'
                      end
                      object liLeftE2D: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = seLeftEndo2D
                        ControlOptions.ShowBorder = False
                      end
                      object liLeftE2mm: TdxLayoutLabeledItem
                        CaptionOptions.Text = 'mm'
                      end
                    end
                        end
                        object lgLeftEndo3: TdxLayoutGroup
                          CaptionOptions.Text = '#3'
                          CaptionOptions.Visible = True
                          ButtonOptions.Buttons = <>
                          ShowBorder = False
                          Visible = False
                          object lgLeftE3Dims: TdxLayoutGroup
                      CaptionOptions.Visible = False
                      ButtonOptions.Buttons = <>
                      LayoutDirection = ldHorizontal
                      ShowBorder = False
                      object liLeftE3L: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = seLeftEndo3L
                        ControlOptions.ShowBorder = False
                      end
                      object liLeftE3x1: TdxLayoutLabeledItem
                        CaptionOptions.Text = 'x'
                      end
                      object liLeftE3W: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = seLeftEndo3W
                        ControlOptions.ShowBorder = False
                      end
                      object liLeftE3x2: TdxLayoutLabeledItem
                        CaptionOptions.Text = 'x'
                      end
                      object liLeftE3D: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = seLeftEndo3D
                        ControlOptions.ShowBorder = False
                      end
                      object liLeftE3mm: TdxLayoutLabeledItem
                        CaptionOptions.Text = 'mm'
                      end
                    end
                        end
                      end
                      object liLeftDermoid: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = chkLeftDermoid
                        ControlOptions.ShowBorder = False
                      end
                      object lgLeftDermoidDims: TdxLayoutGroup
                        CaptionOptions.Visible = False
                        ButtonOptions.Buttons = <>
                        ShowBorder = False
                        Visible = False
                        object lgLeftDDims: TdxLayoutGroup
                      CaptionOptions.Visible = False
                      ButtonOptions.Buttons = <>
                      LayoutDirection = ldHorizontal
                      ShowBorder = False
                      object liLeftDL: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = seLeftDermoidL
                        ControlOptions.ShowBorder = False
                      end
                      object liLeftDx1: TdxLayoutLabeledItem
                        CaptionOptions.Text = 'x'
                      end
                      object liLeftDW: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = seLeftDermoidW
                        ControlOptions.ShowBorder = False
                      end
                      object liLeftDx2: TdxLayoutLabeledItem
                        CaptionOptions.Text = 'x'
                      end
                      object liLeftDD: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = seLeftDermoidD
                        ControlOptions.ShowBorder = False
                      end
                      object liLeftDmm: TdxLayoutLabeledItem
                        CaptionOptions.Text = 'mm'
                      end
                    end
                      end
                      object liLeftFibroma: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = chkLeftFibroma
                        ControlOptions.ShowBorder = False
                      end
                      object lgLeftFibromaDims: TdxLayoutGroup
                        CaptionOptions.Visible = False
                        ButtonOptions.Buttons = <>
                        ShowBorder = False
                        Visible = False
                        object lgLeftFDims: TdxLayoutGroup
                      CaptionOptions.Visible = False
                      ButtonOptions.Buttons = <>
                      LayoutDirection = ldHorizontal
                      ShowBorder = False
                      object liLeftFL: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = seLeftFibromaL
                        ControlOptions.ShowBorder = False
                      end
                      object liLeftFx1: TdxLayoutLabeledItem
                        CaptionOptions.Text = 'x'
                      end
                      object liLeftFW: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = seLeftFibromaW
                        ControlOptions.ShowBorder = False
                      end
                      object liLeftFx2: TdxLayoutLabeledItem
                        CaptionOptions.Text = 'x'
                      end
                      object liLeftFD: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = seLeftFibromaD
                        ControlOptions.ShowBorder = False
                      end
                      object liLeftFmm: TdxLayoutLabeledItem
                        CaptionOptions.Text = 'mm'
                      end
                    end
                      end
                    end
                  end
                end
              end

              object tsComplexPathology: TcxTabSheet
                Caption = 'More Complex Pathology'
                ImageIndex = 0
                object lcComplex: TdxLayoutControl
                  Left = 0
                  Top = 0
                  Width = 888
                  Height = 468
                  Align = alClient
                  TabOrder = 0
                  AutoSize = True
                  LayoutLookAndFeel = dxLayoutSkinLookAndFeel1

                  object cmbIOTAClassRight: TcxComboBox
                    Left = 10000
                    Top = 10000
                    Properties.DropDownListStyle = lsFixedList
                    Properties.Items.Strings = (
                      ''
                      'unilocular'
                      'unilocular solid'
                      'multilocular'
                      'multilocular solid'
                      'solid')
                    TabOrder = 0
                    Width = 140
                  end
                  object chkCystWallSmoothRight: TcxCheckBox
                    Left = 10000
                    Top = 10000
                    Caption = 'Cyst wall smooth'
                    TabOrder = 0
                    Transparent = True
                    Width = 130
                  end
                  object seRightPapillaryCount: TcxSpinEdit
                    Left = 10000
                    Top = 10000
                    Properties.AssignedValues.MinValue = True
                    Properties.MaxValue = 10.000000000000000000
                    TabOrder = 0
                    Width = 35
                  end
                  object seRightPapillaryHeight: TcxSpinEdit
                    Left = 10000
                    Top = 10000
                    Properties.AssignedValues.MinValue = True
                    Properties.SpinButtons.Visible = False
                    TabOrder = 0
                    Width = 35
                  end
                  object cmbInternalContentRight: TcxComboBox
                    Left = 10000
                    Top = 10000
                    Properties.DropDownListStyle = lsFixedList
                    Properties.Items.Strings = (
                      ''
                      'anechoic'
                      'low-level'
                      'ground glass'
                      'haemorrhagic'
                      'mixed')
                    TabOrder = 0
                    Width = 120
                  end
                  object cmbVascularityRight: TcxComboBox
                    Left = 10000
                    Top = 10000
                    Properties.DropDownListStyle = lsFixedList
                    Properties.Items.Strings = (
                      ''
                      'no vascularity'
                      'minimal'
                      'moderate'
                      'strong')
                    TabOrder = 0
                    Width = 120
                  end
                  object chkAscitesRight: TcxCheckBox
                    Left = 10000
                    Top = 10000
                    Caption = 'Ascites'
                    TabOrder = 0
                    Transparent = True
                    Width = 70
                  end
                  object cmbIOTAClassLeft: TcxComboBox
                    Left = 10000
                    Top = 10000
                    Properties.DropDownListStyle = lsFixedList
                    Properties.Items.Strings = (
                      ''
                      'unilocular'
                      'unilocular solid'
                      'multilocular'
                      'multilocular solid'
                      'solid')
                    TabOrder = 0
                    Width = 140
                  end
                  object chkCystWallSmoothLeft: TcxCheckBox
                    Left = 10000
                    Top = 10000
                    Caption = 'Cyst wall smooth'
                    TabOrder = 0
                    Transparent = True
                    Width = 130
                  end
                  object seLeftPapillaryCount: TcxSpinEdit
                    Left = 10000
                    Top = 10000
                    Properties.AssignedValues.MinValue = True
                    Properties.MaxValue = 10.000000000000000000
                    TabOrder = 0
                    Width = 35
                  end
                  object seLeftPapillaryHeight: TcxSpinEdit
                    Left = 10000
                    Top = 10000
                    Properties.AssignedValues.MinValue = True
                    Properties.SpinButtons.Visible = False
                    TabOrder = 0
                    Width = 35
                  end
                  object cmbInternalContentLeft: TcxComboBox
                    Left = 10000
                    Top = 10000
                    Properties.DropDownListStyle = lsFixedList
                    Properties.Items.Strings = (
                      ''
                      'anechoic'
                      'low-level'
                      'ground glass'
                      'haemorrhagic'
                      'mixed')
                    TabOrder = 0
                    Width = 120
                  end
                  object cmbVascularityLeft: TcxComboBox
                    Left = 10000
                    Top = 10000
                    Properties.DropDownListStyle = lsFixedList
                    Properties.Items.Strings = (
                      ''
                      'no vascularity'
                      'minimal'
                      'moderate'
                      'strong')
                    TabOrder = 0
                    Width = 120
                  end
                  object chkAscitesLeft: TcxCheckBox
                    Left = 10000
                    Top = 10000
                    Caption = 'Ascites'
                    TabOrder = 0
                    Transparent = True
                    Width = 70
                  end

                  object lcComplexGroup_Root: TdxLayoutGroup
                    AlignHorz = ahClient
                    AlignVert = avTop
                    ButtonOptions.Buttons = <>
                    Hidden = True
                    LayoutDirection = ldHorizontal
                    ShowBorder = False
                    object lgRightComplex: TdxLayoutGroup
                      CaptionOptions.Text = 'Right'
                      CaptionOptions.Visible = True
                      ButtonOptions.Buttons = <>
                      ShowBorder = True
                      object liRightClass: TdxLayoutItem
                        CaptionOptions.Text = 'Classification'
                        Control = cmbIOTAClassRight
                        ControlOptions.ShowBorder = False
                      end
                      object liRightSmooth: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = chkCystWallSmoothRight
                        ControlOptions.ShowBorder = False
                      end
                      object lgRightPapillary: TdxLayoutGroup
                        CaptionOptions.Visible = False
                        ButtonOptions.Buttons = <>
                        LayoutDirection = ldHorizontal
                        ShowBorder = False
                        object liRightPapCount: TdxLayoutItem
                          CaptionOptions.Text = 'Papillary projections'
                          Control = seRightPapillaryCount
                          ControlOptions.ShowBorder = False
                        end
                        object liRightPapHeight: TdxLayoutItem
                          CaptionOptions.Text = 'Max height'
                          Control = seRightPapillaryHeight
                          ControlOptions.ShowBorder = False
                        end
                        object liRightPapMM: TdxLayoutLabeledItem
                          CaptionOptions.Text = 'mm'
                        end
                      end
                      object liRightContent: TdxLayoutItem
                        CaptionOptions.Text = 'Internal content'
                        Control = cmbInternalContentRight
                        ControlOptions.ShowBorder = False
                      end
                      object liRightVasc: TdxLayoutItem
                        CaptionOptions.Text = 'Vascularity'
                        Control = cmbVascularityRight
                        ControlOptions.ShowBorder = False
                      end
                      object liRightAscites: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = chkAscitesRight
                        ControlOptions.ShowBorder = False
                      end
                    end
                    object lgLeftComplex: TdxLayoutGroup
                      CaptionOptions.Text = 'Left'
                      CaptionOptions.Visible = True
                      ButtonOptions.Buttons = <>
                      ShowBorder = True
                      object liLeftClass: TdxLayoutItem
                        CaptionOptions.Text = 'Classification'
                        Control = cmbIOTAClassLeft
                        ControlOptions.ShowBorder = False
                      end
                      object liLeftSmooth: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = chkCystWallSmoothLeft
                        ControlOptions.ShowBorder = False
                      end
                      object lgLeftPapillary: TdxLayoutGroup
                        CaptionOptions.Visible = False
                        ButtonOptions.Buttons = <>
                        LayoutDirection = ldHorizontal
                        ShowBorder = False
                        object liLeftPapCount: TdxLayoutItem
                          CaptionOptions.Text = 'Papillary projections'
                          Control = seLeftPapillaryCount
                          ControlOptions.ShowBorder = False
                        end
                        object liLeftPapHeight: TdxLayoutItem
                          CaptionOptions.Text = 'Max height'
                          Control = seLeftPapillaryHeight
                          ControlOptions.ShowBorder = False
                        end
                        object liLeftPapMM: TdxLayoutLabeledItem
                          CaptionOptions.Text = 'mm'
                        end
                      end
                      object liLeftContent: TdxLayoutItem
                        CaptionOptions.Text = 'Internal content'
                        Control = cmbInternalContentLeft
                        ControlOptions.ShowBorder = False
                      end
                      object liLeftVasc: TdxLayoutItem
                        CaptionOptions.Text = 'Vascularity'
                        Control = cmbVascularityLeft
                        ControlOptions.ShowBorder = False
                      end
                      object liLeftAscites: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = chkAscitesLeft
                        ControlOptions.ShowBorder = False
                      end
                    end
                  end
                end
              end

              object tsIOTASimpleRules: TcxTabSheet
                Caption = 'IOTA Simple Rules'
                ImageIndex = 0
                object lcSimpleRules: TdxLayoutControl
                  Left = 0
                  Top = 0
                  Width = 888
                  Height = 468
                  Align = alClient
                  TabOrder = 0
                  AutoSize = True
                  LayoutLookAndFeel = dxLayoutSkinLookAndFeel1

                  object chkB1Unilocular: TcxCheckBox
                    Left = 10000
                    Top = 10000
                    Caption = 'B1: Unilocular'
                    TabOrder = 0
                    Transparent = True
                    Width = 250
                  end
                  object chkB2SolidLessThan7: TcxCheckBox
                    Left = 10000
                    Top = 10000
                    Caption = 'B2: Solid component <7mm'
                    TabOrder = 0
                    Transparent = True
                    Width = 250
                  end
                  object chkB3AcousticShadows: TcxCheckBox
                    Left = 10000
                    Top = 10000
                    Caption = 'B3: Acoustic shadows'
                    TabOrder = 0
                    Transparent = True
                    Width = 250
                  end
                  object chkB4SmoothMultilocular: TcxCheckBox
                    Left = 10000
                    Top = 10000
                    Caption = 'B4: Smooth multilocular <100mm'
                    TabOrder = 0
                    Transparent = True
                    Width = 250
                  end
                  object chkB5NoBloodFlow: TcxCheckBox
                    Left = 10000
                    Top = 10000
                    Caption = 'B5: No blood flow'
                    TabOrder = 0
                    Transparent = True
                    Width = 250
                  end
                  object chkM1IrregularSolid: TcxCheckBox
                    Left = 10000
                    Top = 10000
                    Caption = 'M1: Irregular solid tumour'
                    TabOrder = 0
                    Transparent = True
                    Width = 300
                  end
                  object chkM2Ascites: TcxCheckBox
                    Left = 10000
                    Top = 10000
                    Caption = 'M2: Ascites'
                    TabOrder = 0
                    Transparent = True
                    Width = 300
                  end
                  object chkM3PapillaryProjections: TcxCheckBox
                    Left = 10000
                    Top = 10000
                    Caption = 'M3: >=4 papillary projections'
                    TabOrder = 0
                    Transparent = True
                    Width = 300
                  end
                  object chkM4IrregularMultilocular: TcxCheckBox
                    Left = 10000
                    Top = 10000
                    Caption = 'M4: Irregular multilocular solid >=100mm'
                    TabOrder = 0
                    Transparent = True
                    Width = 300
                  end
                  object chkM5HighBloodFlow: TcxCheckBox
                    Left = 10000
                    Top = 10000
                    Caption = 'M5: Very strong blood flow'
                    TabOrder = 0
                    Transparent = True
                    Width = 300
                  end
                  object lblSimpleRulesResult: TcxLabel
                    Left = 10000
                    Top = 10000
                    Caption = ''
                    Transparent = True
                  end

                  object lcSimpleRulesGroup_Root: TdxLayoutGroup
                    AlignHorz = ahClient
                    AlignVert = avTop
                    ButtonOptions.Buttons = <>
                    Hidden = True
                    LayoutDirection = ldHorizontal
                    ShowBorder = False
                    object lgBFeatures: TdxLayoutGroup
                      CaptionOptions.Text = 'B-features (benign)'
                      CaptionOptions.Visible = True
                      ButtonOptions.Buttons = <>
                      ShowBorder = True
                      object liB1: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = chkB1Unilocular
                        ControlOptions.ShowBorder = False
                      end
                      object liB2: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = chkB2SolidLessThan7
                        ControlOptions.ShowBorder = False
                      end
                      object liB3: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = chkB3AcousticShadows
                        ControlOptions.ShowBorder = False
                      end
                      object liB4: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = chkB4SmoothMultilocular
                        ControlOptions.ShowBorder = False
                      end
                      object liB5: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = chkB5NoBloodFlow
                        ControlOptions.ShowBorder = False
                      end
                    end
                    object lgMFeatures: TdxLayoutGroup
                      CaptionOptions.Text = 'M-features (malignant)'
                      CaptionOptions.Visible = True
                      ButtonOptions.Buttons = <>
                      ShowBorder = True
                      object liM1: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = chkM1IrregularSolid
                        ControlOptions.ShowBorder = False
                      end
                      object liM2: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = chkM2Ascites
                        ControlOptions.ShowBorder = False
                      end
                      object liM3: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = chkM3PapillaryProjections
                        ControlOptions.ShowBorder = False
                      end
                      object liM4: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = chkM4IrregularMultilocular
                        ControlOptions.ShowBorder = False
                      end
                      object liM5: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = chkM5HighBloodFlow
                        ControlOptions.ShowBorder = False
                      end
                    end
                  end
                  object lgSimpleResult: TdxLayoutGroup
                    CaptionOptions.Visible = False
                    ButtonOptions.Buttons = <>
                    LayoutDirection = ldHorizontal
                    ShowBorder = False
                    object liResultLabel: TdxLayoutLabeledItem
                      CaptionOptions.Text = 'Result:'
                    end
                    object liResult: TdxLayoutItem
                      CaptionOptions.Visible = False
                      Control = lblSimpleRulesResult
                      ControlOptions.ShowBorder = False
                    end
                  end
                end
              end
            end
          end

          object tsEndometriosis: TcxTabSheet
            Caption = 'Endometriosis'
            ImageIndex = 1
            object lcEndometriosis: TdxLayoutControl
              Left = 0
              Top = 0
              Width = 888
              Height = 492
              Align = alClient
              TabOrder = 0
              AutoSize = True
              LayoutLookAndFeel = dxLayoutSkinLookAndFeel1

              object chkBladderNodule: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Bladder nodule present'
                TabOrder = 0
                Transparent = True
                Width = 165
              end
              object seBladderNoduleLength: TcxSpinEdit
                Left = 10000
                Top = 10000
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                Properties.DisplayFormat = '#0.0'
                Properties.EditFormat = '#0.0'
                Properties.ValueType = vtFloat
                TabOrder = 1
                Width = 35
              end
              object seBladderNoduleWidth: TcxSpinEdit
                Left = 10000
                Top = 10000
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                Properties.DisplayFormat = '#0.0'
                Properties.EditFormat = '#0.0'
                Properties.ValueType = vtFloat
                TabOrder = 2
                Width = 35
              end
              object seBladderNoduleDepth: TcxSpinEdit
                Left = 10000
                Top = 10000
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                Properties.DisplayFormat = '#0.0'
                Properties.EditFormat = '#0.0'
                Properties.ValueType = vtFloat
                TabOrder = 3
                Width = 35
              end
              object cmbBladderNoduleLocation: TcxComboBox
                Left = 10000
                Top = 10000
                Properties.DropDownListStyle = lsFixedList
                Properties.Items.Strings = (
                  ''
                  'left'
                  'right'
                  'midline')
                TabOrder = 4
                Width = 100
              end
              object chkVaultVisualised: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Visualised'
                TabOrder = 5
                Transparent = True
                Width = 85
              end
              object chkVaultThinRegular: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Thin and regular'
                TabOrder = 6
                Transparent = True
                Width = 120
              end
              object chkVaginalNodule: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Vaginal nodule present'
                TabOrder = 7
                Transparent = True
                Width = 160
              end
              object seVagNoduleLength: TcxSpinEdit
                Left = 10000
                Top = 10000
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                Properties.DisplayFormat = '#0.0'
                Properties.EditFormat = '#0.0'
                Properties.ValueType = vtFloat
                TabOrder = 8
                Width = 35
              end
              object seVagNoduleWidth: TcxSpinEdit
                Left = 10000
                Top = 10000
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                Properties.DisplayFormat = '#0.0'
                Properties.EditFormat = '#0.0'
                Properties.ValueType = vtFloat
                TabOrder = 9
                Width = 35
              end
              object seVagNoduleDepth: TcxSpinEdit
                Left = 10000
                Top = 10000
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                Properties.DisplayFormat = '#0.0'
                Properties.EditFormat = '#0.0'
                Properties.ValueType = vtFloat
                TabOrder = 10
                Width = 35
              end
              object cmbVagNoduleStuckTo: TcxComboBox
                Left = 10000
                Top = 10000
                Properties.DropDownListStyle = lsFixedList
                Properties.Items.Strings = (
                  ''
                  'bowel'
                  'bowel nodule'
                  'uterosacral ligament nodule')
                TabOrder = 11
                Width = 200
              end
              object chkFreeFluid: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Free fluid present'
                TabOrder = 12
                Transparent = True
                Width = 130
              end
              object sePODDepth: TcxSpinEdit
                Left = 10000
                Top = 10000
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                Enabled = False
                TabOrder = 74
                Width = 35
              end
              object rbPODNoObliteration: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'No obliteration'
                TabOrder = 13
                Transparent = True
                Width = 120
              end
              object rbPODPartialObliteration: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Partial obliteration'
                TabOrder = 14
                Transparent = True
                Width = 140
              end
              object cmbPODPartialSide: TcxComboBox
                Left = 10000
                Top = 10000
                Properties.DropDownListStyle = lsFixedList
                Properties.Items.Strings = (
                  ''
                  'left'
                  'right')
                Enabled = False
                TabOrder = 15
                Width = 80
              end
              object rbPODCompleteObliteration: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Complete obliteration'
                TabOrder = 16
                Transparent = True
                Width = 155
              end
              object rbPODPostSurgical: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'No longer obliterated, post-surgical'
                TabOrder = 17
                Transparent = True
                Width = 260
              end
              object chkUterusMobile: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Mobile'
                TabOrder = 18
                Transparent = True
                Width = 70
              end
              object chkUterusLimitedMobility: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Limited mobility'
                TabOrder = 19
                Transparent = True
                Width = 115
              end
              object chkUterusFixed: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Fixed'
                TabOrder = 20
                Transparent = True
                Width = 60
              end
              object chkUterusTender: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Tender'
                TabOrder = 21
                Transparent = True
                Width = 70
              end
              object chkUterusNonTender: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Non-tender'
                TabOrder = 22
                Transparent = True
                Width = 90
              end
              object chkRetroCervicalNodule: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Retro-cervical nodule present'
                TabOrder = 23
                Transparent = True
                Width = 200
              end
              object seRetroCervLength: TcxSpinEdit
                Left = 10000
                Top = 10000
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                Properties.DisplayFormat = '#0.0'
                Properties.EditFormat = '#0.0'
                Properties.ValueType = vtFloat
                TabOrder = 24
                Width = 35
              end
              object seRetroCervWidth: TcxSpinEdit
                Left = 10000
                Top = 10000
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                Properties.DisplayFormat = '#0.0'
                Properties.EditFormat = '#0.0'
                Properties.ValueType = vtFloat
                TabOrder = 25
                Width = 35
              end
              object seRetroCervDepth: TcxSpinEdit
                Left = 10000
                Top = 10000
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                Properties.DisplayFormat = '#0.0'
                Properties.EditFormat = '#0.0'
                Properties.ValueType = vtFloat
                TabOrder = 26
                Width = 35
              end
              object chkGrowsIntoMyometrium: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Grows into myometrium'
                TabOrder = 27
                Transparent = True
                Width = 170
              end
              object chkRCStuckLeftOvary: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Left ovary'
                TabOrder = 28
                Transparent = True
                Width = 85
              end
              object chkRCStuckRightOvary: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Right ovary'
                TabOrder = 29
                Transparent = True
                Width = 90
              end
              object chkRCStuckBowel: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Bowel'
                TabOrder = 30
                Transparent = True
                Width = 60
              end
              object chkRCStuckBowelNodule: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Bowel nodule'
                TabOrder = 31
                Transparent = True
                Width = 100
              end
              object chkRCStuckBowelFat: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Bowel fat'
                TabOrder = 32
                Transparent = True
                Width = 80
              end
              object chkRCTender: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Tender'
                TabOrder = 33
                Transparent = True
                Width = 70
              end
              object chkRCNonTender: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Non-tender'
                TabOrder = 34
                Transparent = True
                Width = 90
              end
              object chkRCPostSurgicalScarring: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Likely post-surgical scarring'
                TabOrder = 35
                Transparent = True
                Width = 200
              end
              object cmbRightUSLAppearance: TcxComboBox
                Left = 10000
                Top = 10000
                Properties.DropDownListStyle = lsFixedList
                Properties.Items.Strings = (
                  ''
                  'normal'
                  'thickened'
                  'mottled')
                TabOrder = 36
                Width = 100
              end
              object chkRightUSLNodule: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Nodule'
                TabOrder = 37
                Transparent = True
                Width = 70
              end
              object seRightUSLNoduleLength: TcxSpinEdit
                Left = 10000
                Top = 10000
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                Properties.DisplayFormat = '#0.0'
                Properties.EditFormat = '#0.0'
                Properties.ValueType = vtFloat
                Enabled = False
                TabOrder = 38
                Width = 35
              end
              object seRightUSLNoduleWidth: TcxSpinEdit
                Left = 10000
                Top = 10000
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                Properties.DisplayFormat = '#0.0'
                Properties.EditFormat = '#0.0'
                Properties.ValueType = vtFloat
                Enabled = False
                TabOrder = 39
                Width = 35
              end
              object seRightUSLNoduleDepth: TcxSpinEdit
                Left = 10000
                Top = 10000
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                Properties.DisplayFormat = '#0.0'
                Properties.EditFormat = '#0.0'
                Properties.ValueType = vtFloat
                Enabled = False
                TabOrder = 40
                Width = 35
              end
              object chkRightUSLTender: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Tender'
                TabOrder = 41
                Transparent = True
                Width = 70
              end
              object chkRightUSLFatStranding: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Fat stranding'
                TabOrder = 42
                Transparent = True
                Width = 100
              end
              object cmbLeftUSLAppearance: TcxComboBox
                Left = 10000
                Top = 10000
                Properties.DropDownListStyle = lsFixedList
                Properties.Items.Strings = (
                  ''
                  'normal'
                  'thickened'
                  'mottled')
                TabOrder = 43
                Width = 100
              end
              object chkLeftUSLNodule: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Nodule'
                TabOrder = 44
                Transparent = True
                Width = 70
              end
              object seLeftUSLNoduleLength: TcxSpinEdit
                Left = 10000
                Top = 10000
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                Properties.DisplayFormat = '#0.0'
                Properties.EditFormat = '#0.0'
                Properties.ValueType = vtFloat
                Enabled = False
                TabOrder = 45
                Width = 35
              end
              object seLeftUSLNoduleWidth: TcxSpinEdit
                Left = 10000
                Top = 10000
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                Properties.DisplayFormat = '#0.0'
                Properties.EditFormat = '#0.0'
                Properties.ValueType = vtFloat
                Enabled = False
                TabOrder = 46
                Width = 35
              end
              object seLeftUSLNoduleDepth: TcxSpinEdit
                Left = 10000
                Top = 10000
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                Properties.DisplayFormat = '#0.0'
                Properties.EditFormat = '#0.0'
                Properties.ValueType = vtFloat
                Enabled = False
                TabOrder = 47
                Width = 35
              end
              object chkLeftUSLTender: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Tender'
                TabOrder = 48
                Transparent = True
                Width = 70
              end
              object chkLeftUSLFatStranding: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Fat stranding'
                TabOrder = 49
                Transparent = True
                Width = 100
              end
              object chkBowelNodulePresent: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Bowel nodule present'
                TabOrder = 50
                Transparent = True
                Width = 160
              end
              object seBowelNoduleCount: TcxSpinEdit
                Left = 10000
                Top = 10000
                Properties.MinValue = 1.000000000000000000
                Properties.MaxValue = 3.000000000000000000
                TabOrder = 51
                Value = 1
                Width = 35
              end
              object seBowelNod1Length: TcxSpinEdit
                Left = 10000
                Top = 10000
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                Properties.DisplayFormat = '#0.0'
                Properties.EditFormat = '#0.0'
                Properties.ValueType = vtFloat
                TabOrder = 52
                Width = 35
              end
              object seBowelNod1Width: TcxSpinEdit
                Left = 10000
                Top = 10000
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                Properties.DisplayFormat = '#0.0'
                Properties.EditFormat = '#0.0'
                Properties.ValueType = vtFloat
                TabOrder = 53
                Width = 35
              end
              object seBowelNod1Depth: TcxSpinEdit
                Left = 10000
                Top = 10000
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                Properties.DisplayFormat = '#0.0'
                Properties.EditFormat = '#0.0'
                Properties.ValueType = vtFloat
                TabOrder = 54
                Width = 35
              end
              object seBowelNod1DistAnus: TcxSpinEdit
                Left = 10000
                Top = 10000
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                TabOrder = 55
                Width = 40
              end
              object cmbBowelNod1Invasion: TcxComboBox
                Left = 10000
                Top = 10000
                Properties.DropDownListStyle = lsFixedList
                Properties.Items.Strings = (
                  ''
                  'muscularis'
                  'submucosa'
                  'mucosa')
                TabOrder = 56
                Width = 120
              end
              object cmbBowelNod1StuckTo: TcxComboBox
                Left = 10000
                Top = 10000
                Properties.DropDownListStyle = lsFixedList
                Properties.Items.Strings = (
                  ''
                  'free-lying loop'
                  'retro-cervical nodule'
                  'left ovary'
                  'right ovary'
                  'uterosacral ligament nodule'
                  'vaginal vault'
                  'none')
                TabOrder = 57
                Width = 200
              end
              object seBowelNod2Length: TcxSpinEdit
                Left = 10000
                Top = 10000
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                Properties.DisplayFormat = '#0.0'
                Properties.EditFormat = '#0.0'
                Properties.ValueType = vtFloat
                TabOrder = 58
                Width = 35
              end
              object seBowelNod2Width: TcxSpinEdit
                Left = 10000
                Top = 10000
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                Properties.DisplayFormat = '#0.0'
                Properties.EditFormat = '#0.0'
                Properties.ValueType = vtFloat
                TabOrder = 59
                Width = 35
              end
              object seBowelNod2Depth: TcxSpinEdit
                Left = 10000
                Top = 10000
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                Properties.DisplayFormat = '#0.0'
                Properties.EditFormat = '#0.0'
                Properties.ValueType = vtFloat
                TabOrder = 60
                Width = 35
              end
              object seBowelNod2DistPrev: TcxSpinEdit
                Left = 10000
                Top = 10000
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                TabOrder = 61
                Width = 40
              end
              object cmbBowelNod2Invasion: TcxComboBox
                Left = 10000
                Top = 10000
                Properties.DropDownListStyle = lsFixedList
                Properties.Items.Strings = (
                  ''
                  'muscularis'
                  'submucosa'
                  'mucosa')
                TabOrder = 62
                Width = 120
              end
              object cmbBowelNod2StuckTo: TcxComboBox
                Left = 10000
                Top = 10000
                Properties.DropDownListStyle = lsFixedList
                Properties.Items.Strings = (
                  ''
                  'free-lying loop'
                  'retro-cervical nodule'
                  'left ovary'
                  'right ovary'
                  'uterosacral ligament nodule'
                  'vaginal vault'
                  'none')
                TabOrder = 63
                Width = 200
              end
              object seBowelNod3Length: TcxSpinEdit
                Left = 10000
                Top = 10000
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                Properties.DisplayFormat = '#0.0'
                Properties.EditFormat = '#0.0'
                Properties.ValueType = vtFloat
                TabOrder = 64
                Width = 35
              end
              object seBowelNod3Width: TcxSpinEdit
                Left = 10000
                Top = 10000
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                Properties.DisplayFormat = '#0.0'
                Properties.EditFormat = '#0.0'
                Properties.ValueType = vtFloat
                TabOrder = 65
                Width = 35
              end
              object seBowelNod3Depth: TcxSpinEdit
                Left = 10000
                Top = 10000
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                Properties.DisplayFormat = '#0.0'
                Properties.EditFormat = '#0.0'
                Properties.ValueType = vtFloat
                TabOrder = 66
                Width = 35
              end
              object seBowelNod3DistPrev: TcxSpinEdit
                Left = 10000
                Top = 10000
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                TabOrder = 67
                Width = 40
              end
              object cmbBowelNod3Invasion: TcxComboBox
                Left = 10000
                Top = 10000
                Properties.DropDownListStyle = lsFixedList
                Properties.Items.Strings = (
                  ''
                  'muscularis'
                  'submucosa'
                  'mucosa')
                TabOrder = 68
                Width = 120
              end
              object cmbBowelNod3StuckTo: TcxComboBox
                Left = 10000
                Top = 10000
                Properties.DropDownListStyle = lsFixedList
                Properties.Items.Strings = (
                  ''
                  'free-lying loop'
                  'retro-cervical nodule'
                  'left ovary'
                  'right ovary'
                  'uterosacral ligament nodule'
                  'vaginal vault'
                  'none')
                TabOrder = 69
                Width = 200
              end
              object chkRightKidneyVisualised: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Visualised'
                TabOrder = 70
                Transparent = True
                Width = 85
              end
              object chkRightKidneyObstructed: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Obstructed'
                Enabled = False
                TabOrder = 71
                Transparent = True
                Width = 90
              end
              object chkLeftKidneyVisualised: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Visualised'
                TabOrder = 72
                Transparent = True
                Width = 85
              end
              object chkLeftKidneyObstructed: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Obstructed'
                Enabled = False
                TabOrder = 73
                Transparent = True
                Width = 90
              end

              object lcEndometriosisGroup_Root: TdxLayoutGroup
                AlignHorz = ahClient
                AlignVert = avTop
                ButtonOptions.Buttons = <>
                Hidden = True
                LayoutDirection = ldVertical
                ShowBorder = False

                object lgBladder: TdxLayoutGroup
                  CaptionOptions.Text = 'Bladder'
                  CaptionOptions.Visible = True
                  ButtonOptions.Buttons = <>
                  ShowBorder = True
                  object liBladderNodule: TdxLayoutItem
                    CaptionOptions.Visible = False
                    Control = chkBladderNodule
                    ControlOptions.ShowBorder = False
                  end
                  object lgBladderDetails: TdxLayoutGroup
                    CaptionOptions.Visible = False
                    ButtonOptions.Buttons = <>
                    LayoutDirection = ldHorizontal
                    ShowBorder = False
                    Visible = False
                    object liBladderDimLabel: TdxLayoutLabeledItem
                      CaptionOptions.Text = 'Dimensions'
                    end
                    object liBladderL: TdxLayoutItem
                      CaptionOptions.Visible = False
                      Control = seBladderNoduleLength
                      ControlOptions.ShowBorder = False
                    end
                    object liBladderSep1: TdxLayoutLabeledItem
                      CaptionOptions.Text = 'x'
                    end
                    object liBladderW: TdxLayoutItem
                      CaptionOptions.Visible = False
                      Control = seBladderNoduleWidth
                      ControlOptions.ShowBorder = False
                    end
                    object liBladderSep2: TdxLayoutLabeledItem
                      CaptionOptions.Text = 'x'
                    end
                    object liBladderD: TdxLayoutItem
                      CaptionOptions.Visible = False
                      Control = seBladderNoduleDepth
                      ControlOptions.ShowBorder = False
                    end
                    object liBladderMM: TdxLayoutLabeledItem
                      CaptionOptions.Text = 'mm'
                    end
                  end
                  object lgBladderLocation: TdxLayoutGroup
                    CaptionOptions.Visible = False
                    ButtonOptions.Buttons = <>
                    LayoutDirection = ldHorizontal
                    ShowBorder = False
                    Visible = False
                    object liBladderLoc: TdxLayoutItem
                      CaptionOptions.Text = 'Location'
                      Control = cmbBladderNoduleLocation
                      ControlOptions.ShowBorder = False
                    end
                  end
                end

                object lgVaginalVault: TdxLayoutGroup
                  CaptionOptions.Text = 'Vaginal Vault'
                  CaptionOptions.Visible = True
                  ButtonOptions.Buttons = <>
                  ShowBorder = True
                  object lgVaultStatus: TdxLayoutGroup
                    CaptionOptions.Visible = False
                    ButtonOptions.Buttons = <>
                    LayoutDirection = ldHorizontal
                    ShowBorder = False
                    object liVaultVis: TdxLayoutItem
                      CaptionOptions.Visible = False
                      Control = chkVaultVisualised
                      ControlOptions.ShowBorder = False
                    end
                    object liVaultThin: TdxLayoutItem
                      CaptionOptions.Visible = False
                      Control = chkVaultThinRegular
                      ControlOptions.ShowBorder = False
                    end
                  end
                  object liVaultSep: TdxLayoutSeparatorItem
                    CaptionOptions.Text = 'Vaginal Nodule'
                  end
                  object liVagNodule: TdxLayoutItem
                    CaptionOptions.Visible = False
                    Control = chkVaginalNodule
                    ControlOptions.ShowBorder = False
                  end
                  object lgVaultDetails: TdxLayoutGroup
                    CaptionOptions.Visible = False
                    ButtonOptions.Buttons = <>
                    ShowBorder = False
                    Visible = False
                    object lgVaultDims: TdxLayoutGroup
                      CaptionOptions.Visible = False
                      ButtonOptions.Buttons = <>
                      LayoutDirection = ldHorizontal
                      ShowBorder = False
                      object liVagDimLabel: TdxLayoutLabeledItem
                        CaptionOptions.Text = 'Dimensions'
                      end
                      object liVagL: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = seVagNoduleLength
                        ControlOptions.ShowBorder = False
                      end
                      object liVagSep1: TdxLayoutLabeledItem
                        CaptionOptions.Text = 'x'
                      end
                      object liVagW: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = seVagNoduleWidth
                        ControlOptions.ShowBorder = False
                      end
                      object liVagSep2: TdxLayoutLabeledItem
                        CaptionOptions.Text = 'x'
                      end
                      object liVagD: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = seVagNoduleDepth
                        ControlOptions.ShowBorder = False
                      end
                      object liVagMM: TdxLayoutLabeledItem
                        CaptionOptions.Text = 'mm'
                      end
                    end
                    object liVagStuckTo: TdxLayoutItem
                      CaptionOptions.Text = 'Stuck to'
                      Control = cmbVagNoduleStuckTo
                      ControlOptions.ShowBorder = False
                    end
                  end
                end

                object lgPOD: TdxLayoutGroup
                  CaptionOptions.Text = 'Pouch of Douglas'
                  CaptionOptions.Visible = True
                  ButtonOptions.Buttons = <>
                  ShowBorder = True
                  object lgFreeFluidRow: TdxLayoutGroup
                    CaptionOptions.Visible = False
                    ButtonOptions.Buttons = <>
                    LayoutDirection = ldHorizontal
                    ShowBorder = False
                    object liFreeFluid: TdxLayoutItem
                      CaptionOptions.Visible = False
                      Control = chkFreeFluid
                      ControlOptions.ShowBorder = False
                    end
                    object liPODDepth: TdxLayoutItem
                      CaptionOptions.Text = 'Depth'
                      Control = sePODDepth
                      ControlOptions.ShowBorder = False
                    end
                    object liPODmm: TdxLayoutLabeledItem
                      CaptionOptions.Text = 'mm'
                    end
                  end
                  object liPODOblLabel: TdxLayoutLabeledItem
                    CaptionOptions.Text = 'Obliteration'
                  end
                  object liPODNone: TdxLayoutItem
                    CaptionOptions.Visible = False
                    Control = rbPODNoObliteration
                    ControlOptions.ShowBorder = False
                  end
                  object lgPODPartial: TdxLayoutGroup
                    CaptionOptions.Visible = False
                    ButtonOptions.Buttons = <>
                    LayoutDirection = ldHorizontal
                    ShowBorder = False
                    object liPODPartial: TdxLayoutItem
                      CaptionOptions.Visible = False
                      Control = rbPODPartialObliteration
                      ControlOptions.ShowBorder = False
                    end
                    object liPODSide: TdxLayoutItem
                      CaptionOptions.Visible = False
                      Control = cmbPODPartialSide
                      ControlOptions.ShowBorder = False
                    end
                  end
                  object liPODComplete: TdxLayoutItem
                    CaptionOptions.Visible = False
                    Control = rbPODCompleteObliteration
                    ControlOptions.ShowBorder = False
                  end
                  object liPODPost: TdxLayoutItem
                    CaptionOptions.Visible = False
                    Control = rbPODPostSurgical
                    ControlOptions.ShowBorder = False
                  end
                  object liUterusMobLabel: TdxLayoutSeparatorItem
                    CaptionOptions.Text = 'Uterus Mobility'
                  end
                  object lgMobility: TdxLayoutGroup
                    CaptionOptions.Visible = False
                    ButtonOptions.Buttons = <>
                    LayoutDirection = ldHorizontal
                    ShowBorder = False
                    object liUMobile: TdxLayoutItem
                      CaptionOptions.Visible = False
                      Control = chkUterusMobile
                      ControlOptions.ShowBorder = False
                    end
                    object liULimited: TdxLayoutItem
                      CaptionOptions.Visible = False
                      Control = chkUterusLimitedMobility
                      ControlOptions.ShowBorder = False
                    end
                    object liUFixed: TdxLayoutItem
                      CaptionOptions.Visible = False
                      Control = chkUterusFixed
                      ControlOptions.ShowBorder = False
                    end
                  end
                  object lgTenderness: TdxLayoutGroup
                    CaptionOptions.Visible = False
                    ButtonOptions.Buttons = <>
                    LayoutDirection = ldHorizontal
                    ShowBorder = False
                    object liUTender: TdxLayoutItem
                      CaptionOptions.Visible = False
                      Control = chkUterusTender
                      ControlOptions.ShowBorder = False
                    end
                    object liUNonTender: TdxLayoutItem
                      CaptionOptions.Visible = False
                      Control = chkUterusNonTender
                      ControlOptions.ShowBorder = False
                    end
                  end
                end

                object lgRetroCervical: TdxLayoutGroup
                  CaptionOptions.Text = 'Retro-cervical'
                  CaptionOptions.Visible = True
                  ButtonOptions.Buttons = <>
                  ShowBorder = True
                  object liRCNodule: TdxLayoutItem
                    CaptionOptions.Visible = False
                    Control = chkRetroCervicalNodule
                    ControlOptions.ShowBorder = False
                  end
                  object lgRCDetails: TdxLayoutGroup
                    CaptionOptions.Visible = False
                    ButtonOptions.Buttons = <>
                    ShowBorder = False
                    Visible = False
                    object lgRCDims: TdxLayoutGroup
                      CaptionOptions.Visible = False
                      ButtonOptions.Buttons = <>
                      LayoutDirection = ldHorizontal
                      ShowBorder = False
                      object liRCDimLabel: TdxLayoutLabeledItem
                        CaptionOptions.Text = 'Dimensions'
                      end
                      object liRCL: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = seRetroCervLength
                        ControlOptions.ShowBorder = False
                      end
                      object liRCSep1: TdxLayoutLabeledItem
                        CaptionOptions.Text = 'x'
                      end
                      object liRCW: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = seRetroCervWidth
                        ControlOptions.ShowBorder = False
                      end
                      object liRCSep2: TdxLayoutLabeledItem
                        CaptionOptions.Text = 'x'
                      end
                      object liRCD: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = seRetroCervDepth
                        ControlOptions.ShowBorder = False
                      end
                      object liRCMM: TdxLayoutLabeledItem
                        CaptionOptions.Text = 'mm'
                      end
                    end
                    object liRCMyometrium: TdxLayoutItem
                      CaptionOptions.Visible = False
                      Control = chkGrowsIntoMyometrium
                      ControlOptions.ShowBorder = False
                    end
                    object lgRCStuckTo: TdxLayoutGroup
                      CaptionOptions.Text = 'Stuck to'
                      CaptionOptions.Visible = True
                      ButtonOptions.Buttons = <>
                      ShowBorder = False
                      object lgRCStuckRow1: TdxLayoutGroup
                        CaptionOptions.Visible = False
                        ButtonOptions.Buttons = <>
                        LayoutDirection = ldHorizontal
                        ShowBorder = False
                        object liRCStuckLO: TdxLayoutItem
                          CaptionOptions.Visible = False
                          Control = chkRCStuckLeftOvary
                          ControlOptions.ShowBorder = False
                        end
                        object liRCStuckRO: TdxLayoutItem
                          CaptionOptions.Visible = False
                          Control = chkRCStuckRightOvary
                          ControlOptions.ShowBorder = False
                        end
                        object liRCStuckBowel: TdxLayoutItem
                          CaptionOptions.Visible = False
                          Control = chkRCStuckBowel
                          ControlOptions.ShowBorder = False
                        end
                      end
                      object lgRCStuckRow2: TdxLayoutGroup
                        CaptionOptions.Visible = False
                        ButtonOptions.Buttons = <>
                        LayoutDirection = ldHorizontal
                        ShowBorder = False
                        object liRCStuckBN: TdxLayoutItem
                          CaptionOptions.Visible = False
                          Control = chkRCStuckBowelNodule
                          ControlOptions.ShowBorder = False
                        end
                        object liRCStuckBF: TdxLayoutItem
                          CaptionOptions.Visible = False
                          Control = chkRCStuckBowelFat
                          ControlOptions.ShowBorder = False
                        end
                      end
                    end
                    object lgRCTenderness: TdxLayoutGroup
                      CaptionOptions.Visible = False
                      ButtonOptions.Buttons = <>
                      LayoutDirection = ldHorizontal
                      ShowBorder = False
                      object liRCTender: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = chkRCTender
                        ControlOptions.ShowBorder = False
                      end
                      object liRCNonTender: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = chkRCNonTender
                        ControlOptions.ShowBorder = False
                      end
                    end
                    object liRCScarring: TdxLayoutItem
                      CaptionOptions.Visible = False
                      Control = chkRCPostSurgicalScarring
                      ControlOptions.ShowBorder = False
                    end
                  end
                end

                object lgUSL: TdxLayoutGroup
                  CaptionOptions.Text = 'Uterosacral Ligaments'
                  CaptionOptions.Visible = True
                  ButtonOptions.Buttons = <>
                  LayoutDirection = ldHorizontal
                  ShowBorder = True
                  object lgRightUSL: TdxLayoutGroup
                    CaptionOptions.Text = 'Right'
                    CaptionOptions.Visible = True
                    ButtonOptions.Buttons = <>
                    ShowBorder = False
                    object liRUSLApp: TdxLayoutItem
                      CaptionOptions.Text = 'Appearance'
                      Control = cmbRightUSLAppearance
                      ControlOptions.ShowBorder = False
                    end
                    object lgRUSLNodule: TdxLayoutGroup
                      CaptionOptions.Visible = False
                      ButtonOptions.Buttons = <>
                      LayoutDirection = ldHorizontal
                      ShowBorder = False
                      object liRUSLNodule: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = chkRightUSLNodule
                        ControlOptions.ShowBorder = False
                      end
                      object liRUSLL: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = seRightUSLNoduleLength
                        ControlOptions.ShowBorder = False
                      end
                      object liRUSLSep1: TdxLayoutLabeledItem
                        CaptionOptions.Text = 'x'
                      end
                      object liRUSLW: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = seRightUSLNoduleWidth
                        ControlOptions.ShowBorder = False
                      end
                      object liRUSLSep2: TdxLayoutLabeledItem
                        CaptionOptions.Text = 'x'
                      end
                      object liRUSLD: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = seRightUSLNoduleDepth
                        ControlOptions.ShowBorder = False
                      end
                      object liRUSLMM: TdxLayoutLabeledItem
                        CaptionOptions.Text = 'mm'
                      end
                    end
                    object lgRUSLExtra: TdxLayoutGroup
                      CaptionOptions.Visible = False
                      ButtonOptions.Buttons = <>
                      LayoutDirection = ldHorizontal
                      ShowBorder = False
                      object liRUSLTender: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = chkRightUSLTender
                        ControlOptions.ShowBorder = False
                      end
                      object liRUSLFat: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = chkRightUSLFatStranding
                        ControlOptions.ShowBorder = False
                      end
                    end
                  end
                  object lgLeftUSL: TdxLayoutGroup
                    CaptionOptions.Text = 'Left'
                    CaptionOptions.Visible = True
                    ButtonOptions.Buttons = <>
                    ShowBorder = False
                    object liLUSLApp: TdxLayoutItem
                      CaptionOptions.Text = 'Appearance'
                      Control = cmbLeftUSLAppearance
                      ControlOptions.ShowBorder = False
                    end
                    object lgLUSLNodule: TdxLayoutGroup
                      CaptionOptions.Visible = False
                      ButtonOptions.Buttons = <>
                      LayoutDirection = ldHorizontal
                      ShowBorder = False
                      object liLUSLNodule: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = chkLeftUSLNodule
                        ControlOptions.ShowBorder = False
                      end
                      object liLUSLL: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = seLeftUSLNoduleLength
                        ControlOptions.ShowBorder = False
                      end
                      object liLUSLSep1: TdxLayoutLabeledItem
                        CaptionOptions.Text = 'x'
                      end
                      object liLUSLW: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = seLeftUSLNoduleWidth
                        ControlOptions.ShowBorder = False
                      end
                      object liLUSLSep2: TdxLayoutLabeledItem
                        CaptionOptions.Text = 'x'
                      end
                      object liLUSLD: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = seLeftUSLNoduleDepth
                        ControlOptions.ShowBorder = False
                      end
                      object liLUSLMM: TdxLayoutLabeledItem
                        CaptionOptions.Text = 'mm'
                      end
                    end
                    object lgLUSLExtra: TdxLayoutGroup
                      CaptionOptions.Visible = False
                      ButtonOptions.Buttons = <>
                      LayoutDirection = ldHorizontal
                      ShowBorder = False
                      object liLUSLTender: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = chkLeftUSLTender
                        ControlOptions.ShowBorder = False
                      end
                      object liLUSLFat: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = chkLeftUSLFatStranding
                        ControlOptions.ShowBorder = False
                      end
                    end
                  end
                end

                object lgBowel: TdxLayoutGroup
                  CaptionOptions.Text = 'Bowel'
                  CaptionOptions.Visible = True
                  ButtonOptions.Buttons = <>
                  ShowBorder = True
                  object liBowelNodule: TdxLayoutItem
                    CaptionOptions.Visible = False
                    Control = chkBowelNodulePresent
                    ControlOptions.ShowBorder = False
                  end
                  object lgBowelDetails: TdxLayoutGroup
                    CaptionOptions.Visible = False
                    ButtonOptions.Buttons = <>
                    ShowBorder = False
                    Visible = False
                    object liBowelCount: TdxLayoutItem
                      CaptionOptions.Text = 'Count'
                      Control = seBowelNoduleCount
                      ControlOptions.ShowBorder = False
                    end
                    object lgBowelNod1: TdxLayoutGroup
                      CaptionOptions.Text = '#1'
                      CaptionOptions.Visible = True
                      ButtonOptions.Buttons = <>
                      ShowBorder = True
                      object lgBN1Row1: TdxLayoutGroup
                        CaptionOptions.Visible = False
                        ButtonOptions.Buttons = <>
                        LayoutDirection = ldHorizontal
                        ShowBorder = False
                        object liBN1DimLabel: TdxLayoutLabeledItem
                          CaptionOptions.Text = 'Dimensions'
                        end
                        object liBN1L: TdxLayoutItem
                          CaptionOptions.Visible = False
                          Control = seBowelNod1Length
                          ControlOptions.ShowBorder = False
                        end
                        object liBN1Sep1: TdxLayoutLabeledItem
                          CaptionOptions.Text = 'x'
                        end
                        object liBN1W: TdxLayoutItem
                          CaptionOptions.Visible = False
                          Control = seBowelNod1Width
                          ControlOptions.ShowBorder = False
                        end
                        object liBN1Sep2: TdxLayoutLabeledItem
                          CaptionOptions.Text = 'x'
                        end
                        object liBN1D: TdxLayoutItem
                          CaptionOptions.Visible = False
                          Control = seBowelNod1Depth
                          ControlOptions.ShowBorder = False
                        end
                        object liBN1MM: TdxLayoutLabeledItem
                          CaptionOptions.Text = 'mm'
                        end
                        object liBN1Dist: TdxLayoutItem
                          CaptionOptions.Text = 'Dist. from anus'
                          Control = seBowelNod1DistAnus
                          ControlOptions.ShowBorder = False
                        end
                      end
                      object lgBN1Row2: TdxLayoutGroup
                        CaptionOptions.Visible = False
                        ButtonOptions.Buttons = <>
                        LayoutDirection = ldHorizontal
                        ShowBorder = False
                        object liBN1Invasion: TdxLayoutItem
                          CaptionOptions.Text = 'Depth of invasion'
                          Control = cmbBowelNod1Invasion
                          ControlOptions.ShowBorder = False
                        end
                        object liBN1Stuck: TdxLayoutItem
                          CaptionOptions.Text = 'Stuck to'
                          Control = cmbBowelNod1StuckTo
                          ControlOptions.ShowBorder = False
                        end
                      end
                    end
                    object lgBowelNod2: TdxLayoutGroup
                      CaptionOptions.Text = '#2'
                      CaptionOptions.Visible = True
                      ButtonOptions.Buttons = <>
                      ShowBorder = True
                      Visible = False
                      object lgBN2Row1: TdxLayoutGroup
                        CaptionOptions.Visible = False
                        ButtonOptions.Buttons = <>
                        LayoutDirection = ldHorizontal
                        ShowBorder = False
                        object liBN2DimLabel: TdxLayoutLabeledItem
                          CaptionOptions.Text = 'Dimensions'
                        end
                        object liBN2L: TdxLayoutItem
                          CaptionOptions.Visible = False
                          Control = seBowelNod2Length
                          ControlOptions.ShowBorder = False
                        end
                        object liBN2Sep1: TdxLayoutLabeledItem
                          CaptionOptions.Text = 'x'
                        end
                        object liBN2W: TdxLayoutItem
                          CaptionOptions.Visible = False
                          Control = seBowelNod2Width
                          ControlOptions.ShowBorder = False
                        end
                        object liBN2Sep2: TdxLayoutLabeledItem
                          CaptionOptions.Text = 'x'
                        end
                        object liBN2D: TdxLayoutItem
                          CaptionOptions.Visible = False
                          Control = seBowelNod2Depth
                          ControlOptions.ShowBorder = False
                        end
                        object liBN2MM: TdxLayoutLabeledItem
                          CaptionOptions.Text = 'mm'
                        end
                        object liBN2Dist: TdxLayoutItem
                          CaptionOptions.Text = 'Distance from prev'
                          Control = seBowelNod2DistPrev
                          ControlOptions.ShowBorder = False
                        end
                      end
                      object lgBN2Row2: TdxLayoutGroup
                        CaptionOptions.Visible = False
                        ButtonOptions.Buttons = <>
                        LayoutDirection = ldHorizontal
                        ShowBorder = False
                        object liBN2Invasion: TdxLayoutItem
                          CaptionOptions.Text = 'Depth of invasion'
                          Control = cmbBowelNod2Invasion
                          ControlOptions.ShowBorder = False
                        end
                        object liBN2Stuck: TdxLayoutItem
                          CaptionOptions.Text = 'Stuck to'
                          Control = cmbBowelNod2StuckTo
                          ControlOptions.ShowBorder = False
                        end
                      end
                    end
                    object lgBowelNod3: TdxLayoutGroup
                      CaptionOptions.Text = '#3'
                      CaptionOptions.Visible = True
                      ButtonOptions.Buttons = <>
                      ShowBorder = True
                      Visible = False
                      object lgBN3Row1: TdxLayoutGroup
                        CaptionOptions.Visible = False
                        ButtonOptions.Buttons = <>
                        LayoutDirection = ldHorizontal
                        ShowBorder = False
                        object liBN3DimLabel: TdxLayoutLabeledItem
                          CaptionOptions.Text = 'Dimensions'
                        end
                        object liBN3L: TdxLayoutItem
                          CaptionOptions.Visible = False
                          Control = seBowelNod3Length
                          ControlOptions.ShowBorder = False
                        end
                        object liBN3Sep1: TdxLayoutLabeledItem
                          CaptionOptions.Text = 'x'
                        end
                        object liBN3W: TdxLayoutItem
                          CaptionOptions.Visible = False
                          Control = seBowelNod3Width
                          ControlOptions.ShowBorder = False
                        end
                        object liBN3Sep2: TdxLayoutLabeledItem
                          CaptionOptions.Text = 'x'
                        end
                        object liBN3D: TdxLayoutItem
                          CaptionOptions.Visible = False
                          Control = seBowelNod3Depth
                          ControlOptions.ShowBorder = False
                        end
                        object liBN3MM: TdxLayoutLabeledItem
                          CaptionOptions.Text = 'mm'
                        end
                        object liBN3Dist: TdxLayoutItem
                          CaptionOptions.Text = 'Distance from prev'
                          Control = seBowelNod3DistPrev
                          ControlOptions.ShowBorder = False
                        end
                      end
                      object lgBN3Row2: TdxLayoutGroup
                        CaptionOptions.Visible = False
                        ButtonOptions.Buttons = <>
                        LayoutDirection = ldHorizontal
                        ShowBorder = False
                        object liBN3Invasion: TdxLayoutItem
                          CaptionOptions.Text = 'Depth of invasion'
                          Control = cmbBowelNod3Invasion
                          ControlOptions.ShowBorder = False
                        end
                        object liBN3Stuck: TdxLayoutItem
                          CaptionOptions.Text = 'Stuck to'
                          Control = cmbBowelNod3StuckTo
                          ControlOptions.ShowBorder = False
                        end
                      end
                    end
                  end
                end

                object lgKidneys: TdxLayoutGroup
                  CaptionOptions.Text = 'Kidneys'
                  CaptionOptions.Visible = True
                  ButtonOptions.Buttons = <>
                  LayoutDirection = ldHorizontal
                  ShowBorder = True
                  object lgRightKidney: TdxLayoutGroup
                    CaptionOptions.Text = 'Right Kidney'
                    CaptionOptions.Visible = True
                    ButtonOptions.Buttons = <>
                    LayoutDirection = ldHorizontal
                    ShowBorder = False
                    object liRKVis: TdxLayoutItem
                      CaptionOptions.Visible = False
                      Control = chkRightKidneyVisualised
                      ControlOptions.ShowBorder = False
                    end
                    object liRKObs: TdxLayoutItem
                      CaptionOptions.Visible = False
                      Control = chkRightKidneyObstructed
                      ControlOptions.ShowBorder = False
                    end
                  end
                  object lgLeftKidney: TdxLayoutGroup
                    CaptionOptions.Text = 'Left Kidney'
                    CaptionOptions.Visible = True
                    ButtonOptions.Buttons = <>
                    LayoutDirection = ldHorizontal
                    ShowBorder = False
                    object liLKVis: TdxLayoutItem
                      CaptionOptions.Visible = False
                      Control = chkLeftKidneyVisualised
                      ControlOptions.ShowBorder = False
                    end
                    object liLKObs: TdxLayoutItem
                      CaptionOptions.Visible = False
                      Control = chkLeftKidneyObstructed
                      ControlOptions.ShowBorder = False
                    end
                  end
                end
              end
            end
          end

          object tsProcedures: TcxTabSheet
            Caption = 'Procedures'
            ImageIndex = 4
            object lcProcedures: TdxLayoutControl
              Left = 0
              Top = 0
              Width = 888
              Height = 492
              Align = alClient
              TabOrder = 0
              AutoSize = True
              LayoutLookAndFeel = dxLayoutSkinLookAndFeel1

              object chkSHGPerformed: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Performed'
                TabOrder = 0
                Transparent = True
                Width = 85
              end
              object cmbSHGFindings: TcxComboBox
                Left = 10000
                Top = 10000
                Properties.DropDownListStyle = lsFixedList
                Properties.Items.Strings = (
                  ''
                  'Normal'
                  'Endometrial polyp'
                  'Two endometrial polyps'
                  'Submucosal fibroid'
                  'Synechia')
                Enabled = False
                TabOrder = 1
                Width = 180
              end
              object chkTubalPatencyPerformed: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Performed'
                TabOrder = 2
                Transparent = True
                Width = 85
              end
              object cmbEnhancementMethod: TcxComboBox
                Left = 10000
                Top = 10000
                Properties.DropDownListStyle = lsFixedList
                Properties.Items.Strings = (
                  ''
                  'ExEm foam'
                  'Dfinity')
                TabOrder = 3
                Width = 120
              end
              object rbRightTubePatent: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Patent'
                TabOrder = 4
                Transparent = True
                Width = 65
              end
              object rbRightTubeNotDemonstrated: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Patency could not be demonstrated'
                TabOrder = 5
                Transparent = True
                Width = 240
              end
              object rbRightTubeAbsent: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Absent'
                TabOrder = 6
                Transparent = True
                Width = 65
              end
              object rbLeftTubePatent: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Patent'
                TabOrder = 7
                Transparent = True
                Width = 65
              end
              object rbLeftTubeNotDemonstrated: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Patency could not be demonstrated'
                TabOrder = 8
                Transparent = True
                Width = 240
              end
              object rbLeftTubeAbsent: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Absent'
                TabOrder = 9
                Transparent = True
                Width = 65
              end

              object lcProceduresGroup_Root: TdxLayoutGroup
                AlignHorz = ahClient
                AlignVert = avTop
                ButtonOptions.Buttons = <>
                Hidden = True
                LayoutDirection = ldVertical
                ShowBorder = False

                object lgSHG: TdxLayoutGroup
                  CaptionOptions.Text = 'Saline Hysterosonography'
                  CaptionOptions.Visible = True
                  ButtonOptions.Buttons = <>
                  ShowBorder = True
                  object liSHGPerformed: TdxLayoutItem
                    CaptionOptions.Visible = False
                    Control = chkSHGPerformed
                    ControlOptions.ShowBorder = False
                  end
                  object lgSHGDetails: TdxLayoutGroup
                    CaptionOptions.Visible = False
                    ButtonOptions.Buttons = <>
                    ShowBorder = False
                    Visible = False
                    object liSHGFindings: TdxLayoutItem
                      CaptionOptions.Text = 'Findings'
                      Control = cmbSHGFindings
                      ControlOptions.ShowBorder = False
                    end
                  end
                end

                object lgTubalPatency: TdxLayoutGroup
                  CaptionOptions.Text = 'Tubal Patency Test'
                  CaptionOptions.Visible = True
                  ButtonOptions.Buttons = <>
                  ShowBorder = True
                  object liTubalPerformed: TdxLayoutItem
                    CaptionOptions.Visible = False
                    Control = chkTubalPatencyPerformed
                    ControlOptions.ShowBorder = False
                  end
                  object lgTubalDetails: TdxLayoutGroup
                    CaptionOptions.Visible = False
                    ButtonOptions.Buttons = <>
                    ShowBorder = False
                    Visible = False
                    object liEnhancement: TdxLayoutItem
                      CaptionOptions.Text = 'Enhancement method'
                      Control = cmbEnhancementMethod
                      ControlOptions.ShowBorder = False
                    end
                    object lgTubes: TdxLayoutGroup
                      CaptionOptions.Visible = False
                      ButtonOptions.Buttons = <>
                      LayoutDirection = ldHorizontal
                      ShowBorder = False
                    object lgRightTube: TdxLayoutGroup
                      CaptionOptions.Text = 'Right tube'
                      CaptionOptions.Visible = True
                      ButtonOptions.Buttons = <>
                      LayoutDirection = ldHorizontal
                      ShowBorder = False
                      object liRTPatent: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = rbRightTubePatent
                        ControlOptions.ShowBorder = False
                      end
                      object liRTNotDemo: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = rbRightTubeNotDemonstrated
                        ControlOptions.ShowBorder = False
                      end
                      object liRTAbsent: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = rbRightTubeAbsent
                        ControlOptions.ShowBorder = False
                      end
                    end
                    object lgLeftTube: TdxLayoutGroup
                      CaptionOptions.Text = 'Left tube'
                      CaptionOptions.Visible = True
                      ButtonOptions.Buttons = <>
                      LayoutDirection = ldHorizontal
                      ShowBorder = False
                      object liLTPatent: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = rbLeftTubePatent
                        ControlOptions.ShowBorder = False
                      end
                      object liLTNotDemo: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = rbLeftTubeNotDemonstrated
                        ControlOptions.ShowBorder = False
                      end
                      object liLTAbsent: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = rbLeftTubeAbsent
                        ControlOptions.ShowBorder = False
                      end
                    end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  object dxLayoutSkinLookAndFeel1: TdxLayoutSkinLookAndFeel
  end
end