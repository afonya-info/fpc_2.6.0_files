program art;
type mas = array[1..5] of integer;
const n = 5;
var oldmas:mas;
i:integer;
s:string[2];
function sum(var newmas:mas;const r:byte):integer;
  var ii: integer;
  begin
    for ii:= 1 to r do
      begin
        sum:=sum + oldmas[ii];
      end;
  end;
begin
  for i:= 1 to n do
    begin
      oldmas[i]:= random(10)+1;
      write('[',oldmas[i],'] ');
    end;
  writeln;
  s:='123';
  writeln(sum(oldmas,n),' ',s);
  readln;
end.