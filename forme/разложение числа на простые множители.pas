﻿const
  nar = 200;

type
  arr = array[1..nar] of byte;

var
  ans :arr;
  i, j, n: cardinal;
  s,sans,si:string;

function prime_fac(m: cardinal): cardinal;
var
  ip, st, im,max: cardinal;
begin
  st := 2;
  max:=1;
  im := 1;
  while m<>1 do
  begin
    if m mod st = 0 then begin
      ans[st] := im;
      inc(im);
      if max<st then max:=st;
      m:=m div st;
    end
    else begin
      im:=1;
      st:=st+1;
    end;
  end;
  prime_fac:=max;
end;

begin
  readln(n);
  s:='';
  for i:= 1 to n do
    ans[i]:=0;
  ans[1]:=1;
  for i:= 1 to prime_fac(n) do begin
    if ans[i] <> 0 then begin 
      str(ans[i],sans);
      str(i,si);
      s:=s+si+'^'+sans+' * ';
    end;
  end;
  delete(s,length(s)-2,3);
  s:='n = '+s;
  writeln(s);
end.