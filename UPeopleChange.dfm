object Form11: TForm11
  Left = 0
  Top = 0
  Caption = 'Form11'
  ClientHeight = 324
  ClientWidth = 470
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 24
    Width = 31
    Height = 13
    Caption = 'Label1'
  end
  object Label2: TLabel
    Left = 16
    Top = 96
    Width = 76
    Height = 13
    Caption = #1042#1099#1073#1077#1088#1080' '#1089#1090#1088#1072#1085#1091
    WordWrap = True
  end
  object Label3: TLabel
    Left = 264
    Top = 24
    Width = 176
    Height = 19
    Caption = #1044#1083#1103' '#1076#1086#1073#1072#1074#1083#1077#1085#1080#1103' '#1089#1090#1088#1072#1085#1099
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 15
    Top = 128
    Width = 171
    Height = 21
    KeyField = 'CID'
    ListField = 'NAME'
    ListSource = DataSource1
    TabOrder = 0
  end
  object Edit1: TEdit
    Left = 16
    Top = 56
    Width = 171
    Height = 21
    TabOrder = 1
    Text = 'Edit1'
  end
  object Button1: TButton
    Left = 16
    Top = 176
    Width = 75
    Height = 25
    Caption = #1048#1079#1084#1077#1085#1080#1090#1100
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 112
    Top = 176
    Width = 75
    Height = 25
    Caption = #1059#1076#1072#1083#1080#1090#1100
    TabOrder = 3
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 264
    Top = 54
    Width = 105
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    TabOrder = 4
    OnClick = Button3Click
  end
  object IBQuery1: TIBQuery
    Database = Form1.IBDatabase1
    Transaction = Form1.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 152
    Top = 8
  end
  object DataSource1: TDataSource
    DataSet = IBTable1
    Left = 136
    Top = 120
  end
  object IBTable1: TIBTable
    Database = Form1.IBDatabase1
    Transaction = Form1.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'CID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'NAME'
        DataType = ftWideString
        Size = 100
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY8'
        Fields = 'CID'
        Options = [ixPrimary, ixUnique]
      end>
    StoreDefs = True
    TableName = 'COUNTRY'
    UniDirectional = False
    Left = 168
    Top = 120
  end
end
