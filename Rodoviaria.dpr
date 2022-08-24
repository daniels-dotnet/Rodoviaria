program Rodoviaria;

uses
  Forms,
  untMenu in 'forms\untMenu.pas' {frmMenu},
  untEmpresas in 'forms\untEmpresas.pas' {frmEmpresas},
  untMotoristas in 'forms\untMotoristas.pas' {frmMotoristas},
  untOnibus in 'forms\untOnibus.pas' {frmOnibus};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMenu, frmMenu);
  Application.CreateForm(TfrmEmpresas, frmEmpresas);
  Application.CreateForm(TfrmMotoristas, frmMotoristas);
  Application.CreateForm(TfrmOnibus, frmOnibus);
  Application.Run;
end.
