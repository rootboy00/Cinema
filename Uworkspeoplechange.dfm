object Form21: TForm21
  Left = 0
  Top = 0
  Caption = 'Form20'
  ClientHeight = 302
  ClientWidth = 364
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
    Top = 8
    Width = 108
    Height = 19
    Caption = #1042#1099#1073#1077#1088#1080' '#1092#1080#1083#1100#1084
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 24
    Top = 63
    Width = 135
    Height = 19
    Caption = #1042#1099#1073#1077#1088#1080' '#1095#1077#1083#1086#1074#1077#1074#1082#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 24
    Top = 119
    Width = 95
    Height = 19
    Caption = #1042#1099#1073#1077#1088#1080' '#1088#1086#1083#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 24
    Top = 32
    Width = 145
    Height = 21
    KeyField = 'FID'
    ListField = 'NAME'
    ListSource = DataSource1
    TabOrder = 0
  end
  object DBLookupComboBox2: TDBLookupComboBox
    Left = 24
    Top = 88
    Width = 145
    Height = 21
    KeyField = 'PID'
    ListField = 'NAME'
    ListSource = DataSource2
    TabOrder = 1
  end
  object DBLookupComboBox3: TDBLookupComboBox
    Left = 24
    Top = 144
    Width = 145
    Height = 21
    KeyField = 'TPID'
    ListField = 'NAME'
    ListSource = DataSource3
    TabOrder = 2
  end
  object Button1: TButton
    Left = 179
    Top = 84
    Width = 118
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1063#1077#1083#1086#1074#1077#1082#1072
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 179
    Top = 139
    Width = 118
    Height = 26
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1088#1086#1083#1100
    TabOrder = 4
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 179
    Top = 32
    Width = 118
    Height = 21
    Caption = #1054#1073#1085#1086#1074#1080#1090#1100
    TabOrder = 5
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 24
    Top = 200
    Width = 118
    Height = 53
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    TabOrder = 6
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 179
    Top = 200
    Width = 118
    Height = 53
    Caption = #1059#1076#1072#1083#1080#1090#1100
    TabOrder = 7
  end
  object IBTable1: TIBTable
    Database = Form1.IBDatabase1
    Transaction = Form1.IBTransaction1
    FieldDefs = <
      item
        Name = 'FID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'CID'
        DataType = ftInteger
      end
      item
        Name = 'GID'
        DataType = ftInteger
      end
      item
        Name = 'NAME'
        DataType = ftWideString
        Size = 100
      end
      item
        Name = 'AGELIMIT'
        DataType = ftInteger
      end
      item
        Name = 'START_DATE'
        DataType = ftDate
      end
      item
        Name = 'END_DATE'
        DataType = ftDate
      end
      item
        Name = 'TIMING'
        DataType = ftInteger
      end
      item
        Name = 'DESCRIPTION'
        DataType = ftWideString
        Size = 500
      end
      item
        Name = 'IMAGE_NAME'
        DataType = ftWideString
        Size = 100
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY9'
        Fields = 'FID'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'RDB$FOREIGN20'
        Fields = 'CID'
      end
      item
        Name = 'RDB$FOREIGN21'
        Fields = 'GID'
      end>
    StoreDefs = True
    TableName = 'FILM'
    Top = 336
  end
  object DataSource1: TDataSource
    DataSet = IBTable1
    Left = 24
    Top = 336
  end
  object IBTable2: TIBTable
    Database = Form1.IBDatabase1
    Transaction = Form1.IBTransaction1
    FieldDefs = <
      item
        Name = 'PID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'CID'
        DataType = ftInteger
      end
      item
        Name = 'NAME'
        DataType = ftString
        Size = 100
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY9'
        Fields = 'FID'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'RDB$FOREIGN20'
        Fields = 'CID'
      end
      item
        Name = 'RDB$FOREIGN21'
        Fields = 'GID'
      end>
    StoreDefs = True
    TableName = 'PEOPLE'
    Left = 80
    Top = 336
  end
  object DataSource2: TDataSource
    DataSet = IBTable2
    Left = 104
    Top = 336
  end
  object IBTable3: TIBTable
    Database = Form1.IBDatabase1
    Transaction = Form1.IBTransaction1
    FieldDefs = <
      item
        Name = 'TPID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'NAME'
        DataType = ftString
        Size = 50
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY9'
        Fields = 'FID'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'RDB$FOREIGN20'
        Fields = 'CID'
      end
      item
        Name = 'RDB$FOREIGN21'
        Fields = 'GID'
      end>
    StoreDefs = True
    TableName = 'TYPEPEOPLE'
    Left = 144
    Top = 336
  end
  object DataSource3: TDataSource
    DataSet = IBTable3
    Left = 168
    Top = 336
  end
  object IBQuery1: TIBQuery
    Database = Form1.IBDatabase1
    Transaction = Form1.IBTransaction1
    Left = 224
    Top = 336
  end
end
