program Project1;

uses
  Forms,
  UMain in 'UMain.pas' {Form1},
  UCountry in 'UCountry.pas' {Form2},
  UCountryChange in 'UCountryChange.pas' {Form3},
  UGenre in 'UGenre.pas' {Genre},
  UHall in 'UHall.pas' {Form8},
  UHallChange in 'UHallChange.pas' {Form9},
  UPeople in 'UPeople.pas' {Form10},
  Uplaceshow in 'Uplaceshow.pas' {Form13},
  Usession in 'Usession.pas' {Form14},
  Usessionchange in 'Usessionchange.pas' {Form15},
  Utickets in 'Utickets.pas' {Form16},
  Uticketschange in 'Uticketschange.pas' {Form17},
  Utypepeople in 'Utypepeople.pas' {Form18},
  Utypepeoplechange in 'Utypepeoplechange.pas' {Form19},
  Uworkspeople in 'Uworkspeople.pas' {Form20},
  Uworkspeoplechange in 'Uworkspeoplechange.pas' {Form21},
  UPeopleChange in 'UPeopleChange.pas' {Form11},
  ColorButton in 'ColorButton.pas',
  UFilm in 'UFilm.pas' {Form4},
  UGenreChange in 'UGenreChange.pas' {Form5},
  Uplace in 'Uplace.pas' {Form6},
  UFilmChange in 'UFilmChange.pas' {Form7},
  Uplacechange in 'Uplacechange.pas' {Form12},
  UFilmShow in 'UFilmShow.pas' {Form22};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TGenre, Genre);
  Application.CreateForm(TForm8, Form8);
  Application.CreateForm(TForm9, Form9);
  Application.CreateForm(TForm10, Form10);
  Application.CreateForm(TForm13, Form13);
  Application.CreateForm(TForm14, Form14);
  Application.CreateForm(TForm15, Form15);
  Application.CreateForm(TForm16, Form16);
  Application.CreateForm(TForm17, Form17);
  Application.CreateForm(TForm18, Form18);
  Application.CreateForm(TForm19, Form19);
  Application.CreateForm(TForm20, Form20);
  Application.CreateForm(TForm21, Form21);
  Application.CreateForm(TForm11, Form11);
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TForm5, Form5);
  Application.CreateForm(TForm6, Form6);
  Application.CreateForm(TForm7, Form7);
  Application.CreateForm(TForm12, Form12);
  Application.CreateForm(TForm22, Form22);
  Application.Run;

end.
