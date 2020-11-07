unit Utypepeoplechange;

interface

uses
  Windows, Messages, SysUtils, Variants,
  Classes, Graphics,
  Controls, Forms, Dialogs, StdCtrls, DB,
  IBCustomDataSet, IBQuery;

type
  TForm19 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
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
  Form19: TForm19;
  TypeID: Integer;

implementation

uses Umain, UTypepeople;
{$R *.dfm}

procedure TForm19.Button1Click(Sender: TObject);
begin

  if (TypeID = 0) then
  begin
    // insert
    IBQuery1.SQL.Clear;
    IBQuery1.SQL.Add('INSERT INTO TYPEPEOPLE(NAME) VALUES (:NAME)');
  end
  else
  begin
    IBQuery1.SQL.Clear;
    IBQuery1.SQL.Add('UPDATE TYPEPEOPLE set Name = :Name where TPID = :TPID');
    IBQuery1.ParamByName('TPID').AsInteger := TypeID;
    // update
  end;

  IBQuery1.ParamByName('NAME').AsString := Edit1.Text;
  IBQuery1.ExecSQL;
  UTypepeople.Form18.refreshing;
  close;
end;

procedure TForm19.Button2Click(Sender: TObject);
begin
  IBQuery1.SQL.Clear;
  IBQuery1.SQL.Add('DELETE FROM TYPEPEOPLE WHERE TPID = :TPID');
  IBQuery1.ParamByName('TPID').AsInteger := TypeID;
  IBQuery1.ExecSQL;
  UTypepeople.Form18.refreshing;
  close;
end;

procedure TForm19.FormShow(Sender: TObject);
begin

  Edit1.Text := '';

  if (TypeID = 0) then
  begin
    Label1.Caption := 'Введите имя нового типа';
    Button1.Caption := 'Добавить';
    Button2.Visible := false;
  end
  else
  begin
    IBQuery1.SQL.Clear;
    IBQuery1.SQL.Add('Select Name from typepeople where TPID = :TPID');
    IBQuery1.ParamByName('TPID').AsInteger := TypeID;
    IBQuery1.Open;
    Edit1.Text := IBQuery1.Fields[0].AsString;
    Label1.Caption := 'Изменить имя (' + Edit1.Text + ')';
    Button1.Caption := 'Изменить';
    Button2.Caption := 'Удалить';
    Button2.Visible := true;
  end;
end;

end.
