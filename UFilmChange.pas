unit UFilmChange;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.WinXPickers, Vcl.DBCtrls,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls, Data.DB, IBX.IBCustomDataSet,PngImage,
  IBX.IBQuery, IBX.IBTable,shellapi;

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
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form7: TForm7;
  FilmID:integer;
  Image_name:string;

implementation
  uses umain,Ufilm;
{$R *.dfm}

procedure TForm7.Button2Click(Sender: TObject);
begin
  if(image_name = '') then image_name:='none.png';
  ibquery1.SQL.Clear;
  if(FilmID <> 0) then
  begin
  //Update
  ibquery1.SQL.Add('Update FILM set CID = :CID, GID = :GID, Name = :NAME, AGELIMIT = :AGILIMIT, START_DATE = :START_DATE, ');
  ibquery1.SQL.Add('END_DATE = :END_DATE,TIMING = :TIMING, DESCRIPTION = :DESCRIPTION, IMAGE_NAME = :IMAGE_NAME WHERE FID = :FID');
  ibquery1.ParamByName('FID').AsInteger:= FilmID;
  end else
  begin
    ibquery1.SQL.Add('INSERT INTO FILM(CID,GID,NAME,AGELIMIT,START_DATE,END_DATE,TIMING,DESCRIPTION,IMAGE_NAME) VALUES ');
    ibquery1.SQL.Add(' (:CID,:GID,:NAME,:AGILIMIT,:START_DATE,:END_DATE,:TIMING,:DESCRIPTION,:IMAGE_NAME) ');


  end;

  ibquery1.ParamByName('CID').AsInteger:= dblookupcombobox1.KeyValue;
  ibquery1.ParamByName('GID').AsInteger:= dblookupcombobox2.KeyValue;
  ibquery1.ParamByName('NAME').AsString:= Name.text;
  ibquery1.ParamByName('AGILIMIT').AsInteger:= Strtoint(Age_limit.Text);
  ibquery1.ParamByName('START_DATE').AsDateTime:= DateTimePicker2.Date;
  ibquery1.ParamByName('END_DATE').AsDateTime:= DateTimePicker1.Date;
  ibquery1.ParamByName('TIMING').AsInteger:= Strtoint(TIMING.Text);
  ibquery1.ParamByName('DESCRIPTION').AsString:= description.Text;
  ibquery1.ParamByName('IMAGE_NAME').AsString:= image_name;
  ibquery1.ExecSQL;
  Ufilm.Form6.refreshing;
  close;
end;

procedure TForm7.Button3Click(Sender: TObject);
begin
  ibquery1.SQL.Clear;
  ibquery1.SQL.Add('Delete from film where FID = :FID');
  ibquery1.ParamByName('FID').AsInteger:= filmid;
  ibquery1.ExecSQL;
  Ufilm.Form6.refreshing;
  close;
end;

procedure TForm7.Button4Click(Sender: TObject);
var OpenDialog:TopenDialog;
begin
//��������� � ������� ������
Opendialog:= TOpenDialog.Create(self);
opendialog.InitialDir:= getcurrentdir + '\IMG';
opendialog.Filter:= 'Picture | *.png';
if( opendialog.Execute()) then begin
  image_name:= opendialog.FileName;
  image_name:= extractfilename(image_name);
end else
begin
  image_name:= 'none.png';
end;
opendialog.Free;

image1.Picture.LoadFromFile('IMG/'+Image_name);
end;

procedure TForm7.FormShow(Sender: TObject);
begin

  Name.Text:='';
  Description.Text:='';
  Age_limit.Text:='0';
  timing.Text:='0';
  Dblookupcombobox1.KeyValue:= -1;
  Dblookupcombobox2.KeyValue:= -1;
  DateTimePicker1.Date:= Date;
  DateTimePicker1.Date:= Date;


  ibtable1.Refresh;
  ibtable2.Refresh;
  ibtable1.FetchAll;
  ibtable2.FetchAll;
  button3.Visible:= false;
  button2.Caption:= '��������';


  if(FilmID <> 0) then
  begin
    ibquery1.SQL.Clear;
    ibquery1.SQL.Add('select Name,CID,GID,AGELIMIT,START_DATE,END_DATE,TIMING,DESCRIPTION,IMAGE_NAME from film where FID = :FID ');
    ibquery1.ParamByName('FID').AsInteger:= FilmID;
    ibquery1.Open;
    name.text:= ibquery1.Fields[0].AsString;
    dblookupcombobox1.KeyValue:= ibquery1.Fields[1].AsString;
    dblookupcombobox2.KeyValue:= ibquery1.Fields[2].AsString;
    AGE_LIMIT.Text:= ibquery1.Fields[3].AsString;
    DateTimePicker2.Date:= ibquery1.Fields[4].AsDateTime;
    DateTimePicker1.Date:= ibquery1.Fields[5].AsDateTime;
    timing.Text:= ibquery1.Fields[6].AsString;
    Description.Text:= ibquery1.Fields[7].AsString;
    Image_name:= ibquery1.Fields[8].AsString;
    button3.Visible:= true;
    button2.Caption:= '��������';

    if(FileExists('IMG/'+Image_name)) then  image1.Picture.LoadFromFile('IMG/'+Image_name);
  end else
  begin
  image1.Picture.LoadFromFile('IMG/none.png');
  end;

end;

end.