object Form6: TForm6
  Left = 0
  Top = 0
  Caption = 'Form6'
  ClientHeight = 390
  ClientWidth = 718
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 8
    Top = 40
    Width = 681
    Height = 273
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
        FieldName = 'FID'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'CID'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'GID'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'NAME2'
        Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1060#1080#1083#1100#1084#1072
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NAME'
        Title.Caption = #1057#1090#1088#1072#1085#1072
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NAME1'
        Title.Caption = #1046#1072#1085#1088
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AGELIMIT'
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'START_DATE'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'END_DATE'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIMING'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRIPTION'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IMAGE_NAME'
        Width = 70
        Visible = True
      end>
  end
  object Button1: TButton
    Left = 8
    Top = 336
    Width = 81
    Height = 33
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    TabOrder = 1
    OnClick = Button1Click
  end
  object IBDataSet1: TIBDataSet
    Database = Form1.IBDatabase1
    Transaction = Form1.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SelectSQL.Strings = (
      
        'select FID,Film.CID,Film.GID,Country.Name,Genre.Name,Film.Name,A' +
        'gelimit,Start_Date,End_Date,Timing,Description,Image_Name '
      'from FILM'
      'inner join Country on (Country.CID = Film.CID)'
      'inner join genre on ( Genre.GID = Film.GID )')
    ParamCheck = True
    UniDirectional = False
    Active = True
    Left = 680
    Top = 152
  end
  object DataSource1: TDataSource
    DataSet = IBDataSet1
    Left = 680
    Top = 192
  end
end
