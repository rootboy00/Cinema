object Form1: TForm1
  Left = 0
  Top = 0
  Caption = #1043#1083#1072#1074#1085#1072#1103' '#1060#1086#1088#1084#1072
  ClientHeight = 342
  ClientWidth = 473
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  DesignSize = (
    473
    342)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 74
    Height = 24
    Caption = #1060#1080#1083#1100#1084#1099
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 73
    Width = 145
    Height = 209
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DataSource1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
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
        FieldName = 'NAME'
        Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077
        Width = 110
        Visible = True
      end>
  end
  object Edit1: TEdit
    Left = 8
    Top = 46
    Width = 145
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    OnChange = Edit1Change
  end
  object IBDatabase1: TIBDatabase
    DatabaseName = 'H:\Delphi\HomeWork\sql\HOME_BASE_SHOW.IB'
    Params.Strings = (
      'user_name=sysdba'
      'password=masterkey')
    LoginPrompt = False
    ServerType = 'IBServer'
    Left = 304
    Top = 8
  end
  object MainMenu1: TMainMenu
    Left = 368
    Top = 8
    object N1: TMenuItem
      Caption = 'Database'
      object Country1: TMenuItem
        Caption = 'Country'
        OnClick = Country1Click
      end
      object Fil1: TMenuItem
        Caption = 'Film'
        OnClick = Fil1Click
      end
      object Genre1: TMenuItem
        Caption = 'Genre'
        OnClick = Genre1Click
      end
      object Hall1: TMenuItem
        Caption = 'Hall'
        OnClick = Hall1Click
      end
      object People1: TMenuItem
        Caption = 'People'
        OnClick = People1Click
      end
      object Place1: TMenuItem
        Caption = 'Place'
        OnClick = Place1Click
      end
      object Session1: TMenuItem
        Caption = 'Session'
        OnClick = Session1Click
      end
      object ickets1: TMenuItem
        Caption = 'Tickets'
        OnClick = ickets1Click
      end
      object typepeople1: TMenuItem
        Caption = 'typepeople'
        OnClick = typepeople1Click
      end
      object workspeople1: TMenuItem
        Caption = 'workspeople'
        OnClick = workspeople1Click
      end
    end
  end
  object IBTransaction1: TIBTransaction
    DefaultDatabase = IBDatabase1
    Left = 336
    Top = 8
  end
  object IBQuery1: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select FID, NAME from FILM')
    Left = 24
    Top = 296
  end
  object DataSource1: TDataSource
    DataSet = IBQuery1
    Left = 64
    Top = 296
  end
end
