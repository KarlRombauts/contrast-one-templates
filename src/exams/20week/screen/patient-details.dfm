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
