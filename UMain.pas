unit UMain;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics,  Forms,
  Dialogs, StdCtrls, IBDatabase, Menus, DB, Controls, IBX.IBCustomDataSet,
  IBX.IBQuery, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    IBDatabase1: TIBDatabase;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
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
    DBGrid1: TDBGrid;
    Label1: TLabel;
    IBQuery1: TIBQuery;
    DataSource1: TDataSource;
    Edit1: TEdit;
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
    procedure FormCreate(Sender: TObject);
    procedure test11Click(Sender: TObject);
    procedure GetCommit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
  private
    { Private declarations }
  public
  end;
var
  Form1: TForm1;

implementation

uses UCountry, UGenre, Ufilm, Uhall, Upeople, Uplace, Usession, Utickets,
  Utypepeople, Uworkspeople,Ucountrychange,Ufilmshow;

{$R *.dfm}


procedure Tform1.GetCommit;
begin
  IBTransaction1.Commit;
  IBTransaction1.StartTransaction;
  Form1.IBQuery1.Active:= true;

end;




procedure TForm1.Button1Click(Sender: TObject);
begin
  GetCommit;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Ucountrychange.CID:= 0;
  Ucountrychange.Form3.Show;
end;

procedure TForm1.Country1Click(Sender: TObject);
begin
  UCountry.Form2.Show;
end;

procedure TForm1.DBGrid1CellClick(Column: TColumn);
var FilmID:integer;
begin
  Ufilmshow.FilmID:= dbgrid1.Fields[0].AsInteger;
  Ufilmshow.Form22.Show;
end;



procedure TForm1.Edit1Change(Sender: TObject);
var addsql:string;
begin
  dbgrid1.Visible:= true;

  if(edit1.Text='') then
  begin
    addsql:='';
  end else
  begin
    addsql:=' where NAME like ''%' + edit1.Text + '%''';


  end;

  ibquery1.SQL.Clear;
  ibquery1.SQL.Add('Select FID,NAME from film' + addsql);
  ibquery1.Open;

  if(ibquery1.Fields[0].AsInteger = 0) then dbgrid1.Visible:= false;



end;

procedure TForm1.Fil1Click(Sender: TObject);
begin
  Ufilm.Form4.Show;

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  UMain.Form1.Show;
  ibdatabase1.Connected:= false;

  try
    IBDatabase1.Params.Clear;
    IBDatabase1.DatabaseName := 'sql\HOME_BASE.ib';
    IBDatabase1.Params.Add('password=masterkey');
    IBDatabase1.Params.Add('user_name=SYSDBA');
    IBDatabase1.Params.Add('lc_ctype=WIN1251');
    IBDatabase1.Connected := true;
  except
    showmessage('???????? ???? ?? ?????????');
  end;

  if not(ibdatabase1.Connected) then
  begin
    try
      IBDatabase1.Params.Add('password=edu-759');
      IBDatabase1.Params.Add('user_name=student');
      IBDatabase1.Params.Add('lc_ctype=WIN1251');
      IBDatabase1.Connected := true;
    except
      showmessage('???????? ???? ?? ?????????');
    end;

  end;


  Ibquery1.SQL.Clear;
  Ibquery1.SQL.Add('Select FID,Name from film');
  ibquery1.Open;
  if(ibquery1.Fields[0].AsInteger = 0) then dbgrid1.Visible:= false;

  UMain.Form1.GetCommit;

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
