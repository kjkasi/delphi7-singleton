unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  TSingleton = class
    test : String;
  private
    { Private declarations }
  public
    { Public declarations }
    class function NewInstance() : TObject; override;
  end;

var
  Form1: TForm1;
  Instance : TSingleton;

implementation

{$R *.dfm}

{ TSingleton }

class function TSingleton.NewInstance: TObject;
begin
  if not Assigned(Instance) then
  begin
    Instance := TSingleton(inherited NewInstance);
  end;
  Result := Instance;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  Singleton1, Singleton2, Singleton3 : TSingleton;
begin
  Singleton1 := TSingleton(TSingleton.NewInstance);
  Singleton2 := TSingleton(TSingleton.NewInstance);
  Singleton3 := TSingleton(TSingleton.NewInstance);
  
  Singleton1.test := '1';
  Singleton2.test := '1';
  Singleton3.test := '1';
  Memo1.Lines.Add(Singleton1.test);
  Memo1.Lines.Add(Singleton2.test);
  Memo1.Lines.Add(Singleton3.test);

  Singleton1.test := '2';
  Memo1.Lines.Add(Singleton1.test);
  Memo1.Lines.Add(Singleton2.test);
  Memo1.Lines.Add(Singleton3.test);

  Singleton1.test := '3';
  Memo1.Lines.Add(Singleton1.test);
  Memo1.Lines.Add(Singleton2.test);
  Memo1.Lines.Add(Singleton3.test);


end;

end.
