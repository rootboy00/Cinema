unit Uticketschange;

interface

uses
  Windows, Messages, SysUtils, Variants,
  Classes, Graphics,
  Controls, Forms, Dialogs, DBCtrls, UMain, DB, IBCustomDataSet, StdCtrls;

type
  TForm17 = class(TForm)
    DBLookupComboBox1: TDBLookupComboBox;
    DataSource1: TDataSource;
    IBDataSet1: TIBDataSet;
    DBComboBox1: TDBComboBox;
    Label1: TLabel;
    procedure FormShow(Sender: TObject);
    procedure refreshing;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form17: TForm17;
  TicketID:integer;
implementation

{$R *.dfm}

procedure Tform17.refreshing;
begin
  ibdataset1.Active:= false;
  ibdataset1.Active:= true;
  ibdataset1.FetchAll;
end;


procedure TForm17.FormShow(Sender: TObject);
begin
//abab
refreshing;

end;

end.
