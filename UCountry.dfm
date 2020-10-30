object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 299
  ClientWidth = 408
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
  object DBGrid1: TDBGrid
    Left = 8
    Top = 3
    Width = 385
    Height = 249
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = DBGrid1CellClick
  end
  object Button1: TButton
    Left = 8
    Top = 258
    Width = 121
    Height = 33
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1053#1086#1074#1091#1102
    TabOrder = 1
    OnClick = Button1Click
  end
  object DataSource1: TDataSource
    DataSet = IBDataSet1
    Left = 336
    Top = 256
  end
  object IBDataSet1: TIBDataSet
    Database = Form1.IBDatabase1
    Transaction = Form1.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SelectSQL.Strings = (
      'select * from COUNTRY')
    ParamCheck = True
    UniDirectional = False
    Active = True
    Left = 296
    Top = 256
  end
  object IBQuery1: TIBQuery
    Database = Form1.IBDatabase1
    Transaction = Form1.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 216
    Top = 256
  end
end
