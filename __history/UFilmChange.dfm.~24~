object Form7: TForm7
  Left = 0
  Top = 0
  Caption = 'Form7'
  ClientHeight = 410
  ClientWidth = 603
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
  object Image1: TImage
    Left = 426
    Top = 21
    Width = 169
    Height = 169
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
    Left = 24
    Top = 72
    Width = 186
    Height = 21
    KeyField = 'CID'
    ListField = 'NAME'
    ListSource = DataSource1
    TabOrder = 1
  end
  object DBLookupComboBox2: TDBLookupComboBox
    Left = 24
    Top = 112
    Width = 186
    Height = 21
    KeyField = 'GID'
    ListField = 'NAME'
    ListSource = DataSource2
    TabOrder = 2
  end
  object Description: TEdit
    Left = 240
    Top = 21
    Width = 145
    Height = 169
    AutoSize = False
    TabOrder = 3
    Text = 'Description'
  end
  object Age_Limit: TEdit
    Left = 24
    Top = 157
    Width = 81
    Height = 21
    NumbersOnly = True
    TabOrder = 4
    Text = 'Age Limit'
  end
  object DateTimePicker1: TDateTimePicker
    Left = 240
    Top = 264
    Width = 186
    Height = 21
    Date = 44134.000000000000000000
    Time = 44134.000000000000000000
    TabOrder = 5
  end
  object DateTimePicker2: TDateTimePicker
    Left = 24
    Top = 264
    Width = 186
    Height = 21
    Date = 44134.000000000000000000
    Time = 44134.000000000000000000
    TabOrder = 6
  end
  object Timing: TEdit
    Left = 24
    Top = 205
    Width = 121
    Height = 21
    NumbersOnly = True
    TabOrder = 7
    Text = 'timing'
  end
  object Button2: TButton
    Left = 24
    Top = 328
    Width = 91
    Height = 49
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    TabOrder = 8
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 160
    Top = 328
    Width = 91
    Height = 49
    Caption = #1059#1076#1072#1083#1080#1090#1100
    TabOrder = 9
    Visible = False
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 426
    Top = 196
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
    Left = 128
    Top = 336
  end
  object IBTable1: TIBTable
    Database = Form1.IBDatabase1
    Transaction = Form1.IBTransaction1
    Active = True
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
    Left = 24
    Top = 64
  end
  object IBTable2: TIBTable
    Database = Form1.IBDatabase1
    Transaction = Form1.IBTransaction1
    Active = True
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
    Left = 112
    Top = 104
  end
  object DataSource1: TDataSource
    DataSet = IBTable1
    Left = 64
    Top = 64
  end
  object DataSource2: TDataSource
    DataSet = IBTable2
    Left = 152
    Top = 104
  end
end
