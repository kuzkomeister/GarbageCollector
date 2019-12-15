object dm_add: Tdm_add
  OldCreateOrder = False
  Height = 354
  Width = 554
  object IBDatabase1: TIBDatabase
    Connected = True
    DatabaseName = 'D:\Delphi Collector 2\FREIGHT_TAXI_actual_changes.FDB'
    Params.Strings = (
      'password=masterkey'
      'lc_ctype=WIN1251'
      'user_name=SYSDBA')
    LoginPrompt = False
    DefaultTransaction = IBTransaction1
    ServerType = 'IBServer'
    Left = 160
    Top = 88
  end
  object IBTransaction1: TIBTransaction
    Active = True
    DefaultDatabase = IBDatabase1
    Left = 248
    Top = 112
  end
  object spAdd_Car: TIBStoredProc
    Database = IBDatabase1
    Transaction = IBTransaction1
    StoredProcName = 'ADD_CAR'
    Left = 152
    Top = 184
    ParamData = <
      item
        DataType = ftWideString
        Name = 'MARKA'
        ParamType = ptInput
      end
      item
        DataType = ftWideString
        Name = 'NUMBER'
        ParamType = ptInput
      end
      item
        DataType = ftWideString
        Name = 'MODEL'
        ParamType = ptInput
      end>
  end
  object spAdd_Worker: TIBStoredProc
    Database = IBDatabase1
    Transaction = IBTransaction1
    StoredProcName = 'ADD_WORKER'
    Left = 136
    Top = 232
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ROLE_'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'EXPERIENCE'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DOB'
        ParamType = ptInput
      end
      item
        DataType = ftWideString
        Name = 'SURNAME'
        ParamType = ptInput
      end
      item
        DataType = ftWideString
        Name = 'NAME'
        ParamType = ptInput
      end>
  end
  object spEdit_Car: TIBStoredProc
    Database = IBDatabase1
    Transaction = IBTransaction1
    StoredProcName = 'EDIT_CAR'
    Left = 216
    Top = 184
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end
      item
        DataType = ftWideString
        Name = 'MARKA'
        ParamType = ptInput
      end
      item
        DataType = ftWideString
        Name = 'NUMBER'
        ParamType = ptInput
      end
      item
        DataType = ftWideString
        Name = 'MODEL'
        ParamType = ptInput
      end>
  end
  object spEdit_Worker: TIBStoredProc
    Database = IBDatabase1
    Transaction = IBTransaction1
    StoredProcName = 'EDIT_WORKER'
    Left = 232
    Top = 232
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'STATUS'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ROLE_'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'EXPERIENCE'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DOB'
        ParamType = ptInput
      end
      item
        DataType = ftWideString
        Name = 'SURNAME'
        ParamType = ptInput
      end
      item
        DataType = ftWideString
        Name = 'NAME'
        ParamType = ptInput
      end>
  end
  object spAdd_Order: TIBStoredProc
    Database = IBDatabase1
    Transaction = IBTransaction1
    StoredProcName = 'ADD_ORDER'
    Left = 312
    Top = 192
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID_CUSTOMER                    '
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'WEIGHT                         '
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'FROM_ID_ADDREESS               '
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TO_ID_ADDRESS                  '
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATE_OF_DELIVERY               '
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'WHO_DRIVER                     '
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_OPERATOR                    '
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NUMBER_STEVEDORE               '
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PRICE                          '
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'STATUS                         '
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATE_ORDER_COMPLETION          '
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATE_ORDER_CANCELLATION        '
        ParamType = ptInput
      end>
  end
  object spAdd_Customer: TIBStoredProc
    Database = IBDatabase1
    Transaction = IBTransaction1
    StoredProcName = 'ADD_CUSTOMER'
    Left = 400
    Top = 224
    ParamData = <
      item
        DataType = ftString
        Name = 'NAME                           '
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'SURNAME                        '
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_ADDRESS                     '
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PHONE_NUMBER                   '
        ParamType = ptInput
      end>
  end
end
