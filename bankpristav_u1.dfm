object Form1: TForm1
  Left = 221
  Top = 95
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
  object lbl1: TLabel
    Left = 88
    Top = 40
    Width = 157
    Height = 13
    Caption = #1042#1093#1086#1076#1103#1097#1080#1077' /'#1080#1089#1093#1086#1076#1103#1097#1080#1077' '#1087#1072#1082#1077#1090#1099
  end
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
    object btn3: TButton
      Left = 23
      Top = 2
      Width = 75
      Height = 22
      Caption = 'btn3'
      TabOrder = 0
      OnClick = btn3Click
    end
  end
  object dbgrd1: TDBGrid
    Left = 0
    Top = 29
    Width = 878
    Height = 420
    Align = alTop
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object btn2: TButton
    Left = 304
    Top = 0
    Width = 75
    Height = 25
    Caption = 'btn2'
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
    Left = 424
    Top = 0
    Width = 75
    Height = 25
    Caption = 'btn4'
    TabOrder = 4
    OnClick = btn4Click
  end
  object mm1: TMainMenu
    Left = 312
    Top = 32
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
end
