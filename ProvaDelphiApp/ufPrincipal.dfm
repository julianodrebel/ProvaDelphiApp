object fPrincipal: TfPrincipal
  Left = 0
  Top = 0
  Caption = 'Principal'
  ClientHeight = 537
  ClientWidth = 1052
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = MainMenu
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu: TMainMenu
    Left = 312
    Top = 152
    object mniTarefas: TMenuItem
      Caption = 'Tarefas'
      object mniTarefa1: TMenuItem
        Caption = 'Tarefa 1'
        OnClick = mniTarefa1Click
      end
      object mniTarefa2: TMenuItem
        Caption = 'Tarefa 2'
        OnClick = mniTarefa2Click
      end
      object mniTarefa3: TMenuItem
        Caption = 'Tarefa 3'
        OnClick = mniTarefa3Click
      end
    end
  end
end
