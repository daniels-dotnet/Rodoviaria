unit untOnibus;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, ADODB, Grids, DBGrids;

type
  TfrmOnibus = class(TForm)
    btnFechar: TBitBtn;
    qryOnibus: TADOQuery;
    grdOnibus: TDBGrid;
    dtsOnibus: TDataSource;
    qryOnibusId: TAutoIncField;
    qryOnibusEmpresa: TStringField;
    qryOnibusMotorista: TStringField;
    qryOnibusTrajeto: TStringField;
    Label1: TLabel;
    edtId: TEdit;
    Label2: TLabel;
    edtTrajeto: TEdit;
    btnInserir: TBitBtn;
    qryAuxiliar: TADOQuery;
    Label4: TLabel;
    cmbMotorista: TComboBox;
    Label6: TLabel;
    cmbEmpresa: TComboBox;
    btnAlterar: TBitBtn;
    btnSalvarAlteracoes: TBitBtn;
    btnExcluir: TBitBtn;
    procedure btnFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnInserirClick(Sender: TObject);
    procedure cmbMotoristaChange(Sender: TObject);
    procedure cmbEmpresaChange(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnSalvarAlteracoesClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
  private
  public
  end;

var
  frmOnibus: TfrmOnibus;
  MotoristaId : Integer;
  EmpresaId : Integer;
  OnibusId : Integer;
  HouveErro : Boolean;

implementation

uses untMenu;

{$R *.dfm}

procedure TfrmOnibus.btnFecharClick(Sender: TObject);
begin
  Close();
end;

procedure TfrmOnibus.FormShow(Sender: TObject);
begin
  qryOnibus.Open();
  cmbMotorista.Clear(); 
  qryAuxiliar.SQL.Text := 'SELECT Nome FROM Motoristas ORDER BY Nome'; 
  qryAuxiliar.Open();

  while not qryAuxiliar.Eof do
  begin
    cmbMotorista.Items.Add(qryAuxiliar.FieldByName('Nome').AsString);
    qryAuxiliar.Next();
  end;

  qryAuxiliar.Close();
  cmbEmpresa.Clear();
  qryAuxiliar.SQL.Text := 'SELECT Nome FROM Empresas ORDER BY Nome';
  qryAuxiliar.Open();

  while not qryAuxiliar.Eof do
  begin
    cmbEmpresa.Items.Add(qryAuxiliar.FieldByName('Nome').AsString);
    qryAuxiliar.Next();
  end;

  qryAuxiliar.Close();
end;

procedure TfrmOnibus.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qryOnibus.Close();
end;

procedure TfrmOnibus.btnInserirClick(Sender: TObject);
begin
  if (Trim(edtTrajeto.Text) = '') then
  begin
    ShowMessage('Preencha o campo trajeto!');
    Exit;
  end;

  if (cmbMotorista.ItemIndex = -1) then
  begin
    ShowMessage('Preencha o campo motorista!');
    Exit;
  end;

  if (cmbEmpresa.ItemIndex = -1) then
  begin
    ShowMessage('Preencha o campo empresa!');
    Exit;
  end;

  frmMenu.cnnConexao.BeginTrans();
  qryAuxiliar.SQL.Text := 'INSERT INTO Onibus(Trajeto, MotoristaId, EmpresaId)' +
    'VALUES(:trajeto, :motoristaId, :empresaId)';
  qryAuxiliar.Parameters.ParamByName('trajeto').Value := edtTrajeto.Text;
  qryAuxiliar.Parameters.ParamByName('motoristaId').Value := MotoristaId;
  qryAuxiliar.Parameters.ParamByName('empresaId').Value := EmpresaId;

  try
    qryAuxiliar.ExecSQL();
    HouveErro := False;
  except
    on E:Exception do
    begin
      HouveErro := True;
      ShowMessage('Ocorreu o seguinte erro: ' + E.Message);
    end;
  end;

  if HouveErro = False then
  begin
    frmMenu.cnnConexao.CommitTrans();

    qryOnibus.Close();
    qryOnibus.Open();

    ShowMessage('Operação executada com sucesso!');
    edtId.Clear();
    edtTrajeto.Clear();
    cmbMotorista.ItemIndex := -1;
    cmbEmpresa.ItemIndex := -1;
  end
  else
  begin
    frmMenu.cnnConexao.RollbackTrans();
  end;
end;

procedure TfrmOnibus.cmbMotoristaChange(Sender: TObject);
begin
  qryAuxiliar.SQL.Text := 'SELECT Id FROM Motoristas WHERE Nome = :nome';
  qryAuxiliar.Parameters.ParamByName('nome').Value := cmbMotorista.Text;
  qryAuxiliar.Open();
  MotoristaId := qryAuxiliar.FieldByName('Id').AsInteger;
  qryAuxiliar.Close();
end;

procedure TfrmOnibus.cmbEmpresaChange(Sender: TObject);
begin
  qryAuxiliar.SQL.Text := 'SELECT Id FROM Empresas WHERE Nome = :nome';
  qryAuxiliar.Parameters.ParamByName('nome').Value := cmbEmpresa.Text;
  qryAuxiliar.Open();
  EmpresaId := qryAuxiliar.FieldByName('Id').AsInteger;
  qryAuxiliar.Close();
end;

procedure TfrmOnibus.btnAlterarClick(Sender: TObject);
begin
  OnibusId := qryOnibus.FieldByName('Id').AsInteger;
  edtId.Text := IntToStr(OnibusId);
  edtTrajeto.Text := qryOnibus.FieldByName('Trajeto').AsString;
  cmbMotorista.Text := qryOnibus.FieldByName('Motorista').AsString;
  cmbMotoristaChange(Sender);
  cmbEmpresa.Text := qryOnibus.FieldByName('Empresa').AsString;
  cmbMotoristaChange(Sender);
end;

procedure TfrmOnibus.btnSalvarAlteracoesClick(Sender: TObject);
begin
  if (Trim(edtTrajeto.Text) = '') then
  begin
    ShowMessage('Preencha o campo trajeto!');
    Exit;
  end;

  if (cmbMotorista.ItemIndex = -1) then
  begin
    ShowMessage('Preencha o campo motorista!');
    Exit;
  end;

  if (cmbEmpresa.ItemIndex = -1) then
  begin
    ShowMessage('Preencha o campo empresa!');
    Exit;
  end;

  frmMenu.cnnConexao.BeginTrans();
  qryAuxiliar.SQL.Text := 'UPDATE Onibus SET Trajeto = :trajeto, MotoristaId = ' +
    ':motoristaId, EmpresaId = :empresaId WHERE Id = :id';
  qryAuxiliar.Parameters.ParamByName('trajeto').Value := edtTrajeto.Text;
  qryAuxiliar.Parameters.ParamByName('motoristaId').Value := MotoristaId;
  qryAuxiliar.Parameters.ParamByName('empresaId').Value := EmpresaId;
  qryAuxiliar.Parameters.ParamByName('id').Value := OnibusId;

  try
    qryAuxiliar.ExecSQL();
    HouveErro := False;
  except
    on E:Exception do
    begin
      HouveErro := True;
      ShowMessage('Ocorreu o seguinte erro: ' + E.Message);
    end;
  end;

  if HouveErro = False then
  begin
    frmMenu.cnnConexao.CommitTrans();

    qryOnibus.Close();
    qryOnibus.Open();

    ShowMessage('Operação executada com sucesso!');
    edtId.Clear();
    edtTrajeto.Clear();
    cmbMotorista.ItemIndex := -1;
    cmbEmpresa.ItemIndex := -1;
  end
  else
  begin
    frmMenu.cnnConexao.RollbackTrans();
  end;
end;

procedure TfrmOnibus.btnExcluirClick(Sender: TObject);
begin
  OnibusId := qryOnibus.FieldByName('Id').AsInteger;
  frmMenu.cnnConexao.BeginTrans();
  qryAuxiliar.SQL.Text := 'DELETE FROM Onibus WHERE Id = :id';
  qryAuxiliar.Parameters.ParamByName('id').Value := OnibusId;
  qryAuxiliar.ExecSQL();
  frmMenu.cnnConexao.CommitTrans();

  qryOnibus.Close();
  qryOnibus.Open();

  ShowMessage('Operação executada com sucesso!');
end;

end.
