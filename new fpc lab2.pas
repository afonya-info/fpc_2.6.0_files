Program lab2;

Const
leters:set of char = ['а'..'я','А'..'Я','a'..'z','A'..'Z'];

Var 
wmas: array[1..255] of string;
bools: array[1..255] of boolean;
ch:array[1..255] of integer;
dliny: array [1..255] of integer;
chsort: array[1..255] of integer;// dlya perenaznacheniya chtoby ne poteryat mas ch
chindex: array [1..255] of boolean;// mas indexov nesortirovannogo massiva 
i,cod,j,k,n,max,imax,m,kflag1,t : integer; 
s,s1,gh,mistake:string;
c:char;
flag,flag1, flag2: boolean;

BEGIN
  s:=' ';
  flag:=true;
  flag1:=false;
  i:=1;
  cod:=0;
  kflag1:=0;
  
  writeln('Пожалуйста, введите строку, не превышающую 252 символа:');//252 simvola tk est probel 13 i 10 cod sledovatelno na 3 mense razmera stroki
  while flag do
    begin
      while (not(cod=10)) do
        begin
          read(c);// chitaet do simvola 10
          s:=s+c;
          inc(i);
          cod:=ord(s[i]);
        end;
      if i>255 then
        begin
          flag:=true;
          writeln;
          writeln('Пожалуйста, введите строку заново(не более 252 символов):');
          s:=' ';
          writeln(ord(s[1]));
          i:=1;
          cod:=0;
          c:=chr(10);
         end
      else
        flag:=false;
    end;
    
  i:=2;
  s1:=s[1];
  while not(ord(s[i])=13) do
    begin
      s1:=s1+s[i];
      inc(i);
    end;
  s1:=s1+' ';
  //-----stroka s1 polnostiy gotova--------
  
  for i:=1 to 255 do // zanolenie massiva
    for j:= 1 to 255 do
      wmas[i]:=wmas[i]+' ';
      
  for i:= 1 to 255 do// zaedinichivanie massiva dlya ycheta povtorov;
    bools[i]:=true;
  
  for i:= 1 to 255 do//zaedinichivanie massiva dlya chetchika
    ch[i]:=1;
  
  i:=2;
  k:=1;
  while i< length(s1) do//zapis kazdogo slova v massi
    begin
      if (not(s1[i-1] in leters)) and (s1[i] in leters) then
        begin
          j:=i;
          n:=1;
          while s1[j] in leters do
            begin
              wmas[k][n]:=s1[j];
              inc(i);
              inc(j);
              inc(n);
            end;
          dliny[k]:=n-1;// dlinya slova
          inc(k);
        end;
      inc(i);
    end;
  
  dec(k); // dlina wmas
  
  {for i:= 1 to k do
    writeln(wmas[i],' ',dliny[i]);
  writeln(k);}
  
{ vlozhenimi ciklami perebiraem stroki i esli 
oni ravnyu to yvelich chetchik povtorov i 
izmenyaem ychet povtorov bools chtoby ne povtoritsya pri poiske povtorov}

  i:=1;
  j:=1;
  
  while i<k do
    begin
      j:=i+1;
      while j<= k do
        begin
          if (bools[i]) and (dliny[i]=dliny[j]) then// esli sovpali dliny slov togda sravnit ih posimvolno
            begin  
              for m:= 1 to dliny[i] do// поменять до длинны строки wmas i
                if (wmas[i][m] = wmas[j][m]) or(abs(ord(wmas[i][m])-ord(wmas[j][m])) = 32) then // t e simvoly ili ravny ili ih cody otlich. na 32 chto sootvetstvyet ravenstvy bolshoy i malenkoi bukvy
                  begin
                    bools[j]:=false;
                    inc(kflag1);// proverka et li voobshe povtoryaemoe slovo yvelichivaem chetchik esli simvoly sovpali i potom proverim esli chetchik raven dline slova to est slovo kotoroe povtoryaetsya
                  end;
              if kflag1 = dliny[i] then // vot zdes i proveryaetsya slovo na povtor voobse i inc ch ibo tochno slovo sovpalo s dr slovom i eto nyzhno ychest
                begin
                  flag1:=true;
                  inc(ch[i]);
                  kflag1:=0;
                end
            end;
          {if (bools[i]) and (wmas[i]=wmas[j]) then
            begin
              bools[i]:=false;
              inc(ch[i]);
              flag1:=true;// proverka et li voobshe povtoryaemoe slovo
            end;}
          inc(j);
        end;
      inc(i);
    end;
    
{nahodim max v massive ch kotory oznachaet samoe chastovstrechayyseesya
slovo i po indexu ch nahodim samo slovo}

  for i:= 1 to 255 do //kopiryem massiv dlya ego sortirovki
    chsort[i]:=ch[i];
    
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
            writeln(' - (самое частовстречающееся слово)/(одно из самых частовстречающихся слов) в заданой строке');
          end; 
    end
  else
    writeln('в заданной строке отсутствуют повторяющиеся слова');
END.