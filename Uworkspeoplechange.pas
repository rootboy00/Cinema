unit Uworkspeoplechange;

interface

uses
  Windows, Messages, SysUtils, Variants,
  Classes, Graphics,
  Controls, Forms, Dialogs, StdCtrls, DBCtrls, DB, IBCustomDataSet,
  IBTable, IBQuery;

type
  TForm21 = class(TForm)
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    DBLookupComboBox3: TDBLookupComboBox;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Button4: TButton;
    IBTable1: TIBTable;
    DataSource1: TDataSource;
    IBTable2: TIBTable;
    DataSource2: TDataSource;
    IBTable3: TIBTable;
    DataSource3: TDataSource;
    IBQuery1: TIBQuery;
    Button5: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure refreshing;
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form21: TForm21;
  WorkID:integer;

implementation
 uses Upeoplechange,UTypepeoplechange,UMain,UWorkspeople;
{$R *.dfm}

procedure TForm21.Button1Click(Sender: TObject);
begin
//asgasg
Upeoplechange.Texttype:= 0;
Upeoplechange.Form11.Show;
end;

procedure TForm21.Button2Click(Sender: TObject);
begin
// asgasg
UTypepeoplechange.TypeID:= 0;
UTypepeoplechange.Form19.Show;
end;

procedure TForm21.Button3Click(Sender: TObject);
begin
refreshing;
end;


procedure TForm21.Button4Click(Sender: TObject);
begin
  ibquery1.SQL.Clear;

  if(WorkID = 0) then
  begin
  //Insert
    ibquery1.SQL.Add('INSERT INTO WORKSPEOPLE(FID,PID,TPID) VALUES (:FID,:PID,:TPID)');
  end else
  begin
  //Update
    ibquery1.SQL.Add('UPDATE WORKSPEOPLE SET FID = :FID, PID = :PID, TPID = :TPID WHERE WPID = :WPID');
    ibquery1.ParamByName('WPID').AsInteger:= WorkID;
  end;

  ibquery1.ParamByName('FID').AsInteger := dblookupcombobox1.KeyValue;
  ibquery1.ParamByName('PID').AsInteger:= dblookupcombobox2.KeyValue;
  ibquery1.ParamByName('TPID').AsInteger:= dblookupcombobox3.KeyValue;
  ibquery1.ExecSQL;
  Uworkspeople.Form20.refreshing;
  close;
end;

procedure TForm21.refreshing;
begin
  Ibtable1.Active:= false;
  Ibtable1.Active:= true;
  ibtable1.FetchAll;
  Ibtable2.Active:= false;
  Ibtable2.Active:= true;
  ibtable2.FetchAll;
  Ibtable3.Active:= false;
  Ibtable3.Active:= true;
  ibtable3.FetchAll;
end;


procedure TForm21.FormShow(Sender: TObject);
begin
  refreshing;
  button5.Visible:= false;
  dblookupcombobox1.KeyValue:= -1;
  dblookupcombobox2.KeyValue:= -1;
  dblookupcombobox3.KeyValue:= -1;

  if(WorkID = 0) then
  begin
    button4.Caption:= '????????';
    form21.Caption:= '???????? ???????? ? ??????';
  end else
  begin
    button5.Visible:= true;
    button4.Caption:= '????????';
    ibquery1.SQL.Clear;
    ibquery1.SQL.Add('select wp.FID,wp.PID,wp.TPID,p.name from workspeople as wp inner join people as p on (p.pid = wp.pid) where WPID = :WPID');
    ibquery1.ParamByName('WPID').AsInteger:= WorkID;
    ibquery1.Open;
    dblookupcombobox1.KeyValue:= ibquery1.Fields[0].AsInteger;
    dblookupcombobox2.KeyValue:= ibquery1.Fields[1].AsInteger;
    dblookupcombobox3.KeyValue:= ibquery1.Fields[2].AsInteger;
    form21.Caption:= '???????? ???????? (' + ibquery1.Fields[3].AsString + ')';
  end;


end;

end.
