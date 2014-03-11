unit bankpristav_u1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, ToolWin, DB, IBCustomDataSet, IBQuery, IBSQL,
  IBDatabase, StdCtrls, Grids, DBGrids, ADODB,dbf,DateUtils;
  
type
  TForm1 = class(TForm)
    mm1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    tlb1: TToolBar;
    btn1: TToolButton;
    dbgrd1: TDBGrid;
    btn2: TButton;
    lbl2: TLabel;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    mmo1: TMemo;
    btn4: TButton;
    pm1: TPopupMenu;
    test1: TMenuItem;
    CheckBox1: TCheckBox;
    btn3: TButton;
    btn5: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure test1Click(Sender: TObject);
    procedure dbgrd1DblClick(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
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
 //DM.ibtbl1.Active:=false;

//DM.ibtrnsctn1.Commit;
DM.ibtrnsctn1.Active :=False;
DM.ibdtbs1.Close;
end;

procedure TForm1.FormShow(Sender: TObject);
var
   i:integer;
begin
if  not DM.ibdtbs1.Connected then begin
  dm.ibdtbs1.DatabaseName:=ExtractFilePath(application.exename)+'REQ.FDB';
  DM.ibdtbs1.Params.LoadFromFile(ExtractFilePath(application.exename)+'baseparam.txt' );
  dm.ibdtbs1.Open;
  DM.ibtrnsctn1.Active:=True;
 // Dm.ibtbl1.Database:=DM.ibdtbs1;
 // DM.ibtbl1.TableName:='DIVINFO';
  //DM.ibtbl1.Active:=True;

  dm.ibqry1.SQL.Text:='select * from requests'  ;
  dm.ibqry1.Open;
  for i:=0 to dm.ibqry1.Fields.count-1 do begin
    dm.ibqry2.SQL.Clear;
   dm.ibqry2.SQL.Text:='select * from Description where tablename=upper('+quotedStr('Requests')+') and fieldorder='+IntToStr(i);
   DM.ibqry2.Open;

   dm.ibqry1.Fields[i].DisplayLabel:=DM.ibqry2.Fields[2].asString;
   dm.ibqry1.Fields[i].DisplayWidth:=DM.ibqry2.Fields[3].AsInteger;
  end;
  form1.dbgrd1.DataSource:=DM.ds1 ;

end;

end;

procedure TForm1.N4Click(Sender: TObject);
begin
//DM.ibtbl1.First;
//DM.ibtbl1.Edit;
//if form3.ShowModal=mrOk then DM.ibtbl1.Post
//else    DM.ibtbl1.Cancel;
end;

procedure TForm1.btn2Click(Sender: TObject);
 var
    SR:TSearchRec;
    FindRes:Integer;
    path:string;
begin
  //path:=DM.ibtbl1.FieldByName('INPATH').AsString;
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
//     mmo1.Lines.Add(DM.ibtbl1.FieldByName('INPATH').AsString+SR.Name);
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
    //for i:=
Form1.mmo1.Lines.Add('DF3='+IntToStr(Length( Tbl1.GetFieldData(7))))   ;

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


procedure TForm1.test1Click(Sender: TObject);
begin
  mmo1.Lines.Add(form1.dbgrd1.SelectedRows.Items[0]);
end;

procedure TForm1.dbgrd1DblClick(Sender: TObject);
begin
 form2.show;
end;

procedure TForm1.btn3Click(Sender: TObject);
var
tbl1:TDBF;
y,m,d,i,h,mm,ss,ms:word;
st:string;
begin
  DM.ibqry3.SQL.Clear;
  DM.ibqry3.SQL.Text:='select * from answer';
  DM.ibqry3.Open;
  Tbl1:=TDBF.Create(Form1);
  //UNICODE,N,10,0	ID_ZAPR,N,10,0	NUMISP,C,40	DT,D	NUM,C,40	NUMRES,C,40	DTRES,D	RESULT,N,4,0	TEXT,C,253	FILENAME,C,30
  tbl1.AddFieldDefs('UNICODE',bfNumber,10,0);
  tbl1.AddFieldDefs('NUMISP',bfString,40,0 );
  tbl1.AddFieldDefs('DT',bfDate,8,0);
  tbl1.AddFieldDefs('NUM',bfString,40,0 );
  tbl1.AddFieldDefs('NUMRES',bfString,40,0);
  tbl1.AddFieldDefs('DTRES',bfDate,8,0);
  tbl1.AddFieldDefs('RESULT',bfNumber,4,0);
  tbl1.AddFieldDefs('TEXT',bfString,253,0);
  tbl1.AddFieldDefs('FILENAME',bfString,30,0);

  tbl1.TableName:=ExtractFilePath(Application.ExeName)+ 'rez.dbf';

  tbl1.CreateTable;
  tbl1.CodePage:=OEM;
  //tbl1.Append;
  tbl1.Insert;
  for i:=1 to tbl1.FieldCount do begin
  st:='';
  if tbl1.GetFieldType(i)=bfDate then  begin
   DecodeDateTime(DM.ibqry3.Fields[i+1].AsDateTime,y,m,d,h,mm,ss,ms);
   if d<10 then st:=st+'0';
   st:=st+IntToStr(d)+'.';
   if m<10 then st:=st+'0';
   st:=st+intTostr(m)+'.'+IntToStr(y)[3]+InttoStr(y)[4]  ;
   tbl1.SetFieldData(i,st);
  end else
   if   tbl1.GetFieldType(i)=bfString then  begin
    st:=  DM.ibqry3.Fields[i+1].AsString ;
    tbl1.Translate(st,st,True) ;
    tbl1.SetFieldData(i,st);
   end
   else
   tbl1.SetFieldData(i, DM.ibqry3.Fields[i+1].AsString );


  end;
  tbl1.Post;
  tbl1.Close;
end;

procedure TForm1.btn5Click(Sender: TObject);
var
 i:Integer;
 Tbl1:TDBF;
begin

//  dtnow:=Now;
  Tbl1:=TDBF.Create(Form1);
  Tbl1.TableName:= 'C:\bankpristav\In\rz_0902_10.12.2013_1.dbf';
  Tbl1.Open;
  Tbl1.CodePage:=OEM;

//Список полей
  for i:=1 to Tbl1.FieldCount    do
   mmo1.Lines.Add(Tbl1.GetFieldName(i)+':'+tbl1.getfielddata(i)+':'+IntToStr(Length(tbl1.getfielddata(i))) );
end;

end.
