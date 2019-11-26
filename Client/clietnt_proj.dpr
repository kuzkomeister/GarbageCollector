program clietnt_proj;



uses
  Vcl.Forms,
  login_window in 'login_window.pas' {Login_Form},
  data_module in 'data_module.pas' {dm: TDataModule},
  Panel_order in 'Panel_order.pas',
  Order_class in 'Order_class.pas',
  abstsract_operator_window in 'abstsract_operator_window.pas' {Form_abstract_operator},
  order_interface in 'order_interface.pas',
  operator_window_inh in 'operator_window_inh.pas' {Form_inh_operator},
  Driver_class in 'Driver_class.pas',
  Human_class in 'Human_class.pas',
  Panel_driver in 'Panel_driver.pas',
  driver_interface in 'driver_interface.pas',
  test_window in 'test_window.pas' {form_test},
  Manager_window in 'Manager_window.pas' {Form_manager};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tdm, dm);
  //Application.CreateForm(TLogin_Form, Login_Form);
  //Application.CreateForm(TForm_manager, Form_manager);
  //Application.CreateForm(Tform_test, form_test);
  //Application.CreateForm(Tform_operator, form_operator);
  Application.CreateForm(TForm_inh_operator, Form_inh_operator);
  //Application.CreateForm(Toperator_form, operator_form);

  //Application.CreateForm(TForm_abstract_operator, Form_abstract_operator);

  Application.Run;
end.
