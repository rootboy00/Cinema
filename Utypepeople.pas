unit Utypepeople;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls,
  IBX.IBCustomDataSet, Vcl.Grids, Vcl.DBGrids, IBX.IBTable;

type
  TForm18 = class(TForm)
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    Button1: TButton;
    IBTable1: TIBTable;
    procedure Button1Click(Sender: TObject);
    procedure refreshing;
    procedure DBGrid1CellClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form18: TForm18;

implementation
 uses Umain,Utypepeoplechange;

{$R *.dfm}

procedure TForm18.DBGrid1CellClick(Column: TColumn);
begin
  Utypepeoplechange.TypeID:= dbgrid1.Fields[0].AsInteger;
  Utypepeoplechange.Form19.Show;
end;

procedure TForm18.refreshing;
begin
  IbTable1.Active:= false;
  IbTable1.Active:= true;
end;

procedure TForm18.Button1Click(Sender: TObject);
begin
Utypepeoplechange.TypeID:= 0;
Utypepeoplechange.Form19.Show;
end;

end.
