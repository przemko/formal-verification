package body Automata with SPARK_Mode is

   function Automaton (W : String; T : Trans_Table) return Natural is
      Current_State : Natural := 0;
   begin

      for I in W'Range loop
         pragma Loop_Invariant (Current_State in T'Range (1));
         Current_State := T (Current_State, W (I));
      end loop;
      return Current_State;
   end Automaton;

end Automata;

