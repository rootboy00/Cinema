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
    Panel1: TPanel;
    Panel2: TPanel;
    Button1: TButton;
    Memo1: TMemo;
    Label1: TLabel;
    PaintBox1: TPaintBox;

    procedure Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PaintBox1Paint(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);

  private
    { Private declarations }
    var
    MaxRow, MaxCol, maxsize: integer;
    Heigh_But, Width_But: integer;
    Left_but, top_but: integer;
    step_left, step_up: integer;
    cnt: integer;
    ar: array[0..1000] of TColorButton;

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

  Place: array [0 .. 500] of RPlace;
  i,HID,SID: integer;

implementation

uses umain,ufilmshow;
{$R *.dfm}

procedure TForm13.Button1Click(Sender: TObject);
var m:integer;

begin

  for m := 0 to memo1.Lines.Count do
    begin
      if(length(memo1.Lines[m]) > 0) then
      begin
        ibquery1.SQL.Clear;
        ibquery1.SQL.Add('INSERT INTO TICKETS(SID,PLID) VALUES (:SID,:PLID)');
        ibquery1.ParamByName('SID').AsInteger:= SID;
        ibquery1.ParamByName('PLID').AsString:= memo1.Lines[m];
        ibquery1.ExecSQL;
      end;
    end;
  close;
  UFilmShow.Form22.Close;
  UMain.Form1.GetCommit;
  end;




procedure TForm13.Click(Sender: TObject);
var
  tag: integer;
  k:integer;
  flag:boolean;
begin
  tag := (Sender as TButton).tag;
  flag:= false;

  if( ar[tag].Color = rgb(255,0,0)) then exit;


  for k := 0 to memo1.Lines.Count-1 do
    begin
      if( memo1.Lines[k] = Inttostr(Place[tag].PlaceID) ) then
      begin
        memo1.Lines.Delete(k);
        flag:= true;
        ar[tag].Color:= rgb(0,255,0);
      end;
    end;

  if(flag = false) then
  begin
  memo1.Lines.Add( Inttostr(Place[tag].PlaceID));
  ar[tag].Color:= CLYELLOW;
  end;
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

if(SID = 0) then panel2.Visible:= false;
memo1.Lines.Clear;

//Paintbox1.Parent:= Panel1;
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

  UPlaceShow.Form13.Caption:= '??? (' +ibquery1.Fields[0].AsString + ')';



  if(SID <> 0) then
  begin
    ibquery1.SQL.Clear;
    ibquery1.SQL.Add('select Film.Name,STime,SDate,Price');
    ibquery1.SQL.Add('from session ');
    ibquery1.SQL.Add('Inner join hall on (Hall.HID = session.HID) ');
    ibquery1.SQL.Add('inner join film on (film.FID = session.FID)');
    ibquery1.SQL.Add('where sid = :sid');
    ibquery1.ParamByName('sid').AsInteger:= SID;
    ibquery1.Open;
    Form13.Caption:= Form13.Caption + ' ????? (' + ibquery1.Fields[0].AsString
                                    + ') ????? (' + copy(ibquery1.Fields[1].AsString,1,length(ibquery1.Fields[1].AsString)-3 )
                                    + ') ???? (' + ibquery1.Fields[2].AsString + ')';
  end;

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
        ar[cnt].Caption:= Inttostr(Place[cnt].PlaceID);
        // Ar[cnt].Show;
      end;


      Left_but := Left_but + tmp_width + step_left;
      cnt := cnt + 1;
    end;

    top_but := top_but + Heigh_But + step_up;
    Left_but := Width_But;
  end;

  if( sid <> 0 ) then
  begin
    ibquery1.SQL.Clear;
    ibquery1.SQL.Add('select count(*) from tickets where sid = :sid');
    ibquery1.ParamByName('sid').AsInteger:= SID;
    ibquery1.Open;

    if(ibquery1.Fields[0].asinteger > 0) then
    begin
      ibquery1.SQL.Clear;
      ibquery1.SQL.Add('select PLID from Tickets where sid = :SID');
      ibquery1.ParamByName('SID').AsInteger:= SID;
      ibquery1.Open;

      ibquery1.First;
      while not ibquery1.Eof do
      begin
        for j := 0 to cnt-1 do
          if(place[j].PlaceID = ibquery1.Fields[0].asinteger) then
          begin
            ar[j].Color:= rgb(255,0,0);
          end;
      ibquery1.Next;
      end;

    end;
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
      Paintbox1.Canvas.TextOut(Left_but,top_but,Inttostr(i) +' ???');
      top_but := top_but + Heigh_But + step_up ;
    end;

end;

end.
