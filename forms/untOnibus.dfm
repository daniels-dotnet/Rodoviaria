object frmOnibus: TfrmOnibus
  Left = 192
  Top = 117
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cadastro de '#212'nibus'
  ClientHeight = 269
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
  object grdOnibus: TDBGrid
    Left = 10
    Top = 10
    Width = 772
    Height = 210
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
    Top = 230
    Width = 75
    Height = 25
    Caption = 'Fechar'
    TabOrder = 0
    OnClick = btnFecharClick
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
    Top = 24
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
    Top = 24
  end
end
