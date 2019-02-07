program art;
uses crt,windows;
var s:string;
begin
s:='';
  setconsolecp(1251);
  setconsoleoutputcp(1251);
  while s <> '  ' do
    begin
      readln(s);
      writeln('length(s) = ',length(s));
    end;
end.