object EmailView: TEmailView
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Enviar e-mail'
  ClientHeight = 556
  ClientWidth = 633
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 168
    Width = 74
    Height = 13
    Caption = 'Texto do e-mail'
    FocusControl = memTextoEmail
  end
  object edtRemetente: TLabeledEdit
    Left = 24
    Top = 40
    Width = 441
    Height = 21
    EditLabel.Width = 13
    EditLabel.Height = 13
    EditLabel.Caption = 'De'
    TabOrder = 0
  end
  object edtDestinatario: TLabeledEdit
    Left = 24
    Top = 88
    Width = 585
    Height = 21
    EditLabel.Width = 22
    EditLabel.Height = 13
    EditLabel.Caption = 'Para'
    TabOrder = 2
  end
  object edtAssunto: TLabeledEdit
    Left = 24
    Top = 136
    Width = 585
    Height = 21
    EditLabel.Width = 39
    EditLabel.Height = 13
    EditLabel.Caption = 'Assunto'
    TabOrder = 3
  end
  object memTextoEmail: TMemo
    Left = 24
    Top = 184
    Width = 585
    Height = 281
    TabOrder = 4
  end
  object pnlBar: TPanel
    Left = 0
    Top = 491
    Width = 633
    Height = 65
    Align = alBottom
    BevelKind = bkTile
    BevelOuter = bvNone
    Caption = 'pnlBar'
    Padding.Top = 10
    Padding.Right = 10
    Padding.Bottom = 10
    ShowCaption = False
    TabOrder = 5
    object btnEnviarEmail: TBitBtn
      Left = 499
      Top = 10
      Width = 120
      Height = 41
      Align = alRight
      Caption = 'Enviar'
      TabOrder = 0
      OnClick = btnEnviarEmailClick
    end
  end
  object edtSenha: TLabeledEdit
    Left = 471
    Top = 40
    Width = 138
    Height = 21
    EditLabel.Width = 30
    EditLabel.Height = 13
    EditLabel.Caption = 'Senha'
    PasswordChar = '*'
    TabOrder = 1
  end
end
