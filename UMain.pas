unit UMain;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics,  Forms,
  Dialogs, StdCtrls, IBDatabase, Menus, DB, Controls;

type
  TForm1 = class(TForm)
    ComboBox1: TComboBox;
    IBDatabase1: TIBDatabase;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    test11: TMenuItem;
    Country1: TMenuItem;
    Fil1: TMenuItem;
    Genre1: TMenuItem;
    Hall1: TMenuItem;
    People1: TMenuItem;
    Place1: TMenuItem;
    Session1: TMenuItem;
    ickets1: TMenuItem;
    typepeople1: TMenuItem;
    workspeople1: TMenuItem;
    IBTransaction1: TIBTransaction;
    Button1: TButton;
    N11: TMenuItem;
    procedure ComboBox1Change(Sender: TObject);
    procedure Country1Click(Sender: TObject);
    procedure Genre1Click(Sender: TObject);
    procedure Fil1Click(Sender: TObject);
    procedure Hall1Click(Sender: TObject);
    procedure People1Click(Sender: TObject);
    procedure Place1Click(Sender: TObject);
    procedure Session1Click(Sender: TObject);
    procedure ickets1Click(Sender: TObject);
    procedure typepeople1Click(Sender: TObject);
    procedure workspeople1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure test11Click(Sender: TObject);
  private
    { Private declarations }
  public
  end;

var

  Form1: TForm1;

implementation

uses UCountry, UGenre, Ufilm, Uhall, Upeople, Uplace, Usession, Utickets,
  Utypepeople, Uworkspeople;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  IBTransaction1.Commit;
  IBTransaction1.StartTransaction;

end;

procedure TForm1.ComboBox1Change(Sender: TObject);
begin

  IBDatabase1.Connected := false;
  case (ComboBox1.ItemIndex) of
    0:
      begin
        IBDatabase1.Params.Clear;
        IBDatabase1.DatabaseName := 'X:\db\Home_base.ib';
        IBDatabase1.Params.Add('password=masterkey');
        IBDatabase1.Params.Add('user_name=SYSDBA');
        IBDatabase1.Params.Add('lc_ctype=WIN1251');
      end;
    1:
      begin
        IBDatabase1.Params.Clear;

        IBDatabase1.Params.Add('password=edu-759');
        IBDatabase1.Params.Add('user_name=student');
        IBDatabase1.Params.Add('lc_ctype=WIN1251');
      end;
  end;

  try
    IBDatabase1.Connected := true;
  finally
    if (IBDatabase1.Connected) then
      ShowMessage('������');
  end;

end;

procedure TForm1.Country1Click(Sender: TObject);
begin
  UCountry.Form2.Show;
end;

procedure TForm1.Fil1Click(Sender: TObject);
begin
  Ufilm.Form4.Show;

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  UMain.Form1.Show;
  ibdatabase1.Connected:= true;
end;

procedure TForm1.Genre1Click(Sender: TObject);
begin
  UGenre.Genre.Show;
end;

procedure TForm1.Hall1Click(Sender: TObject);
begin
  Uhall.Form8.Show;
end;

procedure TForm1.ickets1Click(Sender: TObject);
begin
  Utickets.Form16.Show;
end;

procedure TForm1.People1Click(Sender: TObject);
begin
  Upeople.Form10.Show;
end;

procedure TForm1.Place1Click(Sender: TObject);
begin
  Uplace.Form6.Show;
end;

procedure TForm1.Session1Click(Sender: TObject);
begin
  Usession.Form14.Show;
end;

procedure TForm1.test11Click(Sender: TObject);
begin
//bababab
end;

procedure TForm1.typepeople1Click(Sender: TObject);
begin
  Utypepeople.Form18.Show;
end;

procedure TForm1.workspeople1Click(Sender: TObject);
begin
  Uworkspeople.Form20.Show;
end;

end.
