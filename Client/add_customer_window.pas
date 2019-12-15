unit add_customer_window;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, data_module, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons;

type
  Tform_Add_customer = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    BitBtn1: TBitBtn;
    label_surname: TEdit;
    label_name: TEdit;
    label_phone: TEdit;
    DBGrid1: TDBGrid;
    DataSource_address: TDataSource;
    Label4: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  form_Add_customer: Tform_Add_customer;

implementation

{$R *.dfm}

end.
