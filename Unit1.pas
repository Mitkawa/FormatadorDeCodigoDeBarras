unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Clipbrd, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    CodBarras: TEdit;
    Button1: TButton;
    Label1: TLabel;
    LBCopiado: TLabel;
    Timer1: TTimer;
    procedure Button1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  convertido: string;

implementation

{$R *.dfm}

function RemoveEspacosEPontos(str: string): string;
var
  i: Integer;
begin
  for i := Length(str) downto 1 do
  begin
    if (str[i] = ' ') or (str[i] = '.') or (str[i] = '/') then
      Delete(str, i, 1);
  end;
  Result := str;
  convertido:=str;
end;

procedure TForm1.Button1Click(Sender: TObject);

begin
RemoveEspacosEPontos(CodBarras.Text);
Clipboard.AsText := convertido;
CodBarras.Text:= Convertido;

if Trim(CodBarras.Text) <> '' then
  begin
   LBCopiado.Caption:='Código Copiado !';
   LBCopiado.Visible:=true;
   Timer1.Interval:=5000;
   Timer1.Enabled:=true;

  end
else
  begin
   LBCopiado.Caption:='Campo em branco !';
   LBCopiado.Visible:=true;
   Timer1.Interval:=5000;
   Timer1.Enabled:=true;

  end;

end;


procedure TForm1.Timer1Timer(Sender: TObject);
begin
LBCopiado.Visible:=false;
end;

end.




