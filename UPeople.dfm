object Form10: TForm10
  Left = 0
  Top = 0
  Caption = #1051#1102#1076#1080
  ClientHeight = 358
  ClientWidth = 532
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
    532
    358)
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 8
    Top = 8
    Width = 505
    Height = 273
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
        FieldName = 'PID'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'CID'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'NAME1'
        Title.Caption = #1060#1048#1054
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NAME'
        Title.Caption = #1057#1090#1088#1072#1085#1072
        Width = 250
        Visible = True
      end>
  end
  object Button1: TButton
    Left = 8
    Top = 304
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
      'select p.PID,p.CID,c.Name,P.Name'
      'from People as p'
      'inner join Country as c on ( c.CID = P.CID  )')
    Left = 168
    Top = 296
  end
  object DataSource1: TDataSource
    DataSet = IBQuery1
    Left = 120
    Top = 296
  end
end
