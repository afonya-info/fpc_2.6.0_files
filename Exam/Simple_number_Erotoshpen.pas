const nb = 200;
type bool = array [1..nb] of boolean;
var es:bool;
i,n,j:cardinal;
begin
  readln(n);
  for i:= 1 to n do 
    es[i]:=true;
  
  for i:= 2 to trunc(sqrt(n))+1  do
    for j:= i+1 to n do
      if j mod i = 0 then 
        es[j]:= false;

  for i:= 1 to n do
    if es[i] then
      write(i,' ');
end.