object dm: Tdm
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 214
  Width = 480
  object IBDatabase1: TIBDatabase
    Connected = True
    DatabaseName = 
      'C:\Users\dupel\OneDrive\'#1056#1072#1073#1086#1095#1080#1081' '#1089#1090#1086#1083'\'#1055#1056#1054#1045#1050#1058' '#1044#1045#1051#1060#1048'\Local_DB\FREIG' +
      'HT_TAXI.fdb'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey'
      'lc_ctype=WIN1251')
    LoginPrompt = False
    DefaultTransaction = IBTransaction_read
    ServerType = 'IBServer'
    Left = 152
    Top = 80
  end
  object IBTransaction_read: TIBTransaction
    DefaultDatabase = IBDatabase1
    Params.Strings = (
      'read_committed'
      'no_rec_version')
    Left = 224
    Top = 88
  end
  object Torders: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction_read
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'ORDERS'
    UniDirectional = False
    Left = 304
    Top = 104
  end
end
