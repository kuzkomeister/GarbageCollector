unit Panel_vehicle;


interface
uses Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vehicle_class,Vehicle_interface;


type TPanel_Vehicle = Class(TPanel,TVehicle_Interface,IInterface)


  private
  vehicle : TVehicle;
  procedure put_details;

  // from interface
  public
  function get_id : integer;
  function get_status : integer;
  procedure update_vehicle(updated_Vehicle : TVehicle);
  procedure destroy_from_interface;
  procedure set_driver(id_driver: integer);

  function get_driver_id : integer;

  constructor Create(AOwner: TComponent;PVehicle : TVehicle);
  destructor Destroy; override;
End;

implementation

// From iterface---------------------------------
function TPanel_Vehicle.get_id : integer;
begin
     get_id := vehicle.get_id;
end;

function TPanel_Vehicle.get_status;
begin
  get_status := vehicle.get_status;
end;



procedure TPanel_Vehicle.update_vehicle(updated_vehicle : TVehicle);
begin
  vehicle.Destroy;
  vehicle := updated_vehicle;
  put_details;
end;

procedure  TPanel_Vehicle.destroy_from_interface;
begin
  destroy;
end;

procedure TPanel_vehicle.set_driver(id_driver : Integer);
begin
    vehicle.update_driver(id_driver);
    put_details;
end;

// end From iterface---------------------------------



function TPanel_vehicle.get_driver_id;
begin
  get_driver_id := vehicle.get_driver_id;
end;

procedure TPanel_Vehicle.put_details;
begin
     caption := 'id: '+ intTostr(vehicle.get_id) + ' driver_id: ' + intTostr(vehicle.get_driver_id);
end;






constructor TPanel_Vehicle.Create(AOwner: TComponent;Pvehicle : Tvehicle );
var
  p_info_width, p_queue_width : Integer;
begin
  inherited Create(AOwner);
  vehicle := Pvehicle;

  dragMode :=  dmAutomatic;
 
  // Put here order details
  put_details;
end;

destructor TPanel_Vehicle.Destroy;
begin
  vehicle.Destroy;
  parent := nil;

  inherited;
end;

end.
