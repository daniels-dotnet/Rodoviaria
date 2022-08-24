unit untEmpresas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, ADODB, Grids, DBGrids;

type
  TfrmEmpresas = class(TForm)
    btnFechar: TBitBtn;
    qryEmpresas: TADOQuery;
    grdEmpresas: TDBGrid;
    dtsEmpresas: TDataSource;
    Label1: TLabel;
    edtId: TEdit;
    Label2: TLabel;
    edtNome: TEdit;
    qryAuxiliar: TADOQuery;
    btnInserir: TBitBtn;
    procedure btnFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnInserirClick(Sender: TObject);
  private
  public
  end;

var
  frmEmpresas: TfrmEmpresas;

implementation

uses untMenu;

{$R *.dfm}

procedure TfrmEmpresas.btnFecharClick(Sender: TObject);
begin
  Close();
end;

procedure TfrmEmpresas.FormShow(Sender: TObject);
begin
  qryEmpresas.Open();
end;

procedure TfrmEmpresas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qryEmpresas.Close();
end;

procedure TfrmEmpresas.btnInserirClick(Sender: TObject);
begin
  if (Trim(edtNome.Text) = '') then
  begin
    ShowMessage('Preencha o campo nome!');
    Exit;
  end;

  frmMenu.cnnConexao.BeginTrans();
  qryAuxiliar.SQL.Text := 'INSERT INTO Empresas(Nome) VALUES(:nome)';
  qryAuxiliar.Parameters.ParamByName('nome').Value := edtNome.Text;
  qryAuxiliar.ExecSQL();
  frmMenu.cnnConexao.CommitTrans();

  qryEmpresas.Close();
  qryEmpresas.Open();

  ShowMessage('Operação executada com sucesso!');
  edtId.Clear();
  edtNome.Clear();
end;

end.
