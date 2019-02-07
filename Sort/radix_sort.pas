program radixsort;

uses crt, windows;

type
  mas = array [1..10000] of longint;

var
  a, ai: mas;
  Pok: array [0..9] of string;
  temp: longint;
  i, n, ram, rt, j, s, h, b: integer;
  m, stemp: string;

function max(const amax: mas; nn: integer): longint;
var
  fmax: longint;
  ii: integer;
begin
  fmax := amax[1];
  for ii := 2 to nn do
  begin
    if fmax < amax[ii] then
      fmax := a[ii];
  end;
  max := fmax;
end;

begin
	setconsolecp(1251);
  setconsoleoutputcp(1251);
  write('Введите количество элементов = ');
  readln(n);
  for i := 1 to n do
  begin
    write('a[', i, '] = ');
    readln(a[i]);
  end;
  for i := 1 to n do
    write(a[i], ' ');
	writeln;
  for i := 1 to n do
    ai[i] := a[i];
  temp := max(a, n);
  str(temp, stemp);
  ram := length(stemp);
  rt := 1;
  for j := 1 to ram do
  begin
    for i := 1 to n do
    begin
      b := a[i] div rt mod 10;
      str(i, m);
      Pok[b] := Pok[b] + m + ' ';
    end;
    rt := rt * 10;
    s := 1;
    for i := 0 to 9 do
    begin
      while pos(' ', Pok[i]) > 0 do
      begin
        m := copy(Pok[i], 1, pos(' ', Pok[i]) - 1);
        val(m, b, h);
        a[s] := ai[b];
        inc(s);
        delete(Pok[i], 1, pos(' ', Pok[i]));
        m := '';
      end;
      Pok[i] := '';
    end;
    for i := 1 to n do
      ai[i] := a[i];
  end;
  for i := 1 to n do
    Write(a[i], ' ');
  readln;
end.