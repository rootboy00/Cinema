unit UCountryChange;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,IBQuery, DB,
  IBCustomDataSet, StdCtrls, Grids, DBGrids;

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
  Texttype: integer;

implementation

uses Umain, Ucountry;
{$R *.dfm}

procedure TForm3.Button1Click(Sender: TObject);
begin

  if (Edit1.Text <> '') then
  begin

    if (Texttype <> 0) then
    begin
      // update
      IBQuery1.SQL.Clear;
      IBQuery1.SQL.Add('select count(*) from country where (name= :name)');
      IBQuery1.ParamByName('name').asstring := Edit1.Text;
      IBQuery1.Open;
      if (IBQuery1.Fields[0].asinteger = 0) then
      begin
        IBQuery1.SQL.Clear;
        IBQuery1.SQL.Add('UPDATE Country set NAME =:Name where CID = :CID ');
        IBQuery1.ParamByName('name').asstring := Edit1.Text;
        IBQuery1.ParamByName('CID').asinteger := Texttype;
        IBQuery1.ExecSQL;
      end;

    end
    else
    begin
      // insert
      IBQuery1.SQL.Clear;
      IBQuery1.SQL.Add('select count(*) from country where (name= :name)');
      IBQuery1.ParamByName('name').asstring := Edit1.Text;
      IBQuery1.Open;

      if (IBQuery1.Fields[0].asinteger = 0) then
      begin
        IBQuery1.SQL.Clear;
        IBQuery1.SQL.Add('INSERT INTO COUNTRY(NAME) VALUES (:NAME)');
        IBQuery1.ParamByName('name').asstring := Edit1.Text;
        IBQuery1.ExecSQL;
      end
      else
      begin
        showmessage('Извини, но Страна с названием ' + Edit1.Text +
          ' уже есть в базе данных');
      end;

    end;
    Form2.Refreshing;
    Close;
  end;
end;

procedure TForm3.Button2Click(Sender: TObject);
begin

  IBQuery1.SQL.Clear;
  IBQuery1.SQL.Add('delete from country where CID = :CID');
  IBQuery1.ParamByName('CID').asinteger := Texttype;
  IBQuery1.ExecSQL;
  Form2.Refreshing;
  Close;
end;

procedure TForm3.FormShow(Sender: TObject);
var
  str: string;
var
  CountryName: string;
begin

  IBQuery1.SQL.Clear;
  IBQuery1.SQL.Add('select name from country where CID = :CID ');
  IBQuery1.ParamByName('CID').asinteger := Texttype;
  IBQuery1.Open;
  CountryName := IBQuery1.Fields[0].asstring;

  case Texttype of
    0:
      begin
        UcountryChange.Form3.Caption:= 'Добавить страну';
        str := 'Добавить новую страну';
        Edit1.Text := 'Введите страну';
        Button2.Visible := false;
        Button1.Caption := 'Добавить';
      end;
  else
    begin
      str := 'Изменить название (' + CountryName + ')';
      Edit1.Text := CountryName;
    end;
    Button2.Visible := true;
    Button1.Caption := 'Изменить';
    UcountryChange.Form3.Caption:= 'Изменить страну ('+ edit1.Text + ')';
  end;
  Label1.Caption := str;
end;

end.
