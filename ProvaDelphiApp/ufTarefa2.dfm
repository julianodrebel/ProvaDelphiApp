object fTarefa2: TfTarefa2
  Left = 0
  Top = 0
  ActiveControl = btnComeçar
  Caption = 'fTarefa2'
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
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object prbUm: TProgressBar
    Left = 8
    Top = 56
    Width = 473
    Height = 17
    Step = 1
    TabOrder = 0
  end
  object prbDois: TProgressBar
    Left = 8
    Top = 120
    Width = 473
    Height = 17
    TabOrder = 1
  end
  object btnComeçar: TButton
    Left = 528
    Top = 81
    Width = 75
    Height = 25
    Caption = 'Come'#231'ar'
    TabOrder = 2
    OnClick = btnComeçarClick
  end
  object edtIntervaloUm: TEdit
    Left = 8
    Top = 29
    Width = 121
    Height = 21
    NumbersOnly = True
    TabOrder = 3
    Text = '100'
  end
  object edtIntervaloDois: TEdit
    Left = 8
    Top = 93
    Width = 121
    Height = 21
    NumbersOnly = True
    TabOrder = 4
    Text = '200'
  end
end
