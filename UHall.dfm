object Form8: TForm8
  Left = 0
  Top = 0
  Caption = #1047#1072#1083
  ClientHeight = 265
  ClientWidth = 507
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
  object Button1: TButton
    Left = 8
    Top = 199
    Width = 75
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    TabOrder = 0
    OnClick = Button1Click
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 8
    Width = 481
    Height = 161
    DataSource = DataSource1
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = DBGrid1CellClick
    Columns = <
      item
        Expanded = False
        FieldName = 'HID'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'NAME'
        Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ROW_COUNT'
        Title.Caption = #1050#1086#1083'-'#1074#1086' '#1057#1090#1088#1086#1082
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COL_COUNT'
        Title.Caption = #1050#1086#1083'-'#1074#1086' '#1057#1090#1086#1083#1073#1094#1086#1074
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRIPTION'
        Title.Caption = #1054#1087#1080#1089#1072#1085#1080#1077
        Width = 250
        Visible = True
      end>
  end
  object DataSource1: TDataSource
    DataSet = IBDataSet1
    Left = 120
    Top = 192
  end
  object IBDataSet1: TIBDataSet
    Database = Form1.IBDatabase1
    Transaction = Form1.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SelectSQL.Strings = (
      'select * from Hall')
    ParamCheck = True
    UniDirectional = False
    Left = 160
    Top = 192
  end
end
