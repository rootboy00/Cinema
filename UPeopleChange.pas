unit UPeopleChange;

interface

uses
  Windows, Messages, SysUtils, Variants,
  Classes, Graphics,
  Controls, Forms, Dialogs, DB, IBCustomDataSet,
  IBQuery, StdCtrls, DBCtrls, IBTable;

type
  TForm11 = class(TForm)
    DBLookupComboBox1: TDBLookupComboBox;
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    IBQuery1: TIBQuery;
    Label1: TLabel;
    DataSource1: TDataSource;
    IBTable1: TIBTable;
    Label2: TLabel;
    Button3: TButton;
    Label3: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure refreshing;
    procedure Button4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form11: TForm11;
  Texttype: integer;
  KeyValue: integer;

implementation

uses Umain, Upeople, UcountryChange;
{$R *.dfm}

procedure TForm11.Button1Click(Sender: TObject);
begin

  if (Edit1.Text <> '') then
  begin

    if (Texttype <> 0) then
    begin
      IBQuery1.SQL.Clear;
      IBQuery1.SQL.Add
        ('UPDATE People set NAME =:NAME, CID = :CID where PID = :PID ');
      IBQuery1.ParamByName('NAME').asstring := Edit1.Text;
      IBQuery1.ParamByName('PID').AsInteger := Texttype;
      IBQuery1.ParamByName('CID').AsInteger := DBLookupComboBox1.KeyValue;
      IBQuery1.ExecSQL;
    end
    else
    begin
      // insert
      IBQuery1.SQL.Clear;
      IBQuery1.SQL.Add('select count(*) from people where (name= :name)');
      IBQuery1.ParamByName('name').asstring := Edit1.Text;
      IBQuery1.Open;

      if (IBQuery1.Fields[0].AsInteger = 0) then
      begin
        IBQuery1.SQL.Clear;
        IBQuery1.SQL.Add('INSERT INTO People(CID,NAME) VALUES (:CID,:NAME)');
        IBQuery1.ParamByName('CID').asstring := DBLookupComboBox1.KeyValue;
        IBQuery1.ParamByName('name').asstring := Edit1.Text;
        IBQuery1.ExecSQL;
      end
      else
      begin
        showmessage('??????, ?? ' + Edit1.Text + ' ??? ???? ? ???? ??????');
      end;

    end;
    Form10.refreshing;
    Close;
  end;
end;

procedure TForm11.refreshing;
begin
  IBTable1.Active := false;
  IBTable1.Active := true;
  IBTable1.FetchAll;
end;

procedure TForm11.Button2Click(Sender: TObject);
begin

  IBQuery1.SQL.Clear;
  IBQuery1.SQL.Add('delete from Poeple where PID = :PID');
  IBQuery1.ParamByName('PID').AsInteger := Texttype;
  IBQuery1.ExecSQL;
  Form10.refreshing;
  Close;
end;

procedure TForm11.Button3Click(Sender: TObject);
begin
  UCountryChange.CID := 0;
  UCountryChange.Form3.Show;
end;

procedure TForm11.Button4Click(Sender: TObject);
begin
  refreshing;
end;

procedure TForm11.FormCreate(Sender: TObject);
begin
//
end;

procedure TForm11.FormShow(Sender: TObject);
var
  str: string;
var
  CountryName: string;
begin
  refreshing;

  DBLookupComboBox1.KeyValue := 0;
  IBTable1.FetchAll;
  IBQuery1.SQL.Clear;
  IBQuery1.SQL.Add('select name,CID from people where PID = :PID ');
  IBQuery1.ParamByName('PID').AsInteger := Texttype;
  IBQuery1.Open;
  CountryName := IBQuery1.Fields[0].asstring;

  case Texttype of
    0:
      begin
        UpeopleChange.Form11.Caption:= '???????? ?????? ????????';
        str := '???????? ?????? ????????';
        Edit1.Text := '??????? ???';
        Button2.Visible := false;
        Button1.Caption := '????????';
      end;
  else
    begin
      str := '???????? ??? (' + CountryName + ')';
      Edit1.Text := CountryName;
      DBLookupComboBox1.KeyValue := ibquery1.Fields[1].AsInteger;
      UpeopleChange.Form11.Caption:= '???????? (' + edit1.Text + ')';
    end;
    Button2.Visible := true;
    Button1.Caption := '????????';

  end;
  Label1.Caption := str;
end;

end.
