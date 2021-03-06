unit UFilmChange;

interface

uses
  SysUtils, forms, shellapi, DB, IBTable, IBCustomDataSet, IBQuery,
  StdCtrls, ComCtrls, Controls, DBCtrls, Classes, ExtCtrls,FileCtrl, Dialogs, Graphics, jpeg;

type
  TForm7 = class(TForm)
    Name: TEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    Description: TEdit;
    Age_Limit: TEdit;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Image1: TImage;
    Timing: TEdit;
    Button2: TButton;
    Button3: TButton;
    IBQuery1: TIBQuery;
    IBTable1: TIBTable;
    IBTable2: TIBTable;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    Button4: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure refreshing;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form7: TForm7;
  FilmID: integer;
  Image_name: string;

implementation

uses umain, Ufilm;
{$R *.dfm}




procedure Tform7.refreshing;
begin
 ibtable1.Active:= false;
 IbTable1.Active:= true;
 ibtable2.Active:= false;
 IbTable2.Active:= true;


end;


procedure TForm7.Button2Click(Sender: TObject);
begin
  if (Image_name = '') then
    Image_name := 'none.png';
  IBQuery1.SQL.Clear;
  if (FilmID <> 0) then
  begin
    // Update
    IBQuery1.SQL.Add
      ('Update FILM set CID = :CID, GID = :GID, Name = :NAME, AGELIMIT = :AGILIMIT, START_DATE = :START_DATE, ');
    IBQuery1.SQL.Add
      ('END_DATE = :END_DATE,TIMING = :TIMING, DESCRIPTION = :DESCRIPTION, IMAGE_NAME = :IMAGE_NAME WHERE FID = :FID');
    IBQuery1.ParamByName('FID').AsInteger := FilmID;
  end
  else
  begin
    IBQuery1.SQL.Add
      ('INSERT INTO FILM(CID,GID,NAME,AGELIMIT,START_DATE,END_DATE,TIMING,DESCRIPTION,IMAGE_NAME) VALUES ');
    IBQuery1.SQL.Add
      (' (:CID,:GID,:NAME,:AGILIMIT,:START_DATE,:END_DATE,:TIMING,:DESCRIPTION,:IMAGE_NAME) ');

  end;

  IBQuery1.ParamByName('CID').AsInteger := DBLookupComboBox1.KeyValue;
  IBQuery1.ParamByName('GID').AsInteger := DBLookupComboBox2.KeyValue;
  IBQuery1.ParamByName('NAME').AsString := Name.text;
  IBQuery1.ParamByName('AGILIMIT').AsInteger := Strtoint(Age_Limit.text);
  IBQuery1.ParamByName('START_DATE').AsDateTime := DateTimePicker2.Date;
  IBQuery1.ParamByName('END_DATE').AsDateTime := DateTimePicker1.Date;
  IBQuery1.ParamByName('TIMING').AsInteger := Strtoint(Timing.text);
  IBQuery1.ParamByName('DESCRIPTION').AsString := Description.text;
  IBQuery1.ParamByName('IMAGE_NAME').AsString := Image_name;
  IBQuery1.ExecSQL;
  Ufilm.Form4.refreshing;
  close;
end;

procedure TForm7.Button3Click(Sender: TObject);
begin
  IBQuery1.SQL.Clear;
  IBQuery1.SQL.Add('Delete from film where FID = :FID');
  IBQuery1.ParamByName('FID').AsInteger := FilmID;
  IBQuery1.ExecSQL;
  Ufilm.Form4.refreshing;
  close;
end;

procedure TForm7.Button4Click(Sender: TObject);
var
  OpenDialog:TopenDialog;
begin
  // ????????? ? ??????? ??????
  OpenDialog:= TopenDialog.Create(self);
  OpenDialog.InitialDir := getcurrentdir + '\IMG';
  OpenDialog.Filter := 'Picture | *.jpg';
  if (OpenDialog.Execute()) then
  begin
    Image_name := OpenDialog.FileName;
    Image_name := extractfilename(Image_name);
  end
  else
  begin
    Image_name := 'none.png';
  end;
  OpenDialog.Free;

  Image1.Picture.LoadFromFile('IMG/' + Image_name);
end;

procedure TForm7.FormCreate(Sender: TObject);
begin
  refreshing;
end;

Procedure TForm7.FormShow(Sender: TObject);
begin

  ibtable1.Active:= true;
  ibtable2.Active:= true;

  Name.text := '';
  Description.text := '';
  Age_Limit.text := '0';
  Timing.text := '0';
  DBLookupComboBox1.KeyValue := -1;
  DBLookupComboBox2.KeyValue := -1;
  DateTimePicker1.Date := Date;
  DateTimePicker1.Date := Date;


  IBTable1.FetchAll;
  IBTable2.FetchAll;
  Button3.Visible := false;
  Button2.Caption := '????????';
  UFilmChange.Form7.Caption:= '???????? ?????';

  if (FilmID <> 0) then
  begin
    IBQuery1.SQL.Clear;
    IBQuery1.SQL.Add
      ('select Name,CID,GID,AGELIMIT,START_DATE,END_DATE,TIMING,DESCRIPTION,IMAGE_NAME from film where FID = :FID ');
    IBQuery1.ParamByName('FID').AsInteger := FilmID;
    IBQuery1.Open;
    name.text := IBQuery1.Fields[0].AsString;
    DBLookupComboBox1.KeyValue := IBQuery1.Fields[1].AsString;
    DBLookupComboBox2.KeyValue := IBQuery1.Fields[2].AsString;
    Age_Limit.text := IBQuery1.Fields[3].AsString;
    DateTimePicker2.Date := IBQuery1.Fields[4].AsDateTime;
    DateTimePicker1.Date := IBQuery1.Fields[5].AsDateTime;
    Timing.text := IBQuery1.Fields[6].AsString;
    Description.text := IBQuery1.Fields[7].AsString;
    Image_name := IBQuery1.Fields[8].AsString;
    Button3.Visible := true;
    Button2.Caption := '????????';
    UFilmChange.Form7.Caption:= '???????? ????? (' + name.Text + ')';

    if (FileExists('IMG/' + Image_name)) then
      Image1.Picture.LoadFromFile('IMG/' + Image_name);
  end
  else
  begin
    Image1.Picture.LoadFromFile('IMG/none.jpg');
  end;

end;

end.
