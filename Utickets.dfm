object Form16: TForm16
  Left = 0
  Top = 0
  Caption = 'Ticketks'
  ClientHeight = 299
  ClientWidth = 635
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
    Left = 16
    Top = 8
    Width = 521
    Height = 225
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'TID'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'NAME'
        Title.Caption = #1060#1080#1083#1100#1084
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SDATE'
        Title.Caption = #1044#1072#1090#1072
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'STIME'
        Title.Caption = #1042#1088#1077#1084#1103
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PLCOL'
        Title.Caption = #1056#1103#1076
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PLROW'
        Title.Caption = #1052#1077#1089#1090#1086
        Visible = True
      end>
  end
  object Button1: TButton
    Left = 16
    Top = 256
    Width = 75
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    TabOrder = 1
    OnClick = Button1Click
  end
  object DataSource1: TDataSource
    DataSet = IBDataSet1
    Left = 248
    Top = 240
  end
  object IBDataSet1: TIBDataSet
    Database = Form1.IBDatabase1
    Transaction = Form1.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SelectSQL.Strings = (
      'select t.TID,f.name,s.sdate,s.stime, p.PLROW,p.PLCOL'
      'from TICKETS as t'
      'inner join SESSION as s on (s.SID = t.TID)'
      'inner join film as f on (s.fid = f.fid)'
      'inner join  place as p on (p.plid = t.plid)')
    ParamCheck = True
    UniDirectional = False
    Left = 192
    Top = 240
  end
end
