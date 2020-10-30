unit UCountry;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, IBX.IBCustomDataSet, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, IBX.IBTable, IBX.IBQuery;

type
  TForm2 = class(TForm)
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    IBDataSet1: TIBDataSet;
    Button1: TButton;
    IBQuery1: TIBQuery;
    procedure FormShow(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure Button1Click(Sender: TObject);

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
 uses UMain,UCountryChange;
{$R *.dfm}

procedure Tform2.Refreshing;
begin
ibdataset1.Active:= false;
ibdataset1.Active:= true;
dbgrid1.Fields[0].Visible:= false;
end;




procedure TForm2.Button1Click(Sender: TObject);
begin
UcountryChange.Texttype:= 0;
UcountryChange.Form3.Show;
end;

procedure TForm2.DBGrid1CellClick(Column: TColumn);
begin
UcountryChange.Texttype:= IbDataset1.Fields[0].asinteger;
UcountryChange.Form3.Show;
end;

procedure TForm2.FormShow(Sender: TObject);
begin
 refreshing;
end;



end.
