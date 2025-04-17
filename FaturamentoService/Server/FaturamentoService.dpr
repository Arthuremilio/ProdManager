program FaturamentoService;

uses
  Vcl.SvcMgr,
  Controller in '..\Controller\Controller.pas' {FaturamentoController: TService};

{$R *.RES}

begin
  if not Application.DelayInitialize or Application.Installing then
    Application.Initialize;
  Application.CreateForm(TFaturamentoController, FaturamentoController);
  Application.Run;
end.
