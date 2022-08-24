unit untMenu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, ADODB;

type
  TfrmMenu = class(TForm)
    btnEmpresas: TBitBtn;
    btnMotoristas: TBitBtn;
    btnOnibus: TBitBtn;
    btnFechar: TBitBtn;
    cnnConexao: TADOConnection;
    procedure btnFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnEmpresasClick(Sender: TObject);
  private
  public
  end;

var
  frmMenu: TfrmMenu;

implementation

uses untEmpresas;

{$R *.dfm}

procedure TfrmMenu.btnFecharClick(Sender: TObject);
begin
  Application.Terminate();
end;

procedure TfrmMenu.FormShow(Sender: TObject);
begin
  cnnConexao.Open();
end;

procedure TfrmMenu.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  cnnConexao.Close();
end;

procedure TfrmMenu.btnEmpresasClick(Sender: TObject);
begin
  frmEmpresas.ShowModal();
end;

end.
