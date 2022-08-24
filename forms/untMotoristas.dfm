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
  object Label3: TLabel
    Left = 423
    Top = 13
    Width = 32
    Height = 16
    Caption = 'Idade'
  end
  object Label4: TLabel
    Left = 503
    Top = 13
    Width = 28
    Height = 16
    Caption = 'Sexo'
  end
  object Label5: TLabel
    Left = 575
    Top = 13
    Width = 40
    Height = 16
    Caption = 'Sal'#225'rio'
  end
  object grdMotoristas: TDBGrid
    Left = 10
    Top = 70
    Width = 672
    Height = 150
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
    Width = 290
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
    TabOrder = 7
    OnClick = btnInserirClick
  end
  object edtIdade: TEdit
    Left = 459
    Top = 10
    Width = 30
    Height = 24
    Color = clWhite
    TabOrder = 4
  end
  object edtSexo: TEdit
    Left = 539
    Top = 10
    Width = 30
    Height = 24
    Color = clWhite
    TabOrder = 5
  end
  object edtSalario: TEdit
    Left = 619
    Top = 10
    Width = 60
    Height = 24
    Color = clWhite
    TabOrder = 6
  end
  object btnAlterar: TBitBtn
    Left = 90
    Top = 40
    Width = 75
    Height = 25
    Caption = 'Alterar'
    TabOrder = 8
    OnClick = btnAlterarClick
  end
  object btnSalvarAlteracoes: TBitBtn
    Left = 170
    Top = 40
    Width = 150
    Height = 25
    Caption = 'Salvar Altera'#231#245'es'
    TabOrder = 9
    OnClick = btnSalvarAlteracoesClick
  end
  object qryMotoristas: TADOQuery
    Connection = frmMenu.cnnConexao
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'SELECT Id, Nome, Idade, Sexo, Salario FROM Motoristas ORDER BY N' +
        'ome')
    Left = 144
    Top = 97
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
    Top = 97
  end
  object qryAuxiliar: TADOQuery
    Connection = frmMenu.cnnConexao
    Parameters = <>
    Left = 144
    Top = 144
  end
end
