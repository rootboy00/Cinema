unit Usession;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, IBX.IBCustomDataSet, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls;

type
  TForm14 = class(TForm)
    DBGrid1: TDBGrid;
    IBDataSet1: TIBDataSet;
    DataSource1: TDataSource;
    Button1: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form14: TForm14;

implementation
 uses umain;
{$R *.dfm}

end.
