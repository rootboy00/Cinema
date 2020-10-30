unit UHallChange;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, IBX.IBCustomDataSet,
  IBX.IBQuery, Vcl.StdCtrls;

type
  TForm9 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    IBQuery1: TIBQuery;
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
  HallID:Integer;

implementation
 uses UMain,UHall;
{$R *.dfm}

procedure TForm9.Button1Click(Sender: TObject);
begin
  ibquery1.SQL.Clear;
  if(HallID = 0) then
  begin
    ibquery1.SQL.Add('INSERT INTO HALL(NAME,DESCRIPTION) VALUES (:NAME,:DESCRIPTION)');
  end else
  begin
    ibquery1.SQL.Add('UPDATE HALL SET NAME = :NAME, DESCRIPTION = :DESCRIPTION');
  end;

  ibquery1.ParamByName('NAME').AsString:= edit1.Text;
  ibquery1.ParamByName('DESCRIPTION').AsString:= edit2.Text;
  ibquery1.ExecSQL;
  Uhall.Form8.refreshing;
  close;
end;

procedure TForm9.Button2Click(Sender: TObject);
begin

  ibquery1.SQL.Clear;
  ibquery1.SQL.Add('DELETE FROM HALL WHERE HID = :HID');
  ibquery1.ParamByName('HID').AsInteger:= HallID;

  ibquery1.ExecSQL;
  Uhall.Form8.refreshing;
  close;
end;

procedure TForm9.FormShow(Sender: TObject);
begin

edit1.Text:= '';
edit2.Text:= '';

  if(HallID = 0) then
  begin
  button2.Visible:= false;
  button1.Caption:= '��������';
  end else
  begin

  ibquery1.SQL.Clear;
  ibquery1.SQL.Add('SELECT NAME,DESCRIPTION FROM HALL WHERE HID = :HID');
  ibquery1.ParamByName('HID').AsInteger:= HallID;
  ibquery1.Open;

  edit1.Text:= ibquery1.Fields[0].AsString;
  edit2.Text:= ibquery1.Fields[1].AsString;

  button2.Caption:= '�������';
  button1.Caption:= '��������';
  button2.Visible:= true;
  end;


end;

end.