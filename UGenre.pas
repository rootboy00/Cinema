unit UGenre;

interface

uses
  Forms,Classes,DB,
  IBCustomDataSet, StdCtrls, Controls, Grids, DBGrids;

type
  TGenre = class(TForm)
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    IBDataSet1: TIBDataSet;
    Button1: TButton;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Refreshing;
  end;

var
  Genre: TGenre;

implementation

uses Umain, UGenreChange;
{$R *.dfm}

procedure TGenre.Refreshing;
begin
  UMain.Form1.GetCommit;
  IBDataSet1.Active := false;
  IBDataSet1.Active := true;
end;

procedure TGenre.Button1Click(Sender: TObject);
begin
  UGenreChange.GenreID := 0;
  UGenreChange.Form5.Show;

end;

procedure TGenre.DBGrid1CellClick(Column: TColumn);
begin
  UGenreChange.GenreID := IBDataSet1.Fields[0].asinteger;
  UGenreChange.Form5.Show;
end;

procedure TGenre.FormResize(Sender: TObject);
begin
  dbgrid1.Columns[1].Width:= dbgrid1.Width - 50;
end;

procedure TGenre.FormShow(Sender: TObject);
begin
  Refreshing;
end;

end.
