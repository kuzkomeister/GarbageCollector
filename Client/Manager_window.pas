unit Manager_window;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, user_class, data_module_add,
  Data.DB, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, data_module, add_customer_window ;

type
  TForm_manager = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    menu_diver: TMenuItem;
    menu_operator: TMenuItem;
    menu_manager: TMenuItem;
    menu_distr_cars: TMenuItem;
    menu_orders: TMenuItem;
    menu_car: TMenuItem;
    DBGrid_drivers: TDBGrid;
    Label_drivers: TLabel;
    DataSource_drivers: TDataSource;
    menu_update: TMenuItem;
    menu_edit: TMenuItem;
    menu_edit_car: TMenuItem;
    DBGrid_cars: TDBGrid;
    DataSource_cars: TDataSource;
    menu_edit_driver: TMenuItem;
    DBGrid_managers: TDBGrid;
    DBGrid_operators: TDBGrid;
    DataSource_managers: TDataSource;
    DataSource_operators: TDataSource;
    menu_edit_operator: TMenuItem;
    menu_edit_manager: TMenuItem;
    Label_cars: TLabel;
    Label_managers: TLabel;
    Label_operators: TLabel;
    menu_customer: TMenuItem;
    procedure menu_ordersClick(Sender: TObject);
    procedure menu_distr_carsClick(Sender: TObject);
    procedure FormCreate(Sender: TObject;pUser : TUser);
    procedure menu_diverClick(Sender: TObject);
    procedure menu_managerClick(Sender: TObject);
    procedure menu_operatorClick(Sender: TObject);
    procedure menu_updateClick(Sender: TObject);
    procedure menu_edit_carClick(Sender: TObject);
    procedure menu_edit_driverClick(Sender: TObject);
    procedure menu_edit_operatorClick(Sender: TObject);
    procedure menu_edit_managerClick(Sender: TObject);
    procedure menu_carClick(Sender: TObject);
    procedure menu_customerClick(Sender: TObject);
  private
    { Private declarations }
    user : TUser;
  public
    { Public declarations }
  end;

var
  Form_manager: TForm_manager;

implementation

{$R *.dfm}

uses operator_window_inh, car_distributing_window, add_car_window, add_worker_window;


procedure TForm_manager.FormCreate(Sender: TObject; pUser : TUser);
begin
  user := pUser;
end;

procedure TForm_manager.menu_diverClick(Sender: TObject);
begin
  form_Add_Worker := Tform_Add_Worker.Create(APPLICATION);
  form_Add_Worker.showmodal;
  if form_Add_Worker.ModalResult = mrOk then  begin
      dm_add.add_worker(2, StrtoInt(form_Add_Worker.label_exp.Text),
                        form_Add_Worker.dtp_DOB.datetime,
                        form_Add_Worker.label_name.text,
                        form_Add_Worker.label_surname.text);
   end;
end;

procedure TForm_manager.menu_managerClick(Sender: TObject);
begin
  form_Add_Worker := Tform_Add_Worker.Create(APPLICATION);
  form_Add_Worker.showmodal;
  if form_Add_Worker.ModalResult = mrOk then  begin
      dm_add.add_worker(0, StrtoInt(form_Add_Worker.label_exp.Text),
                        form_Add_Worker.dtp_DOB.datetime,
                        form_Add_Worker.label_name.text,
                        form_Add_Worker.label_surname.text);

   end;

end;

procedure TForm_manager.menu_operatorClick(Sender: TObject);
begin
  form_Add_Worker := Tform_Add_Worker.Create(APPLICATION);
  form_Add_Worker.showmodal;
  if form_Add_Worker.ModalResult = mrOk then  begin
      dm_add.add_worker(1, StrtoInt(form_Add_Worker.label_exp.Text),
                        form_Add_Worker.dtp_DOB.datetime,
                        form_Add_Worker.label_name.text,
                        form_Add_Worker.label_surname.text);

   end;
end;

procedure TForm_manager.menu_carClick(Sender: TObject);
begin
   form_Add_Car := Tform_Add_Car.Create(APPLICATION);
   form_Add_Car.showmodal;
   if form_Add_Car.ModalResult = mrOk then  begin
       dm_add.add_car(form_Add_Car.label_mark.Text,
                      form_Add_Car.label_number.Text,
                      form_Add_Car.label_model.Text);
   end;

   dm.TVehicle.Refresh;
end;

procedure TForm_manager.menu_customerClick(Sender: TObject);
begin
  form_Add_customer := Tform_Add_customer.Create(Application);
  form_Add_customer.ShowModal;
  if form_Add_customer.ModalResult = mrOk then  begin
      dm_add.add_customer(form_Add_customer.label_name.Text,
                          form_Add_customer.label_surname.Text,
                          dm.TAddress_In.FieldByName('ID').Value,
                          form_Add_customer.label_phone.Text);
   end;
