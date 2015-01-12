object Form1: TForm1
  Left = 365
  Top = 103
  Width = 886
  Height = 565
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
  ShowHint = True
  OnClose = FormClose
  OnResize = FormResize
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
    Top = 80
    Width = 861
    Height = 225
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    PopupMenu = pm1
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = dbgrd1CellClick
    OnDblClick = dbgrd1DblClick
  end
  object btn2: TButton
    Left = 552
    Top = 336
    Width = 211
    Height = 25
    Caption = #1058#1077#1089#1090' '#1080' '#1079#1072#1075#1088#1091#1079#1082#1072' '#1089#1087#1080#1089#1082#1072' '#1092#1072#1081#1083#1086#1074
    TabOrder = 2
    OnClick = btn2Click
  end
  object mmo1: TMemo
    Left = 0
    Top = 447
    Width = 878
    Height = 64
    Align = alBottom
    TabOrder = 3
  end
  object CheckBox1: TCheckBox
    Left = 8
    Top = 40
    Width = 97
    Height = 17
    Caption = #1054#1073#1088#1072#1073#1086#1090#1072#1085
    TabOrder = 4
    OnClick = CheckBox1Click
  end
  object btn3: TButton
    Left = 136
    Top = 376
    Width = 225
    Height = 25
    Caption = #1058#1077#1089#1090' '#1089#1086#1079#1076#1072#1085#1080#1103' '#1086#1090#1074#1077#1090#1072' '#1044#1041#1060
    Enabled = False
    TabOrder = 5
    OnClick = btn3Click
  end
  object btn5: TButton
    Left = 552
    Top = 368
    Width = 75
    Height = 25
    Caption = #1058#1077#1089#1090' '#1044#1041#1060
    TabOrder = 6
    Visible = False
    OnClick = btn5Click
  end
  object chklst1: TCheckListBox
    Left = 0
    Top = 312
    Width = 121
    Height = 97
    ItemHeight = 13
    Items.Strings = (
      '1')
    TabOrder = 7
  end
  object btn6: TBitBtn
    Left = 128
    Top = 312
    Width = 233
    Height = 25
    Caption = #1057#1087#1080#1089#1086#1082' '#1087#1072#1082#1077#1090#1086#1074
    TabOrder = 8
    OnClick = btn6Click
  end
  object btn7: TBitBtn
    Left = 232
    Top = 344
    Width = 129
    Height = 25
    Hint = #1055#1088#1086#1074#1077#1088#1103#1077#1090' '#1075#1086#1090#1086#1074' '#1083#1080' '#1087#1072#1082#1077#1090' '#1082' '#1074#1099#1075#1088#1091#1079#1082#1077' '#1080' '#1074#1099#1075#1088#1091#1078#1077#1085' '#1083#1080' '#1086#1085
    Caption = #1055#1088#1086#1074#1077#1088#1082#1072' '#1075#1086#1090#1086#1074#1085#1086#1089#1090#1080
    Enabled = False
    TabOrder = 9
    OnClick = btn7Click
  end
  object CheckBox2: TCheckBox
    Left = 128
    Top = 344
    Width = 97
    Height = 16
    Hint = #1056#1072#1079#1088#1077#1096#1080#1090#1100' '#1074#1099#1075#1088#1091#1078#1072#1090#1100' '#1086#1090#1074#1077#1090#1099' '#1087#1086' '#1074#1099#1075#1088#1091#1078#1077#1085#1085#1099#1084
    Caption = #1042#1099#1075#1088#1091#1078#1077#1085#1085#1099#1077
    TabOrder = 10
  end
  object edt1: TEdit
    Left = 96
    Top = 40
    Width = 121
    Height = 21
    ReadOnly = True
    TabOrder = 11
    Text = 'FIOORG'
  end
  object btn4: TBitBtn
    Left = 224
    Top = 40
    Width = 75
    Height = 25
    Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072
    TabOrder = 12
    OnClick = btn4Click
  end
  object dbedt1: TDBEdit
    Left = 312
    Top = 40
    Width = 273
    Height = 21
    Hint = #1044#1074#1086#1081#1085#1086#1081' '#1097#1077#1083#1095#1086#1082' '#1089#1082#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1074' '#1073#1091#1092#1077#1088' '#1086#1073#1084#1077#1085#1072
    ReadOnly = True
    TabOrder = 13
    OnDblClick = dbedt1DblClick
  end
  object edt2: TEdit
    Left = 592
    Top = 40
    Width = 161
    Height = 21
    TabOrder = 14
  end
  object btn8: TBitBtn
    Left = 760
    Top = 40
    Width = 113
    Height = 25
    Caption = #1048#1089#1082#1072#1090#1100' '#1087#1086' '#1092#1072#1084#1080#1083#1080#1080
    TabOrder = 15
    OnClick = btn8Click
  end
  object mm1: TMainMenu
    Left = 584
    Top = 65528
    object N1: TMenuItem
      Caption = #1060#1072#1081#1083
      object N2: TMenuItem
        Caption = #1042#1099#1093#1086#1076
        OnClick = N2Click
      end
    end
    object N3: TMenuItem
      Caption = #1055#1088#1072#1074#1082#1072
      object N4: TMenuItem
        Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
        Enabled = False
        OnClick = N4Click
      end
    end
    object N5: TMenuItem
      Caption = #1057#1087#1088#1072#1074#1082#1072
    end
  end
  object pm1: TPopupMenu
    Left = 544
    object test1: TMenuItem
      Caption = 'test'
      OnClick = test1Click
    end
  end
end
