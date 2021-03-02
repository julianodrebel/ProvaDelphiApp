object fTarefa1: TfTarefa1
  Left = 0
  Top = 0
  Caption = 'fTarefa1'
  ClientHeight = 299
  ClientWidth = 635
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  DesignSize = (
    635
    299)
  PixelsPerInch = 96
  TextHeight = 13
  object lblSQLGerado: TLabel
    AlignWithMargins = True
    Left = 18
    Top = 178
    Width = 57
    Height = 13
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Caption = 'SQL Gerado'
  end
  object lblColunas: TLabel
    Left = 18
    Top = 3
    Width = 38
    Height = 13
    Caption = 'Colunas'
  end
  object lblTabelas: TLabel
    Left = 183
    Top = 3
    Width = 37
    Height = 13
    Caption = 'Tabelas'
  end
  object lblCondicoes: TLabel
    Left = 348
    Top = 3
    Width = 49
    Height = 13
    Caption = 'Condi'#231#245'es'
  end
  object mmoResultado: TMemo
    AlignWithMargins = True
    Left = 18
    Top = 200
    Width = 486
    Height = 89
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Anchors = [akLeft, akTop, akBottom]
    TabOrder = 0
  end
  object mmoColunas: TMemo
    AlignWithMargins = True
    Left = 18
    Top = 20
    Width = 156
    Height = 150
    TabOrder = 1
  end
  object mmoTabelas: TMemo
    AlignWithMargins = True
    Left = 183
    Top = 20
    Width = 156
    Height = 150
    TabOrder = 2
  end
  object mmoCondicoes: TMemo
    AlignWithMargins = True
    Left = 348
    Top = 20
    Width = 156
    Height = 150
    TabOrder = 3
  end
  object btnGerarSQL: TButton
    Left = 536
    Top = 88
    Width = 75
    Height = 25
    Caption = 'Gerar SQL'
    TabOrder = 4
    OnClick = btnGerarSQLClick
  end
  object spQuery: TspQuery
    Left = 552
    Top = 144
  end
end
