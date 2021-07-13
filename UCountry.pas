unit UCountry;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,IBQuery, DB,
  IBCustomDataSet, StdCtrls, Grids, DBGrids;

type
  TForm2 = class(TForm)
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    Button1: TButton;
    IBQuery1: TIBQuery;
    ComboBox1: TComboBox;
    procedure FormShow(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure Button1Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure FormResize(Sender: TObject);

  private

    { Private declarations }
  public
    { Public declarations }
    procedure Refreshing;
  end;

var
  Form2: TForm2;
  selectcells: integer;

implementation

uses UMain, UCountryChange;
{$R *.dfm}

procedure TForm2.Refreshing;
var
subsql:string;
begin
  subsql:='';
  case combobox1.ItemIndex of
  0: subsql:= 'order by 1';
  1: subsql:= 'order by 2';

  else subsql:= '';
  end;

  ibquery1.SQL.Clear;
  ibquery1.sql.Add('select CID,Name from country');
  ibquery1.SQL.Add(' '+subsql);

  ibquery1.Active := false;
  ibquery1.Active := true;
end;

procedure TForm2.Button1Click(Sender: TObject);
begin
  UCountryChange.CID := 0;
  UCountryChange.Form3.Show;
end;

procedure TForm2.ComboBox1Change(Sender: TObject);
begin
  refreshing;
end;

procedure TForm2.DBGrid1CellClick(Column: TColumn);
begin
  UCountryChange.CID := dbgrid1.Fields[0].asinteger;
  UCountryChange.Form3.Show;
end;

procedure TForm2.FormResize(Sender: TObject);
begin
dbgrid1.Columns[1].Width:= dbgrid1.Width - 50;
end;

procedure TForm2.FormShow(Sender: TObject);
begin
  Refreshing;
end;

end.