end;

procedure TForm_manager.menu_distr_carsClick(Sender: TObject);
begin
  Form_car_distributing := TForm_car_distributing.create(APPLICATION);
  Form_car_distributing.showmodal;
end;

procedure TForm_manager.menu_ordersClick(Sender: TObject);
begin
  Form_inh_operator := TForm_inh_operator.create(Application);
  Form_inh_operator.showmodal;
end;

procedure TForm_manager.menu_updateClick(Sender: TObject);
begin
  dm.open_all;
end;

procedure TForm_manager.menu_edit_carClick(Sender: TObject);
begin
  form_Add_Car := Tform_Add_Car.Create(APPLICATION);
  with form_Add_Car do begin
    label_mark.Text := dm.TVehicle.FieldByName('MARKA').Value;
    label_number.Text := dm.TVehicle.FieldByName('NUMBER').Value;
    label_model.Text := dm.TVehicle.FieldByName('MODEL').Value;
    showmodal;
  end;
  if form_Add_Car.ModalResult = mrOk then  begin
      dm_add.edit_car(dm.TVehicle.FieldByName('ID').Value,
                      form_Add_Car.label_mark.Text,
                      form_Add_Car.label_number.Text,
                      form_Add_Car.label_model.Text);
   end;
   dm.TVehicle.Refresh;
end;

procedure TForm_manager.menu_edit_driverClick(Sender: TObject);
begin
  form_Add_Worker := Tform_Add_Worker.Create(APPLICATION);
  with form_Add_Worker do begin
    label_name.Text := dm.QDrivers.FieldByName('NAME').Value;
    label_surname.Text := dm.QDrivers.FieldByName('SURNAME').Value;
    label_exp.Text := dm.QDrivers.FieldByName('EXPERIENCE').Value;
    dtp_DOB.DateTime := dm.QDrivers.FieldByName('DOB').AsDateTime;
    showmodal;
  end;

  if form_Add_Worker.ModalResult = mrOk then  begin
      dm_add.edit_worker(dm.QDrivers.FieldByName('ID').Value,
                         dm.QDrivers.FieldByName('STATUS').Value, 2,
                         StrtoInt(form_Add_Worker.label_exp.Text),
                         form_Add_Worker.dtp_DOB.datetime,
                         form_Add_Worker.label_surname.text,
                         form_Add_Worker.label_name.text);

   end;

end;

procedure TForm_manager.menu_edit_managerClick(Sender: TObject);
begin
  form_Add_Worker := Tform_Add_Worker.Create(APPLICATION);
  with form_Add_Worker do begin
    label_name.Text := dm.QDrivers.FieldByName('NAME').Value;
    label_surname.Text := dm.QDrivers.FieldByName('SURNAME').Value;
    label_exp.Text := dm.QDrivers.FieldByName('EXPERIENCE').Value;
    dtp_DOB.DateTime := dm.QDrivers.FieldByName('DOB').AsDateTime;
    showmodal;
  end;
  if form_Add_Worker.ModalResult = mrOk then  begin
      dm_add.edit_worker(dm.QDrivers.FieldByName('ID').Value,
                         dm.QDrivers.FieldByName('STATUS').Value, 0,
                         StrtoInt(form_Add_Worker.label_exp.Text),
                         form_Add_Worker.dtp_DOB.datetime,
                         form_Add_Worker.label_surname.text,
                         form_Add_Worker.label_name.text);

   end;

end;

procedure TForm_manager.menu_edit_operatorClick(Sender: TObject);
begin
  form_Add_Worker := Tform_Add_Worker.Create(APPLICATION);
  with form_Add_Worker do begin
    label_name.Text := dm.QDrivers.FieldByName('NAME').Value;
    label_surname.Text := dm.QDrivers.FieldByName('SURNAME').Value;
    label_exp.Text := dm.QDrivers.FieldByName('EXPERIENCE').Value;
    dtp_DOB.DateTime := dm.QDrivers.FieldByName('DOB').AsDateTime;
    showmodal;
  end;
  if form_Add_Worker.ModalResult = mrOk then  begin
      dm_add.edit_worker(dm.QDrivers.FieldByName('ID').Value,
                         dm.QDrivers.FieldByName('STATUS').Value, 1,
                         StrtoInt(form_Add_Worker.label_exp.Text),
                         form_Add_Worker.dtp_DOB.datetime,
                         form_Add_Worker.label_surname.text,
                         form_Add_Worker.label_name.text);

   end;

end;

end.
