object Form22: TForm22
  Left = 0
  Top = 0
  Caption = 'Form22'
  ClientHeight = 519
  ClientWidth = 595
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  DesignSize = (
    595
    519)
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 16
    Top = 260
    Width = 63
    Height = 24
    Caption = #1057#1077#1089#1089#1080#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Image1: TImage
    Left = 386
    Top = 70
    Width = 169
    Height = 166
    Anchors = [akLeft, akTop, akRight]
  end
  object Label3: TLabel
    Left = 8
    Top = 8
    Width = 88
    Height = 24
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 8
    Top = 65
    Width = 65
    Height = 24
    Caption = #1057#1090#1088#1072#1085#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 8
    Top = 122
    Width = 51
    Height = 24
    Caption = #1046#1072#1085#1088
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 8
    Top = 179
    Width = 127
    Height = 24
    Caption = #1044#1083#1080#1090#1077#1083#1100#1085#1086#1089#1090#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object DBGrid2: TDBGrid
    Left = 8
    Top = 290
    Width = 320
    Height = 209
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = DBGrid2CellClick
    Columns = <
      item
        Expanded = False
        FieldName = 'SID'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'HID'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'NAME'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'STIME'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SDATE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRICE'
        Width = 40
        Visible = True
      end>
  end
  object Memo1: TMemo
    Left = 176
    Top = 71
    Width = 185
    Height = 166
    Lines.Strings = (
      'Memo1')
    ReadOnly = True
    TabOrder = 1
  end
  object Edit2: TEdit
    Left = 8
    Top = 95
    Width = 121
    Height = 21
    ReadOnly = True
    TabOrder = 2
    Text = 'Edit2'
  end
  object Edit3: TEdit
    Left = 8
    Top = 152
    Width = 121
    Height = 21
    ReadOnly = True
    TabOrder = 3
    Text = 'Edit3'
  end
  object Edit4: TEdit
    Left = 8
    Top = 38
    Width = 121
    Height = 21
    ReadOnly = True
    TabOrder = 4
    Text = 'Edit4'
  end
  object Edit6: TEdit
    Left = 8
    Top = 209
    Width = 121
    Height = 21
    ReadOnly = True
    TabOrder = 5
    Text = 'Edit6'
  end
  object IBQuery1: TIBQuery
    Database = Form1.IBDatabase1
    Transaction = Form1.IBTransaction1
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select SID,h.hid,h.name,s.stime,s.sdate,price '
      'from session as s '
      'Inner join HALL as h on (h.HID = s.HID) ')
    Left = 440
    Top = 344
  end
  object DataSource1: TDataSource
    DataSet = IBQuery1
    Left = 400
    Top = 344
  end
end
