unit UHallChange;

interface

uses
  Windows, Messages, SysUtils, Variants,
  Classes, Graphics,
  Controls, Forms, Dialogs, DB, IBCustomDataSet,
  IBQuery, StdCtrls;

type
  TForm9 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    IBQuery1: TIBQuery;
    Edit3: TEdit;
    Edit4: TEdit;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form9: TForm9;
  HallID: Integer;

implementation

uses UMain, UHall;
{$R *.dfm}

procedure TForm9.Button1Click(Sender: TObject);
begin
  IBQuery1.SQL.Clear;
  if (HallID = 0) then
  begin
    IBQuery1.SQL.Add
      ('INSERT INTO HALL(NAME,DESCRIPTION,"ROW_COUNT","COL_COUNT") VALUES (:NAME,:DESCRIPTION,:ROW_COUNT,:COL_COUNT)');
  end
  else
  begin
    IBQuery1.SQL.Add
      ('UPDATE HALL SET NAME = :NAME, DESCRIPTION = :DESCRIPTION, "ROW_COUNT" = :ROW_COUNT,"COL_COUNT" = :COL_COUNT');
  end;

  IBQuery1.ParamByName('NAME').AsString := Edit1.Text;
  IBQuery1.ParamByName('DESCRIPTION').AsString := Edit2.Text;
  ibquery1.ParamByName('ROW_COUNT').asstring:= edit3.text;
  ibquery1.ParamByName('COL_COUNT').asstring:= edit4.Text;
  IBQuery1.ExecSQL;
  UHall.Form8.refreshing;
  close;
end;

procedure TForm9.Button2Click(Sender: TObject);
begin

  IBQuery1.SQL.Clear;
  IBQuery1.SQL.Add('DELETE FROM HALL WHERE HID = :HID');
  IBQuery1.ParamByName('HID').AsInteger := HallID;

  IBQuery1.ExecSQL;
  UHall.Form8.refreshing;
  close;
end;

procedure TForm9.FormShow(Sender: TObject);
begin

  Edit1.Text := '';
  Edit2.Text := '';
  edit3.Text:= '';
  edit4.Text:= '';

  if (HallID = 0) then
  begin
    Button2.Visible := false;
    Button1.Caption := '????????';
    UHallChange.Form9.Caption:= '???????? ???';
  end
  else
  begin

    IBQuery1.SQL.Clear;
    IBQuery1.SQL.Add('SELECT NAME,DESCRIPTION,"ROW_COUNT","COL_COUNT" FROM HALL WHERE HID = :HID');
    IBQuery1.ParamByName('HID').AsInteger := HallID;
    IBQuery1.Open;

    Edit1.Text := IBQuery1.Fields[0].AsString;
    Edit2.Text := IBQuery1.Fields[1].AsString;
    edit3.Text:= ibquery1.Fields[2].AsString;
    edit4.Text:= ibquery1.Fields[3].AsString;

    UHallChange.Form9.Caption:= '???????? ??? (' + edit1.Text + ')';
    Button2.Caption := '???????';
    Button1.Caption := '????????';
    Button2.Visible := true;
  end;

end;

end.
