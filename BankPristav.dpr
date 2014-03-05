program BankPristav;

uses
  Forms,
  bankpristav_u1 in 'bankpristav_u1.pas' {Form1},
  bankpristav_dm in 'bankpristav_dm.pas' {DM: TDataModule},
  bankpristav_u2 in 'bankpristav_u2.pas' {Form2},
  bankpristav_u3 in 'bankpristav_u3.pas' {Form3};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.
