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
