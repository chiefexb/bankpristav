unit bankpristav_dm;

interface

uses
  SysUtils, Classes, DB, IBDatabase, IBCustomDataSet, IBQuery, IBTable;

type
  TDM = class(TDataModule)
    ibqry1: TIBQuery;
    ibdtbs1: TIBDatabase;
    ds1: TDataSource;
    ds2: TDataSource;
    ibtrnsctn1: TIBTransaction;
    ibtbl1: TIBTable;
    ds3: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

end.
