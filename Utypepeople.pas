unit Utypepeople;

interface

uses
  Windows, Messages, SysUtils, Variants,
  Classes, Graphics,
  Controls, Forms, Dialogs, DB, StdCtrls,
  IBCustomDataSet, Grids, DBGrids, IBTable;

type
  TForm18 = class(TForm)
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    Button1: TButton;
    IBTable1: TIBTable;
    procedure Button1Click(Sender: TObject);
    procedure refreshing;
    procedure DBGrid1CellClick(Column: TColumn);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form18: TForm18;

implementation

uses Umain, Utypepeoplechange;

{$R *.dfm}

procedure TForm18.DBGrid1CellClick(Column: TColumn);
begin
  Utypepeoplechange.TypeID := DBGrid1.Fields[0].AsInteger;
  Utypepeoplechange.Form19.Show;
end;

procedure TForm18.FormCreate(Sender: TObject);
begin
  refreshing;
end;

Procedure TForm18.refreshing;
begin
  IBTable1.Active := false;
  IBTable1.Active := true;
end;

procedure TForm18.Button1Click(Sender: TObject);
begin
  Utypepeoplechange.TypeID := 0;
  Utypepeoplechange.Form19.Show;
end;

end.
