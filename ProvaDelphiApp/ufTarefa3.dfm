object fTarefa3: TfTarefa3
  Left = 0
  Top = 0
  Caption = 'fTarefa3'
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
  OnCreate = FormCreate
  DesignSize = (
    635
    299)
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid: TDBGrid
    Left = 0
    Top = 0
    Width = 635
    Height = 225
    Align = alTop
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object btnObterTotal: TButton
    Left = 416
    Top = 240
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Obter Total'
    TabOrder = 1
    OnClick = btnObterTotalClick
  end
  object edtTotal: TEdit
    Left = 497
    Top = 242
    Width = 121
    Height = 21
    Anchors = [akRight, akBottom]
    NumbersOnly = True
    TabOrder = 2
  end
  object btnObterDivisao: TButton
    Left = 391
    Top = 266
    Width = 100
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Obter Divis'#245'es'
    TabOrder = 3
    OnClick = btnObterDivisaoClick
  end
  object edtTotalDivisao: TEdit
    Left = 497
    Top = 268
    Width = 121
    Height = 21
    Anchors = [akRight, akBottom]
    NumbersOnly = True
    TabOrder = 4
  end
end
