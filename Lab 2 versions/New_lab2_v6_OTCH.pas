Program lab2;
uses
crt,windows;
Const
leters:set of char = ['А'..'я','ё','Ё','A'..'Z','a'..'z']; 
digits:set of char = ['0'..'9'];
spchar:set of char = ['-','`'];
bword:set of char = [' ','"','(','[','{','<'];
eword:set of char = [' ','.',',','?','!',':',';','"',')',']','}','>','0'..'9'];

Var
wmas: array[1..255] of string;
bools: array[1..255] of boolean;
ch:array[1..255] of integer;
chsort: array[1..255] of integer;
dliny: array [1..255] of integer;
chindex : array [1..255] of boolean;
i,cod,j,k,n,max,imax,m,x,t,kflag1,kod: integer;
s,s1,kk:string;
c:char;
wofla,flag,flag1,flagle,f1,f2,f3,f4: boolean;

BEGIN
  flag:=true;
  flag1:=false;
	wofla:=true;
  kflag1:=0;
  kod:=0;
  setconsolecp(1251);
  setconsoleoutputcp(1251);



  writeln('Пожалуйста, введите строку:');
  while flag do
    begin
      s:='';
      readln(s);
      if length(s)=0 then
      begin
        flag:=true;
        writeln('Строка должна быть непустой:');
      end
      else
        flag:=false;
    end;
  s1:=s+' ';
  for i:=1 to 255 do 
    for j:= 1 to 255 do
      wmas[i]:=wmas[i]+' ';

  for i:= 1 to 255 do
    bools[i]:=true;

  for i:= 1 to 255 do
    ch[i]:=1;

  i:=1;
  k:=1;
  while i< length(s1) do
    begin
      if (s1[i] in leters) then
        begin
          j:=i;
          n:=1;
							if s[i] in leters 
								then f1:=true 
								else f1:=false;
								
							if s[i] in spchar 
								then f2:=true 
								else f2:=false;
							
							if s[i+1] in leters 
								then f3:=true 
								else f3:=false;
							
							if s[i+1] in spchar 
								then f4:=true 
								else f4:=false;							
							
							wofla:=(not f1 and f2 and f3 and not f4) or (f1 and not f2 and not f3 and f4)or(f1 and not f2 and f3 and not f4);
					while ((not((s1[i] in leters) and (s1[i+1] in eword))) and wofla )  do 
            begin
              wmas[k][n]:=s1[j];
              inc(i);
              inc(j);
              inc(n);
							if s[i] in leters 
								then f1:=true 
								else f1:=false;
								
							if s[i] in spchar 
								then f2:=true 
								else f2:=false;
							
							if s[i+1] in leters 
								then f3:=true 
								else f3:=false;
							
							if s[i+1] in spchar 
								then f4:=true 
								else f4:=false;							
							
							wofla:=(not f1 and f2 and f3 and not f4) or (f1 and not f2 and not f3 and f4)or(f1 and not f2 and f3 and not f4);
            end;
					wofla:= true;
          wmas[k][n]:=s1[j];
          dliny[k]:=n;
					inc(k);
        end;
      inc(i);
    end;

  dec(k); 
  i:=1;
  j:=1;

  while i<k do
    begin
      j:=i+1;
      while j<= k do
        begin
          if (bools[i]) and (dliny[i]=dliny[j]) then
            begin
              for m:= 1 to dliny[i] do
                begin
                  if ((wmas[i][m] in ['А'..'я']) and (wmas[j][m] in ['А'..'я'])) then
                    kod:=abs(ord(wmas[i][m])-ord(wmas[j][m]));

                  if ((wmas[i][m] = 'Ё') and (wmas[j][m] = 'ё')) or ((wmas[j][m] = 'Ё') and (wmas[i][m] = 'ё')) then
                    kod:=abs(ord(wmas[i][m])-ord(wmas[j][m]));

                  if ((wmas[i][m] in ['A'..'Z','a'..'z']) and (wmas[j][m] in ['A'..'Z','a'..'z'])) then
                    kod:=abs(ord(wmas[i][m])-ord(wmas[j][m]));
										
										
                  if (wmas[i][m] = wmas[j][m]) or (kod = 32) or (kod = 16) then 
                    inc(kflag1);
                  kod:=0;
									
                end;
              if kflag1 = dliny[i] then 
                begin
                  flag1:=true;
                  inc(ch[i]);
                  bools[j]:=false;
                end;
              kflag1:=0;
            end;
          inc(j);
        end;
      inc(i);
    end;

  max:=ch[1];
  imax:=1;
  for i:= 2 to k do
    if max<ch[i] then
      begin
        max:=ch[i];
        imax:=i;
      end;

  for i:= 1 to 255 do
    chindex[i]:=false;
  for i:= 1 to 255 do
    if ch[i] = max then
      chindex[i]:=true;


  if flag1 then
    begin
      for i:= 1 to 255 do
        if chindex[i] then
          begin
            j:=1;
            while ord(wmas[i][j]) <> 32 do
              begin
                write(wmas[i][j]);
                inc(j);
              end;
            writeln(' - (Самое частовстречающееся/одно из самых частовстречающихся) слов в заданной строке');
          end;
    end
  else
    writeln('В данной строке отсутствуют повторяющееся слова');
  readln;
END.
