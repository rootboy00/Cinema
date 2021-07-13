unit UPeople;

interface

uses
  Windows, Messages, SysUtils, Variants,
  Classes, Graphics,
  Controls, Forms, Dialogs, DB, IBCustomDataSet,
  IBQuery, Grids, DBGrids, StdCtrls;

type
  TForm10 = class(TForm)
    DBGrid1: TDBGrid;
    IBQuery1: TIBQuery;
    DataSource1: TDataSource;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure refreshing;
    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form10: TForm10;

implementation

uses UMain, Upeoplechange;
{$R *.dfm}

procedure TForm10.refreshing;
begin
  IBQuery1.Active := false;
  IBQuery1.Active := true;
end;

procedure TForm10.Button1Click(Sender: TObject);
begin
  Upeoplechange.Texttype := 0;
  Upeoplechange.Form11.Show;
end;

procedure TForm10.DBGrid1CellClick(Column: TColumn);
begin

  Upeoplechange.Texttype := DBGrid1.Fields[0].asinteger;
  Upeoplechange.KeyValue := DBGrid1.Fields[1].asinteger;
  Upeoplechange.Form11.Show;
end;





procedure TForm10.FormResize(Sender: TObject);
var MainWidth:integer;
begin
MainWidth:= round( dbgrid1.Width / 100 ) ;
  dbgrid1.Columns[1].Width:= MainWidth * 50;
  dbgrid1.Columns[2].Width:= MainWidth * 50;
end;



procedure TForm10.FormShow(Sender: TObject);
begin
  refreshing;
end;

end.
