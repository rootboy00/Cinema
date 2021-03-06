unit UFilmShow;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, IBX.IBCustomDataSet, IBX.IBQuery;

type
  TForm22 = class(TForm)
    Label2: TLabel;
    Image1: TImage;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DBGrid2: TDBGrid;
    Memo1: TMemo;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit6: TEdit;
    Label6: TLabel;
    IBQuery1: TIBQuery;
    DataSource1: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure DBGrid2CellClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form22: TForm22;
  FilmID:integer;

implementation
 uses UMain,UPlaceShow;
{$R *.dfm}

procedure TForm22.DBGrid2CellClick(Column: TColumn);
begin
  UPlaceShow.SID:= dbgrid2.Fields[0].AsInteger;
  UPlaceShow.HID:= dbgrid2.Fields[1].AsInteger;
  UPlaceShow.Form13.Show;
end;

procedure TForm22.FormShow(Sender: TObject);
begin
  ibquery1.SQL.Clear;
  ibquery1.SQL.Add('Select c.name,g.name,f.name,agelimit,timing,description,image_name');
  ibquery1.SQL.Add('FROM FILM AS F ');
  ibquery1.SQL.Add('INNER JOIN COUNTRY AS C ON (C.CID = F.CID) ');
  ibquery1.SQL.Add('INNER JOIN GENRE AS G ON (G.GID = F.GID) ');
  ibquery1.SQL.Add('WHERE FID = :FID');
  ibquery1.ParamByName('FID').AsInteger:= FilmID;
  ibquery1.Open;

  edit2.Text:= ibquery1.Fields[0].AsString + ' [' + ibquery1.Fields[3].AsString + '+]';
  edit3.Text:= ibquery1.Fields[1].AsString;
  edit4.Text:= ibquery1.Fields[2].AsString;


  edit6.Text:= ibquery1.Fields[4].AsString + ' ?????';
  memo1.Text:= ibquery1.Fields[5].AsString;

  image1.Picture.LoadFromFile('IMG/' + ibquery1.Fields[6].AsString);

  ibquery1.SQL.Clear;
  ibquery1.SQL.Add('select count(*) from session where FID = :FID');
  ibquery1.ParamByName('FID').AsInteger:= FilmID;
  ibquery1.Open;

  if( ibquery1.Fields[0].AsInteger = 0 ) then
  begin
  end else
  begin
    ibquery1.SQL.Clear;
    ibquery1.SQL.Add('select SID,h.hid,h.name,s.stime,s.sdate,price ');
    ibquery1.SQL.Add('from session as s ');
    ibquery1.SQL.Add('Inner join HALL as h on (h.HID = s.HID) ');
    ibquery1.SQL.Add('where FID = :FID and s.sdate >= :Date ');
    ibquery1.ParamByName('FID').AsInteger:= FilmID;
    ibquery1.ParamByName('Date').AsDate:= NOW();
    ibquery1.Open;
  end;


end;

end.
