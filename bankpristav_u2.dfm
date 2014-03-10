object Form2: TForm2
  Left = 247
  Top = 119
  Width = 870
  Height = 640
  Caption = #1057#1086#1079#1076#1072#1085#1080#1077' '#1086#1090#1074#1077#1090#1072
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
  object mmo1: TMemo
    Left = 0
    Top = 0
    Width = 865
    Height = 281
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Fixedsys'
    Font.Style = []
    Lines.Strings = (
      'mmo1')
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
    WordWrap = False
  end
  object mmo2: TMemo
    Left = 0
    Top = 536
    Width = 865
    Height = 53
    Align = alBottom
    Lines.Strings = (
      'mmo2')
    TabOrder = 1
  end
  object dbgrd1: TDBGrid
    Left = -8
    Top = 280
    Width = 873
    Height = 73
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object btn1: TButton
    Left = 720
    Top = 344
    Width = 75
    Height = 25
    Caption = 'btn1'
    TabOrder = 3
    OnClick = btn1Click
  end
  object dbgrd2: TDBGrid
    Left = -16
    Top = 416
    Width = 873
    Height = 80
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
end
