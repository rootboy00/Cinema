unit Usessionchange;

interface

uses
  Windows, Messages, SysUtils, Variants,
  Classes, Graphics,
  Controls, Forms, Dialogs, DBCtrls, StdCtrls, db,
  IBCustomDataSet, IBQuery, IBTable,
  ComCtrls,DateUtils, Mask, Vcl.Grids, Vcl.DBGrids;

type
  TForm15 = class(TForm)
    DBLookupComboBox1: TDBLookupComboBox;
    IBQuery1: TIBQuery;
    Button1: TButton;
    Button2: TButton;
    IBTable1: TIBTable;
    IBTable2: TIBTable;
    DBLookupComboBox2: TDBLookupComboBox;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Edit1: TEdit;
    DateTimePicker1: TDateTimePicker;
    Label5: TLabel;
    MaskEdit1: TMaskEdit;
    DataSource3: TDataSource;
    IBQuery2: TIBQuery;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form15: TForm15;
  SessionID: integer;

implementation

uses UMain, Usession;
{$R *.dfm}

procedure TForm15.Button1Click(Sender: TObject);
var StartTime:TDateTime;
    Timing:Integer;
    hour,min:word;
    EndTime:TDateTime;
    SubStartTime,SubEndTime:TDateTime;
begin
  ibquery2.SQL.Clear;
  ibquery2.SQL.Add('select Timing from FILM where FID = :FID');
  ibquery2.ParamByName('FID').AsInteger:= dblookupcombobox1.KeyValue;
  IBQuery2.Open;

  Timing:= ibquery2.Fields[0].AsInteger;
  hour:= Timing div 60;
  min:= Timing mod 60;
  SubStartTime:= StrtoTIme( maskedit1.Text);
  SubEndTime:= SubStartTime + EncodeTime(Hour,min,0,0);


  ibquery2.SQL.Clear;
  ibquery2.SQL.Add('select STIME,TIMING from Session inner join FILM on (FILM.FID = SESSION.FID) where HID = :HID and SDATE = :SDATE ');
  ibquery2.ParamByName('HID').AsInteger:= dblookupcombobox2.KeyValue;
  ibquery2.ParamByName('SDATE').AsDate:= DatetimePicker1.Date;
  ibquery2.Open;


  if( not (ibquery2.IsEmpty)) then
  begin

    ibquery2.First;
    while not( ibquery2.Eof  ) do
    begin
       StartTime:= ibquery2.Fields[0].AsDateTime;
       Timing:= ibquery2.Fields[1].AsInteger;
       hour:= Timing div 60;
       min:= Timing mod 60;
       EndTime:= Starttime + EncodeTime(Hour,min,0,0);

       if( ((SubStartTime >= StartTime) and (SUbStartTime <= EndTime )) or ((SubEndTime >= StartTime) and (SUbEndTime <= EndTime ))) then
       begin

       showmessage('??????, ?? ?? ????????? ???????? ??????? ???????. ?????? ??? ?????!');
       exit;
       end; ;



      //memo1.Lines.Add( Inttostr(ibquery2.Fields[1].AsInteger) );



    ibquery2.Next;
    end;
  end;


  if (Edit1.Text[Length(Edit1.Text)] = ',') then
    Edit1.Text := copy(Edit1.Text, 1, Length(Edit1.Text) - 1);

  IBQuery1.SQL.Clear;
  if (SessionID = 0) then
  begin
    // Insert
    IBQuery1.SQL.Add('INSERT INTO SESSION(FID,HID,STIME,SDATE,PRICE) VALUES (:FID,:HID,:STIME,:SDATE,:PRICE) ');
  end
  else
  begin
    // Update
    IBQuery1.SQL.Add
      ('UPDATE SESSION SET FID = :FID, HID = :HID, STIME = :STIME, SDATE = :SDATE, PRICE = :PRICE where SID = :SID');
    IBQuery1.ParamByName('SID').AsInteger := SessionID;
  end;
  IBQuery1.ParamByName('FID').AsInteger := DBLookupComboBox1.KeyValue;
  IBQuery1.ParamByName('HID').AsInteger := DBLookupComboBox2.KeyValue;
  IBQuery1.ParamByName('STIME').AsTime := StrtoTIme(maskedit1.Text);
  IBQuery1.ParamByName('SDATE').AsDate := DatetimePicker1.Date;
  IBQuery1.ParamByName('Price').AsFloat := strtofloat(Edit1.Text);
  IBQuery1.ExecSQL;
  Usession.Form14.refreshing;
  close;
end;

procedure TForm15.Button2Click(Sender: TObject);
begin
ibquery1.SQL.Clear;
ibquery1.SQL.Add('DELETE FROM SESSION WHERE SID = :SID');
ibquery1.ParamByName('SID').AsInteger:= SessionID;
ibquery1.ExecSQL;
Usession.Form14.refreshing;
close;
end;

procedure TForm15.FormShow(Sender: TObject);
var mask:string;
begin
  ibtable1.Open;
  ibtable2.Open;
  ibtable1.Refresh;
  IBTable2.Refresh;
  IBTable1.FetchAll;
  IBTable2.FetchAll;
  maskedit1.Text:='';

  DatetimePicker1.Date:= strtodate('01.01.2000');

  Edit1.Text := '';
  Button2.Visible := false;

  if (SessionID = 0) then
  begin
    Button1.Caption := '????????';
  end
  else
  begin
    Button2.Caption := '???????';
    Button1.Caption := '????????';
    Button2.Visible := true;
    IBQuery1.SQL.Clear;
    IBQuery1.SQL.Add('Select FID,HID,STIME,SDATE,PRICE from  SESSION where SID = :SID');
    IBQuery1.ParamByName('SID').AsInteger := SessionID;
    IBQuery1.Open;

    DBLookupComboBox1.KeyValue := IBQuery1.Fields[0].AsInteger;
    DBLookupComboBox2.KeyValue := IBQuery1.Fields[1].AsInteger;
    mask:= copy(ibquery1.Fields[2].asstring,1,length(ibquery1.Fields[2].asstring)-3);
    if( length(mask) < 5 ) then mask:= '0' + mask;
    maskedit1.Text:= mask;
    DatetimePicker1.Date := IBQuery1.Fields[3].AsDateTime;
    Edit1.Text := IBQuery1.Fields[4].AsString;

  end;

end;

end.
