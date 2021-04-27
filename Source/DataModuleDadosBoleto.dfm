object dmDadosBoletos: TdmDadosBoletos
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 323
  Width = 483
  object Boletos: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 56
    Top = 56
    object BoletosBancoNumero: TStringField
      FieldName = 'BancoNumero'
      Size = 3
    end
    object BoletosBancoDigito: TStringField
      FieldName = 'BancoDigito'
      Size = 1
    end
    object BoletosBancoNome: TStringField
      FieldName = 'BancoNome'
      Size = 60
    end
    object BoletosContaLocalPagamento: TStringField
      FieldName = 'ContaLocalPagto'
      Size = 200
    end
    object BoletosContaCodigoBeneficiario: TStringField
      FieldName = 'ContaCodBeneficiario'
      Size = 30
    end
    object BoletosContaCarteira: TStringField
      FieldName = 'ContaCarteira'
      Size = 5
    end
    object BoletosBeneficiarioCnpjCpf: TStringField
      FieldName = 'BenCnpjCpf'
    end
    object BoletosBeneficiarioNome: TStringField
      FieldName = 'BenNome'
      Size = 100
    end
    object BoletosBeneficiarioLogradouro: TStringField
      FieldName = 'BenLogradouro'
      Size = 100
    end
    object BoletosBeneficiarioNumero: TStringField
      FieldName = 'BenNumero'
      Size = 15
    end
    object BoletosBeneficiarioBairro: TStringField
      FieldName = 'BenBairro'
      Size = 60
    end
    object BoletosBeneficiarioCep: TStringField
      FieldName = 'BenCep'
      Size = 15
    end
    object BoletosBeneficiarioCidade: TStringField
      FieldName = 'BenCidade'
      Size = 100
    end
    object BoletosBeneficiarioUF: TStringField
      FieldName = 'BenUF'
      Size = 2
    end
    object BoletosBeneficiarioTelefone: TStringField
      FieldName = 'BenTelefone'
    end
    object BoletosTituloData: TDateTimeField
      FieldName = 'TitData'
    end
    object BoletosTituloVencimento: TDateTimeField
      FieldName = 'TitVencimento'
    end
    object BoletosTituloNossoNumero: TStringField
      FieldName = 'TitNossoNumero'
      Size = 30
    end
    object BoletosTituloDataProcessamento: TDateTimeField
      FieldName = 'TitDataProc'
    end
    object BoletosTituloDocumento: TStringField
      FieldName = 'TitDocumento'
      Size = 30
    end
    object BoletosTituloAceite: TStringField
      FieldName = 'TitAceite'
      Size = 5
    end
    object BoletosTituloEspecieDocumento: TStringField
      FieldName = 'TitEspecDoc'
      Size = 5
    end
    object BoletosTituloEspecMoeda: TStringField
      FieldName = 'TitEspecMoeda'
      Size = 5
    end
    object BoletosTituloValor: TCurrencyField
      FieldName = 'TitValor'
    end
    object BoletosTituloInstrucoes: TMemoField
      FieldName = 'TitInstrucoes'
      BlobType = ftMemo
    end
    object BoletosPagadorCnpjCpf: TStringField
      FieldName = 'PagCnpjCpf'
    end
    object BoletosPagadorNome: TStringField
      FieldName = 'PagNome'
      Size = 100
    end
    object BoletosPagadorLogradouro: TStringField
      FieldName = 'PagLogradouro'
      Size = 100
    end
    object BoletosPagadorNumero: TStringField
      FieldName = 'PagNumero'
      Size = 15
    end
    object BoletosPagadorBairro: TStringField
      FieldName = 'PagBairro'
      Size = 60
    end
    object BoletosPagadorCep: TStringField
      FieldName = 'PagCep'
      Size = 15
    end
    object BoletosPagadorCidade: TStringField
      FieldName = 'PagCidade'
      Size = 100
    end
    object BoletosPagadorUF: TStringField
      FieldName = 'PagUF'
      Size = 2
    end
    object BoletosPagadorTelefone: TStringField
      FieldName = 'PagTelefone'
    end
    object BoletosCodigoBarras: TStringField
      FieldName = 'CodigoBarras'
      Size = 60
    end
    object BoletosLinhaDigitavel: TStringField
      FieldName = 'LinhaDigitavel'
      Size = 60
    end
  end
end
