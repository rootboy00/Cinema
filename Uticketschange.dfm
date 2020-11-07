object Form17: TForm17
  Left = 0
  Top = 0
  Caption = 'TicketChange'
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
  object Label1: TLabel
    Left = 312
    Top = 36
    Width = 108
    Height = 19
    Caption = #1042#1099#1073#1077#1088#1080' '#1092#1080#1083#1100#1084
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 32
    Top = 61
    Width = 233
    Height = 21
    KeyField = 'TID'
    ListField = 'F_1'
    ListSource = DataSource1
    TabOrder = 0
  end
  object DBComboBox1: TDBComboBox
    Left = 312
    Top = 61
    Width = 145
    Height = 21
    TabOrder = 1
  end
  object DataSource1: TDataSource
    DataSet = IBDataSet1
    Left = 32
  end
  object IBDataSet1: TIBDataSet
    Database = Form1.IBDatabase1
    Transaction = Form1.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SelectSQL.Strings = (
      
        'select TID,F.NAME || '#39' '#39' || H.NAME || '#39' '#39' || S.STIME || '#39' '#39' || S' +
        '.SDATE'
      'from Tickets as t'
      'inner join session as s on (s.sid = t.sid)'
      'inner join film as f on (f.fid = s.fid)'
      'inner join hall as h on (h.hid = s.hid)')
    ParamCheck = True
    UniDirectional = False
  end
end
