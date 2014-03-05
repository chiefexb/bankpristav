object Form3: TForm3
  Left = 353
  Top = 174
  BorderStyle = bsDialog
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
  ClientHeight = 417
  ClientWidth = 876
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 8
    Width = 126
    Height = 13
    Caption = #1055#1091#1090#1100' '#1082' '#1087#1072#1087#1082#1077' '#1074#1093#1086#1076#1103#1097#1080#1093':'
  end
  object Label2: TLabel
    Left = 16
    Top = 48
    Width = 165
    Height = 13
    Caption = #1055#1091#1090#1100' '#1082' '#1087#1072#1087#1082#1077' '#1072#1088#1093#1080#1074#1072' '#1074#1093#1086#1076#1103#1097#1080#1093':'
  end
  object btn1: TButton
    Left = 792
    Top = 384
    Width = 75
    Height = 25
    Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
    ModalResult = 1
    TabOrder = 0
  end
  object dbedtINPATH: TDBEdit
    Left = 8
    Top = 24
    Width = 369
    Height = 21
    Hint = #1044#1074#1086#1081#1085#1086#1081' '#1097#1077#1083#1095#1086#1082' '#1076#1083#1103' '#1074#1099#1073#1086#1088#1072' '#1087#1072#1087#1082#1080
    DataField = 'INPATH'
    DataSource = DM.ds3
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnDblClick = dbedtINPATHDblClick
  end
  object dbedtINARCPATH: TDBEdit
    Left = 8
    Top = 64
    Width = 369
    Height = 21
    DataField = 'INARCPATH'
    DataSource = DM.ds3
    TabOrder = 2
    OnDblClick = dbedtINARCPATHDblClick
  end
  object dlgOpen1: TOpenDialog
    Left = 808
    Top = 336
  end
end
