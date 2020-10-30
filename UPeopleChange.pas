unit UPeopleChange;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, IBX.IBCustomDataSet,
  IBX.IBQuery, Vcl.StdCtrls, Vcl.DBCtrls, IBX.IBTable;

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
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure refreshing;
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form11: TForm11;
  Texttype:integer;
  KeyValue:integer;

implementation
uses Umain,Upeople,UcountryChange;
{$R *.dfm}

procedure TForm11.Button1Click(Sender: TObject);
begin

if(edit1.Text <> '') then
begin

  if(texttype <> 0) then
  begin
      ibquery1.SQL.Clear;
      ibquery1.SQL.Add('UPDATE People set NAME =:NAME, CID = :CID where PID = :PID ');
      ibquery1.ParamByName('NAME').asstring := edit1.Text;
      ibquery1.ParamByName('PID').AsInteger:= texttype;
      ibquery1.ParamByName('CID').AsInteger:= dblookupcombobox1.KeyValue;
      ibquery1.ExecSQL;
    end else
    begin
    //insert
    ibquery1.SQL.Clear;
    ibquery1.SQL.Add('select count(*) from people where (name= :name)');
    ibquery1.ParamByName('name').asstring := edit1.Text;
    ibquery1.Open;

    if(ibquery1.Fields[0].asinteger = 0) then
    begin
      ibquery1.SQL.Clear;
      ibquery1.SQL.Add('INSERT INTO People(CID,NAME) VALUES (:CID,:NAME)');
      ibquery1.ParamByName('CID').asstring := DBLookupComboBox1.KeyValue;
      ibquery1.ParamByName('name').asstring := edit1.Text;
      ibquery1.ExecSQL;
    end else
    begin
      showmessage('������, �� '+ edit1.text +' ��� ���� � ���� ������');
    end;




    end;
Form10.refreshing;
Close;
end;
end;


procedure Tform11.refreshing;
begin
  ibtable1.Active:= false;
  Ibtable1.Active:= true;
  ibtable1.FetchAll;
end;

procedure TForm11.Button2Click(Sender: TObject);
begin

  ibquery1.SQL.Clear;
  ibquery1.SQL.Add('delete from Poeple where PID = :PID');
  ibquery1.ParamByName('PID').AsInteger:= texttype;
  ibquery1.ExecSQL;
Form10.refreshing;
Close;
end;

procedure TForm11.Button3Click(Sender: TObject);
begin
UcountryChange.Texttype:= 0;
UcountryChange.Form3.Show;
end;

procedure TForm11.Button4Click(Sender: TObject);
begin
refreshing;
end;

procedure TForm11.FormShow(Sender: TObject);
var str:string;
var CountryName:string;
begin

dblookupcombobox1.KeyValue:= KeyValue;

ibtable1.FetchAll;
ibquery1.SQL.Clear;
ibquery1.SQL.Add('select name from people where PID = :PID ');
ibquery1.ParamByName('PID').AsInteger:= texttype;
ibquery1.Open;
CountryName:= ibquery1.Fields[0].asstring;


case texttype of
0:  begin
  str:= '�������� ������ ��������';
  edit1.Text:= '������� ���';
  button2.Visible:= false;
  button1.Caption:= '��������';
end;
else
begin
  str:= '�������� ��� ('+CountryName+')';
  edit1.Text:= Countryname;
  end;
  button2.Visible:= true;
  button1.Caption:= '��������';

end;
label1.Caption:= str;
end;


end.