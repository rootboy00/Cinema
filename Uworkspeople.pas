unit Uworkspeople;

interface

uses
  Windows, Messages, SysUtils, Variants,
  Classes, Graphics,
  Controls, Forms, Dialogs, Data.DB, StdCtrls, Grids, DBGrids, UMain,Uworkspeoplechange,
  IBCustomDataSet, IBQuery;

type
  TForm20 = class(TForm)
    DBGrid1: TDBGrid;
    Button1: TButton;
    IBQuery1: TIBQuery;
    DataSource1: TDataSource;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure refreshing;
    procedure DBGrid1CellClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form20: TForm20;

implementation

{$R *.dfm}


procedure TForm20.refreshing;
begin
  ibquery1.Active:= false;
  ibquery1.Active:= true;
end;



procedure TForm20.Button1Click(Sender: TObject);
begin
 Uworkspeoplechange.WorkID:= 0;
 Uworkspeoplechange.Form21.Show;
end;

procedure TForm20.DBGrid1CellClick(Column: TColumn);
begin
 Uworkspeoplechange.WorkID:= dbgrid1.Fields[0].AsInteger;
 Uworkspeoplechange.Form21.Show;
end;

procedure TForm20.FormShow(Sender: TObject);
begin
refreshing;
end;

end.
