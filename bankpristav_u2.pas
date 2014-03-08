unit bankpristav_u2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ToolWin, ComCtrls, StdCtrls;

type
  TForm2 = class(TForm)
    mmo1: TMemo;
    procedure FormShow(Sender: TObject);
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
  for i:=0 to dm.ibqry1.Fields.Count-1 do
  mmo1.Lines.Add(dm.ibqry1.Fields[i].DisplayName+':'+dm.ibqry1.Fields[i].AsString);
   // s:=s+dm.ibqry1.Fields[i].AsString+', ';

end;

end.
