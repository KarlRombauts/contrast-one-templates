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
        #include "screen/patient-details.dfm"
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
                    #include "screen/fetus-general.dfm"
                    #include "screen/anatomy.dfm"
                    #include "screen/placenta-liquor.dfm"
                  end
                end
              end
            end
            #include "screen/maternal.dfm"
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
end
