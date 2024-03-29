unit Util.XML;

interface

uses
   XMLDoc, XMLIntf, System.Rtti;

type
   TXMLUtil = class
   private
      class procedure ObjectToXML(pXMLNode: IXMLNode; const pObject: TObject;
         const pType: TRttiType); overload;
   public
      class function ObjectToXML(const pObject: TObject): IXMLDocument; overload;
   end;

implementation

uses
   System.TypInfo;

{ TXMLUtil }

{
   "ObjectToXML" � uma classe que literalmente converte um objeto para um XML,
   identificando todas as propriedades da classe e gerando uma tag para cada
   uma, identificando inclusive quando esta classe possui outras classes como
   propriedade, gerando assim grupos de tags no XML.
}
class procedure TXMLUtil.ObjectToXML(pXMLNode: IXMLNode;
   const pObject: TObject; const pType: TRttiType);
var
   xProperty: TRttiProperty;
   xObject: TObject;
begin
   if pObject = Nil then
      Exit;

   if pObject.ClassInfo = Nil then
      Exit;

   for xProperty in pType.GetDeclaredProperties do
   begin
      if xProperty.PropertyType.TypeKind = tkClass then
      begin
         try
            xObject := GetObjectProp(pObject, xProperty.Name);
         except
            Continue;
         end;

         ObjectToXML(pXMLNode.AddChild(xProperty.Name), xObject, xProperty.PropertyType);
      end
      else
         pXMLNode.ChildValues[xProperty.Name] :=
            GetPropValue(pObject, xProperty.Name, True);
   end;
end;

class function TXMLUtil.ObjectToXML(const pObject: TObject): IXMLDocument;
var
   xContext: TRttiContext;
   xType   : TRttiType;
begin
   try
      xContext := TRttiContext.Create;
      xType    := xContext.GetType(pObject.ClassType);

      Result := TXMLDocument.Create(Nil);
      Result.Active := True;

      ObjectToXML(
         Result.AddChild(
            Copy(pObject.ClassName, 2, Length(pObject.ClassName))),
            pObject, xType);
   finally
      xContext.Free;
   end;
end;

end.
