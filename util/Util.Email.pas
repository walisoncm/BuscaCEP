unit Util.Email;

interface

uses
   IdMessage, IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase,
   IdMessageClient, IdSMTPBase, IdSMTP, IdBaseComponent, IdComponent,
   IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL, IdText,
   IdAttachmentFile;

type
   TDadosEnvio = record
      Remetente,
      Senha,
      Assunto,
      Destinatario,
      TextoEmail,
      Anexo: String;
   end;

   TEmailUtil = class
   private
      class function RetornaSMTP(pEmail: string): string; static;
   public
      class procedure Enviar(pDadosEnvio: TDadosEnvio);
   end;

implementation

uses
  System.SysUtils;

{ TEmailUtil }

class function TEmailUtil.RetornaSMTP(pEmail: string): string;
begin
   Result := 'smtp.' + Copy(pEmail, Pos('@', pEmail) + 1, Length(pEmail));
end;

class procedure TEmailUtil.Enviar(pDadosEnvio: TDadosEnvio);
var
   xIdText: TIdText;
   xIdSMTP: TIdSMTP;
   xIdMessage: TIdMessage;
   xIdSSLIOHandlerSocketOpenSSL: TIdSSLIOHandlerSocketOpenSSL;
begin
   try
      //CONFIGURAÇÃO SSL
      xIdSSLIOHandlerSocketOpenSSL := TIdSSLIOHandlerSocketOpenSSL.Create(Nil);
      xIdSSLIOHandlerSocketOpenSSL.SSLOptions.Method := sslvSSLv23;
      xIdSSLIOHandlerSocketOpenSSL.SSLOptions.Mode := sslmClient;

      //CONFIGURAÇÃO DO SERVIDOR
      xIdSMTP := TIdSMTP.Create(Nil);
      xIdSMTP.IOHandler := xIdSSLIOHandlerSocketOpenSSL;
      xIdSMTP.UseTLS := utUseImplicitTLS;
      xIdSMTP.AuthType := satDefault;
      xIdSMTP.Host := RetornaSMTP(pDadosEnvio.Remetente);
      xIdSMTP.Port := 465;
      xIdSMTP.Username := pDadosEnvio.Remetente;
      xIdSMTP.Password := pDadosEnvio.Senha;

      //CONFIGURANDO MENSAGEM
      xIdMessage := TIdMessage.Create(Nil);
      xIdMessage.CharSet := 'utf-8';
      xIdMessage.Encoding := meMIME;
      xIdMessage.Priority := mpNormal;

      //REMETENTE
      xIdMessage.From.Name := xIdSMTP.Username;
      xIdMessage.From.Address := xIdSMTP.Username;

      //ASSUNTO
      xIdMessage.Subject := pDadosEnvio.Assunto;

      //DESTINATÁRIO
      xIdMessage.Recipients.EMailAddresses := pDadosEnvio.Destinatario;

      //CORPO DO E-MAIL
      xIdText := TIdText.Create(xIdMessage.MessageParts);
      xIdText.ContentType := 'text/html; text/plain; charset=iso-8859-1';
      xIdText.Body.Add(pDadosEnvio.TextoEmail);

      //ANEXO
      TIdAttachmentFile.Create(xIdMessage.MessageParts, pDadosEnvio.Anexo);

      xIdSMTP.Connect;
      xIdSMTP.Authenticate;
      xIdSMTP.Send(xIdMessage);
   finally
      if xIdMessage <> Nil then
         FreeAndNil(xIdMessage);

      if xIdSMTP <> Nil then
      begin
         xIdSMTP.Disconnect;
         FreeAndNil(xIdSMTP);
      end;

      UnLoadOpenSSLLibrary;
   end;
end;

end.

