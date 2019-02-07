program lektion7;
type prov = record
  a:real;
  b:array of integer;
  c:char;
  s:string;
end;
  pers = record
    nam:string;
    age:byte;
    pol:boolean;
  end;
  week = (monday,friday);
  diap = 1..20;
var check:prov;
people : array [1..5] of pers;
i:integer;
day:week;
hour:diap;
year:100..200;
begin
  {setlength(check.b,20);
  for i:= 1 to 5 do
    begin
      readln(people[i].nam);
    end;
  for i:= 1 to 20 do
    begin
      check.b[i]:= random(10)-5;
      write('[',check.b[i],'] ');
    end;
  check.a:=5;
  writeln(check.a);
  writeln(check.b[check.a] );
  for i:= 1 to 5 do
    writeln(people[i].nam);}
  check.a:= exp(ln(2)*5);
  writeln(check.a:3:0);
  readln();
end.
