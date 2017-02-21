package body Bubbles with SPARK_Mode is

   procedure Swap (T : in out Table; I : in Positive; J : in Positive) is
      Temp : Integer := T (I);
   begin
      T (I) := T (J);
      T (J) := Temp;
   end Swap;

   procedure Bubble (T : in out Table; I : in Positive) is
   begin
      for J in T'First + 1 .. I loop

         if T (J - 1) > T (J) then

            Swap (T, J - 1, J);

         end if;

         pragma Loop_Invariant
           (for some K in T'First .. J =>
                 T(J) = T'Loop_Entry (K));

         pragma Loop_Invariant
           (for all K in J + 1 .. T'Last =>
              T(K) = T'Loop_Entry (K));

         pragma Loop_Invariant
           (for all K in T'First .. J =>
              T(K) <= T(J));

      end loop;

   end Bubble;

   procedure Sort (T : in out Table) is
   begin

      for I in reverse T'Range loop

         Bubble (T, I);

         pragma Loop_Invariant
           (for all J in I .. T'Last =>
              (for all K in T'First .. J =>
                   T(K) <= T(J)));

      end loop;

   end Sort;

end Bubbles;

