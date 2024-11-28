with Parse_Args; use Parse_Args;
with Ada.Text_IO; use Ada.Text_IO;

with TPA_Options; use TPA_Options;
procedure TPA is
   AP : Argument_Parser;
begin
   AP.Add_Option(Make_Boolean_Option(False), "help", 'h', Usage => "Display this help text");
   AP.Add_Option (Compass_Option.Make_Option, "compass", 'c', 
                  Usage => "A compass point (North (default), South, East or West)");
   
   AP.Parse_Command_Line;
   
   if AP.Parse_Success and then AP.Boolean_Value ("help") then AP.Usage;
   elsif AP.Parse_Success then 
      Put_Line("Compass point specified: " & Compass'Image(Compass_Option.Value(AP, "compass")));
   else
      Put_Line("Error while parsing command-line arguments: " & AP.Parse_Message);
   end if;
   
end TPA;
