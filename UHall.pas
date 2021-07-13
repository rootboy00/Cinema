unit UHall;

interface

uses
  Windows, Messages, SysUtils, Variants,
  Classes, Graphics,
  Controls, Forms, Dialogs, StdCtrls, DB,
  IBCustomDataSet, Grids, DBGrids;

type
  TForm8 = class(TForm)
    Button1: TButton;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    IBDataSet1: TIBDataSet;
    procedure Button1Click(Sender: TObject);
    procedure refreshing;
    procedure DBGrid1CellClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form8: TForm8;

implementation

uses umain, Uhallchange;
{$R *.dfm}

procedure TForm8.DBGrid1CellClick(Column: TColumn);
begin
  Uhallchange.HallID := DBGrid1.Fields[0].AsInteger;
  Uhallchange.Form9.Show;
end;

procedure TForm8.FormResize(Sender: TObject);
var MainWidth:integer;
begin
MainWidth:= round( dbgrid1.Width / 100 );

  dbgrid1.Columns[1].Width:= MainWidth * 20;
  dbgrid1.Columns[2].Width:= MainWidth * 10;
  dbgrid1.Columns[3].Width:= MainWidth * 10;
  dbgrid1.Columns[4].Width:= MainWidth * 50;
end;

procedure TForm8.FormShow(Sender: TObject);
begin
 ibdataset1.Active:= true;
end;

procedure TForm8.refreshing;
begin
  UMain.Form1.GetCommit;
  IBDataSet1.Active := false;
  IBDataSet1.Active := true;
end;

procedure TForm8.Button1Click(Sender: TObject);
begin
  Uhallchange.HallID := 0;
  Uhallchange.Form9.Show;
end;

end.
