program lab2z1;
uses crt,windows;
const cn = 1000;
var a: array [1..cn] of longint;
    i,j,min,prov,n,digit:longint;
    b:real;
    c:char;
    s,s1:string;
    flag,flag1,flag2,minus,flag0:boolean;
BEGIN
  writeln('Amount of array`s elements:');
	write('n = ');
	setconsolecp(1251);
	setconsoleoutputcp(1251);
  readln(n);
  while n>cn do	
		begin
			writeln('Repeat input');
			write('n = ');
			readln(n);
		end;
  for i:= 1 to n do
    begin
      write('a[',i,']=');
      readln(a[i]);
    end;
  min:=a[1];
  for i:= 2 to n do
    if abs(a[i])<abs(min) then
      min:=a[i];
  writeln(min);
  readln;
END.
