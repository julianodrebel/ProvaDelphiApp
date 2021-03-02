unit ufPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus;

type
  TfPrincipal = class(TForm)
    MainMenu: TMainMenu;
    mniTarefas: TMenuItem;
    mniTarefa1: TMenuItem;
    mniTarefa2: TMenuItem;
    mniTarefa3: TMenuItem;
    procedure mniTarefa1Click(Sender: TObject);
    procedure mniTarefa2Click(Sender: TObject);
    procedure mniTarefa3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fPrincipal: TfPrincipal;

implementation

{$R *.dfm}

uses ufTarefa1, ufTarefa2, ufTarefa3;

procedure TfPrincipal.mniTarefa1Click(Sender: TObject);
begin
  var lfTarefa1: TfTarefa1 := TfTarefa1.Create(Self);
  lfTarefa1.Show;
end;

procedure TfPrincipal.mniTarefa2Click(Sender: TObject);
begin
  var lfTarefa2: TfTarefa2 := TfTarefa2.Create(Self);
  lfTarefa2.Show;
end;

procedure TfPrincipal.mniTarefa3Click(Sender: TObject);
begin
  var lfTarefa3: TfTarefa3 := TfTarefa3.Create(Self);
  lfTarefa3.Show;
end;

end.
