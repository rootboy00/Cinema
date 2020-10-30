unit UMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, IBX.IBDatabase,
  Vcl.Menus;

type
  TForm1 = class(TForm)
    ComboBox1: TComboBox;
    IBDatabase1: TIBDatabase;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    test11: TMenuItem;
    test21: TMenuItem;
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
  private
    { Private declarations }
  public
  end;

var




  Form1: TForm1;

implementation

uses UCountry,UGenre,Ufilm,Uhall,Upeople,Uplace,Usession,Utickets,Utypepeople,Uworkspeople,Uplacechange;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
Uplacechange.Form13.Show;
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
begin

IBDatabase1.Connected:= false;
case(ComboBox1.ItemIndex) of
0: begin
  IBDatabase1.Params.Clear;
  IBDatabase1.DatabaseName := 'X:\db\Home_base.ib';
  IBDatabase1.Params.Add('password=masterkey');
  IBDatabase1.Params.Add('user_name=SYSDBA');
  IBDatabase1.Params.Add('lc_ctype=WIN1251');
  end;
1: begin
  IBDatabase1.Params.Clear;
  IBDatabase1.Params.Add('password=MASTERKEY');
  IBDatabase1.Params.Add('user_name=Sysdba');
  IBDatabase1.Params.Add('lc_ctype=WIN1251');
  end;
end;

try
IBDataBase1.Connected:= true;
finally
if(IBDataBase1.Connected) then ShowMessage('Удачно');
end;

end;

procedure TForm1.Country1Click(Sender: TObject);
begin
UCountry.Form2.Show;
end;

procedure TForm1.Fil1Click(Sender: TObject);
begin
Ufilm.Form6.Show;
end;

procedure TForm1.Genre1Click(Sender: TObject);
begin
UGenre.Form4.Show;
end;

procedure TForm1.Hall1Click(Sender: TObject);
begin
UHall.Form8.Show;
end;

procedure TForm1.ickets1Click(Sender: TObject);
begin
Utickets.Form16.Show;
end;

procedure TForm1.People1Click(Sender: TObject);
begin
UPeople.Form10.Show;
end;

procedure TForm1.Place1Click(Sender: TObject);
begin
UPlace.Form12.Show;
end;

procedure TForm1.Session1Click(Sender: TObject);
begin
Usession.Form14.Show;
end;

procedure TForm1.typepeople1Click(Sender: TObject);
begin
UTypepeople.Form18.Show;
end;

procedure TForm1.workspeople1Click(Sender: TObject);
begin
UWorkspeople.Form20.Show;
end;

end.
