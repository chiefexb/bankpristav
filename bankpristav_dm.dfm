object DM: TDM
  OldCreateOrder = False
  Left = 425
  Top = 261
  Height = 389
  Width = 483
  object ibqry1: TIBQuery
    Database = ibdtbs1
    Transaction = ibtrnsctn1
    Left = 40
    Top = 128
  end
  object ibdtbs1: TIBDatabase
    LoginPrompt = False
    DefaultTransaction = ibtrnsctn1
    Left = 40
    Top = 40
  end
  object ds1: TDataSource
    DataSet = ibqry1
    Left = 184
    Top = 136
  end
  object ds2: TDataSource
    Left = 232
    Top = 136
  end
  object ibtrnsctn1: TIBTransaction
    Left = 88
    Top = 40
  end
  object ds3: TDataSource
    DataSet = ibqry3
    Left = 224
    Top = 40
  end
  object ibqry2: TIBQuery
    Database = ibdtbs1
    Transaction = ibtrnsctn1
    Left = 112
    Top = 120
  end
  object ibqry3: TIBQuery
    Database = ibdtbs1
    Transaction = ibtrnsctn1
    Left = 328
    Top = 40
  end
  object ds4: TDataSource
    DataSet = ibqry4
    Left = 344
    Top = 144
  end
  object ibqry4: TIBQuery
    Database = ibdtbs1
    Transaction = ibtrnsctn1
    Left = 400
    Top = 56
  end
end
