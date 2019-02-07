uses windows,crt;
const
a:set of char = ['Ð'..'Ñ'];
var s:string;
begin
  setconsolecp(1251);
  setconsoleoutputcp(1251);
  readln(s);
  if length(s)<>0 then
    writeln(1)
  else
    writeln(0);
  readln;
end.
