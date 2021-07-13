object Form2: TForm2
  Left = 0
  Top = 0
  Caption = #1057#1090#1088#1072#1085#1099
  ClientHeight = 404
  ClientWidth = 408
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
    408
    404)
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 8
    Top = 35
    Width = 385
    Height = 249
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
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
        FieldName = 'CID'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'NAME'
        Title.Caption = #1057#1090#1088#1072#1085#1072
        Visible = True
      end>
  end
  object Button1: TButton
    Left = 8
    Top = 298
    Width = 121
    Height = 33
    Anchors = [akLeft, akBottom]
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1053#1086#1074#1091#1102
    TabOrder = 1
    OnClick = Button1Click
  end
  object ComboBox1: TComboBox
    Left = 312
    Top = 8
    Width = 81
    Height = 21
    ItemIndex = 0
    TabOrder = 2
    Text = #1055#1086' '#1076#1072#1090#1077
    OnChange = ComboBox1Change
    Items.Strings = (
      #1055#1086' '#1076#1072#1090#1077
      #1055#1086' '#1080#1084#1077#1085#1080)
  end
  object DataSource1: TDataSource
    DataSet = IBQuery1
    Left = 64
    Top = 352
  end
  object IBQuery1: TIBQuery
    Database = Form1.IBDatabase1
    Transaction = Form1.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 16
    Top = 352
  end
end
