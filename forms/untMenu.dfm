object frmMenu: TfrmMenu
  Left = 192
  Top = 117
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Sistema de Controle de Rodovi'#225'rias'
  ClientHeight = 219
  ClientWidth = 392
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 16
  object btnEmpresas: TBitBtn
    Left = 50
    Top = 25
    Width = 300
    Height = 25
    Caption = 'Empresas'
    TabOrder = 0
  end
  object btnMotoristas: TBitBtn
    Left = 50
    Top = 75
    Width = 300
    Height = 25
    Caption = 'Motoristas'
    TabOrder = 1
  end
  object btnOnibus: TBitBtn
    Left = 50
    Top = 125
    Width = 300
    Height = 25
    Caption = #212'nibus'
    TabOrder = 2
  end
  object btnFechar: TBitBtn
    Left = 50
    Top = 175
    Width = 300
    Height = 25
    Caption = 'Fechar'
    TabOrder = 3
    OnClick = btnFecharClick
  end
  object cnnConexao: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=123;Persist Security Info=True;User' +
      ' ID=sa;Initial Catalog=Rodoviaria;Data Source=DANIEL-PC\MSSQL201' +
      '9'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 8
    Top = 176
  end
end
