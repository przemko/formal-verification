pragma SPARK_Mode;

package Split is

   type Data is array (Integer range <>) of Integer;

   procedure Split (V : in Integer; T : in out Data; B1, B2 : out Integer)
     with
       Pre =>
         T'First > Integer'First and then T'Last < Integer'Last,
       Post =>
         (for all I in T'First .. B1 - 1 => T(I) < V) and then
         (for all I in B1 .. B2 => T(I) = V) and then
         (for all I in B2 + 1 .. T'Last => T(I) > V);

end Split;
