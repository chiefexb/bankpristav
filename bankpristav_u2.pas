unit bankpristav_u2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ToolWin, ComCtrls, StdCtrls,StrUtils, Buttons;

type
  TForm2 = class(TForm)
    mmo1: TMemo;
    mmo2: TMemo;
    dbgrd1: TDBGrid;
    dbgrd2: TDBGrid;
    btn2: TBitBtn;
    btn3: TBitBtn;
    edt1: TEdit;
    edt2: TEdit;
    cbb1: TComboBox;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    btn1: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
  

implementation

uses bankpristav_dm;

{$R *.dfm}

procedure TForm2.FormShow(Sender: TObject);
 var
   i:Integer;
   s:AnsiString;
begin
  //Form2.mmo1.Lines.Add(IntToStr(dm.ibqry1.RecNo));
   s:='';
   mmo1.Lines.Clear;
  for i:=0 to dm.ibqry1.Fields.Count-1 do  begin
  dm.ibqry2.SQL.Clear;
  dm.ibqry2.SQL.Text:='select * from descr where tablename=upper('+quotedStr('Requests')+') and fieldorder='+IntToStr(i);
  DM.ibqry2.Open;
    mmo1.Lines.Add(DM.ibqry2.Fields[2].asString+':'+dupestring(' ',20-length(DM.ibqry2.Fields[2].asString))+dm.ibqry1.Fields[i].AsString ) ;
  //mo1.Lines.Add(dm.ibqry1.Fields[i].Displayt+':'+dm.ibqry1.Fields[i].AsString);
   // s:=s+dm.ibqry1.Fields[i].AsString+', ';
  end;
  //
  DM.ibqry3.SQL.Clear;
 DM.ibqry3.SQL.Text:='select * from answer where id_zapr='+(DM.ibqry1.FieldByName('PK').asString);

 DM.ibqry3.Open;
 form2.dbgrd1.DataSource:=DM.ds3;
  DM.ibqry4.SQL.Clear;
 DM.ibqry4.SQL.Text:='select * from acc_data';
 DM.ibqry4.Open;
 form2.dbgrd2.DataSource:=DM.ds4;

end;

procedure TForm2.btn3Click(Sender: TObject);
var
  pkans:Integer;
  sql,sq:AnsiString;
begin
 pkans:=Getgenerator('PK_ANSWER'); //PK_ACC_DATA
 sql:='INSERT INTO ANSWER (PK, UNICODE, ID_ZAPR, NUMISP, DT, NUM, NUMRES, DTRES, RESULT, TEXT, FILENAME) VALUES (';
  sq:=sql;
  sq:=sq+IntToStr(pkans)+', ';

  sq:=sq+(DM.ibqry1.FieldByName('UNICODE').asString)+', '   ;
  sq:=sq+(DM.ibqry1.FieldByName('PK').asString)+', '   ;
  sq:=sq+quotedstr(DM.ibqry1.FieldByName('NUMISP').asString)+', '   ;
  sq:=sq+quotedstr(DM.ibqry1.FieldByName('DT').asString)+', '   ;
  sq:=sq+quotedstr(DM.ibqry1.FieldByName('NUM').asString)+', '   ;
  sq:=sq+QuotedStr('/')+', ';
  sq:=sq+QuotedStr(DateToStr(now))+', ';
  sq:=sq+intToStr(1)+', ';
  sq:=sq+QuotedStr('Нет счетов')+', Null)' ;
  mmo2.Lines.Add(sq) ;
  DM.ibqry2.SQL.Clear;
  DM.ibqry2.SQL.Text:=sq;
  DM.ibqry2.ExecSQL;
  sq:='UPDATE REQUESTS SET ANSWERID ='+IntToStr(pkans) +',processed=1  WHERE PK = '+(DM.ibqry1.FieldByName('PK').asString);
  DM.ibtrnsctn1.Commit;
  DM.ibqry2.SQL.Clear;
  DM.ibqry2.SQL.Text:=sq;
  DM.ibqry2.ExecSQL;
  DM.ibtrnsctn1.Commit;


  dbgrd1.Refresh;


end;

procedure TForm2.btn2Click(Sender: TObject);
var
  pkans,pkacc:LongInt;
   sql,sq:AnsiString;
begin
//  счет 42307810860311008389 8585/1 Остаток 194 RUR
pkans:=Getgenerator('PK_ANSWER'); //PK_ACC_DATA
pkacc:=Getgenerator('PK_ACC_DATA'); //PK_ACC_DATA
sql:='INSERT INTO ANSWER (PK, UNICODE, ID_ZAPR, NUMISP, DT, NUM, NUMRES, DTRES, RESULT, TEXT, FILENAME) VALUES (';
  sq:=sql;
  sq:=sq+IntToStr(pkans)+', ';

  sq:=sq+(DM.ibqry1.FieldByName('UNICODE').asString)+', '   ;
  sq:=sq+(DM.ibqry1.FieldByName('PK').asString)+', '   ;
  sq:=sq+quotedstr(DM.ibqry1.FieldByName('NUMISP').asString)+', '   ;
  sq:=sq+quotedstr(DM.ibqry1.FieldByName('DT').asString)+', '   ;
  sq:=sq+quotedstr(DM.ibqry1.FieldByName('NUM').asString)+', '   ;
  sq:=sq+QuotedStr('/')+', ';
  sq:=sq+QuotedStr(DateToStr(now))+', ';
  sq:=sq+intToStr(1)+', ';
  sq:=sq+QuotedStr('Есть счета')+', Null)' ;
  mmo2.Lines.Add(sq) ;
  DM.ibqry2.SQL.Clear;
  DM.ibqry2.SQL.Text:=sq;
  DM.ibqry2.ExecSQL;
  DM.ibtrnsctn1.Commit;
  //dbgrd1.Refresh;
  sql:='INSERT INTO ACC_DATA (PK, ANSWERPK, ACC, BIC_BANK, SUMMA, CURRENCY_CODE, SUMMA_INFO, DEPT_CODE, BANK_NAME) VALUES (';//);'
  sq:=sql+IntToStr(pkacc )+', ';
  sq:=sq+IntToStr(pkans)+', ';
  sq:=sq+quotedStr(edt1.text)+', Null, '; //Edit gde schet
  sq:=sq+ Edt2.Text+', ';
  sq:=sq+QuotedStr(cbb1.Text)+',Null, Null,Null)'  ;
  mmo2.Lines.Add(sq);
  DM.ibqry2.SQL.Clear;
  DM.ibqry2.SQL.Text:=sq;
  DM.ibqry2.ExecSQL;
  DM.ibtrnsctn1.Commit;
  dbgrd1.Refresh;

  end;

end.
