object Form3: TForm3
  Left = 257
  Top = 190
  BorderStyle = bsDialog
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
  ClientHeight = 362
  ClientWidth = 560
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
  object btn1: TButton
    Left = 336
    Top = 312
    Width = 75
    Height = 25
    Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
    ModalResult = 1
    TabOrder = 0
  end
  object ListBox1: TListBox
    Left = 16
    Top = 24
    Width = 153
    Height = 281
    ItemHeight = 13
    MultiSelect = True
    TabOrder = 1
  end
  object ListBox2: TListBox
    Left = 272
    Top = 24
    Width = 153
    Height = 281
    ItemHeight = 13
    MultiSelect = True
    TabOrder = 2
  end
  object BitBtn1: TBitBtn
    Left = 184
    Top = 144
    Width = 75
    Height = 25
    Caption = 'BitBtn1'
    TabOrder = 3
    OnClick = BitBtn1Click
  end
  object dlgOpen1: TOpenDialog
    Left = 96
    Top = 320
  end
end
