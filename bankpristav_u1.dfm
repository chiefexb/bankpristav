object Form1: TForm1
  Left = 350
  Top = 140
  Width = 886
  Height = 572
  Caption = #1041#1072#1085#1082' '#1055#1088#1080#1089#1090#1072#1074
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = mm1
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbl2: TLabel
    Left = 16
    Top = 232
    Width = 43
    Height = 13
    Caption = #1047#1072#1087#1088#1086#1089#1099
  end
  object tlb1: TToolBar
    Left = 0
    Top = 0
    Width = 878
    Height = 29
    Caption = 'tlb1'
    TabOrder = 0
    object btn1: TToolButton
      Left = 0
      Top = 2
      Caption = 'btn1'
      ImageIndex = 0
    end
  end
  object dbgrd1: TDBGrid
    Left = 0
    Top = 64
    Width = 861
    Height = 264
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    PopupMenu = pm1
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = dbgrd1DblClick
  end
  object btn2: TButton
    Left = 552
    Top = 344
    Width = 211
    Height = 25
    Caption = #1058#1077#1089#1090' '#1079#1072#1075#1088#1091#1079#1082#1080' '#1089#1087#1080#1089#1082#1072' '#1092#1072#1081#1083#1086#1074
    TabOrder = 2
    OnClick = btn2Click
  end
  object mmo1: TMemo
    Left = 0
    Top = 454
    Width = 878
    Height = 64
    Align = alBottom
    TabOrder = 3
  end
  object btn4: TButton
    Left = 784
    Top = 344
    Width = 75
    Height = 25
    Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100
    TabOrder = 4
    OnClick = btn4Click
  end
  object CheckBox1: TCheckBox
    Left = 8
    Top = 40
    Width = 97
    Height = 17
    Caption = #1054#1073#1088#1072#1073#1086#1090#1072#1085
    TabOrder = 5
    OnClick = CheckBox1Click
  end
  object btn3: TButton
    Left = 144
    Top = 400
    Width = 179
    Height = 25
    Caption = #1058#1077#1089#1090' '#1089#1086#1079#1076#1072#1085#1080#1103' '#1086#1090#1074#1077#1090#1072' '#1044#1041#1060
    TabOrder = 6
    OnClick = btn3Click
  end
  object btn5: TButton
    Left = 600
    Top = 392
    Width = 75
    Height = 25
    Caption = #1058#1077#1089#1090' '#1044#1041#1060
    TabOrder = 7
    OnClick = btn5Click
  end
  object chklst1: TCheckListBox
    Left = 0
    Top = 336
    Width = 121
    Height = 97
    ItemHeight = 13
    Items.Strings = (
      '1')
    TabOrder = 8
  end
  object btn6: TBitBtn
    Left = 144
    Top = 336
    Width = 113
    Height = 25
    Caption = #1057#1087#1080#1089#1086#1082' '#1087#1072#1082#1077#1090#1086#1074
    TabOrder = 9
    OnClick = btn6Click
  end
  object btn7: TBitBtn
    Left = 144
    Top = 368
    Width = 129
    Height = 25
    Caption = #1055#1088#1086#1074#1077#1088#1082#1072' '#1075#1086#1090#1086#1074#1085#1086#1089#1090#1080
    TabOrder = 10
    OnClick = btn7Click
  end
  object mm1: TMainMenu
    Left = 696
    Top = 8
    object N1: TMenuItem
      Caption = #1060#1072#1081#1083
      object N2: TMenuItem
        Caption = #1042#1099#1093#1086#1076
      end
    end
    object N3: TMenuItem
      Caption = #1055#1088#1072#1074#1082#1072
      object N4: TMenuItem
        Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
        OnClick = N4Click
      end
    end
    object N5: TMenuItem
      Caption = #1057#1087#1088#1072#1074#1082#1072
    end
  end
  object pm1: TPopupMenu
    Left = 640
    Top = 8
    object test1: TMenuItem
      Caption = 'test'
      OnClick = test1Click
    end
  end
end
