unit Utickets;

interface

uses
  Windows, Messages, SysUtils, Variants,
  Classes, Graphics,
  Controls, Forms, Dialogs, DB, StdCtrls, Grids, DBGrids, IBCustomDataSet,Umain,UTicketschange;

type
  TForm16 = class(TForm)
    DBGrid1: TDBGrid;
    Button1: TButton;
    DataSource1: TDataSource;
    IBDataSet1: TIBDataSet;
    procedure Button1Click(Sender: TObject);
    procedure refreshing;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form16: TForm16;

implementation

{$R *.dfm}

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
