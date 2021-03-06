unit UPlace;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, DB, IBCustomDataSet, Grids,
  DBGrids, StdCtrls;

type
  TForm6 = class(TForm)
    Button1: TButton;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    IBDataSet1: TIBDataSet;
    procedure Button1Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;

implementation
 uses Umain,UplaceShow,UplaceChange;
{$R *.dfm}

procedure TForm6.Button1Click(Sender: TObject);
begin
UplaceChange.Form12.Show;
end;

procedure TForm6.DBGrid1CellClick(Column: TColumn);
begin
UplaceShow.HID:= DBGRID1.Fields[0].AsInteger;
UPlaceShow.SID:= 0;
UPlaceShow.Form13.Show;
end;

procedure TForm6.FormResize(Sender: TObject);
var MainWidth:integer;
begin
  MainWidth:= round( dbgrid1.Width / 100 ) ;
  dbgrid1.Columns[1].Width:= MainWidth * 80;
end;

procedure TForm6.FormShow(Sender: TObject);
begin
  ibdataset1.Active:= false;
  ibdataset1.Active:= true;
end;

end.
