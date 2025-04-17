object FaturamentoController: TFaturamentoController
  OnCreate = ServiceCreate
  DisplayName = 'FaturamentoController'
  OnStart = ServiceStart
  Height = 767
  Width = 1022
  PixelsPerInch = 120
  object FDConnection: TFDConnection
    Params.Strings = (
      'DriverID=SQLite')
    Left = 104
    Top = 80
  end
  object IdHTTPServer: TIdHTTPServer
    Bindings = <>
    OnCommandGet = IdHTTPServerCommandGet
    Left = 256
    Top = 80
  end
  object FDPhysFBDriverLink: TFDPhysFBDriverLink
    Left = 104
    Top = 152
  end
end
