with Parse_Args; use Parse_Args;
with Parse_Args.Generic_Discrete_Options;

package TPA_Options is 
   
   type Compass is (North, South, East, West);

   package Compass_Option is new Generic_Discrete_Options(Element => Compass,
                                                         Fallback_Default => North);
end TPA_Options;
