unit Uplacechange;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, StdCtrls, DBCtrls, DB,
  IBCustomDataSet, IBTable, IBQuery;

type
  TForm12 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Memo1: TMemo;
    Label3: TLabel;
    Button2: TButton;
    DataSource1: TDataSource;
    DBLookupComboBox1: TDBLookupComboBox;
    IBQuery1: TIBQuery;
    IBQuery2: TIBQuery;
    Button3: TButton;
    procedure FormShow(Sender: TObject);
    procedure refreshing;
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure DBLookupComboBox1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form12: TForm12;
  HallID:Integer;

implementation
 uses UMain,UHallChange;
{$R *.dfm}

procedure Tform12.refreshing;
begin
  memo1.Lines.Clear;
  ibquery1.Active:= false;
  ibquery1.Active:= true;
  ibquery1.FetchAll;
end;




procedure TForm12.Button2Click(Sender: TObject);
begin
UHallChange.HallID:=0;
UHallChange.Form9.Show;
end;

procedure TForm12.Button3Click(Sender: TObject);
var i,j,flag:integer;
str:string;
row,col,pll:string;

begin

  ibquery2.SQL.Clear;
  ibquery2.SQL.Add('Update Hall set "ROW_COUNT" = :ROW_COUNT, "COL_COUNT" = :COL_COUNT where HID = :HID');
  ibquery2.ParamByName('ROW_COUNT').AsString:= edit1.Text;
  ibquery2.ParamByName('COL_COUNT').AsString:= edit2.Text;
  ibquery2.ParamByName('HID').AsInteger:= HallID;
  ibquery2.ExecSQL;

  ibquery2.SQL.Clear;
  ibquery2.SQL.Add('DELETE FROM PLACE WHERE HID = :HID');
  ibquery2.ParamByName('HID').AsInteger:= HallID;
  ibquery2.ExecSQL;



  for i:= 0 to memo1.Lines.Count do
  begin
    //showmessage(memo1.Lines[i]);
    str:= memo1.Lines[i];

    if(length(str) > 1) then
    begin
      flag:= 1;
      row:= '';
      col:= '';
      pll:= '';
      for j := 1 to length(str) do
      begin
        if(str[j] = ' ') then
        begin
          flag:= flag + 1;
        end else
        begin
          case flag of
            1: begin row:= row + str[j]; end;
            2: begin col:= col + str[j]; end;
            3: begin pll:= pll + str[j]; end;
         end;
        end;
      end;

      ibquery2.SQL.Clear;
      ibquery2.SQL.Add('INSERT INTO PLACE(HID,PLROW,PLCOL,LENGTHPLACE) VALUES (:HID,:PLROW,:PLCOL,:LENGTHPLACE) ');
      ibquery2.ParamByName('HID').AsInteger:= HallID;
      ibquery2.ParamByName('PLROW').AsString:= row;
      ibquery2.ParamByName('PLCOL').AsString:= col;
      ibquery2.ParamByName('LENGTHPLACE').AsString:= pll;
      ibquery2.ExecSQL;

    end;


  end;




end;

procedure TForm12.DBLookupComboBox1Click(Sender: TObject);
begin
  HallID:= ibquery1.Fields[0].AsInteger;
  edit1.Text:= ibquery1.Fields[3].AsString;
  edit2.Text:= ibquery1.Fields[2].AsString;

  ibquery2.SQL.Clear;
  ibquery2.SQL.Add('select PLID,PLROW,PLCOL,LENGTHPLACE from place where HID = :HID ');
  ibquery2.SQL.Add('order by plrow,plcol');
  ibquery2.ParamByName('HID').AsInteger:= HallID;
  ibquery2.Open;

  memo1.Lines.Clear;
  ibquery2.First;
  while not ibquery2.Eof do
  begin
    memo1.Lines.Add(ibquery2.Fields[1].AsString + ' ' + ibquery2.Fields[2].AsString + ' ' + ibquery2.Fields[3].AsString );
    ibquery2.Next;
  end;




end;

procedure TForm12.FormShow(Sender: TObject);
begin
  edit1.Text:= '';
  edit2.Text:= '';
  refreshing;
end;

end.
