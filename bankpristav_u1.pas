unit bankpristav_u1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, ToolWin, DB, IBCustomDataSet, IBQuery, IBSQL,
  IBDatabase, StdCtrls, Grids, DBGrids, ADODB,dbf;
    function Getgenerator(genname:string):Integer;
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
    btn4: TButton;
    pm1: TPopupMenu;
    test1: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure test1Click(Sender: TObject);
    procedure dbgrd1DblClick(Sender: TObject);
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

uses bankpristav_dm, bankpristav_u3, bankpristav_u2;



{$R *.dfm}

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 DM.ibtbl1.Active:=false;

//DM.ibtrnsctn1.Commit;
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
     //LoadDBF(DM.ibtbl1.FieldByName('INPATH').AsString+SR.Name);

     FindRes:=FindNext(SR);
      end;
end;

procedure LoadDBF(Filename:String);
 var
   i:Integer;
   pk,packed_id:integer;
   dtnow:TDate;
   Tbl1:TDBF;
   flstr,sq,sqlstr:AnsiString;

begin
  pk:=0;
  dtnow:=Now;
  Tbl1:=TDBF.Create(Form1);
  packed_id:= Getgenerator('PK_PACKETS');
  Form1.mmo1.Lines.Add('PK='+ IntToStr(pk)) ;
  Tbl1.TableName:= FileName;
  Tbl1.Open;
  Tbl1.CodePage:=OEM;
  form1.Caption:=IntToStr( Tbl1.RecordCount );
//Список полей
  for i:=1 to Tbl1.FieldCount    do
    Form1.mmo1.lines.Add(Tbl1.GetFieldName(i))    ;
    //Tbl1.get
   sqlstr:='INSERT INTO REQUESTS (PK, PACKET_ID, FILENAME, UNICODE, ORGAN, FIOISP, NUMISP, DT, NUM, FIZUR, FIOORG, DATE_R, ADRESS, PASSPORT, SUMM, PROCESSED, ANSWERID, DATELOAD) VALUES (';
  sq:=sqlstr;
  repeat
    pk:=getgenerator('PK_REQUESTS') ;
    sq:=sq+InttoStr(pk)+', '+IntToStr(packed_id)+', '+quotedstr( ExtractFileName(filename))+', ';
    for i:=1 to Tbl1.FieldCount    do begin
      if Tbl1.GetFieldType(i) in [bfBoolean, bfNumber, bfFloat] then   begin
       flstr:= StringReplace(Tbl1.GetFieldData(i), ',', '.', [rfReplaceAll, rfIgnoreCase]);
       sq:=sq+flstr+', ';
       end
       else begin
      flstr:=Tbl1.getfielddata(i);
      if Length(flstr)>0 then
       sq:=sq+ QuotedStr(flstr )+', '
      else
       sq:=sq+'Null, '
       end
    end;
    sq:=sq+'NULL, NULL, '+quotedstr(DateToStr(dtnow))+' )';
    Tbl1.next;
    Form1.mmo1.Lines.add(sq);
    dm.ibqry2.SQL.Text:=sq;
    Dm.ibtrnsctn1.Active:=true;
    DM.ibqry2.ExecSQL;
    DM.ibtrnsctn1.Commit;
    DM.ibqry2.close;
    sq:=sqlstr;
  until Tbl1.Eof;
Form1.mmo1.Lines.Add(Tbl1.GetFieldData(9))   ;

Tbl1.Close;
Form1.mmo1.Lines.Add(DateToStr(dtnow));
Form1.mmo1.Lines.Add(intToStr(packed_id));
end;
//procedure LoadDBF (File)

procedure TForm1.btn4Click(Sender: TObject);
begin
Form1.mmo1.Lines.Add('!')  ;
//if DM.ibdtbs1.Connected then   Form1.mmo1.Lines.Add('con')
LoadDBF('C:\bankpristav\In\rz_0902_10.12.2013_1.dbf');


end;

procedure TForm1.btn3Click(Sender: TObject);
var
  i:integer;
begin
form1.dbgrd1.DataSource:=DM.ds1 ;
dm.ibqry1.SQL.Text:='select * from requests'  ;
dm.ibqry1.Open;

for i:=0 to DM.ibqry1.Fields.Count-1 do  begin
 dm.ibqry1.Fields[i].DisplayWidth:=20;
// dm.ibqry1.Fields[i].s`
 end;
end;
function Getgenerator(genname:string):Integer;
 begin
   dm.ibqry2.SQL.Clear;
  dm.ibqry2.SQL.Text:='SELECT GEN_ID('+genname+', 1) FROM RDB$DATABASE';
  DM.ibqry2.Open;
  Getgenerator:= dm.IBQry2.Fields[0].AsInteger;
 DM.ibqry2.Close;

 end;
procedure TForm1.test1Click(Sender: TObject);
begin
  mmo1.Lines.Add(form1.dbgrd1.SelectedRows.Items[0]);
end;

procedure TForm1.dbgrd1DblClick(Sender: TObject);
begin
 form2.show;
end;

end.
