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
  CID: integer;

implementation

uses Umain, Ucountry,UPeopleChange;
{$R *.dfm}

procedure TForm3.Button1Click(Sender: TObject);
begin
  IBQuery1.SQL.Clear;

  if(CID = 0) then
  begin
    //Insert
    IBQuery1.SQL.Add('INSERT INTO COUNTRY(NAME) VALUES (:NAME)');
  end else
  begin
    //Update
    IBQuery1.SQL.Add('UPDATE Country set NAME =:NAME where CID = :CID ');
    IBQuery1.ParamByName('CID').asinteger := CID;
  end;
  IBQuery1.ParamByName('NAME').asstring := Edit1.Text;
  IBQuery1.ExecSQL;

  UMain.Form1.GetCommit;

  Form2.Refreshing;
  form11.refreshing;
  Close;

end;

procedure TForm3.Button2Click(Sender: TObject);
begin

  IBQuery1.SQL.Clear;
  IBQuery1.SQL.Add('delete from country where CID = :CID');
  IBQuery1.ParamByName('CID').asinteger := CID;
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
Button2.Visible := false;

  if(CID = 0) then
  begin
    UcountryChange.Form3.Caption:= '???????? ??????';
    Label1.Caption:= '???????? ????? ??????';
    Edit1.Text := '??????? ??????';
    Button2.Visible := false;
    Button1.Caption := '????????';
  end else
  begin
    IBQuery1.SQL.Clear;
    IBQuery1.SQL.Add('select name from country where CID = :CID ');
    IBQuery1.ParamByName('CID').asinteger := CID;
    IBQuery1.Open;
    CountryName := IBQuery1.Fields[0].asstring;
    Label1.Caption:= '???????? ???????? (' + CountryName + ')';
    Edit1.Text := CountryName;
    Button1.Caption := '????????';
    Button2.Visible := true;
    UcountryChange.Form3.Caption:= '???????? ?????? ('+ edit1.Text + ')';
  end;
end;

end.
