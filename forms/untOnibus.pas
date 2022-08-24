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
    procedure btnFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
  public
  end;

var
  frmOnibus: TfrmOnibus;

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
end;

procedure TfrmOnibus.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qryOnibus.Close();
end;

end.
