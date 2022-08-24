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
    procedure btnFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnInserirClick(Sender: TObject);
  private
  public
  end;

var
  frmMotoristas: TfrmMotoristas;

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
    ShowMessage('Preencha o campo salário!');
    Exit;
  end;

  frmMenu.cnnConexao.BeginTrans();
  qryAuxiliar.SQL.Text := 'INSERT INTO Motoristas(Nome, Idade, Sexo, Salario)' +
    'VALUES(:nome, :idade, :sexo, :salario)';
  qryAuxiliar.Parameters.ParamByName('nome').Value := edtNome.Text;
  qryAuxiliar.Parameters.ParamByName('idade').Value := StrToInt(edtIdade.Text);
  qryAuxiliar.Parameters.ParamByName('sexo').Value := edtSexo.Text;
  qryAuxiliar.Parameters.ParamByName('salario').Value := StrToFloat(edtSalario.Text);
  qryAuxiliar.ExecSQL();
  frmMenu.cnnConexao.CommitTrans();

  qryMotoristas.Close();
  qryMotoristas.Open();

  ShowMessage('Operação executada com sucesso!');
  edtId.Clear();
  edtNome.Clear();
end;

end.
