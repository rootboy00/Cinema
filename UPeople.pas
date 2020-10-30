unit UPeople;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, IBX.IBCustomDataSet,
  IBX.IBQuery, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls;

type
  TForm10 = class(TForm)
    DBGrid1: TDBGrid;
    IBQuery1: TIBQuery;
    DataSource1: TDataSource;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure refreshing;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form10: TForm10;

implementation
  uses UMain,Upeoplechange;
{$R *.dfm}

procedure TForm10.refreshing;
begin
  IBquery1.Active:= false;
  IBquery1.Active:= true;
end;

procedure TForm10.Button1Click(Sender: TObject);
begin
UpeopleChange.Texttype:= 0;
UpeopleChange.Form11.Show;
end;


procedure TForm10.DBGrid1CellClick(Column: TColumn);
begin

UpeopleChange.Texttype:= dbgrid1.Fields[0].asinteger;
UpeopleChange.KeyValue:= dbgrid1.Fields[1].AsInteger;
UpeopleChange.Form11.Show;
end;

end.
