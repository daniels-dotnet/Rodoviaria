unit untMotoristas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, ADODB, Grids, DBGrids;

type
  TfrmMotoristas = class(TForm)
    btnFechar: TBitBtn;
    qryMotoristas: TADOQuery;
    grdMotoristas: TDBGrid;
    dtsMotoristas: TDataSource;
    qryMotoristasId: TAutoIncField;
    qryMotoristasNome: TStringField;
    qryMotoristasIdade: TIntegerField;
    qryMotoristasSexo: TStringField;
    qryMotoristasSalario: TBCDField;
    Label1: TLabel;
    edtId: TEdit;
    Label2: TLabel;
    edtNome: TEdit;
    btnInserir: TBitBtn;
    qryAuxiliar: TADOQuery;
    Label3: TLabel;
    edtIdade: TEdit;
    Label4: TLabel;
    edtSexo: TEdit;
    Label5: TLabel;
    edtSalario: TEdit;
    btnAlterar: TBitBtn;
    btnSalvarAlteracoes: TBitBtn;
    btnExcluir: TBitBtn;
    procedure btnFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnInserirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnSalvarAlteracoesClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
  private
  public
  end;

var
  frmMotoristas: TfrmMotoristas;
  MotoristaId : Integer;
  HouveErro : Boolean;

implementation

uses untMenu;

{$R *.dfm}

procedure TfrmMotoristas.btnFecharClick(Sender: TObject);
begin
  Close();
end;

procedure TfrmMotoristas.FormShow(Sender: TObject);
begin
  qryMotoristas.Open();
end;

procedure TfrmMotoristas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qryMotoristas.Close();
end;

procedure TfrmMotoristas.btnInserirClick(Sender: TObject);
begin
  if (Trim(edtNome.Text) = '') then
  begin
    ShowMessage('Preencha o campo nome!');
    Exit;
  end;

  if (Trim(edtIdade.Text) = '') then
  begin
    ShowMessage('Preencha o campo idade!');
    Exit;
  end;

  if (Trim(edtSexo.Text) = '') then
  begin
    ShowMessage('Preencha o campo sexo!');
    Exit;
  end;

  if (Trim(edtSalario.Text) = '') then
  begin
    ShowMessage('Preencha o campo sal�rio!');
    Exit;
  end;

  frmMenu.cnnConexao.BeginTrans();
  qryAuxiliar.SQL.Text := 'INSERT INTO Motoristas(Nome, Idade, Sexo, Salario)' +
    'VALUES(:nome, :idade, :sexo, :salario)';
  qryAuxiliar.Parameters.ParamByName('nome').Value := edtNome.Text;
  qryAuxiliar.Parameters.ParamByName('idade').Value := StrToInt(edtIdade.Text);
  qryAuxiliar.Parameters.ParamByName('sexo').Value := edtSexo.Text;
  qryAuxiliar.Parameters.ParamByName('salario').Value := StrToFloat(edtSalario.Text);

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

    qryMotoristas.Close();
    qryMotoristas.Open();

    ShowMessage('Opera��o executada com sucesso!');
    edtId.Clear();
    edtNome.Clear();
    edtIdade.Clear();
    edtSexo.Clear();
    edtSalario.Clear();
  end
  else
  begin
    frmMenu.cnnConexao.RollbackTrans();
  end;
end;

procedure TfrmMotoristas.btnAlterarClick(Sender: TObject);
begin
  MotoristaId := qryMotoristas.FieldByName('Id').AsInteger;
  edtId.Text := IntToStr(MotoristaId);
  edtNome.Text := qryMotoristas.FieldByName('Nome').AsString;
  edtIdade.Text := qryMotoristas.FieldByName('Idade').AsString;
  edtSexo.Text := qryMotoristas.FieldByName('Sexo').AsString;
  edtSalario.Text := FormatFloat('0.00', qryMotoristas.FieldByName('Salario').AsFloat);
end;

procedure TfrmMotoristas.btnSalvarAlteracoesClick(Sender: TObject);
begin
  if (Trim(edtNome.Text) = '') then
  begin
    ShowMessage('Preencha o campo nome!');
    Exit;
  end;

  if (Trim(edtIdade.Text) = '') then
  begin
    ShowMessage('Preencha o campo idade!');
    Exit;
  end;

  if (Trim(edtSexo.Text) = '') then
  begin
    ShowMessage('Preencha o campo sexo!');
    Exit;
  end;

  if (Trim(edtSalario.Text) = '') then
  begin
    ShowMessage('Preencha o campo sal�rio!');
    Exit;
  end;

  frmMenu.cnnConexao.BeginTrans();
  qryAuxiliar.SQL.Text := 'UPDATE Motoristas SET Nome = :nome, Idade = :idade,' +
    'Sexo = :sexo, Salario = :salario WHERE Id = :id';
  qryAuxiliar.Parameters.ParamByName('nome').Value := edtNome.Text;
  qryAuxiliar.Parameters.ParamByName('idade').Value := StrToInt(edtIdade.Text);
  qryAuxiliar.Parameters.ParamByName('sexo').Value := edtSexo.Text;
  qryAuxiliar.Parameters.ParamByName('salario').Value := StrToFloat(edtSalario.Text);
  qryAuxiliar.Parameters.ParamByName('id').Value := MotoristaId;

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

    qryMotoristas.Close();
    qryMotoristas.Open();

    ShowMessage('Opera��o executada com sucesso!');
    edtId.Clear();
    edtNome.Clear();
    edtIdade.Clear();
    edtSexo.Clear();
    edtSalario.Clear();
  end
  else
  begin
    frmMenu.cnnConexao.RollbackTrans();
  end;
end;

procedure TfrmMotoristas.btnExcluirClick(Sender: TObject);
begin
  MotoristaId := qryMotoristas.FieldByName('Id').AsInteger;
  frmMenu.cnnConexao.BeginTrans();
  qryAuxiliar.SQL.Text := 'DELETE FROM Motoristas WHERE Id = :id';
  qryAuxiliar.Parameters.ParamByName('id').Value := MotoristaId;

  try
    qryAuxiliar.ExecSQL();
    HouveErro := False;
  except
    on E:Exception do
    begin
      HouveErro := True;

      if frmMenu.ErroBD(E.Message, 'FK_Onibus_Motoristas') = 'Sim' then
        ShowMessage('Imposs�vel excluir pois existem �nibus ligados a este Motorista!')
      else
        ShowMessage('Ocorreu o seguinte erro: ' + E.Message);
    end;
  end;

  if HouveErro = False then
  begin
    frmMenu.cnnConexao.CommitTrans();

    qryMotoristas.Close();
    qryMotoristas.Open();

    ShowMessage('Opera��o executada com sucesso!');
  end
  else
  begin
    frmMenu.cnnConexao.RollbackTrans();
  end;
end;

end.
