object frmOnibus: TfrmOnibus
  Left = 192
  Top = 117
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cadastro de '#212'nibus'
  ClientHeight = 299
  ClientWidth = 792
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
    Width = 42
    Height = 16
    Caption = 'Trajeto'
  end
  object Label4: TLabel
    Left = 10
    Top = 44
    Width = 53
    Height = 16
    Caption = 'Motorista'
  end
  object Label6: TLabel
    Left = 334
    Top = 44
    Width = 50
    Height = 16
    Caption = 'Empresa'
  end
  object grdOnibus: TDBGrid
    Left = 10
    Top = 100
    Width = 772
    Height = 150
    DataSource = dtsOnibus
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Id'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Empresa'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Motorista'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Trajeto'
        Visible = True
      end>
  end
  object btnFechar: TBitBtn
    Left = 10
    Top = 260
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
  object edtTrajeto: TEdit
    Left = 134
    Top = 10
    Width = 290
    Height = 24
    Color = clWhite
    TabOrder = 3
  end
  object btnInserir: TBitBtn
    Left = 10
    Top = 70
    Width = 75
    Height = 25
    Caption = 'Inserir'
    TabOrder = 4
    OnClick = btnInserirClick
  end
  object cmbMotorista: TComboBox
    Left = 67
    Top = 40
    Width = 250
    Height = 24
    ItemHeight = 16
    TabOrder = 5
    OnChange = cmbMotoristaChange
  end
  object cmbEmpresa: TComboBox
    Left = 387
    Top = 40
    Width = 250
    Height = 24
    ItemHeight = 16
    TabOrder = 6
    OnChange = cmbEmpresaChange
  end
  object btnAlterar: TBitBtn
    Left = 90
    Top = 70
    Width = 75
    Height = 25
    Caption = 'Alterar'
    TabOrder = 7
    OnClick = btnAlterarClick
  end
  object btnSalvarAlteracoes: TBitBtn
    Left = 170
    Top = 70
    Width = 150
    Height = 25
    Caption = 'Salvar Altera'#231#245'es'
    TabOrder = 8
    OnClick = btnSalvarAlteracoesClick
  end
  object qryOnibus: TADOQuery
    Connection = frmMenu.cnnConexao
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT'
      #9'Onibus.Id,'
      #9'Empresas.Nome AS Empresa,'
      #9'Motoristas.Nome AS Motorista,'
      #9'Onibus.Trajeto'
      'FROM'
      #9'Onibus'
      'INNER JOIN'
      #9'Empresas ON Onibus.EmpresaId = Empresas.Id'
      'INNER JOIN'
      #9'Motoristas ON Onibus.MotoristaId = Motoristas.Id'
      'ORDER BY'
      #9'Onibus.Trajeto')
    Left = 144
    Top = 192
    object qryOnibusId: TAutoIncField
      FieldName = 'Id'
      ReadOnly = True
    end
    object qryOnibusEmpresa: TStringField
      FieldName = 'Empresa'
      Size = 30
    end
    object qryOnibusMotorista: TStringField
      FieldName = 'Motorista'
      Size = 40
    end
    object qryOnibusTrajeto: TStringField
      FieldName = 'Trajeto'
      Size = 40
    end
  end
  object dtsOnibus: TDataSource
    DataSet = qryOnibus
    Left = 176
    Top = 192
  end
  object qryAuxiliar: TADOQuery
    Connection = frmMenu.cnnConexao
    Parameters = <>
    Left = 144
    Top = 144
  end
end
