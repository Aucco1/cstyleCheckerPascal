program comcheck;

{$mode objfpc}{$H+} 

uses
  SysUtils;

var
  input: string;
  state, output, i: Integer;
  ch: Char;

begin
  Write('Enter a comment: ');
  ReadLn(input);

  state := 0;
  output := 0;

 
  for i := 1 to Length(input) do
  begin
    ch := input[i];
    output := 0;

    case state of
      0: begin
           if ch = '/' then
             state := 1
           else
             state := -1;
         end;

      1: begin
           if ch = '*' then
             state := 2
           else
             state := -1;
         end;

      2: begin
           if ch = '*' then
             state := 3
           else
             state := 2;
         end;

      3: begin
           if ch = '/' then
           begin
             state := 4;
             output := 1;
           end
           else if ch = '*' then
             state := 3
           else
             state := 2;
         end;

      4: begin
           state := -1;
         end;
    end;

    WriteLn(Format('Input: %s, Output: %d, State: %d', [ch, output, state]));

    if state = -1 then
      Break;
  end;

  if state = 4 then
    WriteLn('Valid Comment')
  else
    WriteLn('Invalid Comment');
end.
