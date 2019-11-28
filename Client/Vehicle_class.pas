unit Vehicle_class;

interface
uses IBX.IBtable, data_module,System.SysUtils;
 type Tvehicle = class
  id : integer;
  status : integer;
  driver_id : integer;
  curr_date : TDate;
  procedure push;
 public
  constructor Create(row : TIBTable;Pdriver_id: integer;date : TDate);
    procedure Edit(P_id: integer);
    procedure update_driver(id_driver : integer);

    destructor Destroy;
    function get_id : integer;
    function get_status : integer;
    function get_driver_id : integer;
 end;
implementation

function Tvehicle.get_id;
begin
   get_id  := id;
end;

function Tvehicle.get_status ;
begin
   get_status := status;
end;
constructor Tvehicle.Create(row : TIBTable;Pdriver_id: integer;date : TDate);
begin
    id := row.FieldByName('ID').AsInteger;
    status := row.FieldByName('STATUS').AsInteger;
    driver_id := PDriver_id;
    curr_date := date;
end;

procedure Tvehicle.Edit(P_id: Integer);
begin
  id := p_id;
end;

function Tvehicle.get_driver_id;
begin
     get_driver_id := driver_id;
end;

procedure Tvehicle.update_driver(id_driver : integer);
begin
  if datetostr(curr_date) = datetostr(now) then begin
     driver_id := id_driver;
     status := 0;
     push;
  end;
  // else error messaage
end;

destructor Tvehicle.Destroy;
begin


end;

procedure TVehicle.push;
begin
    with dm.spBegin_day_driver do
    begin

    ParamByName('ID_CAR').AsInteger := id;
    ParamByName('ID_WORKER').AsInteger:= driver_id ;

    // Execute the procedure
    if not Transaction.InTransaction then
      Transaction.StartTransaction;
    ExecProc;
    Transaction.Commit;
    end;
      dm.open_all;

end;

end.
