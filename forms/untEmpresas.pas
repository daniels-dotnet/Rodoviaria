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
    procedure btnFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
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

end.
