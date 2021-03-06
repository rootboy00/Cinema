object Form15: TForm15
  Left = 0
  Top = 0
  Caption = 'Session Change'
  ClientHeight = 376
  ClientWidth = 327
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
    Left = 40
    Top = 140
    Width = 100
    Height = 19
    Caption = #1042#1088#1077#1084#1103' '#1085#1072#1095#1072#1083#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 40
    Top = 20
    Width = 108
    Height = 19
    Caption = #1042#1099#1073#1077#1088#1080' '#1060#1080#1083#1100#1084
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 40
    Top = 80
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
  object Label4: TLabel
    Left = 40
    Top = 260
    Width = 104
    Height = 19
    Caption = #1062#1077#1085#1072' '#1079#1072' '#1073#1080#1083#1077#1090
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 40
    Top = 200
    Width = 91
    Height = 19
    Caption = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 40
    Top = 40
    Width = 209
    Height = 21
    KeyField = 'FID'
    ListField = 'NAME'
    ListSource = DataSource1
    TabOrder = 0
  end
  object Button1: TButton
    Left = 40
    Top = 320
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 174
    Top = 320
    Width = 75
    Height = 25
    Caption = 'Button2'
    TabOrder = 2
    OnClick = Button2Click
  end
  object DBLookupComboBox2: TDBLookupComboBox
    Left = 40
    Top = 100
    Width = 209
    Height = 21
    KeyField = 'HID'
    ListField = 'NAME'
    ListSource = DataSource2
    TabOrder = 3
  end
  object Edit1: TEdit
    Left = 40
    Top = 280
    Width = 209
    Height = 21
    TabOrder = 4
    Text = 'Edit1'
  end
  object DateTimePicker1: TDateTimePicker
    Left = 40
    Top = 220
    Width = 209
    Height = 21
    Date = 44137.000000000000000000
    Format = 'dd:MM:yyyy'
    Time = 0.043090277780720500
    TabOrder = 5
  end
  object MaskEdit1: TMaskEdit
    Left = 40
    Top = 159
    Width = 209
    Height = 21
    EditMask = '!90:00;1;_'
    MaxLength = 5
    TabOrder = 6
    Text = '  :  '
  end
  object IBQuery1: TIBQuery
    Database = Form1.IBDatabase1
    Transaction = Form1.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 264
  end
  object IBTable1: TIBTable
    Database = Form1.IBDatabase1
    Transaction = Form1.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
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
    UniDirectional = False
    Top = 256
  end
  object IBTable2: TIBTable
    Database = Form1.IBDatabase1
    Transaction = Form1.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'HID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'NAME'
        DataType = ftWideString
        Size = 100
      end
      item
        Name = 'DESCRIPTION'
        DataType = ftWideString
        Size = 200
      end
      item
        Name = 'ROW_COUNT'
        DataType = ftInteger
      end
      item
        Name = 'COL_COUNT'
        DataType = ftInteger
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY13'
        Fields = 'HID'
        Options = [ixPrimary, ixUnique]
      end>
    StoreDefs = True
    TableName = 'HALL'
    UniDirectional = False
    Left = 264
    Top = 240
  end
  object DataSource1: TDataSource
    DataSet = IBTable1
    Top = 288
  end
  object DataSource2: TDataSource
    DataSet = IBTable2
    Left = 264
    Top = 272
  end
  object DataSource3: TDataSource
    DataSet = IBQuery2
    Left = 696
    Top = 208
  end
  object IBQuery2: TIBQuery
    Database = Form1.IBDatabase1
    Transaction = Form1.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 696
    Top = 168
  end
end
