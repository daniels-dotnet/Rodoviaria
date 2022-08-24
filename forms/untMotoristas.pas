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
    procedure btnFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
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

end.
