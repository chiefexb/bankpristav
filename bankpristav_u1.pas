unit bankpristav_u1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, ToolWin, DB, IBCustomDataSet, IBQuery, IBSQL,
  IBDatabase, StdCtrls, Grids, DBGrids, ADODB,dbf;

type
  TForm1 = class(TForm)
    mm1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    tlb1: TToolBar;
    btn1: TToolButton;
    dbgrd1: TDBGrid;
    btn2: TButton;
    lbl1: TLabel;
    lbl2: TLabel;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    mmo1: TMemo;
    btn3: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    //procedure btn3Click(Sender: TObject);
     //procedure LoadDBF(Filename:String);

  private
    { Private declarations }
  public
    { Public declarations }


  end;

var

  Form1: TForm1;

    procedure LoadDBF(Filename:String);
implementation

uses bankpristav_dm, bankpristav_u3;



{$R *.dfm}

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 DM.ibtbl1.Active:=false;

DM.ibtrnsctn1.Commit;
DM.ibtrnsctn1.Active :=False;
DM.ibdtbs1.Close;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
if  not DM.ibdtbs1.Connected then begin
  dm.ibdtbs1.DatabaseName:=ExtractFilePath(application.exename)+'REQ.FDB';
  DM.ibdtbs1.Params.LoadFromFile(ExtractFilePath(application.exename)+'baseparam.txt' );
  dm.ibdtbs1.Open;
  DM.ibtrnsctn1.Active:=True;
  Dm.ibtbl1.Database:=DM.ibdtbs1;
  DM.ibtbl1.TableName:='DIVINFO';
  DM.ibtbl1.Active:=True;
end;

end;

procedure TForm1.N4Click(Sender: TObject);
begin
DM.ibtbl1.First;
DM.ibtbl1.Edit;
if form3.ShowModal=mrOk then DM.ibtbl1.Post
else    DM.ibtbl1.Cancel;
end;

procedure TForm1.btn2Click(Sender: TObject);
 var
    SR:TSearchRec;
    FindRes:Integer;
    path:string;
begin
  path:=DM.ibtbl1.FieldByName('INPATH').AsString;
     mmo1.Lines.Clear;
FindRes:=FindFirst(path+'*.*',faAnyFile,SR);
While FindRes=0 do
   begin
      if ((SR.Attr and faDirectory)=faDirectory) and
      ((SR.Name='.')or(SR.Name='..')) then
         begin
            FindRes:=FindNext(SR);
            Continue;
         end;

    { SR.Name:=fname;
     AssignFile(f, fname);
     Reset(f);
     while not eof(f) do
     ReadLn(f, s); }
     mmo1.Lines.Add(DM.ibtbl1.FieldByName('INPATH').AsString+SR.Name);
     LoadDBF(DM.ibtbl1.FieldByName('INPATH').AsString+SR.Name);

     FindRes:=FindNext(SR);
      end;
end;

procedure LoadDBF(Filename:String);
 var
   i:Integer;
   Tbl1:TDBF;
begin
     Tbl1:=TDBF.Create(Form1);

 // Tbl1.TableName:=DM.ibtbl1.FieldByName('INPATH').AsString+ mmo1.Lines[0];Tbl1.
 Tbl1.TableName:= FileName;


Tbl1.Open;
Tbl1.CodePage:=OEM;
form1.Caption:=IntToStr( Tbl1.RecordCount );
//Список полей
  for i:=1 to Tbl1.FieldCount    do
    Form1.mmo1.lines.Add(Tbl1.GetFieldName(i))    ;
    //Tbl1.get
Form1.mmo1.Lines.Add(Tbl1.GetFieldData(9))   ;

Tbl1.Close;

end;
//procedure LoadDBF (File)

end.
