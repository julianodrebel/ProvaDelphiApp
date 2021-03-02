unit ufTarefa3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids, Datasnap.DBClient,
  Vcl.StdCtrls;

type
  TfTarefa3 = class(TForm)
    DBGrid: TDBGrid;
    btnObterTotal: TButton;
    edtTotal: TEdit;
    btnObterDivisao: TButton;
    edtTotalDivisao: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnObterTotalClick(Sender: TObject);
    procedure btnObterDivisaoClick(Sender: TObject);
  private
    FCds: TClientDataSet;
    FDs: TDataSource;
    procedure PopularDadosAleatoriamente;
    procedure CriarCamposCDS;
    procedure CalcularTotal;
    procedure CalcularDivisao;
  public
    { Public declarations }
  end;

var
  fTarefa3: TfTarefa3;

implementation

{$R *.dfm}

procedure TfTarefa3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfTarefa3.FormCreate(Sender: TObject);
begin
  FCds := TClientDataSet.Create(Self);
  FDs := TDataSource.Create(Self);

  PopularDadosAleatoriamente;
end;

procedure TfTarefa3.PopularDadosAleatoriamente;
var
  lIndex: Integer;
begin
  CriarCamposCDS;

  try
    FCds.DisableControls;
    for lIndex := 1 to 10 do
    begin
      FCds.Append;
      FCds.Fields[0].Value := lIndex;
      FCds.Fields[1].Value := 'Projeto ' + lIndex.ToString;
      FCds.Fields[2].Value := Random(99) + 1; //lIndex * 10;
      FCds.Post;
    end;
  finally
    FCds.EnableControls;
  end;
end;

procedure TfTarefa3.btnObterDivisaoClick(Sender: TObject);
begin
  CalcularDivisao;
end;

procedure TfTarefa3.btnObterTotalClick(Sender: TObject);
begin
  CalcularTotal;
end;

procedure TfTarefa3.CalcularDivisao;
var
  lValorAnterior, lTotal: Double;
  lBookmark: TBookmark;
begin
  lValorAnterior := 0;
  lTotal := 0;
  try
    FCds.DisableControls;
    lBookmark := FCds.GetBookmark;
    FCds.First;
    while not FCds.Eof do
    begin
      if FCds.RecNo > 1 then
      begin
        lTotal := lTotal + (FCds.Fields[2].Value / lValorAnterior);
      end;
      lValorAnterior := FCds.Fields[2].Value;

      FCds.Next;
    end;
  finally
    if FCds.BookmarkValid(lBookmark) then
      FCds.GotoBookmark(lBookmark);
    FCds.FreeBookmark(lBookmark);
    FCds.EnableControls;
  end;

  edtTotalDivisao.Text := lTotal.ToString;
end;

procedure TfTarefa3.CalcularTotal;
var
  lTotal: Double;
  lBookmark: TBookmark;
begin
  lTotal := 0;
  try
    FCds.DisableControls;
    lBookmark := FCds.GetBookmark;
    FCds.First;
    while not FCds.Eof do
    begin
      lTotal := lTotal + FCds.Fields[2].Value;
      FCds.Next;
    end;
  finally
    if FCds.BookmarkValid(lBookmark) then
      FCds.GotoBookmark(lBookmark);
    FCds.FreeBookmark(lBookmark);
    FCds.EnableControls;
  end;

  edtTotal.Text := lTotal.ToString;
end;

procedure TfTarefa3.CriarCamposCDS;
var
  lField: TField;
begin
  lField := TIntegerField.Create(FCds);
  lField.FieldName := 'IdProjeto';
  lField.DataSet := FCds;

  lField := TStringField.Create(FCds);
  lField.FieldName := 'NomeProjeto';
  lField.DataSet := FCds;

  lField := TCurrencyField.Create(FCds);
  lField.FieldName := 'Valor';
  lField.DataSet := FCds;

  FCds.CreateDataSet;
  FDs.DataSet := FCds;

  DBGrid.DataSource := FDs;
end;

end.
