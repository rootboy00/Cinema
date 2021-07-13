object Form7: TForm7
  Left = 0
  Top = 0
  Caption = 'Form7'
  ClientHeight = 366
  ClientWidth = 603
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
  object Image1: TImage
    Left = 426
    Top = 33
    Width = 169
    Height = 169
  end
  object Label1: TLabel
    Left = 24
    Top = 3
    Width = 75
    Height = 19
    Caption = #1042#1074#1077#1076#1080' '#1080#1084#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 20
    Top = 67
    Width = 109
    Height = 19
    Caption = #1042#1099#1073#1077#1088#1080' '#1089#1090#1088#1072#1085#1091
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 20
    Top = 135
    Width = 98
    Height = 19
    Caption = #1042#1099#1073#1077#1088#1080' '#1078#1072#1085#1088
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 24
    Top = 188
    Width = 182
    Height = 19
    Caption = #1042#1086#1079#1088#1072#1089#1090#1085#1086#1077' '#1086#1075#1088#1072#1085#1080#1095#1077#1085#1080#1077
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 24
    Top = 240
    Width = 164
    Height = 19
    Caption = #1044#1083#1080#1090#1077#1083#1100#1085#1086#1089#1090#1100' '#1092#1080#1083#1100#1084#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 20
    Top = 291
    Width = 108
    Height = 19
    Caption = #1042#1088#1077#1084#1103' '#1087#1088#1086#1082#1072#1090#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label7: TLabel
    Left = 240
    Top = 8
    Width = 71
    Height = 19
    Caption = #1054#1087#1080#1089#1072#1085#1080#1077
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label8: TLabel
    Left = 426
    Top = 8
    Width = 69
    Height = 19
    Caption = #1050#1072#1088#1090#1080#1085#1082#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Name: TEdit
    Left = 24
    Top = 21
    Width = 186
    Height = 21
    TabOrder = 0
    Text = 'Name'
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 20
    Top = 92
    Width = 186
    Height = 21
    KeyField = 'CID'
    ListField = 'NAME'
    ListSource = DataSource1
    TabOrder = 1
  end
  object DBLookupComboBox2: TDBLookupComboBox
    Left = 24
    Top = 160
    Width = 186
    Height = 21
    KeyField = 'GID'
    ListField = 'NAME'
    ListSource = DataSource2
    TabOrder = 2
  end
  object Description: TEdit
    Left = 240
    Top = 33
    Width = 145
    Height = 169
    AutoSize = False
    TabOrder = 3
    Text = 'Description'
  end
  object Age_Limit: TEdit
    Left = 24
    Top = 213
    Width = 81
    Height = 21
    TabOrder = 4
    Text = 'Age Limit'
  end
  object DateTimePicker1: TDateTimePicker
    Left = 24
    Top = 339
    Width = 186
    Height = 21
    Date = 44134.000000000000000000
    Time = 44134.000000000000000000
    TabOrder = 5
  end
  object DateTimePicker2: TDateTimePicker
    Left = 24
    Top = 312
    Width = 186
    Height = 21
    Date = 44134.000000000000000000
    Time = 44134.000000000000000000
    TabOrder = 6
  end
  object Timing: TEdit
    Left = 24
    Top = 264
    Width = 121
    Height = 21
    TabOrder = 7
    Text = 'timing'
  end
  object Button2: TButton
    Left = 294
    Top = 311
    Width = 91
    Height = 49
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    TabOrder = 8
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 426
    Top = 311
    Width = 91
    Height = 49
    Caption = #1059#1076#1072#1083#1080#1090#1100
    TabOrder = 9
    Visible = False
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 426
    Top = 212
    Width = 47
    Height = 24
    Caption = '...'
    TabOrder = 10
    OnClick = Button4Click
  end
  object IBQuery1: TIBQuery
    Database = Form1.IBDatabase1
    Transaction = Form1.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 520
    Top = 232
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
        DataType = ftString
        Size = 100
      end>
    IndexDefs = <
      item
        Name = 'PK_COUNTRY'
        Fields = 'CID'
        Options = [ixUnique]
      end>
    StoreDefs = True
    TableName = 'COUNTRY'
    UniDirectional = False
    Left = 208
    Top = 216
  end
  object IBTable2: TIBTable
    Database = Form1.IBDatabase1
    Transaction = Form1.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'GID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'NAME'
        DataType = ftWideString
        Size = 50
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY12'
        Fields = 'GID'
        Options = [ixPrimary, ixUnique]
      end>
    StoreDefs = True
    TableName = 'GENRE'
    UniDirectional = False
    Left = 208
    Top = 256
  end
  object DataSource1: TDataSource
    DataSet = IBTable1
    Left = 240
    Top = 216
  end
  object DataSource2: TDataSource
    DataSet = IBTable2
    Left = 240
    Top = 256
  end
end
