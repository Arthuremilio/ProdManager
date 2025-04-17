program Client;

uses
  Vcl.Forms,
  Form.Principal in 'Views\Form.Principal.pas' {frmPrincipal},
  Form.Produto in 'Views\Form.Produto.pas' {frmProduto},
  Form.Faturamento in 'Views\Form.Faturamento.pas' {frmFaturamento};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmProduto, frmProduto);
  Application.CreateForm(TfrmFaturamento, frmFaturamento);
  Application.Run;
end.
