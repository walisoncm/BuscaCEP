object ClienteView: TClienteView
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Dados do cliente'
  ClientHeight = 392
  ClientWidth = 711
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lblCPF: TLabel
    Left = 24
    Top = 72
    Width = 19
    Height = 13
    Caption = 'CPF'
    FocusControl = edtCPF
  end
  object lblTelefone: TLabel
    Left = 115
    Top = 72
    Width = 42
    Height = 13
    Caption = 'Telefone'
    FocusControl = edtTelefone
  end
  object edtNome: TLabeledEdit
    Left = 24
    Top = 40
    Width = 537
    Height = 21
    EditLabel.Width = 27
    EditLabel.Height = 13
    EditLabel.Caption = 'Nome'
    MaxLength = 80
    TabOrder = 0
  end
  object edtIdentidade: TLabeledEdit
    Left = 567
    Top = 40
    Width = 121
    Height = 21
    EditLabel.Width = 52
    EditLabel.Height = 13
    EditLabel.Caption = 'Identidade'
    TabOrder = 1
  end
  object edtCPF: TMaskEdit
    Left = 24
    Top = 88
    Width = 83
    Height = 21
    EditMask = '999.999.999-99;0;_'
    MaxLength = 14
    TabOrder = 2
    Text = ''
  end
  object edtTelefone: TMaskEdit
    Left = 115
    Top = 88
    Width = 88
    Height = 21
    EditMask = '(99) 9999-9999;0;_'
    MaxLength = 14
    TabOrder = 3
    Text = ''
  end
  object edtEmail: TLabeledEdit
    Left = 209
    Top = 88
    Width = 479
    Height = 21
    EditLabel.Width = 28
    EditLabel.Height = 13
    EditLabel.Caption = 'E-mail'
    MaxLength = 200
    TabOrder = 4
  end
  object grpEndereco: TGroupBox
    Left = 24
    Top = 123
    Width = 664
    Height = 182
    Caption = 'Endere'#231'o'
    TabOrder = 5
    object lblCEP: TLabel
      Left = 19
      Top = 24
      Width = 19
      Height = 13
      Caption = 'CEP'
      FocusControl = edtCEP
    end
    object edtCEP: TMaskEdit
      Left = 19
      Top = 40
      Width = 66
      Height = 21
      EditMask = '99.999-999;0;_'
      MaxLength = 10
      TabOrder = 0
      Text = ''
      OnExit = edtCEPExit
      OnKeyDown = edtCEPKeyDown
    end
    object edtLogradouro: TLabeledEdit
      Left = 91
      Top = 40
      Width = 446
      Height = 21
      EditLabel.Width = 55
      EditLabel.Height = 13
      EditLabel.Caption = 'Logradouro'
      MaxLength = 200
      ReadOnly = True
      TabOrder = 1
    end
    object edtNumero: TLabeledEdit
      Left = 543
      Top = 40
      Width = 101
      Height = 21
      EditLabel.Width = 37
      EditLabel.Height = 13
      EditLabel.Caption = 'N'#250'mero'
      MaxLength = 200
      TabOrder = 2
    end
    object edtComplemento: TLabeledEdit
      Left = 19
      Top = 88
      Width = 314
      Height = 21
      EditLabel.Width = 65
      EditLabel.Height = 13
      EditLabel.Caption = 'Complemento'
      MaxLength = 200
      TabOrder = 3
    end
    object edtBairro: TLabeledEdit
      Left = 339
      Top = 88
      Width = 305
      Height = 21
      EditLabel.Width = 28
      EditLabel.Height = 13
      EditLabel.Caption = 'Bairro'
      MaxLength = 200
      ReadOnly = True
      TabOrder = 4
    end
    object edtCidade: TLabeledEdit
      Left = 19
      Top = 136
      Width = 478
      Height = 21
      EditLabel.Width = 33
      EditLabel.Height = 13
      EditLabel.Caption = 'Cidade'
      MaxLength = 200
      ReadOnly = True
      TabOrder = 5
    end
    object edtEstado: TLabeledEdit
      Left = 503
      Top = 136
      Width = 34
      Height = 21
      EditLabel.Width = 33
      EditLabel.Height = 13
      EditLabel.Caption = 'Estado'
      MaxLength = 200
      ReadOnly = True
      TabOrder = 6
    end
    object edtPais: TLabeledEdit
      Left = 543
      Top = 136
      Width = 101
      Height = 21
      EditLabel.Width = 19
      EditLabel.Height = 13
      EditLabel.Caption = 'Pa'#237's'
      MaxLength = 200
      TabOrder = 7
    end
  end
  object pnlBar: TPanel
    Left = 0
    Top = 327
    Width = 711
    Height = 65
    Align = alBottom
    BevelKind = bkTile
    BevelOuter = bvNone
    Caption = 'pnlBar'
    Padding.Top = 10
    Padding.Right = 10
    Padding.Bottom = 10
    ShowCaption = False
    TabOrder = 6
    object btnEnviarEmail: TBitBtn
      Left = 577
      Top = 10
      Width = 120
      Height = 41
      Align = alRight
      Caption = 'Enviar E-mail'
      TabOrder = 0
      OnClick = btnEnviarEmailClick
    end
  end
end
