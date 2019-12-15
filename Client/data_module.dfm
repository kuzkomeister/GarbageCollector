object dm: Tdm
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 472
  Width = 716
  object IBDatabase1: TIBDatabase
    Connected = True
    DatabaseName = 'D:\Delphi Collector 2\FREIGHT_TAXI_actual_changes.FDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey'
      'lc_ctype=WIN1251')
    LoginPrompt = False
    DefaultTransaction = IBTransaction_read
    ServerType = 'IBServer'
    Left = 112
    Top = 80
  end
  object IBTransaction_read: TIBTransaction
    Active = True
    DefaultDatabase = IBDatabase1
    Params.Strings = (
      'read_committed'
      'no_rec_version')
    Left = 200
    Top = 80
  end
  object Torders: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction_read
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'ORDERS'
    UniDirectional = False
    Left = 328
    Top = 56
  end
  object TWorkers: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction_read
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'WORKERS'
    UniDirectional = False
    Left = 328
    Top = 144
  end
  object spEDIT_ORDER_SET_DRIVER: TIBStoredProc
    Database = IBDatabase1
    Transaction = IBTransaction_read
    StoredProcName = 'EDIT_ORDER_SET_STATUS'
    Left = 320
    Top = 256
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID_ORDER'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NEW_STATUS'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_WORKERS'
        ParamType = ptInput
      end>
  end
  object spAdd_order: TIBStoredProc
    Database = IBDatabase1
    Transaction = IBTransaction_read
    StoredProcName = 'ADD_ORDER'
    Left = 456
    Top = 248
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID_CUSTOMER'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'WEIGHT'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'FROM_ID_ADDREESS'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TO_ID_ADDRESS'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATE_OF_DELIVERY'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'WHO_DRIVER'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_OPERATOR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NUMBER_STEVEDORE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PRICE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'STATUS'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATE_ORDER_COMPLETION'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATE_ORDER_CANCELLATION '
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'RESULT'
        ParamType = ptOutput
      end>
  end
  object TVehicle: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction_read
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'GARAGE'
    UniDirectional = False
    Left = 416
    Top = 64
  end
  object TNew_day_car_delivery: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction_read
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'NEW_DAY_CAR_DRIVER'
    UniDirectional = False
    Left = 432
    Top = 144
  end
  object QDriver_id_from_vehicle_day: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction_read
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select ID_DRIVER, DATE_ from new_day_car_driver'
      'where id_car = :IN_ID_VEHICLE and date_ = :IN_DATE;')
    Left = 520
    Top = 64
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IN_ID_VEHICLE'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'IN_DATE'
        ParamType = ptInput
      end>
  end
  object spBegin_day_driver: TIBStoredProc
    Database = IBDatabase1
    Transaction = IBTransaction_read
    StoredProcName = 'BEGIN_DAY_DRIVER'
    Left = 544
    Top = 256
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID_WORKER'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_CAR'
        ParamType = ptInput
      end>
  end
  object spLogin: TIBStoredProc
    Database = IBDatabase1
    Transaction = IBTransaction_read
    StoredProcName = 'LOGIN'
    Left = 176
    Top = 272
    ParamData = <
      item
        DataType = ftInteger
        Name = 'OUT_SUCCESS'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'OUT_ROLE'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'OUT_WORKER_ID'
        ParamType = ptOutput
      end
      item
        DataType = ftWideString
        Name = 'IN_PASSWORD'
        ParamType = ptInput
      end
      item
        DataType = ftWideString
        Name = 'IN_LOGIN'
        ParamType = ptInput
      end>
  end
  object QDrivers: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction_read
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from workers where role_ = 2;')
    Left = 224
    Top = 176
  end
  object QManagers: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction_read
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from workers where role_ = 0;')
    Left = 96
    Top = 192
  end
  object QOperators: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction_read
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from workers where role_ = 1;')
    Left = 104
    Top = 320
  end
  object QCustomers: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction_read
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from customers;')
    Left = 232
    Top = 360
  end
  object TAddress_In: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction_read
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'ADDRESS'
    UniDirectional = False
    Left = 448
    Top = 376
  end
  object TAddress_Out: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction_read
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'ADDRESS'
    UniDirectional = False
    Left = 576
    Top = 384
  end
  object IBQuery1: TIBQuery
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 352
    Top = 368
  end
end
