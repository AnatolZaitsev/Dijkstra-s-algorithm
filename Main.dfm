object FormMain: TFormMain
  Left = 206
  Top = 159
  Width = 690
  Height = 395
  Caption = 'Dijkstra'#8217's algorithm'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object LabelGraph: TLabel
    Left = 256
    Top = 24
    Width = 113
    Height = 13
    Caption = #1052#1072#1090#1088#1080#1094#1072' '#1089#1084#1077#1078#1085#1086#1089#1090#1080':  '
  end
  object Label2: TLabel
    Left = 16
    Top = 184
    Width = 96
    Height = 13
    Caption = #1048#1089#1093#1086#1076#1085#1072#1103' '#1074#1077#1088#1096#1080#1085#1072
  end
  object Label1: TLabel
    Left = 552
    Top = 24
    Width = 64
    Height = 13
    Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090':   '
  end
  object Label3: TLabel
    Left = 16
    Top = 32
    Width = 109
    Height = 13
    Caption = #1050#1086#1083'-'#1074#1086' '#1074#1077#1088#1096#1080#1085' '#1075#1088#1072#1092#1072
  end
  object StringGrid1: TStringGrid
    Left = 144
    Top = 48
    Width = 337
    Height = 265
    FixedCols = 0
    FixedRows = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    TabOrder = 0
  end
  object EditTop: TEdit
    Left = 40
    Top = 208
    Width = 49
    Height = 21
    ImeName = 'Russian'
    TabOrder = 1
  end
  object ListBox1: TListBox
    Left = 528
    Top = 48
    Width = 121
    Height = 265
    ImeName = 'Russian'
    ItemHeight = 13
    TabOrder = 2
  end
  object ButtonGo: TButton
    Left = 24
    Top = 248
    Width = 81
    Height = 25
    Caption = 'Go'
    TabOrder = 3
    OnClick = ButtonGoClick
  end
  object ButtonCount: TButton
    Left = 24
    Top = 96
    Width = 83
    Height = 25
    Caption = 'Ok'
    TabOrder = 4
    OnClick = ButtonCountClick
  end
  object EditCount: TEdit
    Left = 40
    Top = 56
    Width = 49
    Height = 21
    ImeName = 'Russian'
    TabOrder = 5
  end
  object ButtonGrid: TButton
    Left = 280
    Top = 320
    Width = 75
    Height = 25
    Caption = #1047#1072#1087#1086#1083#1085#1080#1090#1100
    TabOrder = 6
    OnClick = ButtonGridClick
  end
end
