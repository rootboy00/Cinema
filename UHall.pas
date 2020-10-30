unit UHall;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB,
  IBX.IBCustomDataSet, Vcl.Grids, Vcl.DBGrids;

type
  TForm8 = class(TForm)
    Button1: TButton;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    IBDataSet1: TIBDataSet;
    procedure Button1Click(Sender: TObject);
    procedure refreshing;
    procedure DBGrid1CellClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form8: TForm8;

implementation
 uses umain,Uhallchange;
{$R *.dfm}

procedure TForm8.DBGrid1CellClick(Column: TColumn);
begin
  Uhallchange.HallID:= dbgrid1.Fields[0].AsInteger;
  Uhallchange.Form9.Show;
end;

procedure TForm8.refreshing;
begin
  IbDataset1.Active:= false;
  IbDataset1.Active:= true;
end;

procedure TForm8.Button1Click(Sender: TObject);
begin
Uhallchange.HallID:=0;
Uhallchange.Form9.Show;
end;

end.
