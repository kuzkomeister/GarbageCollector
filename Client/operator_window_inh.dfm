inherited Form_inh_operator: TForm_inh_operator
  Caption = 'Form_inh_operator'
  ClientHeight = 598
  ClientWidth = 861
  Menu = MainMenu1
  ExplicitWidth = 877
  ExplicitHeight = 657
  PixelsPerInch = 96
  TextHeight = 13
  object Panel_orders: TPanel [0]
    Left = 600
    Top = 0
    Width = 265
    Height = 558
    Caption = #1055#1072#1085#1077#1083#1100' '#1079#1072#1082#1072#1079#1086#1074
    Color = clGradientActiveCaption
    ParentBackground = False
    TabOrder = 0
  end
  object Panel_drivers: TPanel [1]
    Left = 1
    Top = 0
    Width = 593
    Height = 558
    Caption = #1055#1072#1085#1077#1083#1100' '#1074#1086#1076#1080#1090#1077#1083#1077#1081
    Color = clGradientActiveCaption
    ParentBackground = False
    TabOrder = 1
  end
  inherited IdUDPServer1: TIdUDPServer
    Left = 184
    Top = 528
  end
  object MainMenu1: TMainMenu
    Left = 296
    Top = 216
    object ADD_ORDER: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1079#1072#1082#1072#1079
      OnClick = ADD_ORDERClick
    end
    object MENU_UPDATE: TMenuItem
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      OnClick = MENU_UPDATEClick
    end
  end
end
