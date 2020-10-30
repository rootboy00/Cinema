unit UCountryChange;
interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB,
  IBX.IBCustomDataSet, IBX.IBQuery;

type
  TForm3 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    Label1: TLabel;
    IBQuery1: TIBQuery;
    Button2: TButton;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;
  Texttype:integer;

implementation
 uses Umain,Ucountry;
{$R *.dfm}

procedure TForm3.Button1Click(Sender: TObject);
begin

if(edit1.Text <> '') then
begin

  if(texttype <> 0) then
  begin
    //update
    ibquery1.SQL.Clear;
    ibquery1.SQL.Add('select count(*) from country where (name= :name)');
    ibquery1.ParamByName('name').asstring := edit1.Text;
    ibquery1.Open;
    if(ibquery1.Fields[0].asinteger = 0) then
    begin
      ibquery1.SQL.Clear;
      ibquery1.SQL.Add('UPDATE Country set NAME =:Name where CID = :CID ');
      ibquery1.ParamByName('name').asstring := edit1.Text;
      ibquery1.ParamByName('CID').AsInteger:= texttype;
      ibquery1.ExecSQL;
    end;

    end else
    begin
    //insert
    ibquery1.SQL.Clear;
    ibquery1.SQL.Add('select count(*) from country where (name= :name)');
    ibquery1.ParamByName('name').asstring := edit1.Text;
    ibquery1.Open;

    if(ibquery1.Fields[0].asinteger = 0) then
    begin
      ibquery1.SQL.Clear;
      ibquery1.SQL.Add('INSERT INTO COUNTRY(NAME) VALUES (:NAME)');
      ibquery1.ParamByName('name').asstring := edit1.Text;
      ibquery1.ExecSQL;
    end else
    begin
      showmessage('Извини, но Страна с названием '+ edit1.text +' уже есть в базе данных');
    end;




    end;
Form2.Refreshing;
Close;
end;
end;

procedure TForm3.Button2Click(Sender: TObject);
begin

  ibquery1.SQL.Clear;
  ibquery1.SQL.Add('delete from country where CID = :CID');
  ibquery1.ParamByName('CID').AsInteger:= texttype;
  ibquery1.ExecSQL;
Form2.Refreshing;
Close;
end;

procedure TForm3.FormShow(Sender: TObject);
var str:string;
var CountryName:string;
begin

ibquery1.SQL.Clear;
ibquery1.SQL.Add('select name from country where CID = :CID ');
ibquery1.ParamByName('CID').AsInteger:= texttype;
ibquery1.Open;
CountryName:= ibquery1.Fields[0].asstring;


case texttype of
0:  begin
  str:= 'Добавить новую страну';
  edit1.Text:= 'Введите страну';
  button2.Visible:= false;
  button1.Caption:= 'Добавить';
end;
else
begin
  str:= 'Изменить название ('+CountryName+')';
  edit1.Text:= Countryname;
  end;
  button2.Visible:= true;
  button1.Caption:= 'Изменить';

end;
label1.Caption:= str;
end;

end.
