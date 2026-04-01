inherited Gynae: TGynae
  Width = 1225
  Height = 700
  Align = alClient
  inherited cxpcReportMainPage: TcxPageControl
    Width = 1225
    Height = 700
    Properties.ActivePage = tsDetails
    Properties.CustomButtons.Buttons = <>
    ClientRectBottom = 700
    ClientRectRight = 1225
    ClientRectTop = 24
    object tsDetails: TcxTabSheet
      Caption = 'Details'
      ImageIndex = 1
      object cxScrollBox1: TcxScrollBox
        Left = 0
        Top = 0
        Width = 1225
        Height = 676
        Align = alClient
        TabOrder = 0
        object gbScanType: TcxGroupBox
          Left = 4
          Top = 0
          Style.Edges = [bBottom]
          TabOrder = 0
          Height = 32
          Width = 817
          object cbTransabdominal: TcxCheckBox
            Left = 10
            Top = 7
            Caption = 'Transabdominal'
            TabOrder = 0
            Transparent = True
            Width = 120
          end
          object cbTransvaginal: TcxCheckBox
            Left = 140
            Top = 7
            Caption = 'Transvaginal'
            TabOrder = 1
            Transparent = True
            Width = 105
          end
          object cbPainWithProbe: TcxCheckBox
            Left = 255
            Top = 7
            Caption = 'Pain with probe insertion'
            Enabled = False
            TabOrder = 2
            Transparent = True
            Width = 180
          end
          object cbIncompleteReport: TcxCheckBox
            Left = 550
            Top = 7
            Caption = 'Incomplete report'
            TabOrder = 3
            Transparent = True
            Width = 130
          end
        end
        object cxGroupBox5: TcxGroupBox
          Left = 4
          Top = 36
          Style.Edges = [bBottom]
          TabOrder = 1
          Height = 247
          Width = 817
          object cxLabel1: TcxLabel
            Left = 52
            Top = 5
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
          object cxLabel2: TcxLabel
            Left = 52
            Top = 30
            Caption = 'LMP date'
            Transparent = True
          end
          object deLMPDate: TcxDateEdit
            Left = 109
            Top = 28
            Properties.ImmediatePost = True
            Properties.ShowTime = False
            TabOrder = 1
            Width = 121
          end
          object cbLMPUnknown: TcxCheckBox
            Left = 258
            Top = 30
            Caption = 'LMP unknown'
            TabOrder = 2
            Transparent = True
            Width = 104
          end
          object cbAmenorrhoea: TcxCheckBox
            Left = 370
            Top = 30
            Caption = 'Amenorrhoea'
            TabOrder = 3
            Transparent = True
            Width = 104
          end
          object cbPostMenopausal: TcxCheckBox
            Left = 480
            Top = 30
            Caption = 'Postmenopausal'
            TabOrder = 4
            Transparent = True
            Width = 120
          end
          object cxLabel3: TcxLabel
            Left = 84
            Top = 56
            Caption = 'Day'
            Transparent = True
          end
          object spStartDay: TcxSpinEdit
            Left = 109
            Top = 54
            Properties.AssignedValues.MinValue = True
            Properties.MaxValue = 45.000000000000000000
            TabOrder = 5
            Width = 41
          end
          object cxLabel4: TcxLabel
            Left = 154
            Top = 56
            Caption = 'Of'
            Transparent = True
          end
          object seCycleMinDays: TcxSpinEdit
            Left = 176
            Top = 54
            Properties.MaxValue = 45.000000000000000000
            Properties.MinValue = 1.000000000000000000
            TabOrder = 6
            Value = 28
            Width = 41
          end
          object cxLabel5: TcxLabel
            Left = 220
            Top = 56
            Caption = 'day cycle'
            Transparent = True
          end
          object cxLabel6: TcxLabel
            Left = 90
            Top = 83
            Caption = 'G'
            Transparent = True
          end
          object edtG: TcxSpinEdit
            Left = 109
            Top = 81
            Properties.AssignedValues.MinValue = True
            Properties.MaxValue = 20.000000000000000000
            TabOrder = 7
            Width = 35
          end
          object cxLabel7: TcxLabel
            Left = 152
            Top = 83
            Caption = 'P'
            Transparent = True
          end
          object edtP: TcxSpinEdit
            Left = 165
            Top = 81
            Properties.AssignedValues.MinValue = True
            Properties.MaxValue = 20.000000000000000000
            TabOrder = 8
            Width = 35
          end
          object cxLabel8: TcxLabel
            Left = 52
            Top = 109
            Caption = 'Medication'
            Transparent = True
          end
          object cxccbMedication: TcxCheckComboBox
            Left = 109
            Top = 107
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
            TabOrder = 9
            Width = 200
          end
          object edtOtherMedication: TcxTextEdit
            Left = 316
            Top = 107
            Enabled = False
            TabOrder = 10
            Width = 200
          end
          object cxLabel9: TcxLabel
            Left = 10
            Top = 137
            Caption = 'Referral indication'
            Transparent = True
          end
          object cxccbReferralIndication: TcxCheckComboBox
            Left = 109
            Top = 135
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
            Style.BorderColor = clRed
            Style.BorderStyle = ebsThick
            Style.Edges = [bLeft, bTop, bRight, bBottom]
            Style.Shadow = False
            TabOrder = 11
            Width = 200
          end
          object cxLabel10: TcxLabel
            Left = 21
            Top = 163
            Caption = 'Gynae history'
            Transparent = True
          end
          object cxccbClinicalHistory: TcxCheckComboBox
            Left = 109
            Top = 161
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
            Style.BorderColor = clRed
            Style.BorderStyle = ebsThick
            Style.Edges = [bLeft, bTop, bRight, bBottom]
            Style.Shadow = False
            TabOrder = 12
            Width = 200
          end
          object cxLabel11: TcxLabel
            Left = 20
            Top = 189
            Caption = 'Gynae surgery'
            Transparent = True
          end
          object cxccbPastSurgery: TcxCheckComboBox
            Left = 109
            Top = 187
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
            TabOrder = 13
            Width = 200
          end
          object gbLaparoscopy: TcxGroupBox
            Left = 316
            Top = 183
            PanelStyle.Active = True
            Style.BorderStyle = ebsUltraFlat
            Style.Edges = [bLeft, bTop, bRight, bBottom]
            Style.LookAndFeel.NativeStyle = True
            TabOrder = 14
            Transparent = True
            Visible = False
            Height = 28
            Width = 300
            object cxLabel13: TcxLabel
              Left = 5
              Top = 4
              Caption = 'How many'
              Transparent = True
            end
            object seLaparoscopyCount: TcxSpinEdit
              Left = 70
              Top = 2
              Properties.AssignedValues.MinValue = True
              Properties.MaxValue = 20.000000000000000000
              Properties.MinValue = 1.000000000000000000
              TabOrder = 0
              Width = 35
            end
            object cxLabel14: TcxLabel
              Left = 115
              Top = 4
              Caption = 'Year of last'
              Transparent = True
            end
            object seLaparoscopyYear: TcxSpinEdit
              Left = 185
              Top = 2
              Properties.MaxValue = 2040.000000000000000000
              Properties.MinValue = 1980.000000000000000000
              TabOrder = 1
              Width = 50
            end
          end
          object cxLabel12: TcxLabel
            Left = 52
            Top = 215
            Caption = 'Version'
            Transparent = True
          end
          object lblVersion: TcxLabel
            Left = 109
            Top = 215
            Caption = 'v2.0 Gynae'
            Transparent = True
          end
        end
        object pcReportBody: TcxPageControl
          Left = 4
          Top = 247
          Width = 888
          Height = 516
          TabOrder = 1
          Properties.ActivePage = tsUterus
          Properties.CustomButtons.Buttons = <>
          ClientRectBottom = 516
          ClientRectRight = 888
          ClientRectTop = 24

          object tsUterus: TcxTabSheet
            Caption = 'Uterus'
            ImageIndex = 5
            object dxlcUterus: TdxLayoutControl
              Left = 0
              Top = 0
              Width = 888
              Height = 492
              Align = alClient
              TabOrder = 0
              AutoSize = True
              LayoutLookAndFeel = dxLayoutSkinLookAndFeel1

              object cbUterusPosition: TcxComboBox
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
              object cbHysterectomy: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Hysterectomy'
                TabOrder = 0
                Transparent = True
                Width = 110
              end
              object cbCervixPresent: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Cervix present'
                TabOrder = 0
                Transparent = True
                Width = 110
              end
              object cbCongenitalAbnormality: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Congenital abnormality'
                TabOrder = 0
                Transparent = True
                Width = 170
              end
              object cbCongenitalType: TcxComboBox
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
              object cbLSCSScar: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'LSCS scar identified'
                TabOrder = 0
                Transparent = True
                Width = 160
              end
              object cbAdenomyosis: TcxCheckBox
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
              object cbInfiltratingSerosa: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Infiltrating through serosa'
                Enabled = False
                TabOrder = 0
                Transparent = True
                Width = 195
              end
              object cbIrregularJunctionalZone: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Irregular junctional zone'
                TabOrder = 0
                Transparent = True
                Width = 180
              end
              object cbAdenomyosisSeverity: TcxComboBox
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
              object cbEndometrialBuds: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Endometrial buds'
                TabOrder = 0
                Transparent = True
                Width = 130
              end
              object cbEndometrialIslets: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Endometrial islets'
                TabOrder = 0
                Transparent = True
                Width = 130
              end
              object cbMyometrialCysts: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Myometrial cysts'
                TabOrder = 0
                Transparent = True
                Width = 120
              end
              object cbVenetianBlind: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Venetian blind shadowing'
                TabOrder = 0
                Transparent = True
                Width = 180
              end
              object cbPriorAblation: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Prior ablation effects'
                TabOrder = 0
                Transparent = True
                Width = 160
              end
              object cbFibroidsPresent: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Fibroids present'
                TabOrder = 0
                Transparent = True
                Width = 120
              end
              object spFibroidCount: TcxSpinEdit
                Left = 10000
                Top = 10000
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                TabOrder = 0
                Width = 35
              end
              object cbFibroidSide1: TcxComboBox
                Left = 10000
                Top = 10000
                Properties.DropDownListStyle = lsFixedList
                Properties.Items.Strings = (
                  ''
                  'Left'
                  'Right'
                  'Fundal')
                TabOrder = 0
                Width = 80
              end
              object cbFibroidPosition1: TcxComboBox
                Left = 10000
                Top = 10000
                Properties.DropDownListStyle = lsFixedList
                Properties.Items.Strings = (
                  ''
                  'anterior'
                  'posterior'
                  'lateral'
                  'cervical')
                TabOrder = 0
                Width = 90
              end
              object cbFibroidType1: TcxComboBox
                Left = 10000
                Top = 10000
                Properties.DropDownListStyle = lsFixedList
                Properties.Items.Strings = (
                  ''
                  'intramural'
                  'subserosal'
                  'submucosal'
                  'pedunculated')
                TabOrder = 0
                Width = 110
              end
              object seFibroidLength1: TcxSpinEdit
                Left = 10000
                Top = 10000
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                TabOrder = 0
                Width = 35
              end
              object seFibroidWidth1: TcxSpinEdit
                Left = 10000
                Top = 10000
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                TabOrder = 0
                Width = 35
              end
              object seFibroidDepth1: TcxSpinEdit
                Left = 10000
                Top = 10000
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                TabOrder = 0
                Width = 35
              end
              object cbCavityDistortion1: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Cavity distortion'
                TabOrder = 0
                Transparent = True
                Width = 120
              end
              object cbFibroidSide2: TcxComboBox
                Left = 10000
                Top = 10000
                Properties.DropDownListStyle = lsFixedList
                Properties.Items.Strings = (
                  ''
                  'Left'
                  'Right'
                  'Fundal')
                TabOrder = 0
                Width = 80
              end
              object cbFibroidPosition2: TcxComboBox
                Left = 10000
                Top = 10000
                Properties.DropDownListStyle = lsFixedList
                Properties.Items.Strings = (
                  ''
                  'anterior'
                  'posterior'
                  'lateral'
                  'cervical')
                TabOrder = 0
                Width = 90
              end
              object cbFibroidType2: TcxComboBox
                Left = 10000
                Top = 10000
                Properties.DropDownListStyle = lsFixedList
                Properties.Items.Strings = (
                  ''
                  'intramural'
                  'subserosal'
                  'submucosal'
                  'pedunculated')
                TabOrder = 0
                Width = 110
              end
              object seFibroidLength2: TcxSpinEdit
                Left = 10000
                Top = 10000
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                TabOrder = 0
                Width = 35
              end
              object seFibroidWidth2: TcxSpinEdit
                Left = 10000
                Top = 10000
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                TabOrder = 0
                Width = 35
              end
              object seFibroidDepth2: TcxSpinEdit
                Left = 10000
                Top = 10000
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                TabOrder = 0
                Width = 35
              end
              object cbCavityDistortion2: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Cavity distortion'
                TabOrder = 0
                Transparent = True
                Width = 120
              end
              object cbFibroidSide3: TcxComboBox
                Left = 10000
                Top = 10000
                Properties.DropDownListStyle = lsFixedList
                Properties.Items.Strings = (
                  ''
                  'Left'
                  'Right'
                  'Fundal')
                TabOrder = 0
                Width = 80
              end
              object cbFibroidPosition3: TcxComboBox
                Left = 10000
                Top = 10000
                Properties.DropDownListStyle = lsFixedList
                Properties.Items.Strings = (
                  ''
                  'anterior'
                  'posterior'
                  'lateral'
                  'cervical')
                TabOrder = 0
                Width = 90
              end
              object cbFibroidType3: TcxComboBox
                Left = 10000
                Top = 10000
                Properties.DropDownListStyle = lsFixedList
                Properties.Items.Strings = (
                  ''
                  'intramural'
                  'subserosal'
                  'submucosal'
                  'pedunculated')
                TabOrder = 0
                Width = 110
              end
              object seFibroidLength3: TcxSpinEdit
                Left = 10000
                Top = 10000
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                TabOrder = 0
                Width = 35
              end
              object seFibroidWidth3: TcxSpinEdit
                Left = 10000
                Top = 10000
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                TabOrder = 0
                Width = 35
              end
              object seFibroidDepth3: TcxSpinEdit
                Left = 10000
                Top = 10000
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                TabOrder = 0
                Width = 35
              end
              object cbCavityDistortion3: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Cavity distortion'
                TabOrder = 0
                Transparent = True
                Width = 120
              end
              object cbFibroidSide4: TcxComboBox
                Left = 10000
                Top = 10000
                Properties.DropDownListStyle = lsFixedList
                Properties.Items.Strings = (
                  ''
                  'Left'
                  'Right'
                  'Fundal')
                TabOrder = 0
                Width = 80
              end
              object cbFibroidPosition4: TcxComboBox
                Left = 10000
                Top = 10000
                Properties.DropDownListStyle = lsFixedList
                Properties.Items.Strings = (
                  ''
                  'anterior'
                  'posterior'
                  'lateral'
                  'cervical')
                TabOrder = 0
                Width = 90
              end
              object cbFibroidType4: TcxComboBox
                Left = 10000
                Top = 10000
                Properties.DropDownListStyle = lsFixedList
                Properties.Items.Strings = (
                  ''
                  'intramural'
                  'subserosal'
                  'submucosal'
                  'pedunculated')
                TabOrder = 0
                Width = 110
              end
              object seFibroidLength4: TcxSpinEdit
                Left = 10000
                Top = 10000
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                TabOrder = 0
                Width = 35
              end
              object seFibroidWidth4: TcxSpinEdit
                Left = 10000
                Top = 10000
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                TabOrder = 0
                Width = 35
              end
              object seFibroidDepth4: TcxSpinEdit
                Left = 10000
                Top = 10000
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                TabOrder = 0
                Width = 35
              end
              object cbCavityDistortion4: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Cavity distortion'
                TabOrder = 0
                Transparent = True
                Width = 120
              end
              object cbFibroidSide5: TcxComboBox
                Left = 10000
                Top = 10000
                Properties.DropDownListStyle = lsFixedList
                Properties.Items.Strings = (
                  ''
                  'Left'
                  'Right'
                  'Fundal')
                TabOrder = 0
                Width = 80
              end
              object cbFibroidPosition5: TcxComboBox
                Left = 10000
                Top = 10000
                Properties.DropDownListStyle = lsFixedList
                Properties.Items.Strings = (
                  ''
                  'anterior'
                  'posterior'
                  'lateral'
                  'cervical')
                TabOrder = 0
                Width = 90
              end
              object cbFibroidType5: TcxComboBox
                Left = 10000
                Top = 10000
                Properties.DropDownListStyle = lsFixedList
                Properties.Items.Strings = (
                  ''
                  'intramural'
                  'subserosal'
                  'submucosal'
                  'pedunculated')
                TabOrder = 0
                Width = 110
              end
              object seFibroidLength5: TcxSpinEdit
                Left = 10000
                Top = 10000
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                TabOrder = 0
                Width = 35
              end
              object seFibroidWidth5: TcxSpinEdit
                Left = 10000
                Top = 10000
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                TabOrder = 0
                Width = 35
              end
              object seFibroidDepth5: TcxSpinEdit
                Left = 10000
                Top = 10000
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                TabOrder = 0
                Width = 35
              end
              object cbCavityDistortion5: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Cavity distortion'
                TabOrder = 0
                Transparent = True
                Width = 120
              end
              object cbFibroidSide6: TcxComboBox
                Left = 10000
                Top = 10000
                Properties.DropDownListStyle = lsFixedList
                Properties.Items.Strings = (
                  ''
                  'Left'
                  'Right'
                  'Fundal')
                TabOrder = 0
                Width = 80
              end
              object cbFibroidPosition6: TcxComboBox
                Left = 10000
                Top = 10000
                Properties.DropDownListStyle = lsFixedList
                Properties.Items.Strings = (
                  ''
                  'anterior'
                  'posterior'
                  'lateral'
                  'cervical')
                TabOrder = 0
                Width = 90
              end
              object cbFibroidType6: TcxComboBox
                Left = 10000
                Top = 10000
                Properties.DropDownListStyle = lsFixedList
                Properties.Items.Strings = (
                  ''
                  'intramural'
                  'subserosal'
                  'submucosal'
                  'pedunculated')
                TabOrder = 0
                Width = 110
              end
              object seFibroidLength6: TcxSpinEdit
                Left = 10000
                Top = 10000
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                TabOrder = 0
                Width = 35
              end
              object seFibroidWidth6: TcxSpinEdit
                Left = 10000
                Top = 10000
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                TabOrder = 0
                Width = 35
              end
              object seFibroidDepth6: TcxSpinEdit
                Left = 10000
                Top = 10000
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                TabOrder = 0
                Width = 35
              end
              object cbCavityDistortion6: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Cavity distortion'
                TabOrder = 0
                Transparent = True
                Width = 120
              end
              object cbFibroidSide7: TcxComboBox
                Left = 10000
                Top = 10000
                Properties.DropDownListStyle = lsFixedList
                Properties.Items.Strings = (
                  ''
                  'Left'
                  'Right'
                  'Fundal')
                TabOrder = 0
                Width = 80
              end
              object cbFibroidPosition7: TcxComboBox
                Left = 10000
                Top = 10000
                Properties.DropDownListStyle = lsFixedList
                Properties.Items.Strings = (
                  ''
                  'anterior'
                  'posterior'
                  'lateral'
                  'cervical')
                TabOrder = 0
                Width = 90
              end
              object cbFibroidType7: TcxComboBox
                Left = 10000
                Top = 10000
                Properties.DropDownListStyle = lsFixedList
                Properties.Items.Strings = (
                  ''
                  'intramural'
                  'subserosal'
                  'submucosal'
                  'pedunculated')
                TabOrder = 0
                Width = 110
              end
              object seFibroidLength7: TcxSpinEdit
                Left = 10000
                Top = 10000
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                TabOrder = 0
                Width = 35
              end
              object seFibroidWidth7: TcxSpinEdit
                Left = 10000
                Top = 10000
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                TabOrder = 0
                Width = 35
              end
              object seFibroidDepth7: TcxSpinEdit
                Left = 10000
                Top = 10000
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                TabOrder = 0
                Width = 35
              end
              object cbCavityDistortion7: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Cavity distortion'
                TabOrder = 0
                Transparent = True
                Width = 120
              end
              object cbFibroidSide8: TcxComboBox
                Left = 10000
                Top = 10000
                Properties.DropDownListStyle = lsFixedList
                Properties.Items.Strings = (
                  ''
                  'Left'
                  'Right'
                  'Fundal')
                TabOrder = 0
                Width = 80
              end
              object cbFibroidPosition8: TcxComboBox
                Left = 10000
                Top = 10000
                Properties.DropDownListStyle = lsFixedList
                Properties.Items.Strings = (
                  ''
                  'anterior'
                  'posterior'
                  'lateral'
                  'cervical')
                TabOrder = 0
                Width = 90
              end
              object cbFibroidType8: TcxComboBox
                Left = 10000
                Top = 10000
                Properties.DropDownListStyle = lsFixedList
                Properties.Items.Strings = (
                  ''
                  'intramural'
                  'subserosal'
                  'submucosal'
                  'pedunculated')
                TabOrder = 0
                Width = 110
              end
              object seFibroidLength8: TcxSpinEdit
                Left = 10000
                Top = 10000
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                TabOrder = 0
                Width = 35
              end
              object seFibroidWidth8: TcxSpinEdit
                Left = 10000
                Top = 10000
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                TabOrder = 0
                Width = 35
              end
              object seFibroidDepth8: TcxSpinEdit
                Left = 10000
                Top = 10000
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                TabOrder = 0
                Width = 35
              end
              object cbCavityDistortion8: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Cavity distortion'
                TabOrder = 0
                Transparent = True
                Width = 120
              end

              object dxlcUterusGroup_Root: TdxLayoutGroup
                AlignHorz = ahClient
                AlignVert = avTop
                ButtonOptions.Buttons = <>
                Hidden = True
                LayoutDirection = ldVertical
                ShowBorder = False
              object liPosition: TdxLayoutItem
                CaptionOptions.Text = 'Position'
                Control = cbUterusPosition
                ControlOptions.ShowBorder = False
              end
              object lgMeasurements: TdxLayoutGroup
                CaptionOptions.Text = 'Measurements'
                CaptionOptions.Visible = True
                ButtonOptions.Buttons = <>
                LayoutDirection = ldHorizontal
                ShowBorder = False
              object liUterusL: TdxLayoutItem
                CaptionOptions.Text = 'L'
                CaptionOptions.Visible = False
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
                Control = cbHysterectomy
                ControlOptions.ShowBorder = False
              end
              object liCervixPresent: TdxLayoutItem
                CaptionOptions.Visible = False
                Control = cbCervixPresent
                ControlOptions.ShowBorder = False
              end
              end
              object liCongenital: TdxLayoutItem
                CaptionOptions.Visible = False
                Control = cbCongenitalAbnormality
                ControlOptions.ShowBorder = False
              end
              object lgCongenitalDetails: TdxLayoutGroup
                CaptionOptions.Visible = False
                ButtonOptions.Buttons = <>
                ShowBorder = False
                Visible = False
              object liCongenitalType: TdxLayoutItem
                CaptionOptions.Text = 'Type'
                Control = cbCongenitalType
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
                Control = cbLSCSScar
                ControlOptions.ShowBorder = False
              end
              object liMyoSep: TdxLayoutSeparatorItem
                CaptionOptions.Text = 'Myometrium'
              end
              object liAdenomyosis: TdxLayoutItem
                CaptionOptions.Visible = False
                Control = cbAdenomyosis
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
                Control = cbInfiltratingSerosa
                ControlOptions.ShowBorder = False
              end
              end
              object liIrregularJZ: TdxLayoutItem
                CaptionOptions.Visible = False
                Control = cbIrregularJunctionalZone
                ControlOptions.ShowBorder = False
              end
              object liAdenoSeverity: TdxLayoutItem
                CaptionOptions.Text = 'Severity'
                Control = cbAdenomyosisSeverity
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
                Control = cbEndometrialBuds
                ControlOptions.ShowBorder = False
              end
              object liEndoIslets: TdxLayoutItem
                CaptionOptions.Visible = False
                Control = cbEndometrialIslets
                ControlOptions.ShowBorder = False
              end
              object liMyoCysts: TdxLayoutItem
                CaptionOptions.Visible = False
                Control = cbMyometrialCysts
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
                Control = cbVenetianBlind
                ControlOptions.ShowBorder = False
              end
              object liPriorAblation: TdxLayoutItem
                CaptionOptions.Visible = False
                Control = cbPriorAblation
                ControlOptions.ShowBorder = False
              end
              end
              end
              object liFibSep: TdxLayoutSeparatorItem
                CaptionOptions.Text = 'Fibroids'
              end
              object liFibroidsPresent: TdxLayoutItem
                CaptionOptions.Visible = False
                Control = cbFibroidsPresent
                ControlOptions.ShowBorder = False
              end
              object lgFibroidsDetails: TdxLayoutGroup
                CaptionOptions.Visible = False
                ButtonOptions.Buttons = <>
                ShowBorder = False
                Visible = False
              object liFibroidCount: TdxLayoutItem
                CaptionOptions.Text = 'Count'
                Control = spFibroidCount
                ControlOptions.ShowBorder = False
              end
              object lgFibroid1: TdxLayoutGroup
                CaptionOptions.Text = 'Fibroid 1'
                CaptionOptions.Visible = True
                ButtonOptions.Buttons = <>
                ShowBorder = False
              object lgFib1Row1: TdxLayoutGroup
                CaptionOptions.Visible = False
                ButtonOptions.Buttons = <>
                LayoutDirection = ldHorizontal
                ShowBorder = False
              object liFibSide1: TdxLayoutItem
                CaptionOptions.Text = 'Side'
                Control = cbFibroidSide1
                ControlOptions.ShowBorder = False
              end
              object liFibPos1: TdxLayoutItem
                CaptionOptions.Text = 'Position'
                Control = cbFibroidPosition1
                ControlOptions.ShowBorder = False
              end
              object liFibType1: TdxLayoutItem
                CaptionOptions.Text = 'Type'
                Control = cbFibroidType1
                ControlOptions.ShowBorder = False
              end
              end
              object lgFib1Row2: TdxLayoutGroup
                CaptionOptions.Visible = False
                ButtonOptions.Buttons = <>
                LayoutDirection = ldHorizontal
                ShowBorder = False
              object liFibL1: TdxLayoutItem
                CaptionOptions.Text = 'L'
                CaptionOptions.Visible = False
                Control = seFibroidLength1
                ControlOptions.ShowBorder = False
              end
              object liFibx1a: TdxLayoutLabeledItem
                CaptionOptions.Text = 'x'
              end
              object liFibW1: TdxLayoutItem
                CaptionOptions.Visible = False
                Control = seFibroidWidth1
                ControlOptions.ShowBorder = False
              end
              object liFibx1b: TdxLayoutLabeledItem
                CaptionOptions.Text = 'x'
              end
              object liFibD1: TdxLayoutItem
                CaptionOptions.Visible = False
                Control = seFibroidDepth1
                ControlOptions.ShowBorder = False
              end
              object liFibmm1: TdxLayoutLabeledItem
                CaptionOptions.Text = 'mm'
              end
              object liFibCav1: TdxLayoutItem
                CaptionOptions.Visible = False
                Control = cbCavityDistortion1
                ControlOptions.ShowBorder = False
              end
              end
              end
              object lgFibroid2: TdxLayoutGroup
                CaptionOptions.Text = 'Fibroid 2'
                CaptionOptions.Visible = True
                ButtonOptions.Buttons = <>
                ShowBorder = False
                Visible = False
              object lgFib2Row1: TdxLayoutGroup
                CaptionOptions.Visible = False
                ButtonOptions.Buttons = <>
                LayoutDirection = ldHorizontal
                ShowBorder = False
              object liFibSide2: TdxLayoutItem
                CaptionOptions.Text = 'Side'
                Control = cbFibroidSide2
                ControlOptions.ShowBorder = False
              end
              object liFibPos2: TdxLayoutItem
                CaptionOptions.Text = 'Position'
                Control = cbFibroidPosition2
                ControlOptions.ShowBorder = False
              end
              object liFibType2: TdxLayoutItem
                CaptionOptions.Text = 'Type'
                Control = cbFibroidType2
                ControlOptions.ShowBorder = False
              end
              end
              object lgFib2Row2: TdxLayoutGroup
                CaptionOptions.Visible = False
                ButtonOptions.Buttons = <>
                LayoutDirection = ldHorizontal
                ShowBorder = False
              object liFibL2: TdxLayoutItem
                CaptionOptions.Text = 'L'
                CaptionOptions.Visible = False
                Control = seFibroidLength2
                ControlOptions.ShowBorder = False
              end
              object liFibx2a: TdxLayoutLabeledItem
                CaptionOptions.Text = 'x'
              end
              object liFibW2: TdxLayoutItem
                CaptionOptions.Visible = False
                Control = seFibroidWidth2
                ControlOptions.ShowBorder = False
              end
              object liFibx2b: TdxLayoutLabeledItem
                CaptionOptions.Text = 'x'
              end
              object liFibD2: TdxLayoutItem
                CaptionOptions.Visible = False
                Control = seFibroidDepth2
                ControlOptions.ShowBorder = False
              end
              object liFibmm2: TdxLayoutLabeledItem
                CaptionOptions.Text = 'mm'
              end
              object liFibCav2: TdxLayoutItem
                CaptionOptions.Visible = False
                Control = cbCavityDistortion2
                ControlOptions.ShowBorder = False
              end
              end
              end
              object lgFibroid3: TdxLayoutGroup
                CaptionOptions.Text = 'Fibroid 3'
                CaptionOptions.Visible = True
                ButtonOptions.Buttons = <>
                ShowBorder = False
                Visible = False
              object lgFib3Row1: TdxLayoutGroup
                CaptionOptions.Visible = False
                ButtonOptions.Buttons = <>
                LayoutDirection = ldHorizontal
                ShowBorder = False
              object liFibSide3: TdxLayoutItem
                CaptionOptions.Text = 'Side'
                Control = cbFibroidSide3
                ControlOptions.ShowBorder = False
              end
              object liFibPos3: TdxLayoutItem
                CaptionOptions.Text = 'Position'
                Control = cbFibroidPosition3
                ControlOptions.ShowBorder = False
              end
              object liFibType3: TdxLayoutItem
                CaptionOptions.Text = 'Type'
                Control = cbFibroidType3
                ControlOptions.ShowBorder = False
              end
              end
              object lgFib3Row2: TdxLayoutGroup
                CaptionOptions.Visible = False
                ButtonOptions.Buttons = <>
                LayoutDirection = ldHorizontal
                ShowBorder = False
              object liFibL3: TdxLayoutItem
                CaptionOptions.Text = 'L'
                CaptionOptions.Visible = False
                Control = seFibroidLength3
                ControlOptions.ShowBorder = False
              end
              object liFibx3a: TdxLayoutLabeledItem
                CaptionOptions.Text = 'x'
              end
              object liFibW3: TdxLayoutItem
                CaptionOptions.Visible = False
                Control = seFibroidWidth3
                ControlOptions.ShowBorder = False
              end
              object liFibx3b: TdxLayoutLabeledItem
                CaptionOptions.Text = 'x'
              end
              object liFibD3: TdxLayoutItem
                CaptionOptions.Visible = False
                Control = seFibroidDepth3
                ControlOptions.ShowBorder = False
              end
              object liFibmm3: TdxLayoutLabeledItem
                CaptionOptions.Text = 'mm'
              end
              object liFibCav3: TdxLayoutItem
                CaptionOptions.Visible = False
                Control = cbCavityDistortion3
                ControlOptions.ShowBorder = False
              end
              end
              end
              object lgFibroid4: TdxLayoutGroup
                CaptionOptions.Text = 'Fibroid 4'
                CaptionOptions.Visible = True
                ButtonOptions.Buttons = <>
                ShowBorder = False
                Visible = False
              object lgFib4Row1: TdxLayoutGroup
                CaptionOptions.Visible = False
                ButtonOptions.Buttons = <>
                LayoutDirection = ldHorizontal
                ShowBorder = False
              object liFibSide4: TdxLayoutItem
                CaptionOptions.Text = 'Side'
                Control = cbFibroidSide4
                ControlOptions.ShowBorder = False
              end
              object liFibPos4: TdxLayoutItem
                CaptionOptions.Text = 'Position'
                Control = cbFibroidPosition4
                ControlOptions.ShowBorder = False
              end
              object liFibType4: TdxLayoutItem
                CaptionOptions.Text = 'Type'
                Control = cbFibroidType4
                ControlOptions.ShowBorder = False
              end
              end
              object lgFib4Row2: TdxLayoutGroup
                CaptionOptions.Visible = False
                ButtonOptions.Buttons = <>
                LayoutDirection = ldHorizontal
                ShowBorder = False
              object liFibL4: TdxLayoutItem
                CaptionOptions.Text = 'L'
                CaptionOptions.Visible = False
                Control = seFibroidLength4
                ControlOptions.ShowBorder = False
              end
              object liFibx4a: TdxLayoutLabeledItem
                CaptionOptions.Text = 'x'
              end
              object liFibW4: TdxLayoutItem
                CaptionOptions.Visible = False
                Control = seFibroidWidth4
                ControlOptions.ShowBorder = False
              end
              object liFibx4b: TdxLayoutLabeledItem
                CaptionOptions.Text = 'x'
              end
              object liFibD4: TdxLayoutItem
                CaptionOptions.Visible = False
                Control = seFibroidDepth4
                ControlOptions.ShowBorder = False
              end
              object liFibmm4: TdxLayoutLabeledItem
                CaptionOptions.Text = 'mm'
              end
              object liFibCav4: TdxLayoutItem
                CaptionOptions.Visible = False
                Control = cbCavityDistortion4
                ControlOptions.ShowBorder = False
              end
              end
              end
              object lgFibroid5: TdxLayoutGroup
                CaptionOptions.Text = 'Fibroid 5'
                CaptionOptions.Visible = True
                ButtonOptions.Buttons = <>
                ShowBorder = False
                Visible = False
              object lgFib5Row1: TdxLayoutGroup
                CaptionOptions.Visible = False
                ButtonOptions.Buttons = <>
                LayoutDirection = ldHorizontal
                ShowBorder = False
              object liFibSide5: TdxLayoutItem
                CaptionOptions.Text = 'Side'
                Control = cbFibroidSide5
                ControlOptions.ShowBorder = False
              end
              object liFibPos5: TdxLayoutItem
                CaptionOptions.Text = 'Position'
                Control = cbFibroidPosition5
                ControlOptions.ShowBorder = False
              end
              object liFibType5: TdxLayoutItem
                CaptionOptions.Text = 'Type'
                Control = cbFibroidType5
                ControlOptions.ShowBorder = False
              end
              end
              object lgFib5Row2: TdxLayoutGroup
                CaptionOptions.Visible = False
                ButtonOptions.Buttons = <>
                LayoutDirection = ldHorizontal
                ShowBorder = False
              object liFibL5: TdxLayoutItem
                CaptionOptions.Text = 'L'
                CaptionOptions.Visible = False
                Control = seFibroidLength5
                ControlOptions.ShowBorder = False
              end
              object liFibx5a: TdxLayoutLabeledItem
                CaptionOptions.Text = 'x'
              end
              object liFibW5: TdxLayoutItem
                CaptionOptions.Visible = False
                Control = seFibroidWidth5
                ControlOptions.ShowBorder = False
              end
              object liFibx5b: TdxLayoutLabeledItem
                CaptionOptions.Text = 'x'
              end
              object liFibD5: TdxLayoutItem
                CaptionOptions.Visible = False
                Control = seFibroidDepth5
                ControlOptions.ShowBorder = False
              end
              object liFibmm5: TdxLayoutLabeledItem
                CaptionOptions.Text = 'mm'
              end
              object liFibCav5: TdxLayoutItem
                CaptionOptions.Visible = False
                Control = cbCavityDistortion5
                ControlOptions.ShowBorder = False
              end
              end
              end
              object lgFibroid6: TdxLayoutGroup
                CaptionOptions.Text = 'Fibroid 6'
                CaptionOptions.Visible = True
                ButtonOptions.Buttons = <>
                ShowBorder = False
                Visible = False
              object lgFib6Row1: TdxLayoutGroup
                CaptionOptions.Visible = False
                ButtonOptions.Buttons = <>
                LayoutDirection = ldHorizontal
                ShowBorder = False
              object liFibSide6: TdxLayoutItem
                CaptionOptions.Text = 'Side'
                Control = cbFibroidSide6
                ControlOptions.ShowBorder = False
              end
              object liFibPos6: TdxLayoutItem
                CaptionOptions.Text = 'Position'
                Control = cbFibroidPosition6
                ControlOptions.ShowBorder = False
              end
              object liFibType6: TdxLayoutItem
                CaptionOptions.Text = 'Type'
                Control = cbFibroidType6
                ControlOptions.ShowBorder = False
              end
              end
              object lgFib6Row2: TdxLayoutGroup
                CaptionOptions.Visible = False
                ButtonOptions.Buttons = <>
                LayoutDirection = ldHorizontal
                ShowBorder = False
              object liFibL6: TdxLayoutItem
                CaptionOptions.Text = 'L'
                CaptionOptions.Visible = False
                Control = seFibroidLength6
                ControlOptions.ShowBorder = False
              end
              object liFibx6a: TdxLayoutLabeledItem
                CaptionOptions.Text = 'x'
              end
              object liFibW6: TdxLayoutItem
                CaptionOptions.Visible = False
                Control = seFibroidWidth6
                ControlOptions.ShowBorder = False
              end
              object liFibx6b: TdxLayoutLabeledItem
                CaptionOptions.Text = 'x'
              end
              object liFibD6: TdxLayoutItem
                CaptionOptions.Visible = False
                Control = seFibroidDepth6
                ControlOptions.ShowBorder = False
              end
              object liFibmm6: TdxLayoutLabeledItem
                CaptionOptions.Text = 'mm'
              end
              object liFibCav6: TdxLayoutItem
                CaptionOptions.Visible = False
                Control = cbCavityDistortion6
                ControlOptions.ShowBorder = False
              end
              end
              end
              object lgFibroid7: TdxLayoutGroup
                CaptionOptions.Text = 'Fibroid 7'
                CaptionOptions.Visible = True
                ButtonOptions.Buttons = <>
                ShowBorder = False
                Visible = False
              object lgFib7Row1: TdxLayoutGroup
                CaptionOptions.Visible = False
                ButtonOptions.Buttons = <>
                LayoutDirection = ldHorizontal
                ShowBorder = False
              object liFibSide7: TdxLayoutItem
                CaptionOptions.Text = 'Side'
                Control = cbFibroidSide7
                ControlOptions.ShowBorder = False
              end
              object liFibPos7: TdxLayoutItem
                CaptionOptions.Text = 'Position'
                Control = cbFibroidPosition7
                ControlOptions.ShowBorder = False
              end
              object liFibType7: TdxLayoutItem
                CaptionOptions.Text = 'Type'
                Control = cbFibroidType7
                ControlOptions.ShowBorder = False
              end
              end
              object lgFib7Row2: TdxLayoutGroup
                CaptionOptions.Visible = False
                ButtonOptions.Buttons = <>
                LayoutDirection = ldHorizontal
                ShowBorder = False
              object liFibL7: TdxLayoutItem
                CaptionOptions.Text = 'L'
                CaptionOptions.Visible = False
                Control = seFibroidLength7
                ControlOptions.ShowBorder = False
              end
              object liFibx7a: TdxLayoutLabeledItem
                CaptionOptions.Text = 'x'
              end
              object liFibW7: TdxLayoutItem
                CaptionOptions.Visible = False
                Control = seFibroidWidth7
                ControlOptions.ShowBorder = False
              end
              object liFibx7b: TdxLayoutLabeledItem
                CaptionOptions.Text = 'x'
              end
              object liFibD7: TdxLayoutItem
                CaptionOptions.Visible = False
                Control = seFibroidDepth7
                ControlOptions.ShowBorder = False
              end
              object liFibmm7: TdxLayoutLabeledItem
                CaptionOptions.Text = 'mm'
              end
              object liFibCav7: TdxLayoutItem
                CaptionOptions.Visible = False
                Control = cbCavityDistortion7
                ControlOptions.ShowBorder = False
              end
              end
              end
              object lgFibroid8: TdxLayoutGroup
                CaptionOptions.Text = 'Fibroid 8'
                CaptionOptions.Visible = True
                ButtonOptions.Buttons = <>
                ShowBorder = False
                Visible = False
              object lgFib8Row1: TdxLayoutGroup
                CaptionOptions.Visible = False
                ButtonOptions.Buttons = <>
                LayoutDirection = ldHorizontal
                ShowBorder = False
              object liFibSide8: TdxLayoutItem
                CaptionOptions.Text = 'Side'
                Control = cbFibroidSide8
                ControlOptions.ShowBorder = False
              end
              object liFibPos8: TdxLayoutItem
                CaptionOptions.Text = 'Position'
                Control = cbFibroidPosition8
                ControlOptions.ShowBorder = False
              end
              object liFibType8: TdxLayoutItem
                CaptionOptions.Text = 'Type'
                Control = cbFibroidType8
                ControlOptions.ShowBorder = False
              end
              end
              object lgFib8Row2: TdxLayoutGroup
                CaptionOptions.Visible = False
                ButtonOptions.Buttons = <>
                LayoutDirection = ldHorizontal
                ShowBorder = False
              object liFibL8: TdxLayoutItem
                CaptionOptions.Text = 'L'
                CaptionOptions.Visible = False
                Control = seFibroidLength8
                ControlOptions.ShowBorder = False
              end
              object liFibx8a: TdxLayoutLabeledItem
                CaptionOptions.Text = 'x'
              end
              object liFibW8: TdxLayoutItem
                CaptionOptions.Visible = False
                Control = seFibroidWidth8
                ControlOptions.ShowBorder = False
              end
              object liFibx8b: TdxLayoutLabeledItem
                CaptionOptions.Text = 'x'
              end
              object liFibD8: TdxLayoutItem
                CaptionOptions.Visible = False
                Control = seFibroidDepth8
                ControlOptions.ShowBorder = False
              end
              object liFibmm8: TdxLayoutLabeledItem
                CaptionOptions.Text = 'mm'
              end
              object liFibCav8: TdxLayoutItem
                CaptionOptions.Visible = False
                Control = cbCavityDistortion8
                ControlOptions.ShowBorder = False
              end
              end
              end
              end
              end
            end
          end

          object tsEndometrium: TcxTabSheet
            Caption = 'Endometrium'
            ImageIndex = 5
            object dxlcEndometrium: TdxLayoutControl
              Left = 0
              Top = 0
              Width = 888
              Height = 492
              Align = alClient
              TabOrder = 0
              AutoSize = True
              LayoutLookAndFeel = dxLayoutSkinLookAndFeel1

              object cbEndometriumPhase: TcxComboBox
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
              object cbInSync: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'In sync'
                TabOrder = 2
                Transparent = True
                Width = 70
              end
              object cbFocalLesion: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Endometrial polyp present'
                TabOrder = 3
                Transparent = True
                Width = 180
              end
              object spPolypCount: TcxSpinEdit
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
              object cbPolypLocation1: TcxComboBox
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
              object cbVascularStalk: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Vascular stalk'
                TabOrder = 9
                Transparent = True
                Width = 100
              end
              object cbIUDCorrect: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'IUD correct'
                TabOrder = 10
                Transparent = True
                Width = 90
              end
              object cbIUDIncorrect: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'IUD incorrectly positioned'
                TabOrder = 11
                Transparent = True
                Width = 185
              end
              object cbRPOC: TcxCheckBox
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
              object cbRPOCLocation: TcxComboBox
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
              object cbRPOCSliding: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Sliding in cavity'
                TabOrder = 19
                Transparent = True
                Width = 120
              end
              object cbRPOCInflammatory: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Inflammatory response'
                TabOrder = 20
                Transparent = True
                Width = 160
              end

              object dxlcEndometriumGroup_Root: TdxLayoutGroup
                AlignHorz = ahClient
                AlignVert = avTop
                ButtonOptions.Buttons = <>
                Hidden = True
                LayoutDirection = ldVertical
                ShowBorder = False

                object liEndoPhase: TdxLayoutItem
                  CaptionOptions.Text = 'Phase'
                  Control = cbEndometriumPhase
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
                    Control = cbInSync
                    ControlOptions.ShowBorder = False
                  end
                end

                object liPolypSep: TdxLayoutSeparatorItem
                  CaptionOptions.Text = 'Endometrial Polyp'
                end
                object liPolyp: TdxLayoutItem
                  CaptionOptions.Visible = False
                  Control = cbFocalLesion
                  ControlOptions.ShowBorder = False
                end
                object lgPolypDetails: TdxLayoutGroup
                  CaptionOptions.Visible = False
                  ButtonOptions.Buttons = <>
                  ShowBorder = False
                  Visible = False
                  object liPolypCount: TdxLayoutItem
                    CaptionOptions.Text = 'Count'
                    Control = spPolypCount
                    ControlOptions.ShowBorder = False
                  end
                  object lgPolypDims: TdxLayoutGroup
                    CaptionOptions.Visible = False
                    ButtonOptions.Buttons = <>
                    LayoutDirection = ldHorizontal
                    ShowBorder = False
                    object liPolypDimLabel: TdxLayoutLabeledItem
                      CaptionOptions.Text = 'Dimensions'
                    end
                    object liPolypL: TdxLayoutItem
                      CaptionOptions.Visible = False
                      Control = sePolypLength1
                      ControlOptions.ShowBorder = False
                    end
                    object liPolypSep1: TdxLayoutLabeledItem
                      CaptionOptions.Text = 'x'
                    end
                    object liPolypW: TdxLayoutItem
                      CaptionOptions.Visible = False
                      Control = sePolypWidth1
                      ControlOptions.ShowBorder = False
                    end
                    object liPolypSep2: TdxLayoutLabeledItem
                      CaptionOptions.Text = 'x'
                    end
                    object liPolypD: TdxLayoutItem
                      CaptionOptions.Visible = False
                      Control = sePolypDepth1
                      ControlOptions.ShowBorder = False
                    end
                    object liPolypMM: TdxLayoutLabeledItem
                      CaptionOptions.Text = 'mm'
                    end
                  end
                  object liPolypLoc: TdxLayoutItem
                    CaptionOptions.Text = 'Location'
                    Control = cbPolypLocation1
                    ControlOptions.ShowBorder = False
                  end
                  object liVascStalk: TdxLayoutItem
                    CaptionOptions.Visible = False
                    Control = cbVascularStalk
                    ControlOptions.ShowBorder = False
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
                    Control = cbIUDCorrect
                    ControlOptions.ShowBorder = False
                  end
                  object liIUDIncorrect: TdxLayoutItem
                    CaptionOptions.Visible = False
                    Control = cbIUDIncorrect
                    ControlOptions.ShowBorder = False
                  end
                end

                object liRPOCSep: TdxLayoutSeparatorItem
                  CaptionOptions.Text = 'RPOC'
                end
                object liRPOC: TdxLayoutItem
                  CaptionOptions.Visible = False
                  Control = cbRPOC
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
                    Control = cbRPOCLocation
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
                      Control = cbRPOCSliding
                      ControlOptions.ShowBorder = False
                    end
                    object liRPOCInflam: TdxLayoutItem
                      CaptionOptions.Visible = False
                      Control = cbRPOCInflammatory
                      ControlOptions.ShowBorder = False
                    end
                  end
                end
              end
            end
          end

          object tsOvaries: TcxTabSheet
            Tag = 1
            Caption = 'Ovaries'
            ImageIndex = 0
            object sbOvaries: TcxScrollBox
              Left = 0
              Top = 0
              Width = 888
              Height = 492
              Align = alClient
              TabOrder = 0

              object BevelOvDiv: TBevel
                Left = 430
                Top = 0
                Width = 4
                Height = 700
              end

              object cxLabel70: TcxLabel
                Left = 10
                Top = 2
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

              object cxLabel71: TcxLabel
                Left = 10
                Top = 22
                Caption = 'Status'
                Transparent = True
              end
              object cbRightOvaryStatus: TcxComboBox
                Left = 55
                Top = 20
                Properties.DropDownListStyle = lsFixedList
                Properties.Items.Strings = (
                  ''
                  'identified'
                  'not identified'
                  'absent')
                TabOrder = 0
                Width = 110
              end

              object cxLabel72: TcxLabel
                Left = 10
                Top = 46
                Caption = 'Measured'
                Transparent = True
              end
              object seRightOvaryLength: TcxSpinEdit
                Left = 10
                Top = 62
                Enabled = False
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                TabOrder = 1
                Width = 30
              end
              object cxLabel73: TcxLabel
                Left = 42
                Top = 64
                Caption = 'x'
                Transparent = True
              end
              object seRightOvaryWidth: TcxSpinEdit
                Left = 53
                Top = 62
                Enabled = False
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                TabOrder = 2
                Width = 30
              end
              object cxLabel74: TcxLabel
                Left = 85
                Top = 64
                Caption = 'x'
                Transparent = True
              end
              object seRightOvaryHeight: TcxSpinEdit
                Left = 96
                Top = 62
                Enabled = False
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                TabOrder = 3
                Width = 30
              end
              object cxLabel75: TcxLabel
                Left = 128
                Top = 64
                Caption = 'mm'
                Transparent = True
              end
              object seRightOvaryCC: TcxSpinEdit
                Left = 155
                Top = 62
                Enabled = False
                Properties.AssignedValues.MinValue = True
                Properties.DisplayFormat = '#0.0'
                Properties.EditFormat = '#0.0'
                Properties.SpinButtons.Visible = False
                Properties.ValueType = vtFloat
                TabOrder = 4
                Width = 35
              end
              object cxLabel76: TcxLabel
                Left = 192
                Top = 64
                Caption = 'cc'
                Transparent = True
              end

              object cxLabel77: TcxLabel
                Left = 10
                Top = 88
                Caption = 'Appearance'
                Transparent = True
              end
              object cbRightOvaryAppearance: TcxComboBox
                Left = 80
                Top = 86
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
                TabOrder = 5
                Width = 155
              end

              object cxLabel78: TcxLabel
                Left = 10
                Top = 114
                Caption = 'AFC'
                Transparent = True
              end
              object seRightAFC: TcxSpinEdit
                Left = 40
                Top = 112
                Properties.AssignedValues.MinValue = True
                Properties.MaxValue = 50.000000000000000000
                TabOrder = 6
                Width = 35
              end

              object cxLabel79: TcxLabel
                Left = 90
                Top = 114
                Caption = 'Max follicle'
                Transparent = True
              end
              object seRightMaxFollicle: TcxSpinEdit
                Left = 160
                Top = 112
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                TabOrder = 7
                Width = 30
              end
              object cxLabel80: TcxLabel
                Left = 192
                Top = 114
                Caption = 'mm'
                Transparent = True
              end

              object BevelR1: TBevel
                Left = 5
                Top = 137
                Width = 420
                Height = 1
              end
              object cbRightCorpusLuteum: TcxCheckBox
                Left = 10
                Top = 142
                Caption = 'Corpus luteum'
                TabOrder = 8
                Transparent = True
                Width = 110
              end
              object cbRightHaemorrhagicCL: TcxCheckBox
                Left = 130
                Top = 142
                Caption = 'Haemorrhagic CL'
                TabOrder = 9
                Transparent = True
                Width = 125
              end
              object seRightHaemCLSize: TcxSpinEdit
                Left = 260
                Top = 142
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                Enabled = False
                TabOrder = 10
                Width = 30
              end
              object cxLabel81: TcxLabel
                Left = 292
                Top = 144
                Caption = 'mm'
                Transparent = True
              end
              object cbRightResolvingCL: TcxCheckBox
                Left = 320
                Top = 142
                Caption = 'Resolving CL'
                TabOrder = 11
                Transparent = True
                Width = 100
              end

              object BevelR2: TBevel
                Left = 5
                Top = 168
                Width = 420
                Height = 1
              end
              object cxLabel82: TcxLabel
                Left = 10
                Top = 175
                Caption = 'Mobility'
                Transparent = True
              end
              object cbRightMobile: TcxCheckBox
                Left = 65
                Top = 173
                Caption = 'Mobile'
                TabOrder = 12
                Transparent = True
                Width = 65
              end
              object cbRightReducedMobility: TcxCheckBox
                Left = 135
                Top = 173
                Caption = 'Reduced'
                TabOrder = 13
                Transparent = True
                Width = 75
              end
              object cbRightStuck: TcxCheckBox
                Left = 215
                Top = 173
                Caption = 'Stuck'
                TabOrder = 14
                Transparent = True
                Width = 55
              end
              object cbRightRigid: TcxCheckBox
                Left = 275
                Top = 173
                Caption = 'Rigid'
                TabOrder = 15
                Transparent = True
                Width = 55
              end
              object cxLabel83: TcxLabel
                Left = 10
                Top = 197
                Caption = 'Tender'
                Transparent = True
              end
              object cbRightTender: TcxCheckBox
                Left = 65
                Top = 195
                Caption = 'Tender'
                TabOrder = 16
                Transparent = True
                Width = 70
              end
              object cbRightNonTender: TcxCheckBox
                Left = 140
                Top = 195
                Caption = 'Non-tender'
                TabOrder = 17
                Transparent = True
                Width = 90
              end
              object cbRightAccessible: TcxCheckBox
                Left = 10
                Top = 217
                Caption = 'Accessible vaginally'
                TabOrder = 18
                Transparent = True
                Width = 140
              end

              object BevelR3: TBevel
                Left = 5
                Top = 240
                Width = 420
                Height = 1
              end
              object cbRightEchogenicFoci: TcxCheckBox
                Left = 10
                Top = 246
                Caption = 'Echogenic foci'
                TabOrder = 19
                Transparent = True
                Width = 110
              end
              object cbRightScarring: TcxCheckBox
                Left = 130
                Top = 246
                Caption = 'Scarring'
                TabOrder = 20
                Transparent = True
                Width = 75
              end

              object BevelR4: TBevel
                Left = 5
                Top = 270
                Width = 420
                Height = 1
              end
              object cbRightParaOvarianCyst: TcxCheckBox
                Left = 10
                Top = 276
                Caption = 'Para-ovarian cyst'
                TabOrder = 21
                Transparent = True
                Width = 130
              end
              object seRightParaCystLength: TcxSpinEdit
                Left = 150
                Top = 276
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                Enabled = False
                TabOrder = 22
                Width = 30
              end
              object cxLabel84: TcxLabel
                Left = 182
                Top = 278
                Caption = 'x'
                Transparent = True
              end
              object seRightParaCystWidth: TcxSpinEdit
                Left = 193
                Top = 276
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                Enabled = False
                TabOrder = 23
                Width = 30
              end
              object cxLabel85: TcxLabel
                Left = 225
                Top = 278
                Caption = 'x'
                Transparent = True
              end
              object seRightParaCystDepth: TcxSpinEdit
                Left = 236
                Top = 276
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                Enabled = False
                TabOrder = 24
                Width = 30
              end
              object cxLabel86: TcxLabel
                Left = 268
                Top = 278
                Caption = 'mm'
                Transparent = True
              end

              object cxLabel90: TcxLabel
                Left = 445
                Top = 2
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

              object cxLabel91: TcxLabel
                Left = 445
                Top = 22
                Caption = 'Status'
                Transparent = True
              end
              object cbLeftOvaryStatus: TcxComboBox
                Left = 490
                Top = 20
                Properties.DropDownListStyle = lsFixedList
                Properties.Items.Strings = (
                  ''
                  'identified'
                  'not identified'
                  'absent')
                TabOrder = 25
                Width = 110
              end

              object cxLabel92: TcxLabel
                Left = 445
                Top = 46
                Caption = 'Measured'
                Transparent = True
              end
              object seLeftOvaryLength: TcxSpinEdit
                Left = 445
                Top = 62
                Enabled = False
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                TabOrder = 26
                Width = 30
              end
              object cxLabel93: TcxLabel
                Left = 477
                Top = 64
                Caption = 'x'
                Transparent = True
              end
              object seLeftOvaryWidth: TcxSpinEdit
                Left = 488
                Top = 62
                Enabled = False
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                TabOrder = 27
                Width = 30
              end
              object cxLabel94: TcxLabel
                Left = 520
                Top = 64
                Caption = 'x'
                Transparent = True
              end
              object seLeftOvaryHeight: TcxSpinEdit
                Left = 531
                Top = 62
                Enabled = False
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                TabOrder = 28
                Width = 30
              end
              object cxLabel95: TcxLabel
                Left = 563
                Top = 64
                Caption = 'mm'
                Transparent = True
              end
              object seLeftOvaryCC: TcxSpinEdit
                Left = 590
                Top = 62
                Enabled = False
                Properties.AssignedValues.MinValue = True
                Properties.DisplayFormat = '#0.0'
                Properties.EditFormat = '#0.0'
                Properties.SpinButtons.Visible = False
                Properties.ValueType = vtFloat
                TabOrder = 29
                Width = 35
              end
              object cxLabel96: TcxLabel
                Left = 627
                Top = 64
                Caption = 'cc'
                Transparent = True
              end

              object cxLabel97: TcxLabel
                Left = 445
                Top = 88
                Caption = 'Appearance'
                Transparent = True
              end
              object cbLeftOvaryAppearance: TcxComboBox
                Left = 515
                Top = 86
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
                TabOrder = 30
                Width = 155
              end

              object cxLabel98: TcxLabel
                Left = 445
                Top = 114
                Caption = 'AFC'
                Transparent = True
              end
              object seLeftAFC: TcxSpinEdit
                Left = 475
                Top = 112
                Properties.AssignedValues.MinValue = True
                Properties.MaxValue = 50.000000000000000000
                TabOrder = 31
                Width = 35
              end

              object cxLabel99: TcxLabel
                Left = 525
                Top = 114
                Caption = 'Max follicle'
                Transparent = True
              end
              object seLeftMaxFollicle: TcxSpinEdit
                Left = 595
                Top = 112
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                TabOrder = 32
                Width = 30
              end
              object cxLabel100: TcxLabel
                Left = 627
                Top = 114
                Caption = 'mm'
                Transparent = True
              end

              object BevelAFC: TBevel
                Left = 700
                Top = 108
                Width = 1
                Height = 25
              end
              object cxLabel101: TcxLabel
                Left = 710
                Top = 114
                Caption = 'Total AFC:'
                ParentFont = False
                Style.Font.Charset = DEFAULT_CHARSET
                Style.Font.Color = clWindowText
                Style.Font.Height = -11
                Style.Font.Name = 'Tahoma'
                Style.Font.Style = [fsBold]
                Style.IsFontAssigned = True
                Transparent = True
              end
              object lblTotalAFC: TcxLabel
                Left = 775
                Top = 114
                Caption = ''
                ParentFont = False
                Style.Font.Charset = DEFAULT_CHARSET
                Style.Font.Color = clWindowText
                Style.Font.Height = -11
                Style.Font.Name = 'Tahoma'
                Style.Font.Style = [fsBold]
                Style.IsFontAssigned = True
                Transparent = True
              end

              object BevelL1: TBevel
                Left = 440
                Top = 137
                Width = 420
                Height = 1
              end
              object cbLeftCorpusLuteum: TcxCheckBox
                Left = 445
                Top = 142
                Caption = 'Corpus luteum'
                TabOrder = 33
                Transparent = True
                Width = 110
              end
              object cbLeftHaemorrhagicCL: TcxCheckBox
                Left = 565
                Top = 142
                Caption = 'Haemorrhagic CL'
                TabOrder = 34
                Transparent = True
                Width = 125
              end
              object seLeftHaemCLSize: TcxSpinEdit
                Left = 695
                Top = 142
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                Enabled = False
                TabOrder = 35
                Width = 30
              end
              object cxLabel102: TcxLabel
                Left = 727
                Top = 144
                Caption = 'mm'
                Transparent = True
              end
              object cbLeftResolvingCL: TcxCheckBox
                Left = 755
                Top = 142
                Caption = 'Resolving CL'
                TabOrder = 36
                Transparent = True
                Width = 100
              end

              object BevelL2: TBevel
                Left = 440
                Top = 168
                Width = 420
                Height = 1
              end
              object cxLabel103: TcxLabel
                Left = 445
                Top = 175
                Caption = 'Mobility'
                Transparent = True
              end
              object cbLeftMobile: TcxCheckBox
                Left = 500
                Top = 173
                Caption = 'Mobile'
                TabOrder = 37
                Transparent = True
                Width = 65
              end
              object cbLeftReducedMobility: TcxCheckBox
                Left = 570
                Top = 173
                Caption = 'Reduced'
                TabOrder = 38
                Transparent = True
                Width = 75
              end
              object cbLeftStuck: TcxCheckBox
                Left = 650
                Top = 173
                Caption = 'Stuck'
                TabOrder = 39
                Transparent = True
                Width = 55
              end
              object cbLeftRigid: TcxCheckBox
                Left = 710
                Top = 173
                Caption = 'Rigid'
                TabOrder = 40
                Transparent = True
                Width = 55
              end
              object cxLabel104: TcxLabel
                Left = 445
                Top = 197
                Caption = 'Tender'
                Transparent = True
              end
              object cbLeftTender: TcxCheckBox
                Left = 500
                Top = 195
                Caption = 'Tender'
                TabOrder = 41
                Transparent = True
                Width = 70
              end
              object cbLeftNonTender: TcxCheckBox
                Left = 575
                Top = 195
                Caption = 'Non-tender'
                TabOrder = 42
                Transparent = True
                Width = 90
              end
              object cbLeftAccessible: TcxCheckBox
                Left = 445
                Top = 217
                Caption = 'Accessible vaginally'
                TabOrder = 43
                Transparent = True
                Width = 140
              end

              object BevelL3: TBevel
                Left = 440
                Top = 240
                Width = 420
                Height = 1
              end
              object cbLeftEchogenicFoci: TcxCheckBox
                Left = 445
                Top = 246
                Caption = 'Echogenic foci'
                TabOrder = 44
                Transparent = True
                Width = 110
              end
              object cbLeftScarring: TcxCheckBox
                Left = 565
                Top = 246
                Caption = 'Scarring'
                TabOrder = 45
                Transparent = True
                Width = 75
              end

              object BevelL4: TBevel
                Left = 440
                Top = 270
                Width = 420
                Height = 1
              end
              object cbLeftParaOvarianCyst: TcxCheckBox
                Left = 445
                Top = 276
                Caption = 'Para-ovarian cyst'
                TabOrder = 46
                Transparent = True
                Width = 130
              end
              object seLeftParaCystLength: TcxSpinEdit
                Left = 585
                Top = 276
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                Enabled = False
                TabOrder = 47
                Width = 30
              end
              object cxLabel105: TcxLabel
                Left = 617
                Top = 278
                Caption = 'x'
                Transparent = True
              end
              object seLeftParaCystWidth: TcxSpinEdit
                Left = 628
                Top = 276
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                Enabled = False
                TabOrder = 48
                Width = 30
              end
              object cxLabel106: TcxLabel
                Left = 660
                Top = 278
                Caption = 'x'
                Transparent = True
              end
              object seLeftParaCystDepth: TcxSpinEdit
                Left = 671
                Top = 276
                Properties.AssignedValues.MinValue = True
                Properties.SpinButtons.Visible = False
                Enabled = False
                TabOrder = 49
                Width = 30
              end
              object cxLabel107: TcxLabel
                Left = 703
                Top = 278
                Caption = 'mm'
                Transparent = True
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

                object cxLabel110: TcxLabel
                  Left = 10
                  Top = 5
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
                object cbRightSimpleCyst: TcxCheckBox
                  Left = 10
                  Top = 25
                  Caption = 'Simple cyst'
                  TabOrder = 0
                  Transparent = True
                  Width = 90
                end
                object seRightSimpleCystL: TcxSpinEdit
                  Left = 105
                  Top = 25
                  Properties.AssignedValues.MinValue = True
                  Properties.SpinButtons.Visible = False
                  Enabled = False
                  TabOrder = 1
                  Width = 35
                end
                object cxLabelRSCx1: TcxLabel
                  Left = 142
                  Top = 27
                  Caption = 'x'
                  Transparent = True
                end
                object seRightSimpleCystW: TcxSpinEdit
                  Left = 152
                  Top = 25
                  Properties.AssignedValues.MinValue = True
                  Properties.SpinButtons.Visible = False
                  Enabled = False
                  TabOrder = 2
                  Width = 35
                end
                object cxLabelRSCx2: TcxLabel
                  Left = 189
                  Top = 27
                  Caption = 'x'
                  Transparent = True
                end
                object seRightSimpleCystD: TcxSpinEdit
                  Left = 199
                  Top = 25
                  Properties.AssignedValues.MinValue = True
                  Properties.SpinButtons.Visible = False
                  Enabled = False
                  TabOrder = 3
                  Width = 35
                end
                object cxLabel111: TcxLabel
                  Left = 236
                  Top = 27
                  Caption = 'mm'
                  Transparent = True
                end
                object cbRightEndometrioma: TcxCheckBox
                  Left = 10
                  Top = 49
                  Caption = 'Endometrioma'
                  TabOrder = 4
                  Transparent = True
                  Width = 110
                end
                object seRightEndometriomaCount: TcxSpinEdit
                  Left = 125
                  Top = 49
                  Properties.MinValue = 1.000000000000000000
                  Properties.MaxValue = 3.000000000000000000
                  Enabled = False
                  TabOrder = 5
                  Value = 1
                  Width = 35
                end
                object gbRightEndometrioma1: TcxGroupBox
                  Left = 10
                  Top = 73
                  PanelStyle.Active = True
                  Style.BorderStyle = ebsNone
                  Style.Edges = []
                  TabOrder = 6
                  Transparent = True
                  Visible = False
                  Height = 24
                  Width = 400
                  object cxLabelRE1: TcxLabel
                    Left = 0
                    Top = 3
                    Caption = '#1'
                    Transparent = True
                  end
                  object seRightEndo1L: TcxSpinEdit
                    Left = 20
                    Top = 1
                    Properties.AssignedValues.MinValue = True
                    Properties.SpinButtons.Visible = False
                    TabOrder = 0
                    Width = 35
                  end
                  object cxLabelRE1x1: TcxLabel
                    Left = 57
                    Top = 3
                    Caption = 'x'
                    Transparent = True
                  end
                  object seRightEndo1W: TcxSpinEdit
                    Left = 67
                    Top = 1
                    Properties.AssignedValues.MinValue = True
                    Properties.SpinButtons.Visible = False
                    TabOrder = 1
                    Width = 35
                  end
                  object cxLabelRE1x2: TcxLabel
                    Left = 104
                    Top = 3
                    Caption = 'x'
                    Transparent = True
                  end
                  object seRightEndo1D: TcxSpinEdit
                    Left = 114
                    Top = 1
                    Properties.AssignedValues.MinValue = True
                    Properties.SpinButtons.Visible = False
                    TabOrder = 2
                    Width = 35
                  end
                  object cxLabelRE1mm: TcxLabel
                    Left = 151
                    Top = 3
                    Caption = 'mm'
                    Transparent = True
                  end
                end
                object gbRightEndometrioma2: TcxGroupBox
                  Left = 10
                  Top = 97
                  PanelStyle.Active = True
                  Style.BorderStyle = ebsNone
                  Style.Edges = []
                  TabOrder = 7
                  Transparent = True
                  Visible = False
                  Height = 24
                  Width = 400
                  object cxLabelRE2: TcxLabel
                    Left = 0
                    Top = 3
                    Caption = '#2'
                    Transparent = True
                  end
                  object seRightEndo2L: TcxSpinEdit
                    Left = 20
                    Top = 1
                    Properties.AssignedValues.MinValue = True
                    Properties.SpinButtons.Visible = False
                    TabOrder = 0
                    Width = 35
                  end
                  object cxLabelRE2x1: TcxLabel
                    Left = 57
                    Top = 3
                    Caption = 'x'
                    Transparent = True
                  end
                  object seRightEndo2W: TcxSpinEdit
                    Left = 67
                    Top = 1
                    Properties.AssignedValues.MinValue = True
                    Properties.SpinButtons.Visible = False
                    TabOrder = 1
                    Width = 35
                  end
                  object cxLabelRE2x2: TcxLabel
                    Left = 104
                    Top = 3
                    Caption = 'x'
                    Transparent = True
                  end
                  object seRightEndo2D: TcxSpinEdit
                    Left = 114
                    Top = 1
                    Properties.AssignedValues.MinValue = True
                    Properties.SpinButtons.Visible = False
                    TabOrder = 2
                    Width = 35
                  end
                  object cxLabelRE2mm: TcxLabel
                    Left = 151
                    Top = 3
                    Caption = 'mm'
                    Transparent = True
                  end
                end
                object gbRightEndometrioma3: TcxGroupBox
                  Left = 10
                  Top = 121
                  PanelStyle.Active = True
                  Style.BorderStyle = ebsNone
                  Style.Edges = []
                  TabOrder = 8
                  Transparent = True
                  Visible = False
                  Height = 24
                  Width = 400
                  object cxLabelRE3: TcxLabel
                    Left = 0
                    Top = 3
                    Caption = '#3'
                    Transparent = True
                  end
                  object seRightEndo3L: TcxSpinEdit
                    Left = 20
                    Top = 1
                    Properties.AssignedValues.MinValue = True
                    Properties.SpinButtons.Visible = False
                    TabOrder = 0
                    Width = 35
                  end
                  object cxLabelRE3x1: TcxLabel
                    Left = 57
                    Top = 3
                    Caption = 'x'
                    Transparent = True
                  end
                  object seRightEndo3W: TcxSpinEdit
                    Left = 67
                    Top = 1
                    Properties.AssignedValues.MinValue = True
                    Properties.SpinButtons.Visible = False
                    TabOrder = 1
                    Width = 35
                  end
                  object cxLabelRE3x2: TcxLabel
                    Left = 104
                    Top = 3
                    Caption = 'x'
                    Transparent = True
                  end
                  object seRightEndo3D: TcxSpinEdit
                    Left = 114
                    Top = 1
                    Properties.AssignedValues.MinValue = True
                    Properties.SpinButtons.Visible = False
                    TabOrder = 2
                    Width = 35
                  end
                  object cxLabelRE3mm: TcxLabel
                    Left = 151
                    Top = 3
                    Caption = 'mm'
                    Transparent = True
                  end
                end
                object cbRightDermoid: TcxCheckBox
                  Left = 10
                  Top = 149
                  Caption = 'Dermoid'
                  TabOrder = 9
                  Transparent = True
                  Width = 75
                end
                object seRightDermoidL: TcxSpinEdit
                  Left = 90
                  Top = 149
                  Properties.AssignedValues.MinValue = True
                  Properties.SpinButtons.Visible = False
                  Enabled = False
                  TabOrder = 10
                  Width = 35
                end
                object cxLabelRDx1: TcxLabel
                  Left = 127
                  Top = 151
                  Caption = 'x'
                  Transparent = True
                end
                object seRightDermoidW: TcxSpinEdit
                  Left = 137
                  Top = 149
                  Properties.AssignedValues.MinValue = True
                  Properties.SpinButtons.Visible = False
                  Enabled = False
                  TabOrder = 11
                  Width = 35
                end
                object cxLabelRDx2: TcxLabel
                  Left = 174
                  Top = 151
                  Caption = 'x'
                  Transparent = True
                end
                object seRightDermoidD: TcxSpinEdit
                  Left = 184
                  Top = 149
                  Properties.AssignedValues.MinValue = True
                  Properties.SpinButtons.Visible = False
                  Enabled = False
                  TabOrder = 12
                  Width = 35
                end
                object cxLabel113: TcxLabel
                  Left = 221
                  Top = 151
                  Caption = 'mm'
                  Transparent = True
                end
                object cbRightFibroma: TcxCheckBox
                  Left = 10
                  Top = 173
                  Caption = 'Fibroma'
                  TabOrder = 13
                  Transparent = True
                  Width = 75
                end
                object seRightFibromaL: TcxSpinEdit
                  Left = 90
                  Top = 173
                  Properties.AssignedValues.MinValue = True
                  Properties.SpinButtons.Visible = False
                  Enabled = False
                  TabOrder = 14
                  Width = 35
                end
                object cxLabelRFx1: TcxLabel
                  Left = 127
                  Top = 175
                  Caption = 'x'
                  Transparent = True
                end
                object seRightFibromaW: TcxSpinEdit
                  Left = 137
                  Top = 173
                  Properties.AssignedValues.MinValue = True
                  Properties.SpinButtons.Visible = False
                  Enabled = False
                  TabOrder = 15
                  Width = 35
                end
                object cxLabelRFx2: TcxLabel
                  Left = 174
                  Top = 175
                  Caption = 'x'
                  Transparent = True
                end
                object seRightFibromaD: TcxSpinEdit
                  Left = 184
                  Top = 173
                  Properties.AssignedValues.MinValue = True
                  Properties.SpinButtons.Visible = False
                  Enabled = False
                  TabOrder = 16
                  Width = 35
                end
                object cxLabel114: TcxLabel
                  Left = 221
                  Top = 175
                  Caption = 'mm'
                  Transparent = True
                end

                object BevelOL1: TBevel
                  Left = 430
                  Top = 0
                  Width = 4
                  Height = 200
                end
                object cxLabel115: TcxLabel
                  Left = 445
                  Top = 5
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
                object cbLeftSimpleCyst: TcxCheckBox
                  Left = 445
                  Top = 25
                  Caption = 'Simple cyst'
                  TabOrder = 17
                  Transparent = True
                  Width = 90
                end
                object seLeftSimpleCystL: TcxSpinEdit
                  Left = 540
                  Top = 25
                  Properties.AssignedValues.MinValue = True
                  Properties.SpinButtons.Visible = False
                  Enabled = False
                  TabOrder = 18
                  Width = 35
                end
                object cxLabelLSCx1: TcxLabel
                  Left = 577
                  Top = 27
                  Caption = 'x'
                  Transparent = True
                end
                object seLeftSimpleCystW: TcxSpinEdit
                  Left = 587
                  Top = 25
                  Properties.AssignedValues.MinValue = True
                  Properties.SpinButtons.Visible = False
                  Enabled = False
                  TabOrder = 19
                  Width = 35
                end
                object cxLabelLSCx2: TcxLabel
                  Left = 624
                  Top = 27
                  Caption = 'x'
                  Transparent = True
                end
                object seLeftSimpleCystD: TcxSpinEdit
                  Left = 634
                  Top = 25
                  Properties.AssignedValues.MinValue = True
                  Properties.SpinButtons.Visible = False
                  Enabled = False
                  TabOrder = 20
                  Width = 35
                end
                object cxLabel116: TcxLabel
                  Left = 671
                  Top = 27
                  Caption = 'mm'
                  Transparent = True
                end
                object cbLeftEndometrioma: TcxCheckBox
                  Left = 445
                  Top = 49
                  Caption = 'Endometrioma'
                  TabOrder = 21
                  Transparent = True
                  Width = 110
                end
                object seLeftEndometriomaCount: TcxSpinEdit
                  Left = 560
                  Top = 49
                  Properties.MinValue = 1.000000000000000000
                  Properties.MaxValue = 3.000000000000000000
                  Enabled = False
                  TabOrder = 22
                  Value = 1
                  Width = 35
                end
                object gbLeftEndometrioma1: TcxGroupBox
                  Left = 445
                  Top = 73
                  PanelStyle.Active = True
                  Style.BorderStyle = ebsNone
                  Style.Edges = []
                  TabOrder = 23
                  Transparent = True
                  Visible = False
                  Height = 24
                  Width = 400
                  object cxLabelLE1: TcxLabel
                    Left = 0
                    Top = 3
                    Caption = '#1'
                    Transparent = True
                  end
                  object seLeftEndo1L: TcxSpinEdit
                    Left = 20
                    Top = 1
                    Properties.AssignedValues.MinValue = True
                    Properties.SpinButtons.Visible = False
                    TabOrder = 0
                    Width = 35
                  end
                  object cxLabelLE1x1: TcxLabel
                    Left = 57
                    Top = 3
                    Caption = 'x'
                    Transparent = True
                  end
                  object seLeftEndo1W: TcxSpinEdit
                    Left = 67
                    Top = 1
                    Properties.AssignedValues.MinValue = True
                    Properties.SpinButtons.Visible = False
                    TabOrder = 1
                    Width = 35
                  end
                  object cxLabelLE1x2: TcxLabel
                    Left = 104
                    Top = 3
                    Caption = 'x'
                    Transparent = True
                  end
                  object seLeftEndo1D: TcxSpinEdit
                    Left = 114
                    Top = 1
                    Properties.AssignedValues.MinValue = True
                    Properties.SpinButtons.Visible = False
                    TabOrder = 2
                    Width = 35
                  end
                  object cxLabelLE1mm: TcxLabel
                    Left = 151
                    Top = 3
                    Caption = 'mm'
                    Transparent = True
                  end
                end
                object gbLeftEndometrioma2: TcxGroupBox
                  Left = 445
                  Top = 97
                  PanelStyle.Active = True
                  Style.BorderStyle = ebsNone
                  Style.Edges = []
                  TabOrder = 24
                  Transparent = True
                  Visible = False
                  Height = 24
                  Width = 400
                  object cxLabelLE2: TcxLabel
                    Left = 0
                    Top = 3
                    Caption = '#2'
                    Transparent = True
                  end
                  object seLeftEndo2L: TcxSpinEdit
                    Left = 20
                    Top = 1
                    Properties.AssignedValues.MinValue = True
                    Properties.SpinButtons.Visible = False
                    TabOrder = 0
                    Width = 35
                  end
                  object cxLabelLE2x1: TcxLabel
                    Left = 57
                    Top = 3
                    Caption = 'x'
                    Transparent = True
                  end
                  object seLeftEndo2W: TcxSpinEdit
                    Left = 67
                    Top = 1
                    Properties.AssignedValues.MinValue = True
                    Properties.SpinButtons.Visible = False
                    TabOrder = 1
                    Width = 35
                  end
                  object cxLabelLE2x2: TcxLabel
                    Left = 104
                    Top = 3
                    Caption = 'x'
                    Transparent = True
                  end
                  object seLeftEndo2D: TcxSpinEdit
                    Left = 114
                    Top = 1
                    Properties.AssignedValues.MinValue = True
                    Properties.SpinButtons.Visible = False
                    TabOrder = 2
                    Width = 35
                  end
                  object cxLabelLE2mm: TcxLabel
                    Left = 151
                    Top = 3
                    Caption = 'mm'
                    Transparent = True
                  end
                end
                object gbLeftEndometrioma3: TcxGroupBox
                  Left = 445
                  Top = 121
                  PanelStyle.Active = True
                  Style.BorderStyle = ebsNone
                  Style.Edges = []
                  TabOrder = 25
                  Transparent = True
                  Visible = False
                  Height = 24
                  Width = 400
                  object cxLabelLE3: TcxLabel
                    Left = 0
                    Top = 3
                    Caption = '#3'
                    Transparent = True
                  end
                  object seLeftEndo3L: TcxSpinEdit
                    Left = 20
                    Top = 1
                    Properties.AssignedValues.MinValue = True
                    Properties.SpinButtons.Visible = False
                    TabOrder = 0
                    Width = 35
                  end
                  object cxLabelLE3x1: TcxLabel
                    Left = 57
                    Top = 3
                    Caption = 'x'
                    Transparent = True
                  end
                  object seLeftEndo3W: TcxSpinEdit
                    Left = 67
                    Top = 1
                    Properties.AssignedValues.MinValue = True
                    Properties.SpinButtons.Visible = False
                    TabOrder = 1
                    Width = 35
                  end
                  object cxLabelLE3x2: TcxLabel
                    Left = 104
                    Top = 3
                    Caption = 'x'
                    Transparent = True
                  end
                  object seLeftEndo3D: TcxSpinEdit
                    Left = 114
                    Top = 1
                    Properties.AssignedValues.MinValue = True
                    Properties.SpinButtons.Visible = False
                    TabOrder = 2
                    Width = 35
                  end
                  object cxLabelLE3mm: TcxLabel
                    Left = 151
                    Top = 3
                    Caption = 'mm'
                    Transparent = True
                  end
                end
                object cbLeftDermoid: TcxCheckBox
                  Left = 445
                  Top = 149
                  Caption = 'Dermoid'
                  TabOrder = 26
                  Transparent = True
                  Width = 75
                end
                object seLeftDermoidL: TcxSpinEdit
                  Left = 525
                  Top = 149
                  Properties.AssignedValues.MinValue = True
                  Properties.SpinButtons.Visible = False
                  Enabled = False
                  TabOrder = 27
                  Width = 35
                end
                object cxLabelLDx1: TcxLabel
                  Left = 562
                  Top = 151
                  Caption = 'x'
                  Transparent = True
                end
                object seLeftDermoidW: TcxSpinEdit
                  Left = 572
                  Top = 149
                  Properties.AssignedValues.MinValue = True
                  Properties.SpinButtons.Visible = False
                  Enabled = False
                  TabOrder = 28
                  Width = 35
                end
                object cxLabelLDx2: TcxLabel
                  Left = 609
                  Top = 151
                  Caption = 'x'
                  Transparent = True
                end
                object seLeftDermoidD: TcxSpinEdit
                  Left = 619
                  Top = 149
                  Properties.AssignedValues.MinValue = True
                  Properties.SpinButtons.Visible = False
                  Enabled = False
                  TabOrder = 29
                  Width = 35
                end
                object cxLabel118: TcxLabel
                  Left = 656
                  Top = 151
                  Caption = 'mm'
                  Transparent = True
                end
                object cbLeftFibroma: TcxCheckBox
                  Left = 445
                  Top = 173
                  Caption = 'Fibroma'
                  TabOrder = 30
                  Transparent = True
                  Width = 75
                end
                object seLeftFibromaL: TcxSpinEdit
                  Left = 525
                  Top = 173
                  Properties.AssignedValues.MinValue = True
                  Properties.SpinButtons.Visible = False
                  Enabled = False
                  TabOrder = 31
                  Width = 35
                end
                object cxLabelLFx1: TcxLabel
                  Left = 562
                  Top = 175
                  Caption = 'x'
                  Transparent = True
                end
                object seLeftFibromaW: TcxSpinEdit
                  Left = 572
                  Top = 173
                  Properties.AssignedValues.MinValue = True
                  Properties.SpinButtons.Visible = False
                  Enabled = False
                  TabOrder = 32
                  Width = 35
                end
                object cxLabelLFx2: TcxLabel
                  Left = 609
                  Top = 175
                  Caption = 'x'
                  Transparent = True
                end
                object seLeftFibromaD: TcxSpinEdit
                  Left = 619
                  Top = 173
                  Properties.AssignedValues.MinValue = True
                  Properties.SpinButtons.Visible = False
                  Enabled = False
                  TabOrder = 33
                  Width = 35
                end
                object cxLabel119: TcxLabel
                  Left = 656
                  Top = 175
                  Caption = 'mm'
                  Transparent = True
                end
              end

              object tsComplexRight: TcxTabSheet
                Caption = 'More Complex Pathology - Right'
                ImageIndex = 0
                object cxLabel130: TcxLabel
                  Left = 10
                  Top = 5
                  Caption = 'Classification'
                  Transparent = True
                end
                object cbIOTAClassRight: TcxComboBox
                  Left = 100
                  Top = 3
                  Properties.DropDownListStyle = lsFixedList
                  Properties.Items.Strings = (
                    ''
                    'unilocular'
                    'unilocular solid'
                    'multilocular'
                    'multilocular solid'
                    'solid')
                  TabOrder = 0
                  Width = 150
                end
                object cxLabel131: TcxLabel
                  Left = 10
                  Top = 31
                  Caption = 'Cyst wall smooth'
                  Transparent = True
                end
                object cbCystWallSmoothRight: TcxCheckBox
                  Left = 120
                  Top = 29
                  Caption = 'Yes'
                  TabOrder = 1
                  Transparent = True
                  Width = 45
                end
                object cxLabel132: TcxLabel
                  Left = 10
                  Top = 55
                  Caption = 'Papillary projections'
                  Transparent = True
                end
                object seRightPapillaryCount: TcxSpinEdit
                  Left = 130
                  Top = 53
                  Properties.AssignedValues.MinValue = True
                  Properties.MaxValue = 10.000000000000000000
                  TabOrder = 2
                  Width = 35
                end
                object cxLabel133: TcxLabel
                  Left = 170
                  Top = 55
                  Caption = 'Max height'
                  Transparent = True
                end
                object seRightPapillaryHeight: TcxSpinEdit
                  Left = 235
                  Top = 53
                  Properties.AssignedValues.MinValue = True
                  Properties.SpinButtons.Visible = False
                  TabOrder = 3
                  Width = 30
                end
                object cxLabel134: TcxLabel
                  Left = 267
                  Top = 55
                  Caption = 'mm'
                  Transparent = True
                end
                object cxLabel135: TcxLabel
                  Left = 10
                  Top = 81
                  Caption = 'Internal content'
                  Transparent = True
                end
                object cbInternalContentRight: TcxComboBox
                  Left = 100
                  Top = 79
                  Properties.DropDownListStyle = lsFixedList
                  Properties.Items.Strings = (
                    ''
                    'anechoic'
                    'low-level'
                    'ground glass'
                    'haemorrhagic'
                    'mixed')
                  TabOrder = 4
                  Width = 120
                end
                object cxLabel136: TcxLabel
                  Left = 10
                  Top = 107
                  Caption = 'Vascularity'
                  Transparent = True
                end
                object cbVascularityRight: TcxComboBox
                  Left = 100
                  Top = 105
                  Properties.DropDownListStyle = lsFixedList
                  Properties.Items.Strings = (
                    ''
                    'no vascularity'
                    'minimal'
                    'moderate'
                    'strong')
                  TabOrder = 5
                  Width = 120
                end
                object cbAscitesRight: TcxCheckBox
                  Left = 10
                  Top = 135
                  Caption = 'Ascites'
                  TabOrder = 6
                  Transparent = True
                  Width = 70
                end
              end

              object tsComplexLeft: TcxTabSheet
                Caption = 'More Complex Pathology - Left'
                ImageIndex = 0
                object cxLabel140: TcxLabel
                  Left = 10
                  Top = 5
                  Caption = 'Classification'
                  Transparent = True
                end
                object cbIOTAClassLeft: TcxComboBox
                  Left = 100
                  Top = 3
                  Properties.DropDownListStyle = lsFixedList
                  Properties.Items.Strings = (
                    ''
                    'unilocular'
                    'unilocular solid'
                    'multilocular'
                    'multilocular solid'
                    'solid')
                  TabOrder = 0
                  Width = 150
                end
                object cxLabel141: TcxLabel
                  Left = 10
                  Top = 31
                  Caption = 'Cyst wall smooth'
                  Transparent = True
                end
                object cbCystWallSmoothLeft: TcxCheckBox
                  Left = 120
                  Top = 29
                  Caption = 'Yes'
                  TabOrder = 1
                  Transparent = True
                  Width = 45
                end
                object cxLabel142: TcxLabel
                  Left = 10
                  Top = 55
                  Caption = 'Papillary projections'
                  Transparent = True
                end
                object seLeftPapillaryCount: TcxSpinEdit
                  Left = 130
                  Top = 53
                  Properties.AssignedValues.MinValue = True
                  Properties.MaxValue = 10.000000000000000000
                  TabOrder = 2
                  Width = 35
                end
                object cxLabel143: TcxLabel
                  Left = 170
                  Top = 55
                  Caption = 'Max height'
                  Transparent = True
                end
                object seLeftPapillaryHeight: TcxSpinEdit
                  Left = 235
                  Top = 53
                  Properties.AssignedValues.MinValue = True
                  Properties.SpinButtons.Visible = False
                  TabOrder = 3
                  Width = 30
                end
                object cxLabel144: TcxLabel
                  Left = 267
                  Top = 55
                  Caption = 'mm'
                  Transparent = True
                end
                object cxLabel145: TcxLabel
                  Left = 10
                  Top = 81
                  Caption = 'Internal content'
                  Transparent = True
                end
                object cbInternalContentLeft: TcxComboBox
                  Left = 100
                  Top = 79
                  Properties.DropDownListStyle = lsFixedList
                  Properties.Items.Strings = (
                    ''
                    'anechoic'
                    'low-level'
                    'ground glass'
                    'haemorrhagic'
                    'mixed')
                  TabOrder = 4
                  Width = 120
                end
                object cxLabel146: TcxLabel
                  Left = 10
                  Top = 107
                  Caption = 'Vascularity'
                  Transparent = True
                end
                object cbVascularityLeft: TcxComboBox
                  Left = 100
                  Top = 105
                  Properties.DropDownListStyle = lsFixedList
                  Properties.Items.Strings = (
                    ''
                    'no vascularity'
                    'minimal'
                    'moderate'
                    'strong')
                  TabOrder = 5
                  Width = 120
                end
                object cbAscitesLeft: TcxCheckBox
                  Left = 10
                  Top = 135
                  Caption = 'Ascites'
                  TabOrder = 6
                  Transparent = True
                  Width = 70
                end
              end

              object tsIOTASimpleRules: TcxTabSheet
                Caption = 'IOTA Simple Rules'
                ImageIndex = 7
                object BevelSR1: TBevel
                  Left = 240
                  Top = 5
                  Width = 2
                  Height = 200
                end
                object BevelSR2: TBevel
                  Left = 10
                  Top = 210
                  Width = 460
                  Height = 3
                end

                object cxLabel150: TcxLabel
                  Left = 10
                  Top = 5
                  Caption = 'B-features (benign)'
                  ParentFont = False
                  Style.Font.Charset = DEFAULT_CHARSET
                  Style.Font.Color = clWindowText
                  Style.Font.Height = -11
                  Style.Font.Name = 'Tahoma'
                  Style.Font.Style = [fsBold]
                  Style.IsFontAssigned = True
                  Transparent = True
                end
                object cbB1Unilocular: TcxCheckBox
                  Left = 10
                  Top = 25
                  Caption = 'B1: Unilocular'
                  TabOrder = 0
                  Transparent = True
                  Width = 180
                end
                object cbB2SolidLessThan7: TcxCheckBox
                  Left = 10
                  Top = 47
                  Caption = 'B2: Solid component <7mm'
                  TabOrder = 1
                  Transparent = True
                  Width = 220
                end
                object cbB3AcousticShadows: TcxCheckBox
                  Left = 10
                  Top = 69
                  Caption = 'B3: Acoustic shadows'
                  TabOrder = 2
                  Transparent = True
                  Width = 220
                end
                object cbB4SmoothMultilocular: TcxCheckBox
                  Left = 10
                  Top = 91
                  Caption = 'B4: Smooth multilocular <100mm'
                  TabOrder = 3
                  Transparent = True
                  Width = 220
                end
                object cbB5NoBloodFlow: TcxCheckBox
                  Left = 10
                  Top = 113
                  Caption = 'B5: No blood flow'
                  TabOrder = 4
                  Transparent = True
                  Width = 220
                end

                object cxLabel151: TcxLabel
                  Left = 255
                  Top = 5
                  Caption = 'M-features (malignant)'
                  ParentFont = False
                  Style.Font.Charset = DEFAULT_CHARSET
                  Style.Font.Color = clWindowText
                  Style.Font.Height = -11
                  Style.Font.Name = 'Tahoma'
                  Style.Font.Style = [fsBold]
                  Style.IsFontAssigned = True
                  Transparent = True
                end
                object cbM1IrregularSolid: TcxCheckBox
                  Left = 255
                  Top = 25
                  Caption = 'M1: Irregular solid tumour'
                  TabOrder = 5
                  Transparent = True
                  Width = 220
                end
                object cbM2Ascites: TcxCheckBox
                  Left = 255
                  Top = 47
                  Caption = 'M2: Ascites'
                  TabOrder = 6
                  Transparent = True
                  Width = 220
                end
                object cbM3PapillaryProjections: TcxCheckBox
                  Left = 255
                  Top = 69
                  Caption = 'M3: >=4 papillary projections'
                  TabOrder = 7
                  Transparent = True
                  Width = 220
                end
                object cbM4IrregularMultilocular: TcxCheckBox
                  Left = 255
                  Top = 91
                  Caption = 'M4: Irregular multilocular solid >=100mm'
                  TabOrder = 8
                  Transparent = True
                  Width = 270
                end
                object cbM5HighBloodFlow: TcxCheckBox
                  Left = 255
                  Top = 113
                  Caption = 'M5: Very strong blood flow'
                  TabOrder = 9
                  Transparent = True
                  Width = 220
                end

                object cxLabel152: TcxLabel
                  Left = 10
                  Top = 220
                  Caption = 'Result'
                  ParentFont = False
                  Style.Font.Charset = DEFAULT_CHARSET
                  Style.Font.Color = clWindowText
                  Style.Font.Height = -11
                  Style.Font.Name = 'Tahoma'
                  Style.Font.Style = [fsBold]
                  Style.IsFontAssigned = True
                  Transparent = True
                end
                object lblSimpleRulesResult: TcxLabel
                  Left = 50
                  Top = 220
                  Caption = ''
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

          object tsEndometriosis: TcxTabSheet
            Caption = 'Endometriosis'
            ImageIndex = 1
            object dxlcEndometriosis: TdxLayoutControl
              Left = 0
              Top = 0
              Width = 888
              Height = 492
              Align = alClient
              TabOrder = 0
              AutoSize = True
              LayoutLookAndFeel = dxLayoutSkinLookAndFeel1

              object cbBladderNodule: TcxCheckBox
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
              object cbBladderNoduleLocation: TcxComboBox
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
              object cbVaultVisualised: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Visualised'
                TabOrder = 5
                Transparent = True
                Width = 85
              end
              object cbVaultThinRegular: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Thin and regular'
                TabOrder = 6
                Transparent = True
                Width = 120
              end
              object cbVaginalNodule: TcxCheckBox
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
              object cbVagNoduleStuckTo: TcxComboBox
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
              object cbFreeFluid: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Free fluid present'
                TabOrder = 12
                Transparent = True
                Width = 130
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
              object cbPODPartialSide: TcxComboBox
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
              object cbUterusMobile: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Mobile'
                TabOrder = 18
                Transparent = True
                Width = 70
              end
              object cbUterusLimitedMobility: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Limited mobility'
                TabOrder = 19
                Transparent = True
                Width = 115
              end
              object cbUterusFixed: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Fixed'
                TabOrder = 20
                Transparent = True
                Width = 60
              end
              object cbUterusTender: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Tender'
                TabOrder = 21
                Transparent = True
                Width = 70
              end
              object cbUterusNonTender: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Non-tender'
                TabOrder = 22
                Transparent = True
                Width = 90
              end
              object cbRetroCervicalNodule: TcxCheckBox
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
              object cbGrowsIntoMyometrium: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Grows into myometrium'
                TabOrder = 27
                Transparent = True
                Width = 170
              end
              object cbRCStuckLeftOvary: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Left ovary'
                TabOrder = 28
                Transparent = True
                Width = 85
              end
              object cbRCStuckRightOvary: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Right ovary'
                TabOrder = 29
                Transparent = True
                Width = 90
              end
              object cbRCStuckBowel: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Bowel'
                TabOrder = 30
                Transparent = True
                Width = 60
              end
              object cbRCStuckBowelNodule: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Bowel nodule'
                TabOrder = 31
                Transparent = True
                Width = 100
              end
              object cbRCStuckBowelFat: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Bowel fat'
                TabOrder = 32
                Transparent = True
                Width = 80
              end
              object cbRCTender: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Tender'
                TabOrder = 33
                Transparent = True
                Width = 70
              end
              object cbRCNonTender: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Non-tender'
                TabOrder = 34
                Transparent = True
                Width = 90
              end
              object cbRCPostSurgicalScarring: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Likely post-surgical scarring'
                TabOrder = 35
                Transparent = True
                Width = 200
              end
              object cbRightUSLAppearance: TcxComboBox
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
              object cbRightUSLNodule: TcxCheckBox
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
              object cbRightUSLTender: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Tender'
                TabOrder = 41
                Transparent = True
                Width = 70
              end
              object cbRightUSLFatStranding: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Fat stranding'
                TabOrder = 42
                Transparent = True
                Width = 100
              end
              object cbLeftUSLAppearance: TcxComboBox
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
              object cbLeftUSLNodule: TcxCheckBox
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
              object cbLeftUSLTender: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Tender'
                TabOrder = 48
                Transparent = True
                Width = 70
              end
              object cbLeftUSLFatStranding: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Fat stranding'
                TabOrder = 49
                Transparent = True
                Width = 100
              end
              object cbBowelNodulePresent: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Bowel nodule present'
                TabOrder = 50
                Transparent = True
                Width = 160
              end
              object spBowelNoduleCount: TcxSpinEdit
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
              object cbBowelNod1Invasion: TcxComboBox
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
              object cbBowelNod1StuckTo: TcxComboBox
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
              object cbBowelNod2Invasion: TcxComboBox
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
              object cbBowelNod2StuckTo: TcxComboBox
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
              object cbBowelNod3Invasion: TcxComboBox
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
              object cbBowelNod3StuckTo: TcxComboBox
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
              object cbRightKidneyVisualised: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Visualised'
                TabOrder = 70
                Transparent = True
                Width = 85
              end
              object cbRightKidneyObstructed: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Obstructed'
                Enabled = False
                TabOrder = 71
                Transparent = True
                Width = 90
              end
              object cbLeftKidneyVisualised: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Visualised'
                TabOrder = 72
                Transparent = True
                Width = 85
              end
              object cbLeftKidneyObstructed: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Obstructed'
                Enabled = False
                TabOrder = 73
                Transparent = True
                Width = 90
              end

              object dxlcEndometriosisGroup_Root: TdxLayoutGroup
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
                    Control = cbBladderNodule
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
                      Control = cbBladderNoduleLocation
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
                      Control = cbVaultVisualised
                      ControlOptions.ShowBorder = False
                    end
                    object liVaultThin: TdxLayoutItem
                      CaptionOptions.Visible = False
                      Control = cbVaultThinRegular
                      ControlOptions.ShowBorder = False
                    end
                  end
                  object liVagNodule: TdxLayoutItem
                    CaptionOptions.Visible = False
                    Control = cbVaginalNodule
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
                      Control = cbVagNoduleStuckTo
                      ControlOptions.ShowBorder = False
                    end
                  end
                end

                object lgPOD: TdxLayoutGroup
                  CaptionOptions.Text = 'Pouch of Douglas'
                  CaptionOptions.Visible = True
                  ButtonOptions.Buttons = <>
                  ShowBorder = True
                  object liFreeFluid: TdxLayoutItem
                    CaptionOptions.Visible = False
                    Control = cbFreeFluid
                    ControlOptions.ShowBorder = False
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
                      Control = cbPODPartialSide
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
                      Control = cbUterusMobile
                      ControlOptions.ShowBorder = False
                    end
                    object liULimited: TdxLayoutItem
                      CaptionOptions.Visible = False
                      Control = cbUterusLimitedMobility
                      ControlOptions.ShowBorder = False
                    end
                    object liUFixed: TdxLayoutItem
                      CaptionOptions.Visible = False
                      Control = cbUterusFixed
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
                      Control = cbUterusTender
                      ControlOptions.ShowBorder = False
                    end
                    object liUNonTender: TdxLayoutItem
                      CaptionOptions.Visible = False
                      Control = cbUterusNonTender
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
                    Control = cbRetroCervicalNodule
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
                      Control = cbGrowsIntoMyometrium
                      ControlOptions.ShowBorder = False
                    end
                    object lgRCStuckTo: TdxLayoutGroup
                      CaptionOptions.Text = 'Stuck to'
                      CaptionOptions.Visible = True
                      ButtonOptions.Buttons = <>
                      LayoutDirection = ldHorizontal
                      ShowBorder = False
                      object liRCStuckLO: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = cbRCStuckLeftOvary
                        ControlOptions.ShowBorder = False
                      end
                      object liRCStuckRO: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = cbRCStuckRightOvary
                        ControlOptions.ShowBorder = False
                      end
                      object liRCStuckBowel: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = cbRCStuckBowel
                        ControlOptions.ShowBorder = False
                      end
                      object liRCStuckBN: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = cbRCStuckBowelNodule
                        ControlOptions.ShowBorder = False
                      end
                      object liRCStuckBF: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = cbRCStuckBowelFat
                        ControlOptions.ShowBorder = False
                      end
                    end
                    object lgRCTenderness: TdxLayoutGroup
                      CaptionOptions.Visible = False
                      ButtonOptions.Buttons = <>
                      LayoutDirection = ldHorizontal
                      ShowBorder = False
                      object liRCTender: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = cbRCTender
                        ControlOptions.ShowBorder = False
                      end
                      object liRCNonTender: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = cbRCNonTender
                        ControlOptions.ShowBorder = False
                      end
                    end
                    object liRCScarring: TdxLayoutItem
                      CaptionOptions.Visible = False
                      Control = cbRCPostSurgicalScarring
                      ControlOptions.ShowBorder = False
                    end
                  end
                end

                object lgUSL: TdxLayoutGroup
                  CaptionOptions.Text = 'Uterosacral Ligaments'
                  CaptionOptions.Visible = True
                  ButtonOptions.Buttons = <>
                  ShowBorder = True
                  object lgRightUSL: TdxLayoutGroup
                    CaptionOptions.Text = 'Right'
                    CaptionOptions.Visible = True
                    ButtonOptions.Buttons = <>
                    ShowBorder = False
                    object liRUSLApp: TdxLayoutItem
                      CaptionOptions.Text = 'Appearance'
                      Control = cbRightUSLAppearance
                      ControlOptions.ShowBorder = False
                    end
                    object lgRUSLNodule: TdxLayoutGroup
                      CaptionOptions.Visible = False
                      ButtonOptions.Buttons = <>
                      LayoutDirection = ldHorizontal
                      ShowBorder = False
                      object liRUSLNodule: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = cbRightUSLNodule
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
                        Control = cbRightUSLTender
                        ControlOptions.ShowBorder = False
                      end
                      object liRUSLFat: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = cbRightUSLFatStranding
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
                      Control = cbLeftUSLAppearance
                      ControlOptions.ShowBorder = False
                    end
                    object lgLUSLNodule: TdxLayoutGroup
                      CaptionOptions.Visible = False
                      ButtonOptions.Buttons = <>
                      LayoutDirection = ldHorizontal
                      ShowBorder = False
                      object liLUSLNodule: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = cbLeftUSLNodule
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
                        Control = cbLeftUSLTender
                        ControlOptions.ShowBorder = False
                      end
                      object liLUSLFat: TdxLayoutItem
                        CaptionOptions.Visible = False
                        Control = cbLeftUSLFatStranding
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
                    Control = cbBowelNodulePresent
                    ControlOptions.ShowBorder = False
                  end
                  object lgBowelDetails: TdxLayoutGroup
                    CaptionOptions.Visible = False
                    ButtonOptions.Buttons = <>
                    ShowBorder = False
                    Visible = False
                    object liBowelCount: TdxLayoutItem
                      CaptionOptions.Text = 'Count'
                      Control = spBowelNoduleCount
                      ControlOptions.ShowBorder = False
                    end
                    object lgBowelNod1: TdxLayoutGroup
                      CaptionOptions.Text = 'Nodule 1'
                      CaptionOptions.Visible = True
                      ButtonOptions.Buttons = <>
                      ShowBorder = False
                      object lgBN1Dims: TdxLayoutGroup
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
                      end
                      object liBN1Dist: TdxLayoutItem
                        CaptionOptions.Text = 'Distance from anus'
                        Control = seBowelNod1DistAnus
                        ControlOptions.ShowBorder = False
                      end
                      object liBN1Invasion: TdxLayoutItem
                        CaptionOptions.Text = 'Depth of invasion'
                        Control = cbBowelNod1Invasion
                        ControlOptions.ShowBorder = False
                      end
                      object liBN1Stuck: TdxLayoutItem
                        CaptionOptions.Text = 'Stuck to'
                        Control = cbBowelNod1StuckTo
                        ControlOptions.ShowBorder = False
                      end
                    end
                    object lgBowelNod2: TdxLayoutGroup
                      CaptionOptions.Text = 'Nodule 2'
                      CaptionOptions.Visible = True
                      ButtonOptions.Buttons = <>
                      ShowBorder = False
                      Visible = False
                      object lgBN2Dims: TdxLayoutGroup
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
                      end
                      object liBN2Dist: TdxLayoutItem
                        CaptionOptions.Text = 'Distance from prev'
                        Control = seBowelNod2DistPrev
                        ControlOptions.ShowBorder = False
                      end
                      object liBN2Invasion: TdxLayoutItem
                        CaptionOptions.Text = 'Depth of invasion'
                        Control = cbBowelNod2Invasion
                        ControlOptions.ShowBorder = False
                      end
                      object liBN2Stuck: TdxLayoutItem
                        CaptionOptions.Text = 'Stuck to'
                        Control = cbBowelNod2StuckTo
                        ControlOptions.ShowBorder = False
                      end
                    end
                    object lgBowelNod3: TdxLayoutGroup
                      CaptionOptions.Text = 'Nodule 3'
                      CaptionOptions.Visible = True
                      ButtonOptions.Buttons = <>
                      ShowBorder = False
                      Visible = False
                      object lgBN3Dims: TdxLayoutGroup
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
                      end
                      object liBN3Dist: TdxLayoutItem
                        CaptionOptions.Text = 'Distance from prev'
                        Control = seBowelNod3DistPrev
                        ControlOptions.ShowBorder = False
                      end
                      object liBN3Invasion: TdxLayoutItem
                        CaptionOptions.Text = 'Depth of invasion'
                        Control = cbBowelNod3Invasion
                        ControlOptions.ShowBorder = False
                      end
                      object liBN3Stuck: TdxLayoutItem
                        CaptionOptions.Text = 'Stuck to'
                        Control = cbBowelNod3StuckTo
                        ControlOptions.ShowBorder = False
                      end
                    end
                  end
                end

                object lgKidneys: TdxLayoutGroup
                  CaptionOptions.Text = 'Kidneys'
                  CaptionOptions.Visible = True
                  ButtonOptions.Buttons = <>
                  ShowBorder = True
                  object lgRightKidney: TdxLayoutGroup
                    CaptionOptions.Text = 'Right Kidney'
                    CaptionOptions.Visible = True
                    ButtonOptions.Buttons = <>
                    LayoutDirection = ldHorizontal
                    ShowBorder = False
                    object liRKVis: TdxLayoutItem
                      CaptionOptions.Visible = False
                      Control = cbRightKidneyVisualised
                      ControlOptions.ShowBorder = False
                    end
                    object liRKObs: TdxLayoutItem
                      CaptionOptions.Visible = False
                      Control = cbRightKidneyObstructed
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
                      Control = cbLeftKidneyVisualised
                      ControlOptions.ShowBorder = False
                    end
                    object liLKObs: TdxLayoutItem
                      CaptionOptions.Visible = False
                      Control = cbLeftKidneyObstructed
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
            object dxlcProcedures: TdxLayoutControl
              Left = 0
              Top = 0
              Width = 888
              Height = 492
              Align = alClient
              TabOrder = 0
              AutoSize = True
              LayoutLookAndFeel = dxLayoutSkinLookAndFeel1

              object cbSHGPerformed: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Performed'
                TabOrder = 0
                Transparent = True
                Width = 85
              end
              object cbSHGFindings: TcxComboBox
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
              object cbTubalPatencyPerformed: TcxCheckBox
                Left = 10000
                Top = 10000
                Caption = 'Performed'
                TabOrder = 2
                Transparent = True
                Width = 85
              end
              object cbEnhancementMethod: TcxComboBox
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

              object dxlcProceduresGroup_Root: TdxLayoutGroup
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
                    Control = cbSHGPerformed
                    ControlOptions.ShowBorder = False
                  end
                  object lgSHGDetails: TdxLayoutGroup
                    CaptionOptions.Visible = False
                    ButtonOptions.Buttons = <>
                    ShowBorder = False
                    Visible = False
                    object liSHGFindings: TdxLayoutItem
                      CaptionOptions.Text = 'Findings'
                      Control = cbSHGFindings
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
                    Control = cbTubalPatencyPerformed
                    ControlOptions.ShowBorder = False
                  end
                  object lgTubalDetails: TdxLayoutGroup
                    CaptionOptions.Visible = False
                    ButtonOptions.Buttons = <>
                    ShowBorder = False
                    Visible = False
                    object liEnhancement: TdxLayoutItem
                      CaptionOptions.Text = 'Enhancement method'
                      Control = cbEnhancementMethod
                      ControlOptions.ShowBorder = False
                    end
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
