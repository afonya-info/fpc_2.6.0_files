uses crt;
var	a: real;
		l:char;
begin
	writeln('Checkin is number intger or real');
	while l <> #32 do begin
	write('a = ');
	readln(a);
	if frac(a) = 0 then
		writeln('integer')
	else
		writeln('real');
	writeln('Spase for exit');
	writeln('Enter to continue');
	readln(l);
	end;
end.