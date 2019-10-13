unit data_module;

interface

uses
  System.SysUtils, System.Classes, Data.DB, IBX.IBCustomDataSet, IBX.IBTable,
  IBX.IBDatabase, Datasnap.Provider;

type
  Tdm = class(TDataModule)
    IBDatabase1: TIBDatabase;
    IBTransaction_read: TIBTransaction;
    Torders: TIBTable;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm: Tdm;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure Tdm.DataModuleCreate(Sender: TObject);
begin
  dm.TOrders.Open;
end;

end.
