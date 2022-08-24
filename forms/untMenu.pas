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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMenu: TfrmMenu;

implementation

{$R *.dfm}

procedure TfrmMenu.btnFecharClick(Sender: TObject);
begin
  Application.Terminate();
end;

end.
