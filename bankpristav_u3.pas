unit bankpristav_u3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, ComCtrls, ShellCtrls;

type
  TForm3 = class(TForm)
    btn1: TButton;
    Label1: TLabel;
    dbedtINPATH: TDBEdit;
    Label2: TLabel;
    dlgOpen1: TOpenDialog;
    dbedtINARCPATH: TDBEdit;
    procedure dbedtINPATHDblClick(Sender: TObject);
    procedure dbedtINARCPATHDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

procedure TForm3.dbedtINPATHDblClick(Sender: TObject);
begin
   if form3.dlgOpen1.Execute then  Form3.dbedtINPATH.Text:=ExtractFilePath(form3.dlgOpen1.FileName);
end;

procedure TForm3.dbedtINARCPATHDblClick(Sender: TObject);
begin
     if form3.dlgOpen1.Execute then  Form3.dbedtINARCPATH.Text:=ExtractFilePath(form3.dlgOpen1.FileName);
end;

procedure TForm3.FormShow(Sender: TObject);
begin
Form3.dlgOpen1.InitialDir:=ExtractFileDir(Application.ExeName)
end;

end.
