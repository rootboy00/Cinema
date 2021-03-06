unit UGenreChange;

interface

uses
  Forms, DB, IBCustomDataSet, IBQuery, StdCtrls,
  Controls, Classes;

type
  TForm5 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    IBQuery1: TIBQuery;
    Label1: TLabel;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;
  GenreID:integer;

implementation
 uses Umain,Ugenre;
{$R *.dfm}

procedure TForm5.Button1Click(Sender: TObject);
begin

  ibquery1.SQL.Clear;

  if(GenreID = 0) then
  begin
    //Insert
    ibquery1.sql.Add('INSERT INTO GENRE(NAME) VALUES (:NAME)');
  end else
  begin
    //Update
    ibquery1.sql.Add('UPDATE GENRE SET NAME = :NAME WHERE GID = :GID');
    ibquery1.ParamByName('GID').AsInteger:= GenreID;
  end;

  ibquery1.ParamByName('NAME').AsString:= edit1.Text;

  ibquery1.ExecSQL;
  Ugenre.Genre.Refreshing;
  close;


end;

procedure TForm5.Button2Click(Sender: TObject);
begin

  ibquery1.SQL.Clear;
  ibquery1.SQL.Add('DELETE FROM GENRE WHERE GID = :GID');
  ibquery1.ParamByName('GID').AsInteger:= GenreID;
  ibquery1.ExecSQL;
  Ugenre.Genre.Refreshing;
  close;
end;

procedure TForm5.FormShow(Sender: TObject);
begin
button2.Visible:= false;
edit1.Text:='';

  if(GenreID = 0) then
  begin
    Label1.Caption:= '????? ??? ?????? ?????';
    button1.Caption:= '????????';
    UGenreChange.Form5.Caption:= '???????? ????';
  end else
  begin
    ibquery1.SQL.Clear;
    ibquery1.SQL.Add('select name from genre where gid = :GID');
    ibquery1.ParamByName('GID').AsInteger:= GenreID;
    ibquery1.Open;
    edit1.Text:= ibquery1.Fields[0].AsString;
    Label1.Caption:= '???????? ??? (' + ibquery1.Fields[0].AsString +' )';
    button2.Caption:= '???????';
    button1.Caption:='????????';
    UGenreChange.Form5.Caption:= '???????? (' + edit1.Text + ')';
    button2.Visible:= true;
  end;



end;

end.
