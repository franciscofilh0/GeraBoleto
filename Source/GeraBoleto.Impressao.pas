unit GeraBoleto.Impressao;

interface

uses
  GeraBoleto.Boleto,
  System.Generics.Collections;

type

  IImpressaoBoleto = interface
    procedure Imprimir(Aboletos: TList<IBoleto>);
  end;

implementation

end.
