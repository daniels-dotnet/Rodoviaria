program Rodoviaria;

uses
  Forms,
  untMenu in 'forms\untMenu.pas' {frmMenu},
  untEmpresas in 'forms\untEmpresas.pas' {frmEmpresas};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMenu, frmMenu);
  Application.CreateForm(TfrmEmpresas, frmEmpresas);
  Application.Run;
end.
