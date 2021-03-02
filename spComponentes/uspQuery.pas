unit uspQuery;

interface

uses
  System.Classes, System.SysUtils, FireDAC.Comp.Client, FireDAC.Phys.FB;

type
  TspQuery = class(TFDQuery)
  strict private
    FspCondicoes: TStringList;
    FspColunas: TStringList;
    FspTabelas: TStringList;

    function GerarColunas: string;
    function GerarTabelas: string;
    function GerarCondicoes: string;
  public
    procedure GerarSQL;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

  published
    property spCondicoes: TStringList read FspCondicoes write FspCondicoes;
    property spColunas: TStringList read FspColunas write FspColunas;
    property spTabelas: TStringList read FspTabelas write FspTabelas;

  end;

implementation

{ TspQuery }

constructor TspQuery.Create(AOwner: TComponent);
begin
  inherited;
  FspCondicoes := TStringList.Create;
  FspColunas := TStringList.Create;
  FspTabelas := TStringList.Create;
end;

destructor TspQuery.Destroy;
begin
  FspCondicoes.Free;
  FspColunas.Free;
  FspTabelas.Free;
  inherited;
end;

function TspQuery.GerarColunas: string;
var
  lIndex: Integer;
  lColunas: TStringList;
begin
  lColunas := TStringList.Create;
  try
    for lIndex := 0 to FspColunas.Count -1 do
    begin
      lColunas.Add(FspColunas[lIndex]);
    end;

    if lColunas.Count = 0 then
    begin
      raise Exception.Create('Nenhuma coluna informada para gerar SQL');
    end;

    lColunas.Delimiter := ',';
    Result := lColunas.DelimitedText;
  finally
    lColunas.Free;
  end;
end;

function TspQuery.GerarCondicoes: string;
var
  lIndex: Integer;
  lCondicoes: TStringList;
begin
  lCondicoes := TStringList.Create;
  try
    for lIndex := 0 to FspCondicoes.Count -1 do
    begin
      if lCondicoes.Count > 0 then
      begin
        lCondicoes.Add('AND');
      end;
      lCondicoes.Add(FspCondicoes[lIndex]);
    end;

    if lCondicoes.Count = 0 then
    begin
      {todo: Verificar se precisa desta validação}
      raise Exception.Create('Nenhuma condição informada para gerar SQL');
    end;

    Result := lCondicoes.Text;
  finally
    lCondicoes.Free;
  end;
end;

procedure TspQuery.GerarSQL;
var
  lSQL: TStringList;
begin
  lSQL := TStringList.Create;
  try
    lSQL.Add('SELECT');
    lSQL.Add(GerarColunas);
    lSQL.Add('FROM');
    lSQL.Add(GerarTabelas);
    lSQL.Add('WHERE');
    lSQL.Add(GerarCondicoes);

    Self.SQL.Text := lSQL.Text;
  finally
    lSQL.Free;
  end;
end;

function TspQuery.GerarTabelas: string;
begin
  FspTabelas.Text := Trim(FspTabelas.Text);

  if FspTabelas.Count = 0 then
  begin
    raise Exception.Create('Nenhuma tabela informada para gerar SQL');
  end
  else if FspTabelas.Count > 1 then
  begin
    raise Exception.Create('Só é permitido informar apenas uma tabela para gerar SQL');
  end
  else
  begin
    Result := Trim(FspTabelas.Text);
  end;
end;

end.
