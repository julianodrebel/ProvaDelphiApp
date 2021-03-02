unit ufTarefa2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls;

type
  TfTarefa2 = class(TForm)
    prbUm: TProgressBar;
    prbDois: TProgressBar;
    btnComeçar: TButton;
    edtIntervaloUm: TEdit;
    edtIntervaloDois: TEdit;
    procedure btnComeçarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
  private
    FThreadUm: TThread;
    FThreadDois: TThread;
    procedure InteracaoUm(const pIntervalo: Integer);
    procedure InteracaoDois(const pIntervalo: Integer);
    procedure TerminarThreadUm;
    procedure TerminarThreadDois;
  public
    { Public declarations }
  end;

var
  fTarefa2: TfTarefa2;

implementation

{$R *.dfm}

{ TfTarefa2 }

procedure TfTarefa2.btnComeçarClick(Sender: TObject);
begin
  TerminarThreadUm;
  TerminarThreadDois;

  FThreadUm := TThread.CreateAnonymousThread(
    procedure
    begin
      InteracaoUm(StrToInt(edtIntervaloUm.Text));
    end);

  FThreadDois := TThread.CreateAnonymousThread(
    procedure
    begin
      InteracaoDois(StrToInt(edtIntervaloDois.Text));
    end);

  FThreadUm.FreeOnTerminate := False;
  FThreadDois.FreeOnTerminate := False;

  FThreadUm.Start;
  FThreadDois.Start;
end;

procedure TfTarefa2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfTarefa2.FormDestroy(Sender: TObject);
begin
  TerminarThreadUm;
  TerminarThreadDois;
end;

procedure TfTarefa2.InteracaoDois(const pIntervalo: Integer);
var
  lIndex: Integer;
begin
  TThread.Synchronize(TThread.CurrentThread,
    procedure
    begin
      prbDois.Position := 1;
      prbDois.Max := 100;
    end);

  for lIndex := 0 to 100 do
  begin
    if TThread.CheckTerminated then
      Exit;

    TThread.Synchronize(TThread.CurrentThread,
      procedure
      begin
        prbDois.Position := prbDois.Position +1;
      end);

    Sleep(pIntervalo);
  end;
end;

procedure TfTarefa2.TerminarThreadUm;
begin
  if Assigned(FThreadUm) then
  begin
    FThreadUm.Terminate;
    FThreadUm.WaitFor;
    FThreadUm.Free;
  end;
end;

procedure TfTarefa2.TerminarThreadDois;
begin
  if Assigned(FThreadDois) then
  begin
    FThreadDois.Terminate;
    FThreadDois.WaitFor;
    FThreadDois.Free;
  end;
end;

procedure TfTarefa2.InteracaoUm(const pIntervalo: Integer);
var
  lIndex: Integer;
begin
  TThread.Synchronize(TThread.CurrentThread,
    procedure
    begin
      prbUm.Position := 1;
      prbUm.Max := 100;
    end);

  for lIndex := 0 to 100 do
  begin
    if TThread.CheckTerminated then
      Exit;

    TThread.Synchronize(TThread.CurrentThread,
      procedure
      begin
        prbUm.Position := prbUm.Position +1;
      end);

    Sleep(pIntervalo);
  end;
end;

end.
