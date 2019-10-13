unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  IdBaseComponent, IdComponent, IdUDPBase, IdUDPClient,abstsract_operator_window,order_class,
  generics.collections,panel_order,order_interface;

type
  TForm_operator = class(TForm_abstract_operator)

    Panel_drivers: TPanel;
    Panel_orders: TPanel;
    Panel_order: TPanel;
    Button1: TButton;
    Panel_driver: TPanel;

    procedure Button1Click(Sender: TObject);
    procedure Panel_DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure Panel_DragDrop(Sender, Source: TObject; X, Y: Integer);

  private
    { Private declarations }
    //panel_order_list : TList<TPanel_order> ;
     procedure add(Porder:TOrder);overload;virtual;
     procedure add();overload;virtual;
     procedure delete(id : Integer; elem :Telem);virtual;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
  end;

var
  Form_operator: TForm_operator;

implementation

{R *.dfm}




procedure TForm_operator.add(Porder:TOrder);
var
  new_order_panel : TPanel_order;
  i : integer;
begin
    new_order_panel := TPanel_order.Create(Panel_orders,Porder);
    new_order_panel.Parent := Panel_orders;

    order_list.Add((new_order_panel as TOrder_Interface));
    with Panel_orders do
      for I := 0 to  ControlCount - 1 do begin
        controls[i].Left := 0;
        controls[i].Top := I * 100;
      end;

end;

procedure TForm_operator.add;
begin

end;

procedure TForm_operator.delete(id: Integer; elem: TElem);
var
  i : integer;
  candidate : TOrder_Interface ;
begin
     if elem = order then begin

       i := 1;
       while (i <= order_list.Count) and (order_list[i].get_id <> id)  do
        i:= i+1;
        if (i <= order_list.Count )then begin
            candidate := order_list[i];
            order_list.Delete(i);
            candidate.destroy_from_interface;
        end;




     end;
end;

procedure TForm_operator.Button1Click(Sender: TObject);
begin
  panel_order.Parent :=  Panel_drivers;
end;

procedure TForm_operator.Panel_DragDrop(Sender, Source: TObject; X, Y: Integer);
begin
  (source as TPanel).Parent := (Sender as TPanel);
end;

procedure TForm_operator.Panel_DragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  accept := sender is TPanel;
end;

constructor  TForm_operator.Create(AOwner: TComponent);
begin
  inherited;

end;

end.
