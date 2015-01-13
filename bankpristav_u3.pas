unit bankpristav_u3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, ComCtrls, ShellCtrls, Buttons;

type
  TForm3 = class(TForm)
    btn1: TButton;
    dlgOpen1: TOpenDialog;
    ListBox1: TListBox;
    ListBox2: TListBox;
    BitBtn1: TBitBtn;
    procedure dbedtINPATHDblClick(Sender: TObject);
    procedure dbedtINARCPATHDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
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
  // if form3.dlgOpen1.Execute then  Form3.dbedtINPATH.Text:=ExtractFilePath(form3.dlgOpen1.FileName);
end;

procedure TForm3.dbedtINARCPATHDblClick(Sender: TObject);
begin
   //  if form3.dlgOpen1.Execute then  Form3.dbedtINARCPATH.Text:=ExtractFilePath(form3.dlgOpen1.FileName);
end;

procedure TForm3.FormShow(Sender: TObject);
begin
 //
  //form3.dlgOpen1.InitialDir:=ExtractFileDir(Application.ExeName)
end;

procedure TForm3.BitBtn1Click(Sender: TObject);
 var
   i:integer;
begin
 //listbox2.Items.
 for i:=0 to  listbox1.Items.Count-1 do
  if listbox1.Selected[i] then listbox2.Items.Add(listbox1.Items[i]) ;
end;

end.
