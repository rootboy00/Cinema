object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 299
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object ComboBox1: TComboBox
    Left = 544
    Top = 270
    Width = 83
    Height = 21
    ItemIndex = 0
    TabOrder = 0
    Text = 'Home'
    OnChange = ComboBox1Change
    Items.Strings = (
      'Home'
      'College')
  end
  object Button1: TButton
    Left = 64
    Top = 96
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 1
    OnClick = Button1Click
  end
  object IBDatabase1: TIBDatabase
    DatabaseName = 'X:\db\Home_Base.IB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey'
      'lc_ctype=WIN1251')
    LoginPrompt = False
    ServerType = 'IBServer'
    Left = 600
  end
  object MainMenu1: TMainMenu
    Left = 600
    Top = 48
    object N1: TMenuItem
      Caption = 'Insert'
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
    object test11: TMenuItem
      Caption = 'Select'
    end
    object test21: TMenuItem
      Caption = 'Update'
    end
  end
  object IBTransaction1: TIBTransaction
    DefaultDatabase = IBDatabase1
    Left = 568
  end
end