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
    procedure btnMotoristasClick(Sender: TObject);
    procedure btnOnibusClick(Sender: TObject);
  private
  public
    function ErroBD(Msg: string; Texto: string):string;
  end;

var
  frmMenu: TfrmMenu;

implementation

uses untEmpresas, untMotoristas, untOnibus;

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

procedure TfrmMenu.btnMotoristasClick(Sender: TObject);
begin
  frmMotoristas.ShowModal();
end;

procedure TfrmMenu.btnOnibusClick(Sender: TObject);
begin
  frmOnibus.ShowModal();
end;

function TfrmMenu.ErroBD(Msg, Texto: string): string;
var
  I : Integer;
  TamanhoMensagem : Integer;
  TamanhoTexto : Integer;
  Pedaco : string;
begin
  TamanhoMensagem := Length(msg);
  TamanhoTexto := Length(texto);
  Result := 'Não';
  
  for I := 0 to TamanhoMensagem do
  begin
    Pedaco := Copy(Msg, I, TamanhoTexto);

    if Pedaco = Texto then
    begin
      Result := 'Sim';
      Break;
    end;
  end;
end;

end.
