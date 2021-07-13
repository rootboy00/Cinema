unit Utickets;

interface

uses
  Windows, Messages, SysUtils, Variants,
  Classes, Graphics,
  Controls, Forms, Dialogs, DB, StdCtrls, Grids, DBGrids, IBCustomDataSet,Umain,UTicketschange;

type
  TForm16 = class(TForm)
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    IBDataSet1: TIBDataSet;
    procedure Button1Click(Sender: TObject);
    procedure refreshing;
    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form16: TForm16;

implementation

{$R *.dfm}

procedure TForm16.FormResize(Sender: TObject);
var MainWidth:integer;
begin
  MainWidth:= round( dbgrid1.Width / 100 ) ;
  dbgrid1.Columns[1].Width:= MainWidth * 20;
  dbgrid1.Columns[2].Width:= MainWidth * 20;
  dbgrid1.Columns[3].Width:= MainWidth * 20;
  dbgrid1.Columns[4].Width:= MainWidth * 10;
  dbgrid1.Columns[5].Width:= MainWidth * 10;
end;


procedure TForm16.FormShow(Sender: TObject);
begin
  refreshing;
end;

procedure Tform16.refreshing;
begin
   ibdataset1.Active:= false;
   ibdataset1.Active:= true;
end;


procedure TForm16.Button1Click(Sender: TObject);
begin
//baba
UTicketschange.TicketID:= 0;
UTicketschange.Form17.Show;
end;

end.
