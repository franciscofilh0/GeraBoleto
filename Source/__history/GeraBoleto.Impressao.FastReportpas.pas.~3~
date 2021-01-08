unit GeraBoleto.Impressao.FastReportpas;

interface

uses
  GeraBoleto.Impressao,
  GeraBoleto.Boleto,
  System.SysUtils,
  System.Generics.Collections;

type
  TImpressaoBoletoFast = class(TInterfacedObject, IImpressaoBoleto)
  private
    FReportFile: string;
  public
    constructor Create(AReportFile: string);
    procedure Imprimir(ABoleto: TList<IBoleto>);
  end;

implementation

{ TImpressaoBoletoFast }

constructor TImpressaoBoletoFast.Create(AReportFile: string);
begin
  FReportFile := AReportFile;

  if FReportFile.IsEmpty() then
    raise Exception.Create('Arquivo do FastReport não informado!');

  if not FileExists(FReportFile) then
    raise Exception.Create('Arquivo do FastReport não encontrado!');
end;

procedure TImpressaoBoletoFast.Imprimir(ABoleto: TList<IBoleto>);
begin

end;

end.
