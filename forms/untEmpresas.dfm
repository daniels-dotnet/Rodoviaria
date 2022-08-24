object frmEmpresas: TfrmEmpresas
  Left = 192
  Top = 117
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Empresas'
  ClientHeight = 269
  ClientWidth = 392
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
  object grdEmpresas: TDBGrid
    Left = 10
    Top = 10
    Width = 372
    Height = 210
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
  object qryEmpresas: TADOQuery
    Connection = frmMenu.cnnConexao
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT Id, Nome FROM Empresas ORDER BY Nome')
    Left = 144
    Top = 24
  end
  object dtsEmpresas: TDataSource
    DataSet = qryEmpresas
    Left = 176
    Top = 24
  end
end
