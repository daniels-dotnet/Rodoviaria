object frmEmpresas: TfrmEmpresas
  Left = 192
  Top = 117
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Empresas'
  ClientHeight = 269
  ClientWidth = 432
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 10
    Top = 13
    Width = 11
    Height = 16
    Caption = 'Id'
  end
  object Label2: TLabel
    Left = 89
    Top = 13
    Width = 33
    Height = 16
    Caption = 'Nome'
  end
  object grdEmpresas: TDBGrid
    Left = 10
    Top = 70
    Width = 412
    Height = 150
    DataSource = dtsEmpresas
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object btnFechar: TBitBtn
    Left = 10
    Top = 230
    Width = 75
    Height = 25
    Caption = 'Fechar'
    TabOrder = 0
    OnClick = btnFecharClick
  end
  object edtId: TEdit
    Left = 25
    Top = 10
    Width = 50
    Height = 24
    Color = clBtnFace
    Enabled = False
    TabOrder = 2
  end
  object edtNome: TEdit
    Left = 125
    Top = 10
    Width = 300
    Height = 24
    Color = clWhite
    TabOrder = 3
  end
  object btnInserir: TBitBtn
    Left = 10
    Top = 40
    Width = 75
    Height = 25
    Caption = 'Inserir'
    TabOrder = 4
    OnClick = btnInserirClick
  end
  object btnAlterar: TBitBtn
    Left = 90
    Top = 40
    Width = 75
    Height = 25
    Caption = 'Alterar'
    TabOrder = 5
    OnClick = btnAlterarClick
  end
  object btnSalvarAlteracoes: TBitBtn
    Left = 170
    Top = 40
    Width = 144
    Height = 25
    Caption = 'Salvar Altera'#231#245'es'
    TabOrder = 6
    OnClick = btnSalvarAlteracoesClick
  end
  object btnExcluir: TBitBtn
    Left = 320
    Top = 40
    Width = 75
    Height = 25
    Caption = 'Excluir'
    TabOrder = 7
    OnClick = btnExcluirClick
  end
  object qryEmpresas: TADOQuery
    Connection = frmMenu.cnnConexao
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT Id, Nome FROM Empresas ORDER BY Nome')
    Left = 120
    Top = 96
  end
  object dtsEmpresas: TDataSource
    DataSet = qryEmpresas
    Left = 152
    Top = 96
  end
  object qryAuxiliar: TADOQuery
    Connection = frmMenu.cnnConexao
    Parameters = <>
    Left = 120
    Top = 144
  end
end
