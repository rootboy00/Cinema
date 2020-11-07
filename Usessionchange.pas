unit Usessionchange;

interface

uses
  Windows, Messages, SysUtils, Variants,
  Classes, Graphics,
  Controls, Forms, Dialogs, DBCtrls, StdCtrls, db,
  IBCustomDataSet, IBQuery, IBTable,
  ComCtrls,DateUtils;

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
    Edit2: TEdit;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
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
begin
  if (Edit1.Text[Length(Edit1.Text)] = ',') then
    Edit1.Text := copy(Edit1.Text, 1, Length(Edit1.Text) - 1);



  IBQuery1.SQL.Clear;
  if (SessionID = 0) then
  begin
    // Insert
    IBQuery1.SQL.Add
      ('INSERT INTO SESSION(FID,HID,STIME,SDATE,PRICE) VALUES (:FID,:HID,:STIME,:SDATE:PRICE) ');
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
  IBQuery1.ParamByName('STIME').AsTime := StrtoTIme(edit2.Text);
  IBQuery1.ParamByName('SDATE').AsDate := DatetimePicker1.Date;
  IBQuery1.ParamByName('Price').AsFloat := strtofloat(Edit1.Text);
  IBQuery1.ExecSQL;
  Usession.Form14.refreshing;
  close;
end;

procedure TForm15.Edit2Exit(Sender: TObject);
begin
  try
  StrtoTime(edit2.Text);
  except
  edit2.Text:= Timetostr(now());
  end;

end;

procedure TForm15.FormShow(Sender: TObject);
begin
  ibtable1.Open;
  ibtable2.Open;
  ibtable1.Refresh;
  IBTable2.Refresh;
  IBTable1.FetchAll;
  IBTable2.FetchAll;
  edit2.Text:='';

  DatetimePicker1.Date:= strtodate('01.01.2000');

  Edit1.Text := '';
  Button2.Visible := false;

  if (SessionID = 0) then
  begin
    Button1.Caption := '��������';
  end
  else
  begin
    Button2.Caption := '�������';
    Button1.Caption := '��������';
    Button2.Visible := true;
    IBQuery1.SQL.Clear;
    IBQuery1.SQL.Add
      ('Select FID,HID,STIME,SDATE,PRICE from  SESSION where SID = :SID');
    IBQuery1.ParamByName('SID').AsInteger := SessionID;
    IBQuery1.Open;

    DBLookupComboBox1.KeyValue := IBQuery1.Fields[0].AsInteger;
    DBLookupComboBox2.KeyValue := IBQuery1.Fields[1].AsInteger;
    edit2.Text := Timetostr(IBQuery1.Fields[2].AsDateTime);
    DatetimePicker1.Date := IBQuery1.Fields[3].AsDateTime;
    Edit1.Text := IBQuery1.Fields[4].AsString;

  end;

end;

end.
