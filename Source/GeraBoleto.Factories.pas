unit GeraBoleto.Factories;

interface

uses
  GeraBoleto.Base,
  GeraBoleto.Boleto;

type
  TFactoryBoleto = class
  public
    class function GetFormatter(ABoleto: IBoleto): IFormatacao;
  end;

implementation

uses
  SysUtils,
  GeraBoleto.Banco001,
  GeraBoleto.Banco237;

{ TFactoryBoleto }

class function TFactoryBoleto.GetFormatter(ABoleto: IBoleto): IFormatacao;
begin
  case ABoleto.GetConta.Banco.Numero.ToInteger() of
    1: Result := TFormata001.Create(ABoleto);
    237: Result := TFormata237.Create(ABoleto);
  else
    raise Exception.Create('Banco não implementado!');
  end;
end;

end.
