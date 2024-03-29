unit View.Email;

interface

uses
   Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
   System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
   Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Util.Email;

type
   TEmailView = class(TForm)
      edtRemetente: TLabeledEdit;
      edtDestinatario: TLabeledEdit;
      edtAssunto: TLabeledEdit;
      memTextoEmail: TMemo;
      Label1: TLabel;
      pnlBar: TPanel;
      btnEnviarEmail: TBitBtn;
      edtSenha: TLabeledEdit;
      procedure btnEnviarEmailClick(Sender: TObject);
   private
    { Private declarations }
   public
    { Public declarations }
   end;

var
   EmailView: TEmailView;

implementation

{$R *.dfm}

procedure TEmailView.btnEnviarEmailClick(Sender: TObject);
var
   xDadosEmail: TDadosEnvio;
begin
   xDadosEmail.Remetente    := edtRemetente.Text;
   xDadosEmail.Senha        := edtSenha.Text;
   xDadosEmail.Assunto      := edtAssunto.Text;
   xDadosEmail.Destinatario := edtDestinatario.Text;
   xDadosEmail.TextoEmail   := memTextoEmail.Text;
   xDadosEmail.Anexo        := 'XML.xml';

   try
      TEmailUtil.Enviar(xDadosEmail);

      MessageDlg('E-mail enviado com sucesso!', mtInformation, [mbOk], 0);
      Close;
   except
      on E: Exception do
         MessageDlg(E.Message, mtWarning, [mbOk], 0);
   end;
end;

end.

