object Form20: TForm20
  Left = 0
  Top = 0
  Caption = #1057#1087#1080#1089#1086#1082' '#1083#1102#1076#1077#1081' '#1076#1083#1103' '#1092#1080#1083#1100#1084#1072
  ClientHeight = 288
  ClientWidth = 410
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnResize = FormResize
  OnShow = FormShow
  DesignSize = (
    410
    288)
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 16
    Top = 8
    Width = 377
    Height = 225
    Anchors = [akLeft, akTop, akRight, akBottom]
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
        FieldName = 'WPID'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'FNAME'
        Title.Caption = #1060#1080#1083#1100#1084
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PNAME'
        Title.Caption = #1060#1048#1054
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NAME'
        Title.Caption = #1056#1086#1083#1100
        Width = 200
        Visible = True
      end>
  end
  object Button1: TButton
    Left = 16
    Top = 250
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    TabOrder = 1
    OnClick = Button1Click
  end
  object IBQuery1: TIBQuery
    Database = Form1.IBDatabase1
    Transaction = Form1.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select wp.WPID,f.Name as fname, p.Name as pname,tp.Name'
      'from WORKSPEOPLE as wp'
      'inner join film as f on f.FID = wp.FID'
      'inner join PEOPLE as p on p.PID = wp.PID'
      'inner join TYPEPEOPLE as tp on tp.TPID = wp.TPID')
    Left = 272
    Top = 240
  end
  object DataSource1: TDataSource
    DataSet = IBQuery1
    Left = 304
    Top = 240
  end
end
