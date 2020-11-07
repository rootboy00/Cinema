unit Uplaceshow;

interface

uses
  Windows, Messages, SysUtils, Variants,
  Classes, Graphics,
  Controls, Forms, Dialogs, StdCtrls, ExtCtrls, DB,
  IBCustomDataSet, IBQuery, ButtonGroup, Buttons, colorbutton;

type
  TForm13 = class(TForm)
    ibquery1: TIBQuery;
    PaintBox1: TPaintBox;
    Panel1: TPanel;

    procedure Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PaintBox1Paint(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

type
  RPlace = record
    PlaceID:Integer;
    Row: integer;
    Col: integer;
    Length: integer;
  end;

var
  Form13: TForm13;
  MaxRow, MaxCol, maxsize: integer;
  Place: array [0 .. 500] of RPlace;
  i,HID: integer;
  Heigh_But, Width_But: integer;
  Left_but, top_but: integer;
  step_left, step_up: integer;
  ar: array[0..1000] of TColorButton;
  cnt: integer;
implementation

uses umain;
{$R *.dfm}

procedure TForm13.Click(Sender: TObject);
var
  tag: integer;
begin
  tag := (Sender as TButton).tag;
  showmessage(Inttostr(Place[tag].Row) + ' ' + Inttostr(Place[tag].Col));
end;


procedure TForm13.FormClose(Sender: TObject; var Action: TCloseAction);
var
  b: Integer;
begin

if(maxsize > 0) then
begin
    for b := 0  to maxsize do
    begin
      ar[b].Free;
   end;
end;

end;

procedure TForm13.FormShow(Sender: TObject);
var
  j, k: integer;
  tmp_width: integer;
begin

Paintbox1.Parent:= Panel1;
Paintbox1.Visible:= false;
Panel1.Visible:= false;


MaxRow := 0;
MaxCol := 0;
  ibquery1.SQL.Clear;
  ibquery1.SQL.Add('select PLID,plrow,plcol,lengthplace from place where (HID = :HID ) order by PLROW,PLCOL');
  ibquery1.ParamByName('HID').AsInteger := HID;
  ibquery1.Open;
  i := 0;
  ibquery1.First;
  while not(ibquery1.Eof) do
  begin
    Place[i].PlaceID:= ibquery1.Fields[0].AsInteger;
    Place[i].Row := ibquery1.Fields[1].AsInteger;
    Place[i].Col := ibquery1.Fields[2].AsInteger;
    Place[i].Length := ibquery1.Fields[3].AsInteger;
    ibquery1.Next;
    i := i + 1;
  end;
  maxsize := i - 1;



  ibquery1.SQL.Clear;
  ibquery1.SQL.Add('select Name,"ROW_COUNT",COL_COUNT from HALL where HID = :HID');
  ibquery1.ParamByName('HID').AsInteger:= HID;
  ibquery1.Open;
  MaxRow := ibquery1.Fields[1].AsInteger;
  MaxCol := ibquery1.Fields[2].AsInteger;

  UPlaceShow.Form13.Caption:= '��� (' +ibquery1.Fields[0].AsString + ')';

  panel1.Width := 400;
  panel1.Height := 400;
  panel1.Top := 10;
  panel1.Left := 10;
  panel1.Visible:= true;
  //bababa
  Width_But := round(panel1.Width / (MaxCol * 2));
  if(MaxRow = 1) then begin Heigh_But := round(panel1.Height / 4 ); end else begin Heigh_But := round(panel1.Height / ( MaxRow * 2)); end;
  step_left := round(Width_But / 2);
  step_up := round(Heigh_But / 2);

  Left_but := Width_But;
  top_but := Heigh_But;
  cnt := 0;

  for k := 1 to MaxRow do
  begin
    for j := 1 to MaxCol do
    begin
      if (Place[cnt].Row <> k) then
        break;
      tmp_width := Width_But;
      if ((maxsize >= cnt) and (Place[cnt].Length > 0)) then
      begin
        tmp_width := Place[cnt].Length * Width_But + step_left * (Place[cnt].Length - 1);
        ar[cnt] := TColorButton.Create(panel1);
        ar[cnt].Height := Heigh_But;
        ar[cnt].Width := tmp_width;
        ar[cnt].Parent := panel1;
        ar[cnt].Left := Left_but;
        ar[cnt].Top := top_but;
        ar[cnt].tag := cnt;
        ar[cnt].OnClick := Click;
        ar[cnt].Color := rgb(0, 255, 0);
        // Ar[cnt].Show;
      end;


      Left_but := Left_but + tmp_width + step_left;
      cnt := cnt + 1;
    end;

    top_but := top_but + Heigh_But + step_up;
    Left_but := Width_But;
  end;

  Panel1.Width:= 500;
  Paintbox1.Top:= 0;
  Paintbox1.Left:= 400;
  Paintbox1.Height:= 400;
  Paintbox1.Width:=  100;
  Paintbox1.Visible:= true;
end;



procedure TForm13.PaintBox1Paint(Sender: TObject);
begin

  Paintbox1.Font.Color:= CLBLACK;
  Paintbox1.Font.Size:= 14;
  paintbox1.Canvas.Font.Color:= CLBLACK;
  paintbox1.Canvas.Font.Size:= 14;
  Left_but := Width_But;
  top_but := Heigh_But;
  for I := 1 to MaxROW do
    begin
      Paintbox1.Canvas.TextOut(Left_but,top_but,Inttostr(i) +' ���');
      top_but := top_but + Heigh_But + step_up ;
    end;

end;

end.