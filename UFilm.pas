unit UFilm;

interface

uses
  forms, StdCtrls, Classes,
  Controls, Grids, DBGrids, DB, IBCustomDataSet;

type
  TForm4 = class(TForm)
    DBGrid1: TDBGrid;
    Button1: TButton;
    IBDataSet1: TIBDataSet;
    DataSource1: TDataSource;
    procedure refreshing;
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
  Form4: TForm4;

implementation
 uses Umain,UFilmChange;
{$R *.dfm}





procedure TForm4.Button1Click(Sender: TObject);
begin
  Ufilmchange.FilmID:= 0;
  Ufilmchange.Form7.Show;
end;

procedure TForm4.DBGrid1CellClick(Column: TColumn);
begin
  Ufilmchange.FilmID:= Dbgrid1.Fields[0].AsInteger;
  Ufilmchange.Form7.Show;
end;

procedure TForm4.FormResize(Sender: TObject);
var MainWidth:integer;
begin

MainWidth:= round( dbgrid1.Width / 100 );

dbgrid1.Columns[1].Width:= MainWidth * 10; //название
dbgrid1.Columns[2].Width:= MainWidth * 10; //страна
dbgrid1.Columns[3].Width:= MainWidth * 10; //жанр
dbgrid1.Columns[4].Width:= MainWidth * 5; //возраст
dbgrid1.Columns[5].Width:= MainWidth * 10; //start
dbgrid1.Columns[6].Width:= MainWidth * 10; //end
dbgrid1.Columns[7].Width:= MainWidth * 5; //time
dbgrid1.Columns[8].Width:= MainWidth * 10; //image
dbgrid1.Columns[9].Width:= MainWidth * 20; //descript

end;



procedure TForm4.FormShow(Sender: TObject);
begin
  refreshing;
end;

procedure Tform4.refreshing;
begin
  ibdataset1.Active:= false;
  ibdataset1.Active:= true;
end;

end.
