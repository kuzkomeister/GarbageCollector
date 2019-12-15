object Form_manager: TForm_manager
  Left = 549
  Top = 206
  Caption = #1054#1082#1085#1086' '#1084#1077#1085#1077#1076#1078#1077#1088#1072
  ClientHeight = 450
  ClientWidth = 1200
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesigned
  PixelsPerInch = 96
  TextHeight = 13
  object Label_drivers: TLabel
    Left = 312
    Top = 8
    Width = 49
    Height = 13
    Caption = #1042#1086#1076#1080#1090#1077#1083#1080
  end
  object Label_cars: TLabel
    Left = 24
    Top = 8
    Width = 42
    Height = 13
    Caption = #1052#1072#1096#1080#1085#1099
  end
  object Label_managers: TLabel
    Left = 592
    Top = 8
    Width = 51
    Height = 13
    Caption = #1052#1072#1085#1072#1075#1077#1088#1099
  end
  object Label_operators: TLabel
    Left = 886
    Top = 8
    Width = 58
    Height = 13
    Caption = #1054#1087#1077#1088#1072#1090#1086#1088#1099
  end
  object DBGrid_drivers: TDBGrid
    Left = 312
    Top = 27
    Width = 250
    Height = 382
    DataSource = DataSource_drivers
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'SURNAME'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NAME'
        Width = 54
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DOB'
        Width = 31
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EXPERIENCE'
        Visible = True
      end>
  end
  object DBGrid_cars: TDBGrid
    Left = 24
    Top = 27
    Width = 250
    Height = 382
    DataSource = DataSource_cars
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'MARKA'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MODEL'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUMBER'
        Visible = True
      end>
  end
  object DBGrid_managers: TDBGrid
    Left = 592
    Top = 27
    Width = 250
    Height = 382
    DataSource = DataSource_managers
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'SURNAME'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NAME'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DOB'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EXPERIENCE'
        Visible = True
      end>
  end
  object DBGrid_operators: TDBGrid
    Left = 886
    Top = 27
    Width = 250
    Height = 382
    DataSource = DataSource_operators
    ReadOnly = True
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'SURNAME'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NAME'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DOB'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EXPERIENCE'
        Visible = True
      end>
  end
  object MainMenu1: TMainMenu
    Left = 280
    Top = 256
    object N1: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      object menu_diver: TMenuItem
        Caption = #1042#1086#1076#1080#1090#1077#1083#1100
        OnClick = menu_diverClick
      end
      object menu_operator: TMenuItem
        Caption = #1054#1087#1077#1088#1072#1090#1086#1088
        OnClick = menu_operatorClick
      end
      object menu_manager: TMenuItem
        Caption = #1052#1077#1085#1077#1076#1078#1077#1088
        OnClick = menu_managerClick
      end
      object menu_car: TMenuItem
        Caption = #1052#1072#1096#1080#1085#1072
        OnClick = menu_carClick
      end
      object menu_customer: TMenuItem
        Caption = #1047#1072#1082#1072#1079#1095#1080#1082
        OnClick = menu_customerClick
      end
    end
    object menu_edit: TMenuItem
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      object menu_edit_driver: TMenuItem
        Caption = #1042#1086#1076#1080#1090#1077#1083#1100
        OnClick = menu_edit_driverClick
      end
      object menu_edit_operator: TMenuItem
        Caption = #1054#1087#1077#1088#1072#1090#1086#1088
        OnClick = menu_edit_operatorClick
      end
      object menu_edit_manager: TMenuItem
        Caption = #1052#1077#1085#1077#1076#1078#1077#1088
        OnClick = menu_edit_managerClick
      end
      object menu_edit_car: TMenuItem
        Caption = #1052#1072#1096#1080#1085#1072
        OnClick = menu_edit_carClick
      end
    end
    object menu_distr_cars: TMenuItem
      Caption = #1056#1072#1089#1087#1088#1077#1076#1077#1083#1080#1090#1100' '#1074#1086#1076#1080#1090#1077#1083#1077#1081' '
      OnClick = menu_distr_carsClick
    end
    object menu_update: TMenuItem
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      OnClick = menu_updateClick
    end
    object menu_orders: TMenuItem
      Caption = #1047#1072#1082#1072#1079#1099
      OnClick = menu_ordersClick
    end
  end
  object DataSource_drivers: TDataSource
    DataSet = dm.QDrivers
    Left = 424
    Top = 120
  end
  object DataSource_cars: TDataSource
    DataSet = dm.TVehicle
    Left = 144
    Top = 136
  end
  object DataSource_managers: TDataSource
    DataSet = dm.QManagers
    Left = 640
    Top = 128
  end
  object DataSource_operators: TDataSource
    DataSet = dm.QOperators
    Left = 1008
    Top = 168
  end
end
