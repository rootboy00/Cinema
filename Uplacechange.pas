unit Uplacechange;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB,
  IBX.IBCustomDataSet, IBX.IBQuery, Vcl.ButtonGroup;

type
  TForm13 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    Button2: TButton;
    ibquery1: TIBQuery;
    Panel1: TPanel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  type RPlace = record
    Row:integer;
    Col:integer;
    Length:Integer;
  end;


var
  Form13: TForm13;
  Place: array[0..500] of RPlace;
  i:integer;
  MaxSize:integer;
implementation
  uses umain;
{$R *.dfm}

procedure TForm13.Button1Click(Sender: TObject);
begin
  ibquery1.SQL.Clear;
  ibquery1.SQL.Add('select plrow,plcol,lengthplace from place where (HID = :HID )');
  ibquery1.ParamByName('HID').AsInteger:= 3;
  ibquery1.Open;
  i:= 0;
  ibquery1.First;
    while not( Ibquery1.Eof ) do
    begin
    Place[i].Row:= ibquery1.Fields[0].AsInteger;
    Place[i].col:= ibquery1.Fields[1].AsInteger;
    Place[i].Length:= ibquery1.Fields[2].AsInteger;
    ibquery1.Next;
    i:= i + 1;
    end;
    MaxSize:= i - 1;

end;

procedure TForm13.Click(Sender: TObject);
var tag:integer;
begin
  tag:= (sender as Tbutton).tag;
  showmessage('ky ' + inttostr(tag) );

end;

procedure TForm13.Button2Click(Sender: TObject);
var
test:TButton;
H,W:integer;
HeigthWork,WidthWork:integer;
j,k:integer;
x1,x2,y1,y2:integer;
begin
memo1.Lines.Clear;
  for I := 0 to MaxSize do
    begin
      memo1.Lines.Add( Inttostr(Place[i].Row) + ' ' + Inttostr(Place[i].Col) + ' ' + Inttostr(Place[i].Length));
    end;


  test:= TButton.Create(Panel1);
  test.Parent:= Panel1;
  test.left:= 10;
  test.top:= 10;
  test.Name:= 'test';
  test.Caption:= 'test';
  test.Tag:= 1;
  test.OnClick:= Click;
  test.Show;







end;


end.
