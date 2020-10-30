unit UGenreChange;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, IBX.IBCustomDataSet,
  IBX.IBQuery, Vcl.StdCtrls;

type
  TForm5 = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    IBQuery1: TIBQuery;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;
  Texttype:integer;

implementation
 uses Umain,UGenre;
{$R *.dfm}






procedure TForm5.Button1Click(Sender: TObject);
begin

if(edit1.Text <> '') then
begin

  if(texttype <> 0) then
  begin
    //update
    ibquery1.SQL.Clear;
    ibquery1.SQL.Add('select count(*) from genre where (name= :name)');
    ibquery1.ParamByName('name').asstring := edit1.Text;
    ibquery1.Open;
    if(ibquery1.Fields[0].asinteger = 0) then
    begin
      ibquery1.SQL.Clear;
      ibquery1.SQL.Add('UPDATE genre set NAME =:Name where GID = :GID ');
      ibquery1.ParamByName('name').asstring := edit1.Text;
      ibquery1.ParamByName('GID').AsInteger:= texttype;
      ibquery1.ExecSQL;
    end;

    end else
    begin
    //insert
    ibquery1.SQL.Clear;
    ibquery1.SQL.Add('select count(*) from genre where (name= :name)');
    ibquery1.ParamByName('name').asstring := edit1.Text;
    ibquery1.Open;

    if(ibquery1.Fields[0].asinteger = 0) then
    begin
      ibquery1.SQL.Clear;
      ibquery1.SQL.Add('INSERT INTO genre(NAME) VALUES (:NAME)');
      ibquery1.ParamByName('name').asstring := edit1.Text;
      ibquery1.ExecSQL;
    end else
    begin
      showmessage('������, �� ���� � ��������� '+ edit1.text +' ��� ���� � ���� ������');
    end;




    end;
Ugenre.Form4.Refreshing;
close;
end;
end;

procedure TForm5.Button2Click(Sender: TObject);
begin

  ibquery1.SQL.Clear;
  ibquery1.SQL.Add('delete from genre where GID = :GID');
  ibquery1.ParamByName('GID').AsInteger:= texttype;
  ibquery1.ExecSQL;
Form4.Refreshing;
Form5.Close;
end;


procedure TForm5.FormShow(Sender: TObject);
var str:string;
var GenreName:string;
begin

ibquery1.SQL.Clear;
ibquery1.SQL.Add('select name from Genre where GID = :GID ');
ibquery1.ParamByName('GID').AsInteger:= texttype;
ibquery1.Open;
GenreName:= ibquery1.Fields[0].asstring;


case texttype of
0:  begin
  str:= '�������� ����� ����';
  edit1.Text:= '������� �������� ������ �����';
  button2.Visible:= false;
  button1.Caption:= '��������';
end;
else
begin
  str:= '�������� �������� ('+GenreName+')';
  edit1.Text:= GenreName;
  end;
  button2.Visible:= true;
  button1.Caption:= '��������';

end;
label1.Caption:= str;
end;




end.