program GeraBoletoTest;
{

  Delphi DUnit Test Project
  -------------------------
  This project contains the DUnit test framework and the GUI/Console test runners.
  Add "CONSOLE_TESTRUNNER" to the conditional defines entry in the project options
  to use the console test runner.  Otherwise the GUI test runner will be used by
  default.

}

{$IFDEF CONSOLE_TESTRUNNER}
{$APPTYPE CONSOLE}
{$ENDIF}

uses
  DUnitTestRunner,
  GeraBoleto.Pessoa in '..\Source\GeraBoleto.Pessoa.pas',
  GeraBoleto.Banco in '..\Source\GeraBoleto.Banco.pas',
  GeraBoleto.Conta in '..\Source\GeraBoleto.Conta.pas',
  GeraBoleto.Titulo in '..\Source\GeraBoleto.Titulo.pas',
  GeraBoleto.Boleto in '..\Source\GeraBoleto.Boleto.pas',
  TestBanco in 'TestBanco.pas',
  GeraBoleto.Funcoes in '..\Source\GeraBoleto.Funcoes.pas';

{$R *.RES}

begin
  DUnitTestRunner.RunRegisteredTests;
end.

