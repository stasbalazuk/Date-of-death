object Form1: TForm1
  Left = 842
  Top = 243
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1044#1072#1090#1072' '#1057#1084#1077#1088#1090#1080
  ClientHeight = 274
  ClientWidth = 223
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object grp1: TGroupBox
    Left = 8
    Top = 8
    Width = 209
    Height = 217
    Caption = #1059#1082#1072#1078#1080#1090#1077' '#1076#1072#1090#1091' '#1088#1086#1078#1076#1077#1085#1080#1103':'
    TabOrder = 0
    object cal1: TMonthCalendar
      Left = 8
      Top = 16
      Width = 191
      Height = 160
      Date = 43248.830588518520000000
      TabOrder = 0
      OnClick = cal1Click
    end
    object btn1: TButton
      Left = 23
      Top = 182
      Width = 162
      Height = 25
      Caption = #1059#1079#1085#1072#1090#1100' '#1076#1072#1090#1091
      TabOrder = 1
      OnClick = btn1Click
    end
  end
  object grp2: TGroupBox
    Left = 0
    Top = 220
    Width = 223
    Height = 54
    Align = alBottom
    Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090
    TabOrder = 1
    object lst1: TListBox
      Left = 2
      Top = 15
      Width = 219
      Height = 37
      Align = alClient
      ItemHeight = 13
      TabOrder = 0
    end
  end
end
