object Form4: TForm4
  Left = 0
  Top = 0
  Caption = #1060#1080#1083#1100#1084
  ClientHeight = 243
  ClientWidth = 746
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
    746
    243)
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 8
    Top = 8
    Width = 729
    Height = 145
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
        FieldName = 'FID'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'NAME2'
        Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077
        Width = 70
        Visible = True
      end
      item
        Alignment = taRightJustify
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
        Title.Caption = #1042#1086#1079#1088'. '#1054#1075#1088'.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'START_DATE'
        Title.Caption = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'END_DATE'
        Title.Caption = #1044#1072#1090#1072' '#1050#1086#1085#1094#1072
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIMING'
        Title.Caption = #1044#1083#1080#1090#1077#1083#1100#1085#1086#1089#1090#1100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IMAGE_NAME'
        Title.Caption = #1050#1072#1088#1090#1080#1085#1082#1072
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRIPTION'
        Title.Caption = #1054#1087#1080#1089#1072#1085#1080#1077
        Width = 150
        Visible = True
      end>
  end
  object Button1: TButton
    Left = 8
    Top = 192
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
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
      
        'select FID,Country.Name,Genre.Name,Film.Name,Agelimit,Start_Date' +
        ',End_Date,Timing,Description,Image_Name'
      'from FILM'
      'inner join Country on (Country.CID = Film.CID)'
      'inner join genre on ( Genre.GID = Film.GID )')
    ParamCheck = True
    UniDirectional = False
    Left = 112
    Top = 176
  end
  object DataSource1: TDataSource
    DataSet = IBDataSet1
    Left = 160
    Top = 176
  end
end
