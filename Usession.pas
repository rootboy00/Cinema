unit Usession;

interface

uses
  Windows, Messages, SysUtils, Variants,
  Classes, Graphics,
  Controls, Forms, Dialogs, DB, IBCustomDataSet, Grids,
  DBGrids, StdCtrls;

type
  TForm14 = class(TForm)
    DBGrid1: TDBGrid;
    IBDataSet1: TIBDataSet;
    DataSource1: TDataSource;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure refreshing;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form14: TForm14;

implementation

uses umain, UsessionChange;
{$R *.dfm}

procedure TForm14.refreshing;
begin
  IBDataSet1.Active := false;
  IBDataSet1.Active := true;
end;

procedure TForm14.Button1Click(Sender: TObject);
begin
  UsessionChange.SessionID := 0;
  UsessionChange.Form15.Show;
end;

procedure TForm14.DBGrid1CellClick(Column: TColumn);
begin
  UsessionChange.SessionID := DBGrid1.Fields[0].AsInteger;
  UsessionChange.Form15.Show;
end;

procedure TForm14.FormShow(Sender: TObject);
begin
  refreshing;
end;

end.
