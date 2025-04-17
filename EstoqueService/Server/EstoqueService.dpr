program EstoqueService;

uses
  Vcl.SvcMgr,
  Controller in '..\Controller\Controller.pas' {EstoqueController: TService};

{$R *.RES}

begin
  if not Application.DelayInitialize or Application.Installing then
    Application.Initialize;
  Application.CreateForm(TEstoqueController, EstoqueController);
  Application.Run;
end.
