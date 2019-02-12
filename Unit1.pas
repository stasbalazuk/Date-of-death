unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls;

type
  TForm1 = class(TForm)
    grp1: TGroupBox;
    cal1: TMonthCalendar;
    btn1: TButton;
    grp2: TGroupBox;
    lst1: TListBox;
    procedure FormCreate(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure cal1Click(Sender: TObject);
  private
    sd: string;
    statM: Boolean;
    statG: Boolean;
    dts,ks: Integer;
    ksz: Double;
  public
    { Public declarations }
  end;

const
  god = 3;

var
  Form1: TForm1;

implementation

{$R *.dfm}

function DateSM(d: TDate): string;
var
  myDate : TDateTime;
  myYear, myMonth, myDay : Word;
begin
  Result:='';
  myDate := Form1.cal1.Date;
  DecodeDate(myDate, myYear, myMonth, myDay);
  Result:= IntToStr(myDay)+'@'+IntToStr(myMonth)+'@'+IntToStr(myYear);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  statM:=False;
  statG:=False;
  cal1.Date:=Now;
end;

procedure TForm1.btn1Click(Sender: TObject);
label vx;
var
  y,m0,g0: integer;
  d,m,g: string;
  d1,d2,m1,m2,g1,
  g2,g3,g4: string;
  dz,dz0,dz1,dz2,mz,
  mz0,mz1,mz2,gz,gz0,gz1,
  gz2,gz3,gz4: Integer;
begin
  d:='';
  m:='';
  g:='';
  statM:=False;
  statG:=False;
  lst1.Items.Clear;  
  sd:=DateSM(cal1.Date);
  if Length(sd) > 0 then
  vx:
     y:=Pos('@',sd);
  if y > 0 then begin
  if d = '' then
     d:=Copy(sd,1,y-1)
  else
  if m = '' then begin
     m:=Copy(sd,1,y-1);
     Delete(sd,1,y);
  end;
  if m <> '' then
  if g = '' then
     g:=Copy(sd,1,Length(sd));
     Delete(sd,1,y);
     y:=Pos('@',sd);
  if y > 0 then goto vx;
  end;
  m0:=StrToInt(m);
  if (Length(m) > 1) or (m0 >= 5) then
  if Length(d) > 1 then begin
     m1:=Copy(m,1,1);
     m2:=Copy(m,2,1);
     d1:=Copy(d,1,1);
     d2:=Copy(d,2,1);
  if Length(g) > 2 then begin
     g1:=Copy(g,1,1);
     g2:=Copy(g,2,1);
     g3:=Copy(g,3,1);
     g4:=Copy(g,4,1);
     g0:=StrToInt(g3+g4);
  if g0 > 50 then
     statG:=True
  else
     statG:=False;
  end;
  if m0 >= 5 then
     statM:=True
  else
     statM:=False;
  end;
  if (Length(m) = 1) or (m0 <= 5) then
  if Length(d) = 1 then begin
     statM:=False;
     statG:=False;
     m1:=Copy(m,1,1);
     d1:=Copy(d,1,1);
  if Length(g) > 2 then begin
     g1:=Copy(g,1,1);
     g2:=Copy(g,2,1);
     g3:=Copy(g,3,1);
     g4:=Copy(g,4,1);
     g0:=StrToInt(g3+g4);
  if g0 > 50 then
     statG:=True
  else
     statG:=False;
  end;
  end else begin
  if m0 >= 5 then
     statM:=True
  else
     statM:=False;
     statG:=False;
     m1:=Copy(m,1,1);
     d1:=Copy(d,1,1);
     d2:=Copy(d,2,1);
  if Length(g) > 2 then begin
     g1:=Copy(g,1,1);
     g2:=Copy(g,2,1);
     g3:=Copy(g,3,1);
     g4:=Copy(g,4,1);
     g0:=StrToInt(g3+g4);
  if g0 > 50 then
     statG:=True
  else
     statG:=False;
  end;
  end;
  if (statM) and (statG) then begin
  if Length(d) > 1 then begin
     dz1:=StrToInt(d1);
     dz2:=StrToInt(d2);
     dz0:=StrToInt(d1+d2);
     dz:=dz0;
  end else begin
     dz1:=StrToInt(d1);
     dz:=dz1;
  end;
  if Length(m) > 1 then begin
     mz1:=StrToInt(m1);
     mz2:=StrToInt(m2);
     mz0:=StrToInt(m1+m2);
     mz:=mz0;
  end else begin
     mz1:=StrToInt(m1);
     mz:=mz1;
  end;
  if Length(g) > 2 then begin
     gz1:=StrToInt(g1);
     gz2:=StrToInt(g2);
     gz3:=StrToInt(g3);
     gz4:=StrToInt(g4);
     gz0:=StrToInt(g1+g2);
     gz:=StrToInt(g3+g4);
     gz1:=gz1+gz2;
     m1:=IntToStr(gz1);
  if Length(m1) > 1 then begin
     d1:=Copy(m1,1,1);
     d2:=Copy(m1,2,1);
     m0:=StrToInt(d1);
     g0:=StrToInt(d2);
     gz1:=m0+g0;
  end;
     dts:=dz+mz+(gz1)+(gz3+gz4);
     ks:=dz1+dz2+mz1+mz2+gz1+gz2+gz3+gz4;
     m1:=IntToStr(ks);
  if Length(m1) > 1 then begin
     d1:=Copy(m1,1,1);
     d2:=Copy(m1,2,1);
     m0:=StrToInt(d1);
     g0:=StrToInt(d2);
     ks:=m0+g0;
  end;
     dts:=dts+ks+god;
     lst1.Items.Add('Смерть в '+IntToStr(dts));
  end;
  end else begin
  if Length(d) > 1 then begin
     dz1:=StrToInt(d1);
     dz2:=StrToInt(d2);
     dz0:=StrToInt(d1+d2);
     dz:=dz0;
  end else begin
     dz1:=StrToInt(d1);
     dz:=dz1;
  end;
  if Length(m) > 1 then begin
     mz1:=StrToInt(m1);
     mz2:=StrToInt(m2);
     mz0:=StrToInt(m1+m2);
     mz:=mz0;
  end else begin
     mz1:=StrToInt(m1);
     mz:=mz1;
  end;
  if Length(g) > 2 then begin
     gz1:=StrToInt(g1);
     gz2:=StrToInt(g2);
     gz3:=StrToInt(g3);
     gz4:=StrToInt(g4);
     g0:=StrToInt(g3+g4);
  if g0 > 50 then begin
     gz1:=gz1+gz2;
     m1:=IntToStr(gz1);
  if Length(m1) > 1 then begin
     d1:=Copy(m1,1,1);
     d2:=Copy(m1,2,1);
     m0:=StrToInt(d1);
     g0:=StrToInt(d2);
     gz1:=m0+g0;
  end;
     dts:=dz+mz+(gz1)+(gz3+gz4);
     ks:=dz1+dz2+mz1+mz2+gz1+gz2+gz3+gz4;
     m1:=IntToStr(ks);
  if Length(m1) > 1 then begin
     d1:=Copy(m1,1,1);
     d2:=Copy(m1,2,1);
     m0:=StrToInt(d1);
     g0:=StrToInt(d2);
     ks:=m0+g0;
  end;
     dts:=dts+ks+god;
     lst1.Items.Add('Смерть в '+IntToStr(dts));
  end else begin
     g0:=StrToInt(g1+g2);
     gz1:=StrToInt(g3+g4);
     gz1:=g0+gz1;
  if Length(d) > 1 then
     dts:=dz+mz+(gz1)+(gz3+gz4)
  else
     dts:=dz+mz+(gz1); //+(gz3+gz4)
     ks:=dz1+dz2+mz1+mz2+gz1+gz2+gz3+gz4;
     m1:=IntToStr(ks);
  if Length(m1) > 1 then begin
     d1:=Copy(m1,1,1);
     d2:=Copy(m1,2,1);
     m0:=StrToInt(d1);
     g0:=StrToInt(d2);
     ks:=m0+g0;
  end;
  if Length(d) > 1 then
     ks:=ks div god
  else ks:=ks;
     dts:=dts-ks; //+god
     lst1.Items.Add('Смерть в '+IntToStr(dts)+' {+- 3-4 года}');
  end;
  end;
  end;
  dts:=0;
  ks:=0;
end;

procedure TForm1.cal1Click(Sender: TObject);
begin
  grp2.Caption:='Результат: '+DateToStr(cal1.Date);
end;

end.
