Program art;
uses crt;
type mas = array[0..10] of integer;
     mascount = array [0..10] of integer;
var a: mas;
i,n,max: integer;
l:char;
  procedure countsort (var b:mas; var k :integer; var cmax: integer);
    var c:mascount;
        cui,cuj,q,w,r:integer;
        poz:integer;
    begin
       for cui:=0 to k-1 do
       begin
         q:=b[cui];
         w:=c[b[cui]];
         c[b[cui]]:=c[b[cui]] + 1;
         w:=c[b[cui]];
       end;
       poz:=0;
       for cui:= 0 to cmax-1 do
         for cuj:= 0 to c[cui] do
           begin
             r:=b[poz];
             b[poz]:=cui;
             r:=b[poz];
             inc(poz);
           end;
    end;
begin
  readln(n);
  i:=1;
  write('a[',i,'] = ');
  readln(a[i]);
  max:=a[0];
  for i:=1 to n-1 do
    begin
      write('a[',i,'] = ');
      readln(a[i]);

      if a[i]> max then
        max:=a[i];
    end;
  countsort(a,n,max);
  for i:= 0 to n-1 do
    writeln(a[i]);
  readln;
end.
