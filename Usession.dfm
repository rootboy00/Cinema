object Form14: TForm14
  Left = 0
  Top = 0
  Caption = 'Form14'
  ClientHeight = 272
  ClientWidth = 516
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
    Top = 8
    Width = 489
    Height = 217
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = DBGrid1CellClick
    Columns = <
      item
        Expanded = False
        FieldName = 'SID'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'NAME'
        Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1060#1080#1083#1100#1084#1072
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NAME1'
        Title.Caption = #1047#1072#1083
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'STIME'
        Title.Caption = #1042#1088#1077#1084#1103' '#1053#1072#1095#1072#1083#1072
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SDATE'
        Title.Caption = #1044#1072#1090#1072' '#1053#1072#1095#1072#1083#1072
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRICE'
        Title.Caption = #1062#1077#1085#1072
        Width = 35
        Visible = True
      end>
  end
  object Button1: TButton
    Left = 8
    Top = 231
    Width = 137
    Height = 34
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1053#1086#1074#1091#1102
    TabOrder = 1
    OnClick = Button1Click
  end
  object IBDataSet1: TIBDataSet
    Database = Form1.IBDatabase1
    Transaction = Form1.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SelectSQL.Strings = (
      'select SID,Film.Name,HALL.Name,STIME,SDATE,PRICE   from session'
      'inner join FILM on (FILM.FID = Session.FID )'
      'inner join HALL on (HALL.HID = SESSION.HID)')
    ParamCheck = True
    UniDirectional = False
    Left = 216
    Top = 232
  end
  object DataSource1: TDataSource
    DataSet = IBDataSet1
    Left = 160
    Top = 232
  end
end
