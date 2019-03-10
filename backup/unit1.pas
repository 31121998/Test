unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Interfaces;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Panel1: TPanel;
    Timer1: TTimer;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Panel1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  mil:integer =0;
  sec:integer = 0;
  min:integer = 0;
implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Timer1Timer(Sender: TObject);
var m,s,t:string;
begin
  inc(mil) ;
  if (sec=59) and (mil=100) then
     begin
     sec:=0;
     inc(min);
     mil := 0;
     end
  else if mil=100 then
     begin
     mil:=0;
     inc(sec);
     end;
  m:=IntToStr(mil);
  //if mil<10 then
  //   m:='0'+IntToStr(mil);
  s:=IntToStr(sec);
 // if sec<10 then
  //   s:='0'+IntToStr(sec);
  t:=IntToStr(min);
 // if min<10 then
  //   t:='0'+IntToStr(min);
  Panel1.Caption:= t+ ' : ' + s +' : '+ m;

end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  if Timer1.Enabled=False then
     begin
     Timer1.Enabled:=True;
     Button1.Caption:='Стоп';
     Button2.Enabled:=True;
     end
  else
     begin
     Timer1.Enabled:=False;
     Button1.Caption:='Старт';
     end;

end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Timer1.Enabled:=False;
  min:=0;
  sec:=0;
  mil:=0;
  Panel1.Caption:='00 : 00 : 00';
  Button1.Caption:='Старт';
  Button2.Enabled:=False;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin

end;

procedure TForm1.Panel1Click(Sender: TObject);
begin

end;

end.

