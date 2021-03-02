unit uspComponentesRegistro;

interface

uses
  System.Classes, VCL.Controls, VCL.Graphics, uspQuery;

procedure Register;

implementation

procedure Register;
begin
  System.Classes.RegisterComponents('spComponentes', [TspQuery]);
end;

end.
