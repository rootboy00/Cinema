unit Uplacechange;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Data.DB,
  IBX.IBCustomDataSet, IBX.IBTable, IBX.IBQuery;

type
  TForm12 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Memo1: TMemo;
    Label3: TLabel;
    Button2: TButton;
    DataSource1: TDataSource;
    DBLookupComboBox1: TDBLookupComboBox;
    IBQuery1: TIBQuery;
    IBQuery2: TIBQuery;
    Button3: TButton;
    procedure FormShow(Sender: TObject);
    procedure refreshing;
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form12: TForm12;
  HallID:Integer;

implementation
 uses UMain;
{$R *.dfm}

procedure Tform12.refreshing;
begin
  memo1.Lines.Clear;
  ibquery1.Active:= false;
  ibquery1.Active:= true;
  ibquery1.FetchAll;
end;




procedure TForm12.Button1Click(Sender: TObject);
begin
  HallID:= ibquery1.Fields[0].AsInteger;
  edit1.Text:= ibquery1.Fields[3].AsString;
  edit2.Text:= ibquery1.Fields[2].AsString;

  ibquery2.SQL.Clear;
  ibquery2.SQL.Add('select PLID,PLROW,PLCOL,LENGTHPLACE from place where HID = :HID ');
  ibquery2.SQL.Add('order by plrow,plcol');
  ibquery2.ParamByName('HID').AsInteger:= HallID;
  ibquery2.Open;

  memo1.Lines.Clear;
  ibquery2.First;
  while not ibquery2.Eof do
  begin
    memo1.Lines.Add(ibquery2.Fields[1].AsString + ' ' + ibquery2.Fields[2].AsString + ' ' + ibquery2.Fields[3].AsString );
    ibquery2.Next;
  end;




end;

procedure TForm12.Button3Click(Sender: TObject);
var i:integer;
begin
  ibquery2.SQL.Clear;

  for i:= 0 to memo1.Lines.Count do
  begin
    showmessage(memo1.Lines[i]);
  end;




end;

procedure TForm12.FormShow(Sender: TObject);
begin
  edit1.Text:= '';
  edit2.Text:= '';
  refreshing;
end;

end.
