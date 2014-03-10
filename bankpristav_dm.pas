unit bankpristav_dm;

interface

uses
  SysUtils, Classes, DB, IBDatabase, IBCustomDataSet, IBQuery, IBTable,
  IBSQL;
  function Getgenerator(genname:string):Integer;
type
  TDM = class(TDataModule)
    ibqry1: TIBQuery;
    ibdtbs1: TIBDatabase;
    ds1: TDataSource;
    ds2: TDataSource;
    ibtrnsctn1: TIBTransaction;
    ds3: TDataSource;
    ibqry2: TIBQuery;
    ibqry3: TIBQuery;
    ds4: TDataSource;
    ibqry4: TIBQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation
function Getgenerator(genname:string):Integer;
 begin
   dm.ibqry2.SQL.Clear;
  dm.ibqry2.SQL.Text:='SELECT GEN_ID('+genname+', 1) FROM RDB$DATABASE';
  DM.ibqry2.Open;
  Getgenerator:= dm.IBQry2.Fields[0].AsInteger;
 DM.ibqry2.Close;

 end;
{$R *.dfm}

end.
