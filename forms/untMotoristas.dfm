object frmMotoristas: TfrmMotoristas
  Left = 192
  Top = 117
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Motoristas'
  ClientHeight = 269
  ClientWidth = 692
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
  object grdMotoristas: TDBGrid
    Left = 10
    Top = 10
    Width = 672
    Height = 210
    DataSource = dtsMotoristas
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
  object qryMotoristas: TADOQuery
    Connection = frmMenu.cnnConexao
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'SELECT Id, Nome, Idade, Sexo, Salario FROM Motoristas ORDER BY N' +
        'ome')
    Left = 144
    Top = 24
    object qryMotoristasId: TAutoIncField
      FieldName = 'Id'
      ReadOnly = True
    end
    object qryMotoristasNome: TStringField
      FieldName = 'Nome'
      Size = 40
    end
    object qryMotoristasIdade: TIntegerField
      FieldName = 'Idade'
    end
    object qryMotoristasSexo: TStringField
      FieldName = 'Sexo'
      FixedChar = True
      Size = 1
    end
    object qryMotoristasSalario: TBCDField
      DisplayLabel = 'Sal'#225'rio'
      FieldName = 'Salario'
      currency = True
      Precision = 19
    end
  end
  object dtsMotoristas: TDataSource
    DataSet = qryMotoristas
    Left = 176
    Top = 24
  end
end
