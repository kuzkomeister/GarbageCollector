unit abstsract_operator_window;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IdBaseComponent, IdComponent, IdUDPBase,
  IdUDPClient, IdUDPServer, IdGlobal, IdSocketHandle, generics.collections, order_interface,data_module
  ,order_class;

type
  TElem = (Order,Vencele,Driver);
  TForm_abstract_operator = class(TForm)
    IdUDPServer1: TIdUDPServer;
    procedure IdUDPServer1UDPRead(AThread: TIdUDPListenerThread;
      const AData: TIdBytes; ABinding: TIdSocketHandle);

  protected
    order_list : TList<TOrder_Interface>;
    procedure update_orders;
    procedure update_drivers;
    procedure update_venceles;

    procedure add(Porder:TOrder);overload;virtual;abstract;
    procedure add();overload;virtual;abstract;
    procedure delete(id : Integer; elem :Telem);virtual;abstract;

  private
    { Private declarations }
  public
    { Public declarations }
  constructor Create(AOwner: TComponent); override;
  end;

var
  Form_abstract_operator: TForm_abstract_operator;

implementation

{$R *.dfm}

procedure TForm_abstract_operator.update_orders;
var i,j,count : integer;
   new_order : TOrder;
   queue : TList<TOrder_Interface>;
begin
    // Refresh table
    dm.TOrders.Refresh;

    // Get count
    dm.TOrders.Last;
    count := dm.TOrders.RecordCount;
    dm.TOrders.First;

    // Copy TList to queue
    queue := TList<TOrder_Interface>.Create;
    queue.InsertRange(0,order_list);

    for  i := 0 to count - 1 do    begin

      j:=1;
      while ( j < queue.Count) and ( queue[j].get_id  <> dm.TOrders.FieldByName('ID').AsInteger )  do
         j := j+1;
      // if found order but status changed
      if (j < queue.Count) then begin
          if  (dm.TOrders.FieldByName('STATUS').AsInteger <> queue[j].get_status ) then begin
             new_order := TOrder.Create(dm.TOrders);
             queue[j].update_order(new_order);
          end;

          queue.Delete(j);
      end
      else // Order not found
      // add it to list
      //Create new order
      New_Order := TOrder.Create(dm.TOrders);
      add(New_order);

      // end add order in list

      dm.TOrders.Next;
    end;

    // Delete orders wich not found in db
    for I := 0 to queue.Count do
      delete (queue[i].get_id,Order);

    queue.Destroy;
end;

procedure TForm_abstract_operator.update_drivers;
begin

end;

procedure TForm_abstract_operator.update_venceles;
begin

end;
procedure TForm_abstract_operator.IdUDPServer1UDPRead(
  AThread: TIdUDPListenerThread; const AData: TIdBytes;
  ABinding: TIdSocketHandle);
  var
    recieve : string;
begin
  recieve := bytesToString(AData);
  case recieve[1] of
  '1' : update_orders;
  '2' : update_drivers;
  '3' : update_venceles;
  end;
end;

constructor TForm_abstract_operator.Create(AOwner: TComponent);
begin
  inherited;
  order_list :=  TList<TOrder_Interface>.create;
end;

end.
