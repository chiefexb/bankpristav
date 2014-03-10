unit bankpristav_u2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ToolWin, ComCtrls, StdCtrls,StrUtils;

type
  TForm2 = class(TForm)
    mmo1: TMemo;
    mmo2: TMemo;
    dbgrd1: TDBGrid;
    btn1: TButton;
    procedure FormShow(Sender: TObject);
    procedure btn1Click(Sender: TObject);
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
   s:='';
   mmo1.Lines.Clear;
  for i:=0 to dm.ibqry1.Fields.Count-1 do  begin
  dm.ibqry2.SQL.Clear;
  dm.ibqry2.SQL.Text:='select * from Description where tablename=upper('+quotedStr('Requests')+') and fieldorder='+IntToStr(i);
  DM.ibqry2.Open;
    mmo1.Lines.Add(DM.ibqry2.Fields[2].asString+':'+dupestring(' ',20-length(DM.ibqry2.Fields[2].asString))+dm.ibqry1.Fields[i].AsString ) ;
  //mo1.Lines.Add(dm.ibqry1.Fields[i].Displayt+':'+dm.ibqry1.Fields[i].AsString);
   // s:=s+dm.ibqry1.Fields[i].AsString+', ';
  end;

end;

procedure TForm2.btn1Click(Sender: TObject);
begin
 DM.ibqry3.SQL.Clear;
 DM.ibqry3.SQL.Text:=''
 //DM.
end;

end.
