object Form13: TForm13
  Left = 0
  Top = 0
  Caption = 'Form13'
  ClientHeight = 551
  ClientWidth = 536
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 10
    Top = 10
    Width = 500
    Height = 400
    TabOrder = 0
    object PaintBox1: TPaintBox
      Left = 72
      Top = 0
      Width = 105
      Height = 105
      OnPaint = PaintBox1Paint
    end
  end
  object Panel2: TPanel
    Left = 10
    Top = 410
    Width = 500
    Height = 133
    TabOrder = 1
    object Label1: TLabel
      Left = 184
      Top = 0
      Width = 122
      Height = 19
      Caption = #1047#1072#1082#1072#1079#1072#1085#1099#1077' '#1084#1077#1089#1090#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Button1: TButton
      Left = 8
      Top = 96
      Width = 81
      Height = 33
      Caption = #1047#1072#1082#1072#1079#1072#1090#1100
      TabOrder = 0
      OnClick = Button1Click
    end
    object Memo1: TMemo
      Left = 184
      Top = 16
      Width = 129
      Height = 113
      TabOrder = 1
    end
  end
  object ibquery1: TIBQuery
    Database = Form1.IBDatabase1
    Transaction = Form1.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 432
    Top = 552
  end
end
