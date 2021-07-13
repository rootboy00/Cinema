object Form12: TForm12
  Left = 0
  Top = 0
  Caption = 'Form12'
  ClientHeight = 361
  ClientWidth = 257
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 72
    Width = 52
    Height = 19
    Caption = #1042#1099#1089#1086#1090#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 119
    Top = 72
    Width = 58
    Height = 19
    Caption = #1064#1080#1088#1080#1085#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 24
    Top = 8
    Width = 86
    Height = 19
    Caption = #1042#1099#1073#1077#1088#1080' '#1047#1072#1083
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Edit1: TEdit
    Left = 24
    Top = 97
    Width = 59
    Height = 21
    TabOrder = 0
    Text = 'Edit1'
  end
  object Edit2: TEdit
    Left = 125
    Top = 97
    Width = 52
    Height = 21
    TabOrder = 1
    Text = 'Edit1'
  end
  object Memo1: TMemo
    Left = 24
    Top = 124
    Width = 153
    Height = 184
    Lines.Strings = (
      'Memo1')
    TabOrder = 2
  end
  object Button2: TButton
    Left = 144
    Top = 8
    Width = 90
    Height = 19
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1079#1072#1083
    TabOrder = 3
    OnClick = Button2Click
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 24
    Top = 33
    Width = 153
    Height = 21
    KeyField = 'HID'
    ListField = 'NAME'
    ListSource = DataSource1
    TabOrder = 4
    OnClick = DBLookupComboBox1Click
  end
  object Button3: TButton
    Left = 24
    Top = 322
    Width = 73
    Height = 31
    Caption = #1055#1077#1088#1077#1087#1080#1089#1072#1090#1100
    TabOrder = 5
    OnClick = Button3Click
  end
  object DataSource1: TDataSource
    DataSet = IBQuery1
    Left = 51
    Top = 440
  end
  object IBQuery1: TIBQuery
    Database = Form1.IBDatabase1
    Transaction = Form1.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select HID,NAME,"ROW_COUNT","COL_COUNT"  from HALL')
    Left = 19
    Top = 440
  end
  object IBQuery2: TIBQuery
    Database = Form1.IBDatabase1
    Transaction = Form1.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 123
    Top = 440
  end
end
