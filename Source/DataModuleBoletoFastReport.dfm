object dmBoletoFastReport: TdmBoletoFastReport
  OldCreateOrder = False
  Height = 355
  Width = 542
  object Report: TfrxReport
    Version = '6.2.1'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 44201.962427523150000000
    ReportOptions.LastChange = 44201.962427523150000000
    ScriptLanguage = 'PascalScript'
    StoreInDFM = False
    Left = 264
    Top = 112
  end
  object frxBarCodeObject1: TfrxBarCodeObject
    Left = 296
    Top = 224
  end
  object Boletos: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 400
    Top = 224
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
      FieldName = 'ContaLocalPagamento'
      Size = 200
    end
    object BoletosContaCodigoBeneficiario: TStringField
      FieldName = 'ContaCodigoBeneficiario'
      Size = 30
    end
    object BoletosContaCarteira: TStringField
      FieldName = 'ContaCarteira'
      Size = 5
    end
    object BoletosBeneficiarioCnpjCpf: TStringField
      FieldName = 'BeneficiarioCnpjCpf'
    end
    object BoletosBeneficiarioNome: TStringField
      FieldName = 'BeneficiarioNome'
      Size = 100
    end
    object BoletosBeneficiarioLogradouro: TStringField
      FieldName = 'BeneficiarioLogradouro'
      Size = 100
    end
    object BoletosBeneficiarioNumero: TStringField
      FieldName = 'BeneficiarioNumero'
      Size = 15
    end
    object BoletosBeneficiarioBairro: TStringField
      FieldName = 'BeneficiarioBairro'
      Size = 60
    end
    object BoletosBeneficiarioCep: TStringField
      FieldName = 'BeneficiarioCep'
      Size = 15
    end
    object BoletosBeneficiarioCidade: TStringField
      FieldName = 'BeneficiarioCidade'
      Size = 100
    end
    object BoletosBeneficiarioUF: TStringField
      FieldName = 'BeneficiarioUF'
      Size = 2
    end
    object BoletosBeneficiarioTelefone: TStringField
      FieldName = 'BeneficiarioTelefone'
    end
    object BoletosTituloData: TDateTimeField
      FieldName = 'TituloData'
    end
    object BoletosTituloVencimento: TDateTimeField
      FieldName = 'TituloVencimento'
    end
    object BoletosTituloNossoNumero: TStringField
      FieldName = 'TituloNossoNumero'
      Size = 30
    end
    object BoletosTituloDataProcessamento: TDateTimeField
      FieldName = 'TituloDataProcessamento'
    end
    object BoletosTituloDocumento: TStringField
      FieldName = 'TituloDocumento'
      Size = 30
    end
    object BoletosTituloAceite: TStringField
      FieldName = 'TituloAceite'
      Size = 5
    end
    object BoletosTituloEspecieDocumento: TStringField
      FieldName = 'TituloEspecieDocumento'
      Size = 5
    end
    object BoletosTituloEspecMoeda: TStringField
      FieldName = 'TituloEspecMoeda'
      Size = 5
    end
    object BoletosTituloValor: TCurrencyField
      FieldName = 'TituloValor'
    end
    object BoletosTituloInstrucoes: TMemoField
      FieldName = 'TituloInstrucoes'
      BlobType = ftMemo
    end
    object BoletosPagadorCnpjCpf: TStringField
      FieldName = 'PagadorCnpjCpf'
    end
    object BoletosPagadorNome: TStringField
      FieldName = 'PagadorNome'
      Size = 100
    end
    object BoletosPagadorLogradouro: TStringField
      FieldName = 'PagadorLogradouro'
      Size = 100
    end
    object BoletosPagadorNumero: TStringField
      FieldName = 'PagadorNumero'
      Size = 15
    end
    object BoletosPagadorBairro: TStringField
      FieldName = 'PagadorBairro'
      Size = 60
    end
    object BoletosPagadorCep: TStringField
      FieldName = 'PagadorCep'
      Size = 15
    end
    object BoletosPagadorCidade: TStringField
      FieldName = 'PagadorCidade'
      Size = 100
    end
    object BoletosPagadorUF: TStringField
      FieldName = 'PagadorUF'
      Size = 2
    end
    object BoletosPagadorTelefone: TStringField
      FieldName = 'PagadorTelefone'
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
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDsBoletos'
    CloseDataSource = False
    DataSet = Boletos
    BCDToCurrency = False
    Left = 352
    Top = 120
  end
end
