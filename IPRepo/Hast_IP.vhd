-- VHDL libraries necessary for the generated code to work. These libraries are included here instead of being managed separately in the Hardware framework so they can be more easily updated.

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package TypeConversion is
	function Truncate(input: unsigned; size: natural) return unsigned;
	function Truncate(input: signed; size: natural) return signed;
	function ToUnsignedAndExpand(input: signed; size: natural) return unsigned;
end TypeConversion;
		
package body TypeConversion is

	function Truncate(input: unsigned; size: natural) return unsigned is
	begin
		return input(size - 1 downto 0);
	end Truncate;

	function Truncate(input: signed; size: natural) return signed is
	begin
		return input(size - 1 downto 0);
	end Truncate;

	function ToUnsignedAndExpand(input: signed; size: natural) return unsigned is
		variable result: unsigned(size - 1 downto 0);
	begin
		if (input >= 0) then
			return resize(unsigned(input), size);
		else 
			result := (others => '1');
			result(input'LENGTH - 1 downto 0) := unsigned(input);
			return result;
		end if;
	end ToUnsignedAndExpand;

end TypeConversion;


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
		
package SimpleMemory is
	-- Data conversion functions:
	function ConvertUInt32ToStdLogicVector(input: unsigned(31 downto 0)) return std_logic_vector;
	function ConvertStdLogicVectorToUInt32(input : std_logic_vector) return unsigned;
		
	function ConvertBooleanToStdLogicVector(input: boolean) return std_logic_vector;
	function ConvertStdLogicVectorToBoolean(input : std_logic_vector) return boolean;
		
	function ConvertInt32ToStdLogicVector(input: signed(31 downto 0)) return std_logic_vector;
	function ConvertStdLogicVectorToInt32(input : std_logic_vector) return signed;
		
	function ConvertCharToStdLogicVector(input: character) return std_logic_vector;
	function ConvertStdLogicVectorToChar(input : std_logic_vector) return character;
end SimpleMemory;
		
package body SimpleMemory is

	function ConvertUInt32ToStdLogicVector(input: unsigned(31 downto 0)) return std_logic_vector is
	begin
		return std_logic_vector(input);
	end ConvertUInt32ToStdLogicVector;
	
	function ConvertStdLogicVectorToUInt32(input : std_logic_vector) return unsigned is
	begin
		return unsigned(input);
	end ConvertStdLogicVectorToUInt32;
	
	function ConvertBooleanToStdLogicVector(input: boolean) return std_logic_vector is 
	begin
		case input is
			when true => return X"FFFFFFFF";
			when false => return X"00000000";
			when others => return X"00000000";
		end case;
	end ConvertBooleanToStdLogicVector;

	function ConvertStdLogicVectorToBoolean(input : std_logic_vector) return boolean is 
	begin
		-- In .NET a false is all zeros while a true is at least one 1 bit (or more), so using the same logic here.
		return not(input = X"00000000");
	end ConvertStdLogicVectorToBoolean;

	function ConvertInt32ToStdLogicVector(input: signed(31 downto 0)) return std_logic_vector is
	begin
		return std_logic_vector(input);
	end ConvertInt32ToStdLogicVector;

	function ConvertStdLogicVectorToInt32(input : std_logic_vector) return signed is
	begin
		return signed(input);
	end ConvertStdLogicVectorToInt32;

	function ConvertCharToStdLogicVector(input: character) return std_logic_vector is
		variable characterIndex : integer;
	begin
		case input is
			when '0' => characterIndex :=  0;
			when '1' => characterIndex :=  1;
			when '2' => characterIndex :=  2;
			when '3' => characterIndex :=  3;
			when '4' => characterIndex :=  4;
			when '5' => characterIndex :=  5;
			when '6' => characterIndex :=  6;
			when '7' => characterIndex :=  7;
			when '8' => characterIndex :=  8;
			when '9' => characterIndex :=  9;
			when 'A' => characterIndex := 10;
			when 'B' => characterIndex := 11;
			when 'C' => characterIndex := 12;
			when 'D' => characterIndex := 13;
			when 'E' => characterIndex := 14;
			when 'F' => characterIndex := 15;
			when 'G' => characterIndex := 16;
			when 'H' => characterIndex := 17;
			when 'I' => characterIndex := 18;
			when 'J' => characterIndex := 19;
			when 'K' => characterIndex := 20;
			when 'L' => characterIndex := 21;
			when 'M' => characterIndex := 22;
			when 'N' => characterIndex := 23;
			when 'O' => characterIndex := 24;
			when 'P' => characterIndex := 25;
			when 'Q' => characterIndex := 26;
			when 'R' => characterIndex := 27;
			when 'S' => characterIndex := 28;
			when 'T' => characterIndex := 29;
			when 'U' => characterIndex := 30;
			when 'V' => characterIndex := 31;
			when 'W' => characterIndex := 32;
			when 'X' => characterIndex := 33;
			when 'Y' => characterIndex := 34;
			when 'Z' => characterIndex := 35;
			when others => characterIndex := 0;
		end case;
			
		return std_logic_vector(to_signed(characterIndex, 32));
	end ConvertCharToStdLogicVector;

	function ConvertStdLogicVectorToChar(input : std_logic_vector) return character is
		variable characterIndex     : integer;
	begin
		characterIndex := to_integer(unsigned(input));
		
		case characterIndex is
			when  0 => return '0';
			when  1 => return '1';
			when  2 => return '2';
			when  3 => return '3';
			when  4 => return '4';
			when  5 => return '5';
			when  6 => return '6';
			when  7 => return '7';
			when  8 => return '8';
			when  9 => return '9';
			when 10 => return 'A';
			when 11 => return 'B';
			when 12 => return 'C';
			when 13 => return 'D';
			when 14 => return 'E';
			when 15 => return 'F';
			when 16 => return 'G';
			when 17 => return 'H';
			when 18 => return 'I';
			when 19 => return 'J';
			when 20 => return 'K';
			when 21 => return 'L';
			when 22 => return 'M';
			when 23 => return 'N';
			when 24 => return 'O';
			when 25 => return 'P';
			when 26 => return 'Q';
			when 27 => return 'R';
			when 28 => return 'S';
			when 29 => return 'T';
			when 30 => return 'U';
			when 31 => return 'V';
			when 32 => return 'W';
			when 33 => return 'X';
			when 34 => return 'Y';
			when 35 => return 'Z';
			when others => return '?';
		end case;
	end ConvertStdLogicVectorToChar;

end SimpleMemory;
-- Hast_IP, logic generated from the input .NET assemblies starts here.
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library work;
use work.TypeConversion.all;
library work;
use work.SimpleMemory.all;

entity Hast_IP is 
    port(
        \DataIn\: In std_logic_vector(31 downto 0);
        \DataOut\: Out std_logic_vector(31 downto 0);
        \CellIndex\: Out integer;
        \ReadEnable\: Out boolean;
        \WriteEnable\: Out boolean;
        \ReadsDone\: In boolean;
        \WritesDone\: In boolean;
        \MemberId\: In integer;
        \Reset\: In std_logic;
        \Started\: In boolean;
        \Finished\: Out boolean;
        \Clock\: In std_logic
    );
    -- Hast_IP ID: ed93fd67a69158614904111fdc702adee335d9259f52dbd868f9df0bd55afc70
    -- Date and time: 2017-07-31 01:24:18 UTC
    -- Generated by Hastlayer - hastlayer.com
end Hast_IP;

architecture Imp of Hast_IP is 
    -- This IP was generated by Hastlayer from .NET code to mimic the original logic. Note the following:
    -- * For each member (methods, functions) in .NET a state machine was generated. Each state machine's name corresponds to 
    --   the original member's name.
    -- * Inputs and outputs are passed between state machines as shared objects.
    -- * There are operations that take multiple clock cycles like interacting with the memory and long-running arithmetic operations 
    --   (modulo, division, multiplication). These are awaited in subsequent states but be aware that some states can take more 
    --   than one clock cycle to produce their output.
    -- * The ExternalInvocationProxy process dispatches invocations that were started from the outside to the state machines.
    -- * The InternalInvocationProxy processes dispatch invocations between state machines.

    -- Custom inter-dependent type declarations start
    type \boolean_Array\ is array (integer range <>) of boolean;
    -- Custom inter-dependent type declarations end


    -- System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(System.UInt32).0 declarations start
    -- State machine states:
    type \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0._States\ is (
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0._State_0\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0._State_1\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0._State_2\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0._State_3\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0._State_4\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0._State_5\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0._State_6\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0._State_7\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0._State_8\);
    -- Signals:
    Signal \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0._Finished\: boolean := false;
    Signal \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0.return\: boolean := false;
    Signal \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0._Started\: boolean := false;
    Signal \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0.numberObject.parameter.In\: unsigned(31 downto 0) := to_unsigned(0, 32);
    -- System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(System.UInt32).0 declarations end


    -- System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(System.UInt32).1 declarations start
    -- State machine states:
    type \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1._States\ is (
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1._State_0\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1._State_1\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1._State_2\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1._State_3\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1._State_4\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1._State_5\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1._State_6\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1._State_7\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1._State_8\);
    -- Signals:
    Signal \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1._Finished\: boolean := false;
    Signal \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1.return\: boolean := false;
    Signal \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1._Started\: boolean := false;
    Signal \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1.numberObject.parameter.In\: unsigned(31 downto 0) := to_unsigned(0, 32);
    -- System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(System.UInt32).1 declarations end


    -- System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(System.UInt32).2 declarations start
    -- State machine states:
    type \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2._States\ is (
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2._State_0\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2._State_1\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2._State_2\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2._State_3\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2._State_4\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2._State_5\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2._State_6\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2._State_7\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2._State_8\);
    -- Signals:
    Signal \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2._Finished\: boolean := false;
    Signal \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2.return\: boolean := false;
    Signal \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2._Started\: boolean := false;
    Signal \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2.numberObject.parameter.In\: unsigned(31 downto 0) := to_unsigned(0, 32);
    -- System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(System.UInt32).2 declarations end


    -- System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(System.UInt32).3 declarations start
    -- State machine states:
    type \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3._States\ is (
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3._State_0\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3._State_1\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3._State_2\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3._State_3\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3._State_4\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3._State_5\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3._State_6\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3._State_7\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3._State_8\);
    -- Signals:
    Signal \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3._Finished\: boolean := false;
    Signal \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3.return\: boolean := false;
    Signal \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3._Started\: boolean := false;
    Signal \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3.numberObject.parameter.In\: unsigned(31 downto 0) := to_unsigned(0, 32);
    -- System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(System.UInt32).3 declarations end


    -- System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(System.UInt32).4 declarations start
    -- State machine states:
    type \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4._States\ is (
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4._State_0\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4._State_1\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4._State_2\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4._State_3\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4._State_4\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4._State_5\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4._State_6\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4._State_7\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4._State_8\);
    -- Signals:
    Signal \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4._Finished\: boolean := false;
    Signal \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4.return\: boolean := false;
    Signal \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4._Started\: boolean := false;
    Signal \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4.numberObject.parameter.In\: unsigned(31 downto 0) := to_unsigned(0, 32);
    -- System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(System.UInt32).4 declarations end


    -- System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(System.UInt32).5 declarations start
    -- State machine states:
    type \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5._States\ is (
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5._State_0\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5._State_1\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5._State_2\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5._State_3\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5._State_4\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5._State_5\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5._State_6\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5._State_7\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5._State_8\);
    -- Signals:
    Signal \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5._Finished\: boolean := false;
    Signal \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5.return\: boolean := false;
    Signal \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5._Started\: boolean := false;
    Signal \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5.numberObject.parameter.In\: unsigned(31 downto 0) := to_unsigned(0, 32);
    -- System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(System.UInt32).5 declarations end


    -- System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(System.UInt32).6 declarations start
    -- State machine states:
    type \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6._States\ is (
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6._State_0\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6._State_1\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6._State_2\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6._State_3\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6._State_4\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6._State_5\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6._State_6\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6._State_7\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6._State_8\);
    -- Signals:
    Signal \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6._Finished\: boolean := false;
    Signal \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6.return\: boolean := false;
    Signal \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6._Started\: boolean := false;
    Signal \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6.numberObject.parameter.In\: unsigned(31 downto 0) := to_unsigned(0, 32);
    -- System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(System.UInt32).6 declarations end


    -- System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(System.UInt32).7 declarations start
    -- State machine states:
    type \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7._States\ is (
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7._State_0\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7._State_1\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7._State_2\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7._State_3\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7._State_4\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7._State_5\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7._State_6\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7._State_7\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7._State_8\);
    -- Signals:
    Signal \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7._Finished\: boolean := false;
    Signal \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7.return\: boolean := false;
    Signal \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7._Started\: boolean := false;
    Signal \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7.numberObject.parameter.In\: unsigned(31 downto 0) := to_unsigned(0, 32);
    -- System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(System.UInt32).7 declarations end


    -- System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(System.UInt32).8 declarations start
    -- State machine states:
    type \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8._States\ is (
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8._State_0\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8._State_1\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8._State_2\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8._State_3\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8._State_4\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8._State_5\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8._State_6\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8._State_7\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8._State_8\);
    -- Signals:
    Signal \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8._Finished\: boolean := false;
    Signal \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8.return\: boolean := false;
    Signal \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8._Started\: boolean := false;
    Signal \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8.numberObject.parameter.In\: unsigned(31 downto 0) := to_unsigned(0, 32);
    -- System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(System.UInt32).8 declarations end


    -- System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(System.UInt32).9 declarations start
    -- State machine states:
    type \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9._States\ is (
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9._State_0\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9._State_1\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9._State_2\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9._State_3\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9._State_4\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9._State_5\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9._State_6\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9._State_7\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9._State_8\);
    -- Signals:
    Signal \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9._Finished\: boolean := false;
    Signal \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9.return\: boolean := false;
    Signal \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9._Started\: boolean := false;
    Signal \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9.numberObject.parameter.In\: unsigned(31 downto 0) := to_unsigned(0, 32);
    -- System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(System.UInt32).9 declarations end


    -- System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(System.UInt32).10 declarations start
    -- State machine states:
    type \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10._States\ is (
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10._State_0\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10._State_1\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10._State_2\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10._State_3\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10._State_4\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10._State_5\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10._State_6\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10._State_7\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10._State_8\);
    -- Signals:
    Signal \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10._Finished\: boolean := false;
    Signal \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10.return\: boolean := false;
    Signal \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10._Started\: boolean := false;
    Signal \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10.numberObject.parameter.In\: unsigned(31 downto 0) := to_unsigned(0, 32);
    -- System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(System.UInt32).10 declarations end


    -- System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(System.UInt32).11 declarations start
    -- State machine states:
    type \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11._States\ is (
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11._State_0\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11._State_1\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11._State_2\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11._State_3\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11._State_4\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11._State_5\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11._State_6\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11._State_7\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11._State_8\);
    -- Signals:
    Signal \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11._Finished\: boolean := false;
    Signal \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11.return\: boolean := false;
    Signal \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11._Started\: boolean := false;
    Signal \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11.numberObject.parameter.In\: unsigned(31 downto 0) := to_unsigned(0, 32);
    -- System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(System.UInt32).11 declarations end


    -- System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(System.UInt32).12 declarations start
    -- State machine states:
    type \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12._States\ is (
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12._State_0\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12._State_1\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12._State_2\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12._State_3\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12._State_4\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12._State_5\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12._State_6\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12._State_7\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12._State_8\);
    -- Signals:
    Signal \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12._Finished\: boolean := false;
    Signal \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12.return\: boolean := false;
    Signal \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12._Started\: boolean := false;
    Signal \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12.numberObject.parameter.In\: unsigned(31 downto 0) := to_unsigned(0, 32);
    -- System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(System.UInt32).12 declarations end


    -- System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(System.UInt32).13 declarations start
    -- State machine states:
    type \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13._States\ is (
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13._State_0\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13._State_1\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13._State_2\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13._State_3\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13._State_4\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13._State_5\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13._State_6\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13._State_7\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13._State_8\);
    -- Signals:
    Signal \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13._Finished\: boolean := false;
    Signal \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13.return\: boolean := false;
    Signal \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13._Started\: boolean := false;
    Signal \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13.numberObject.parameter.In\: unsigned(31 downto 0) := to_unsigned(0, 32);
    -- System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(System.UInt32).13 declarations end


    -- System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(System.UInt32).14 declarations start
    -- State machine states:
    type \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14._States\ is (
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14._State_0\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14._State_1\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14._State_2\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14._State_3\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14._State_4\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14._State_5\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14._State_6\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14._State_7\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14._State_8\);
    -- Signals:
    Signal \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14._Finished\: boolean := false;
    Signal \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14.return\: boolean := false;
    Signal \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14._Started\: boolean := false;
    Signal \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14.numberObject.parameter.In\: unsigned(31 downto 0) := to_unsigned(0, 32);
    -- System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(System.UInt32).14 declarations end


    -- System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(System.UInt32).15 declarations start
    -- State machine states:
    type \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15._States\ is (
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15._State_0\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15._State_1\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15._State_2\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15._State_3\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15._State_4\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15._State_5\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15._State_6\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15._State_7\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15._State_8\);
    -- Signals:
    Signal \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15._Finished\: boolean := false;
    Signal \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15.return\: boolean := false;
    Signal \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15._Started\: boolean := false;
    Signal \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15.numberObject.parameter.In\: unsigned(31 downto 0) := to_unsigned(0, 32);
    -- System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(System.UInt32).15 declarations end


    -- System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(System.UInt32).16 declarations start
    -- State machine states:
    type \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16._States\ is (
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16._State_0\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16._State_1\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16._State_2\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16._State_3\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16._State_4\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16._State_5\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16._State_6\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16._State_7\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16._State_8\);
    -- Signals:
    Signal \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16._Finished\: boolean := false;
    Signal \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16.return\: boolean := false;
    Signal \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16._Started\: boolean := false;
    Signal \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16.numberObject.parameter.In\: unsigned(31 downto 0) := to_unsigned(0, 32);
    -- System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(System.UInt32).16 declarations end


    -- System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(System.UInt32).17 declarations start
    -- State machine states:
    type \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17._States\ is (
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17._State_0\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17._State_1\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17._State_2\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17._State_3\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17._State_4\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17._State_5\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17._State_6\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17._State_7\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17._State_8\);
    -- Signals:
    Signal \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17._Finished\: boolean := false;
    Signal \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17.return\: boolean := false;
    Signal \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17._Started\: boolean := false;
    Signal \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17.numberObject.parameter.In\: unsigned(31 downto 0) := to_unsigned(0, 32);
    -- System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(System.UInt32).17 declarations end


    -- System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(System.UInt32).18 declarations start
    -- State machine states:
    type \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18._States\ is (
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18._State_0\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18._State_1\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18._State_2\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18._State_3\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18._State_4\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18._State_5\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18._State_6\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18._State_7\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18._State_8\);
    -- Signals:
    Signal \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18._Finished\: boolean := false;
    Signal \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18.return\: boolean := false;
    Signal \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18._Started\: boolean := false;
    Signal \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18.numberObject.parameter.In\: unsigned(31 downto 0) := to_unsigned(0, 32);
    -- System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(System.UInt32).18 declarations end


    -- System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(System.UInt32).19 declarations start
    -- State machine states:
    type \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19._States\ is (
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19._State_0\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19._State_1\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19._State_2\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19._State_3\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19._State_4\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19._State_5\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19._State_6\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19._State_7\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19._State_8\);
    -- Signals:
    Signal \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19._Finished\: boolean := false;
    Signal \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19.return\: boolean := false;
    Signal \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19._Started\: boolean := false;
    Signal \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19.numberObject.parameter.In\: unsigned(31 downto 0) := to_unsigned(0, 32);
    -- System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(System.UInt32).19 declarations end


    -- System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(System.UInt32).20 declarations start
    -- State machine states:
    type \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20._States\ is (
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20._State_0\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20._State_1\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20._State_2\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20._State_3\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20._State_4\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20._State_5\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20._State_6\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20._State_7\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20._State_8\);
    -- Signals:
    Signal \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20._Finished\: boolean := false;
    Signal \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20.return\: boolean := false;
    Signal \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20._Started\: boolean := false;
    Signal \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20.numberObject.parameter.In\: unsigned(31 downto 0) := to_unsigned(0, 32);
    -- System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(System.UInt32).20 declarations end


    -- System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(System.UInt32).21 declarations start
    -- State machine states:
    type \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21._States\ is (
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21._State_0\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21._State_1\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21._State_2\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21._State_3\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21._State_4\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21._State_5\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21._State_6\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21._State_7\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21._State_8\);
    -- Signals:
    Signal \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21._Finished\: boolean := false;
    Signal \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21.return\: boolean := false;
    Signal \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21._Started\: boolean := false;
    Signal \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21.numberObject.parameter.In\: unsigned(31 downto 0) := to_unsigned(0, 32);
    -- System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(System.UInt32).21 declarations end


    -- System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(System.UInt32).22 declarations start
    -- State machine states:
    type \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22._States\ is (
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22._State_0\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22._State_1\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22._State_2\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22._State_3\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22._State_4\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22._State_5\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22._State_6\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22._State_7\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22._State_8\);
    -- Signals:
    Signal \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22._Finished\: boolean := false;
    Signal \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22.return\: boolean := false;
    Signal \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22._Started\: boolean := false;
    Signal \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22.numberObject.parameter.In\: unsigned(31 downto 0) := to_unsigned(0, 32);
    -- System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(System.UInt32).22 declarations end


    -- System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(System.UInt32).23 declarations start
    -- State machine states:
    type \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23._States\ is (
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23._State_0\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23._State_1\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23._State_2\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23._State_3\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23._State_4\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23._State_5\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23._State_6\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23._State_7\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23._State_8\);
    -- Signals:
    Signal \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23._Finished\: boolean := false;
    Signal \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23.return\: boolean := false;
    Signal \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23._Started\: boolean := false;
    Signal \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23.numberObject.parameter.In\: unsigned(31 downto 0) := to_unsigned(0, 32);
    -- System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(System.UInt32).23 declarations end


    -- System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(System.UInt32).24 declarations start
    -- State machine states:
    type \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24._States\ is (
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24._State_0\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24._State_1\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24._State_2\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24._State_3\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24._State_4\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24._State_5\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24._State_6\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24._State_7\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24._State_8\);
    -- Signals:
    Signal \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24._Finished\: boolean := false;
    Signal \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24.return\: boolean := false;
    Signal \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24._Started\: boolean := false;
    Signal \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24.numberObject.parameter.In\: unsigned(31 downto 0) := to_unsigned(0, 32);
    -- System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(System.UInt32).24 declarations end


    -- System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(System.UInt32).25 declarations start
    -- State machine states:
    type \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25._States\ is (
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25._State_0\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25._State_1\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25._State_2\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25._State_3\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25._State_4\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25._State_5\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25._State_6\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25._State_7\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25._State_8\);
    -- Signals:
    Signal \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25._Finished\: boolean := false;
    Signal \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25.return\: boolean := false;
    Signal \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25._Started\: boolean := false;
    Signal \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25.numberObject.parameter.In\: unsigned(31 downto 0) := to_unsigned(0, 32);
    -- System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(System.UInt32).25 declarations end


    -- System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(System.UInt32).26 declarations start
    -- State machine states:
    type \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26._States\ is (
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26._State_0\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26._State_1\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26._State_2\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26._State_3\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26._State_4\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26._State_5\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26._State_6\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26._State_7\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26._State_8\);
    -- Signals:
    Signal \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26._Finished\: boolean := false;
    Signal \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26.return\: boolean := false;
    Signal \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26._Started\: boolean := false;
    Signal \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26.numberObject.parameter.In\: unsigned(31 downto 0) := to_unsigned(0, 32);
    -- System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(System.UInt32).26 declarations end


    -- System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(System.UInt32).27 declarations start
    -- State machine states:
    type \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27._States\ is (
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27._State_0\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27._State_1\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27._State_2\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27._State_3\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27._State_4\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27._State_5\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27._State_6\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27._State_7\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27._State_8\);
    -- Signals:
    Signal \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27._Finished\: boolean := false;
    Signal \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27.return\: boolean := false;
    Signal \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27._Started\: boolean := false;
    Signal \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27.numberObject.parameter.In\: unsigned(31 downto 0) := to_unsigned(0, 32);
    -- System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(System.UInt32).27 declarations end


    -- System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(System.UInt32).28 declarations start
    -- State machine states:
    type \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28._States\ is (
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28._State_0\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28._State_1\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28._State_2\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28._State_3\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28._State_4\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28._State_5\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28._State_6\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28._State_7\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28._State_8\);
    -- Signals:
    Signal \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28._Finished\: boolean := false;
    Signal \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28.return\: boolean := false;
    Signal \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28._Started\: boolean := false;
    Signal \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28.numberObject.parameter.In\: unsigned(31 downto 0) := to_unsigned(0, 32);
    -- System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(System.UInt32).28 declarations end


    -- System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(System.UInt32).29 declarations start
    -- State machine states:
    type \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29._States\ is (
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29._State_0\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29._State_1\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29._State_2\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29._State_3\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29._State_4\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29._State_5\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29._State_6\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29._State_7\, 
        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29._State_8\);
    -- Signals:
    Signal \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29._Finished\: boolean := false;
    Signal \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29.return\: boolean := false;
    Signal \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29._Started\: boolean := false;
    Signal \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29.numberObject.parameter.In\: unsigned(31 downto 0) := to_unsigned(0, 32);
    -- System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(System.UInt32).29 declarations end


    -- System.Void Hast.Samples.SampleAssembly.PrimeCalculator::IsPrimeNumber(Hast.Transformer.Abstractions.SimpleMemory.SimpleMemory).0 declarations start
    -- State machine states:
    type \PrimeCalculator::IsPrimeNumber(SimpleMemory).0._States\ is (
        \PrimeCalculator::IsPrimeNumber(SimpleMemory).0._State_0\, 
        \PrimeCalculator::IsPrimeNumber(SimpleMemory).0._State_1\, 
        \PrimeCalculator::IsPrimeNumber(SimpleMemory).0._State_2\, 
        \PrimeCalculator::IsPrimeNumber(SimpleMemory).0._State_3\, 
        \PrimeCalculator::IsPrimeNumber(SimpleMemory).0._State_4\, 
        \PrimeCalculator::IsPrimeNumber(SimpleMemory).0._State_5\);
    -- Signals:
    Signal \PrimeCalculator::IsPrimeNumber(SimpleMemory).0._Finished\: boolean := false;
    Signal \PrimeCalculator::IsPrimeNumber(SimpleMemory).0.SimpleMemory.CellIndex\: signed(31 downto 0) := to_signed(0, 32);
    Signal \PrimeCalculator::IsPrimeNumber(SimpleMemory).0.SimpleMemory.DataOut\: std_logic_vector(31 downto 0);
    Signal \PrimeCalculator::IsPrimeNumber(SimpleMemory).0.SimpleMemory.ReadEnable\: boolean := false;
    Signal \PrimeCalculator::IsPrimeNumber(SimpleMemory).0.SimpleMemory.WriteEnable\: boolean := false;
    Signal \PrimeCalculator::IsPrimeNumber(SimpleMemory).0.PrimeCalculator::IsPrimeNumberInternal(UInt32).number.parameter.Out.0\: unsigned(31 downto 0) := to_unsigned(0, 32);
    Signal \PrimeCalculator::IsPrimeNumber(SimpleMemory).0.PrimeCalculator::IsPrimeNumberInternal(UInt32)._Started.0\: boolean := false;
    Signal \PrimeCalculator::IsPrimeNumber(SimpleMemory).0._Started\: boolean := false;
    Signal \PrimeCalculator::IsPrimeNumber(SimpleMemory).0.PrimeCalculator::IsPrimeNumberInternal(UInt32)._Finished.0\: boolean := false;
    Signal \PrimeCalculator::IsPrimeNumber(SimpleMemory).0.PrimeCalculator::IsPrimeNumberInternal(UInt32).return.0\: boolean := false;
    -- System.Void Hast.Samples.SampleAssembly.PrimeCalculator::IsPrimeNumber(Hast.Transformer.Abstractions.SimpleMemory.SimpleMemory).0 declarations end


    -- System.Threading.Tasks.Task Hast.Samples.SampleAssembly.PrimeCalculator::IsPrimeNumberAsync(Hast.Transformer.Abstractions.SimpleMemory.SimpleMemory).0 declarations start
    -- State machine states:
    type \PrimeCalculator::IsPrimeNumberAsync(SimpleMemory).0._States\ is (
        \PrimeCalculator::IsPrimeNumberAsync(SimpleMemory).0._State_0\, 
        \PrimeCalculator::IsPrimeNumberAsync(SimpleMemory).0._State_1\, 
        \PrimeCalculator::IsPrimeNumberAsync(SimpleMemory).0._State_2\, 
        \PrimeCalculator::IsPrimeNumberAsync(SimpleMemory).0._State_3\);
    -- Signals:
    Signal \PrimeCalculator::IsPrimeNumberAsync(SimpleMemory).0._Finished\: boolean := false;
    Signal \PrimeCalculator::IsPrimeNumberAsync(SimpleMemory).0.PrimeCalculator::IsPrimeNumber(SimpleMemory)._Started.0\: boolean := false;
    Signal \PrimeCalculator::IsPrimeNumberAsync(SimpleMemory).0._Started\: boolean := false;
    Signal \PrimeCalculator::IsPrimeNumberAsync(SimpleMemory).0.PrimeCalculator::IsPrimeNumber(SimpleMemory)._Finished.0\: boolean := false;
    -- System.Threading.Tasks.Task Hast.Samples.SampleAssembly.PrimeCalculator::IsPrimeNumberAsync(Hast.Transformer.Abstractions.SimpleMemory.SimpleMemory).0 declarations end


    -- System.Void Hast.Samples.SampleAssembly.PrimeCalculator::ArePrimeNumbers(Hast.Transformer.Abstractions.SimpleMemory.SimpleMemory).0 declarations start
    -- State machine states:
    type \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0._States\ is (
        \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0._State_0\, 
        \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0._State_1\, 
        \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0._State_2\, 
        \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0._State_3\, 
        \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0._State_4\, 
        \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0._State_5\, 
        \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0._State_6\, 
        \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0._State_7\, 
        \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0._State_8\);
    -- Signals:
    Signal \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0._Finished\: boolean := false;
    Signal \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0.SimpleMemory.CellIndex\: signed(31 downto 0) := to_signed(0, 32);
    Signal \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0.SimpleMemory.DataOut\: std_logic_vector(31 downto 0);
    Signal \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0.SimpleMemory.ReadEnable\: boolean := false;
    Signal \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0.SimpleMemory.WriteEnable\: boolean := false;
    Signal \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0.PrimeCalculator::IsPrimeNumberInternal(UInt32).number.parameter.Out.0\: unsigned(31 downto 0) := to_unsigned(0, 32);
    Signal \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0.PrimeCalculator::IsPrimeNumberInternal(UInt32)._Started.0\: boolean := false;
    Signal \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0._Started\: boolean := false;
    Signal \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0.PrimeCalculator::IsPrimeNumberInternal(UInt32)._Finished.0\: boolean := false;
    Signal \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0.PrimeCalculator::IsPrimeNumberInternal(UInt32).return.0\: boolean := false;
    -- System.Void Hast.Samples.SampleAssembly.PrimeCalculator::ArePrimeNumbers(Hast.Transformer.Abstractions.SimpleMemory.SimpleMemory).0 declarations end


    -- System.Void Hast.Samples.SampleAssembly.PrimeCalculator::ParallelizedArePrimeNumbers(Hast.Transformer.Abstractions.SimpleMemory.SimpleMemory).0 declarations start
    -- State machine states:
    type \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0._States\ is (
        \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0._State_0\, 
        \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0._State_1\, 
        \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0._State_2\, 
        \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0._State_3\, 
        \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0._State_4\, 
        \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0._State_5\, 
        \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0._State_6\, 
        \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0._State_7\, 
        \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0._State_8\, 
        \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0._State_9\, 
        \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0._State_10\, 
        \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0._State_11\, 
        \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0._State_12\);
    -- Signals:
    Signal \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0._Finished\: boolean := false;
    Signal \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.SimpleMemory.CellIndex\: signed(31 downto 0) := to_signed(0, 32);
    Signal \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.SimpleMemory.DataOut\: std_logic_vector(31 downto 0);
    Signal \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.SimpleMemory.ReadEnable\: boolean := false;
    Signal \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.SimpleMemory.WriteEnable\: boolean := false;
    Signal \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).numberObject.parameter.Out.0\: unsigned(31 downto 0) := to_unsigned(0, 32);
    Signal \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.0\: boolean := false;
    Signal \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).numberObject.parameter.Out.1\: unsigned(31 downto 0) := to_unsigned(0, 32);
    Signal \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.1\: boolean := false;
    Signal \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).numberObject.parameter.Out.2\: unsigned(31 downto 0) := to_unsigned(0, 32);
    Signal \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.2\: boolean := false;
    Signal \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).numberObject.parameter.Out.3\: unsigned(31 downto 0) := to_unsigned(0, 32);
    Signal \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.3\: boolean := false;
    Signal \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).numberObject.parameter.Out.4\: unsigned(31 downto 0) := to_unsigned(0, 32);
    Signal \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.4\: boolean := false;
    Signal \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).numberObject.parameter.Out.5\: unsigned(31 downto 0) := to_unsigned(0, 32);
    Signal \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.5\: boolean := false;
    Signal \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).numberObject.parameter.Out.6\: unsigned(31 downto 0) := to_unsigned(0, 32);
    Signal \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.6\: boolean := false;
    Signal \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).numberObject.parameter.Out.7\: unsigned(31 downto 0) := to_unsigned(0, 32);
    Signal \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.7\: boolean := false;
    Signal \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).numberObject.parameter.Out.8\: unsigned(31 downto 0) := to_unsigned(0, 32);
    Signal \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.8\: boolean := false;
    Signal \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).numberObject.parameter.Out.9\: unsigned(31 downto 0) := to_unsigned(0, 32);
    Signal \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.9\: boolean := false;
    Signal \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).numberObject.parameter.Out.10\: unsigned(31 downto 0) := to_unsigned(0, 32);
    Signal \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.10\: boolean := false;
    Signal \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).numberObject.parameter.Out.11\: unsigned(31 downto 0) := to_unsigned(0, 32);
    Signal \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.11\: boolean := false;
    Signal \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).numberObject.parameter.Out.12\: unsigned(31 downto 0) := to_unsigned(0, 32);
    Signal \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.12\: boolean := false;
    Signal \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).numberObject.parameter.Out.13\: unsigned(31 downto 0) := to_unsigned(0, 32);
    Signal \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.13\: boolean := false;
    Signal \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).numberObject.parameter.Out.14\: unsigned(31 downto 0) := to_unsigned(0, 32);
    Signal \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.14\: boolean := false;
    Signal \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).numberObject.parameter.Out.15\: unsigned(31 downto 0) := to_unsigned(0, 32);
    Signal \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.15\: boolean := false;
    Signal \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).numberObject.parameter.Out.16\: unsigned(31 downto 0) := to_unsigned(0, 32);
    Signal \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.16\: boolean := false;
    Signal \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).numberObject.parameter.Out.17\: unsigned(31 downto 0) := to_unsigned(0, 32);
    Signal \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.17\: boolean := false;
    Signal \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).numberObject.parameter.Out.18\: unsigned(31 downto 0) := to_unsigned(0, 32);
    Signal \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.18\: boolean := false;
    Signal \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).numberObject.parameter.Out.19\: unsigned(31 downto 0) := to_unsigned(0, 32);
    Signal \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.19\: boolean := false;
    Signal \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).numberObject.parameter.Out.20\: unsigned(31 downto 0) := to_unsigned(0, 32);
    Signal \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.20\: boolean := false;
    Signal \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).numberObject.parameter.Out.21\: unsigned(31 downto 0) := to_unsigned(0, 32);
    Signal \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.21\: boolean := false;
    Signal \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).numberObject.parameter.Out.22\: unsigned(31 downto 0) := to_unsigned(0, 32);
    Signal \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.22\: boolean := false;
    Signal \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).numberObject.parameter.Out.23\: unsigned(31 downto 0) := to_unsigned(0, 32);
    Signal \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.23\: boolean := false;
    Signal \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).numberObject.parameter.Out.24\: unsigned(31 downto 0) := to_unsigned(0, 32);
    Signal \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.24\: boolean := false;
    Signal \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).numberObject.parameter.Out.25\: unsigned(31 downto 0) := to_unsigned(0, 32);
    Signal \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.25\: boolean := false;
    Signal \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).numberObject.parameter.Out.26\: unsigned(31 downto 0) := to_unsigned(0, 32);
    Signal \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.26\: boolean := false;
    Signal \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).numberObject.parameter.Out.27\: unsigned(31 downto 0) := to_unsigned(0, 32);
    Signal \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.27\: boolean := false;
    Signal \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).numberObject.parameter.Out.28\: unsigned(31 downto 0) := to_unsigned(0, 32);
    Signal \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.28\: boolean := false;
    Signal \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).numberObject.parameter.Out.29\: unsigned(31 downto 0) := to_unsigned(0, 32);
    Signal \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.29\: boolean := false;
    Signal \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0._Started\: boolean := false;
    Signal \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Finished.0\: boolean := false;
    Signal \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Finished.1\: boolean := false;
    Signal \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Finished.2\: boolean := false;
    Signal \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Finished.3\: boolean := false;
    Signal \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Finished.4\: boolean := false;
    Signal \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Finished.5\: boolean := false;
    Signal \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Finished.6\: boolean := false;
    Signal \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Finished.7\: boolean := false;
    Signal \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Finished.8\: boolean := false;
    Signal \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Finished.9\: boolean := false;
    Signal \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Finished.10\: boolean := false;
    Signal \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Finished.11\: boolean := false;
    Signal \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Finished.12\: boolean := false;
    Signal \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Finished.13\: boolean := false;
    Signal \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Finished.14\: boolean := false;
    Signal \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Finished.15\: boolean := false;
    Signal \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Finished.16\: boolean := false;
    Signal \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Finished.17\: boolean := false;
    Signal \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Finished.18\: boolean := false;
    Signal \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Finished.19\: boolean := false;
    Signal \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Finished.20\: boolean := false;
    Signal \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Finished.21\: boolean := false;
    Signal \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Finished.22\: boolean := false;
    Signal \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Finished.23\: boolean := false;
    Signal \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Finished.24\: boolean := false;
    Signal \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Finished.25\: boolean := false;
    Signal \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Finished.26\: boolean := false;
    Signal \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Finished.27\: boolean := false;
    Signal \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Finished.28\: boolean := false;
    Signal \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Finished.29\: boolean := false;
    Signal \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).return.0\: boolean := false;
    Signal \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).return.1\: boolean := false;
    Signal \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).return.2\: boolean := false;
    Signal \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).return.3\: boolean := false;
    Signal \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).return.4\: boolean := false;
    Signal \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).return.5\: boolean := false;
    Signal \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).return.6\: boolean := false;
    Signal \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).return.7\: boolean := false;
    Signal \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).return.8\: boolean := false;
    Signal \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).return.9\: boolean := false;
    Signal \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).return.10\: boolean := false;
    Signal \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).return.11\: boolean := false;
    Signal \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).return.12\: boolean := false;
    Signal \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).return.13\: boolean := false;
    Signal \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).return.14\: boolean := false;
    Signal \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).return.15\: boolean := false;
    Signal \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).return.16\: boolean := false;
    Signal \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).return.17\: boolean := false;
    Signal \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).return.18\: boolean := false;
    Signal \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).return.19\: boolean := false;
    Signal \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).return.20\: boolean := false;
    Signal \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).return.21\: boolean := false;
    Signal \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).return.22\: boolean := false;
    Signal \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).return.23\: boolean := false;
    Signal \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).return.24\: boolean := false;
    Signal \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).return.25\: boolean := false;
    Signal \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).return.26\: boolean := false;
    Signal \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).return.27\: boolean := false;
    Signal \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).return.28\: boolean := false;
    Signal \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).return.29\: boolean := false;
    -- System.Void Hast.Samples.SampleAssembly.PrimeCalculator::ParallelizedArePrimeNumbers(Hast.Transformer.Abstractions.SimpleMemory.SimpleMemory).0 declarations end


    -- System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator::IsPrimeNumberInternal(System.UInt32).0 declarations start
    -- State machine states:
    type \PrimeCalculator::IsPrimeNumberInternal(UInt32).0._States\ is (
        \PrimeCalculator::IsPrimeNumberInternal(UInt32).0._State_0\, 
        \PrimeCalculator::IsPrimeNumberInternal(UInt32).0._State_1\, 
        \PrimeCalculator::IsPrimeNumberInternal(UInt32).0._State_2\, 
        \PrimeCalculator::IsPrimeNumberInternal(UInt32).0._State_3\, 
        \PrimeCalculator::IsPrimeNumberInternal(UInt32).0._State_4\, 
        \PrimeCalculator::IsPrimeNumberInternal(UInt32).0._State_5\, 
        \PrimeCalculator::IsPrimeNumberInternal(UInt32).0._State_6\, 
        \PrimeCalculator::IsPrimeNumberInternal(UInt32).0._State_7\, 
        \PrimeCalculator::IsPrimeNumberInternal(UInt32).0._State_8\);
    -- Signals:
    Signal \PrimeCalculator::IsPrimeNumberInternal(UInt32).0._Finished\: boolean := false;
    Signal \PrimeCalculator::IsPrimeNumberInternal(UInt32).0.return\: boolean := false;
    Signal \PrimeCalculator::IsPrimeNumberInternal(UInt32).0._Started\: boolean := false;
    Signal \PrimeCalculator::IsPrimeNumberInternal(UInt32).0.number.parameter.In\: unsigned(31 downto 0) := to_unsigned(0, 32);
    -- System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator::IsPrimeNumberInternal(System.UInt32).0 declarations end


    -- System.Void Hast::ExternalInvocationProxy() declarations start
    -- Signals:
    Signal \FinishedInternal\: boolean := false;
    Signal \Hast::ExternalInvocationProxy().PrimeCalculator::IsPrimeNumber(SimpleMemory)._Started.0\: boolean := false;
    Signal \Hast::ExternalInvocationProxy().PrimeCalculator::IsPrimeNumberAsync(SimpleMemory)._Started.0\: boolean := false;
    Signal \Hast::ExternalInvocationProxy().PrimeCalculator::ArePrimeNumbers(SimpleMemory)._Started.0\: boolean := false;
    Signal \Hast::ExternalInvocationProxy().PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory)._Started.0\: boolean := false;
    Signal \Hast::ExternalInvocationProxy().PrimeCalculator::IsPrimeNumber(SimpleMemory)._Finished.0\: boolean := false;
    Signal \Hast::ExternalInvocationProxy().PrimeCalculator::IsPrimeNumberAsync(SimpleMemory)._Finished.0\: boolean := false;
    Signal \Hast::ExternalInvocationProxy().PrimeCalculator::ArePrimeNumbers(SimpleMemory)._Finished.0\: boolean := false;
    Signal \Hast::ExternalInvocationProxy().PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory)._Finished.0\: boolean := false;
    -- System.Void Hast::ExternalInvocationProxy() declarations end


    -- \System.Void Hast::InternalInvocationProxy()._CommonDeclarations\ declarations start
    type \InternalInvocationProxy_boolean_Array\ is array (integer range <>) of boolean;
    type \Hast::InternalInvocationProxy()._RunningStates\ is (
        WaitingForStarted, 
        WaitingForFinished, 
        AfterFinished);
    -- \System.Void Hast::InternalInvocationProxy()._CommonDeclarations\ declarations end

begin 

    -- System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(System.UInt32).0 state machine start
    \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0._StateMachine\: process (\Clock\) 
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0._State\: \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0._States\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0._State_0\;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0.numberObject\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0.num\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0.num2\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0.num3\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0.flag\: boolean := false;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0.result\: boolean := false;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0.binaryOperationResult.0\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0.binaryOperationResult.1\: boolean := false;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0.binaryOperationResult.2\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0.clockCyclesWaitedForBinaryOperationResult.0\: signed(31 downto 0) := to_signed(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0.binaryOperationResult.3\: boolean := false;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0.binaryOperationResult.4\: unsigned(31 downto 0) := to_unsigned(0, 32);
    begin 
        if (rising_edge(\Clock\)) then 
            if (\Reset\ = '1') then 
                -- Synchronous reset
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0._Finished\ <= false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0.return\ <= false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0._State_0\;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0.numberObject\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0.num\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0.num2\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0.num3\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0.flag\ := false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0.result\ := false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0.binaryOperationResult.0\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0.binaryOperationResult.1\ := false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0.binaryOperationResult.2\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0.clockCyclesWaitedForBinaryOperationResult.0\ := to_signed(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0.binaryOperationResult.3\ := false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0.binaryOperationResult.4\ := to_unsigned(0, 32);
            else 
                case \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0._State\ is 
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0._State_0\ => 
                        -- Start state
                        -- Waiting for the start signal.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0._Started\ = true) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0._State_2\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0._State_1\ => 
                        -- Final state
                        -- Signaling finished until Started is pulled back to false, then returning to the start state.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0._Started\ = true) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0._Finished\ <= true;
                        else 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0._Finished\ <= false;
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0._State_0\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0._State_2\ => 
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0.numberObject\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0.numberObject.parameter.In\;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0.num\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0.numberObject\;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0.binaryOperationResult.0\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0.num\ / to_unsigned(2, 32);
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0.num2\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0.binaryOperationResult.0\;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0.num3\ := to_unsigned(2, 32);
                        -- Starting a while loop.
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0._State_3\;
                        -- Clock cycles needed to complete this state (approximation): 0.1
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0._State_3\ => 
                        -- Repeated state of the while loop which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0._State_2\.
                        -- The while loop's condition:
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0.binaryOperationResult.1\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0.num3\ <= \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0.num2\;
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0.binaryOperationResult.1\) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0._State_5\;
                        else 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0._State_4\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0.261
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0._State_4\ => 
                        -- State after the while loop which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0._State_2\.
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0.result\ := True;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0.return\ <= True;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0._State_1\;
                        -- Clock cycles needed to complete this state (approximation): 0
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0._State_5\ => 
                        -- Waiting for the result to appear in \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0.binaryOperationResult.2\ (have to wait 10 clock cycles in this state).
                        -- The assignment needs to be kept up for multi-cycle operations for the result to actually appear in the target.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0.clockCyclesWaitedForBinaryOperationResult.0\ >= to_signed(10, 32)) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0._State_6\;
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0.clockCyclesWaitedForBinaryOperationResult.0\ := to_signed(0, 32);
                        else 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0.clockCyclesWaitedForBinaryOperationResult.0\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0.clockCyclesWaitedForBinaryOperationResult.0\ + to_signed(1, 32);
                        end if;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0.binaryOperationResult.2\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0.num\ mod \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0.num3\;
                        -- Clock cycles needed to complete this state (approximation): 10
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0._State_6\ => 
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0.binaryOperationResult.3\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0.binaryOperationResult.2\ = to_unsigned(0, 32);
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0.flag\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0.binaryOperationResult.3\;

                        -- This if-else was transformed from a .NET if-else. It spans across multiple states:
                        --     * The true branch starts in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0._State_8\ and ends in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0._State_8\.
                        --     * Execution after either branch will continue in the following state: \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0._State_7\.

                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0.flag\) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0._State_8\;
                        else 
                            -- There was no false branch, so going directly to the state after the if-else.
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0._State_7\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0.2751
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0._State_7\ => 
                        -- State after the if-else which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0._State_6\.
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0.binaryOperationResult.4\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0.num3\ + to_unsigned(1, 32);
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0.num3\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0.binaryOperationResult.4\;
                        -- Returning to the repeated state of the while loop which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0._State_2\ if the loop wasn't exited with a state change.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0._State\ = \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0._State_7\) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0._State_3\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0.3156
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0._State_8\ => 
                        -- True branch of the if-else started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0._State_6\.
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0.result\ := False;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0.return\ <= \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0.result\;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0._State_1\;
                        -- Going to the state after the if-else which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0._State_6\.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0._State\ = \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0._State_8\) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0._State_7\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0
                end case;
            end if;
        end if;
    end process;
    -- System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(System.UInt32).0 state machine end


    -- System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(System.UInt32).1 state machine start
    \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1._StateMachine\: process (\Clock\) 
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1._State\: \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1._States\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1._State_0\;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1.numberObject\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1.num\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1.num2\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1.num3\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1.flag\: boolean := false;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1.result\: boolean := false;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1.binaryOperationResult.0\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1.binaryOperationResult.1\: boolean := false;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1.binaryOperationResult.2\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1.clockCyclesWaitedForBinaryOperationResult.0\: signed(31 downto 0) := to_signed(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1.binaryOperationResult.3\: boolean := false;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1.binaryOperationResult.4\: unsigned(31 downto 0) := to_unsigned(0, 32);
    begin 
        if (rising_edge(\Clock\)) then 
            if (\Reset\ = '1') then 
                -- Synchronous reset
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1._Finished\ <= false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1.return\ <= false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1._State_0\;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1.numberObject\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1.num\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1.num2\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1.num3\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1.flag\ := false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1.result\ := false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1.binaryOperationResult.0\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1.binaryOperationResult.1\ := false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1.binaryOperationResult.2\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1.clockCyclesWaitedForBinaryOperationResult.0\ := to_signed(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1.binaryOperationResult.3\ := false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1.binaryOperationResult.4\ := to_unsigned(0, 32);
            else 
                case \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1._State\ is 
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1._State_0\ => 
                        -- Start state
                        -- Waiting for the start signal.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1._Started\ = true) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1._State_2\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1._State_1\ => 
                        -- Final state
                        -- Signaling finished until Started is pulled back to false, then returning to the start state.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1._Started\ = true) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1._Finished\ <= true;
                        else 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1._Finished\ <= false;
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1._State_0\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1._State_2\ => 
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1.numberObject\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1.numberObject.parameter.In\;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1.num\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1.numberObject\;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1.binaryOperationResult.0\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1.num\ / to_unsigned(2, 32);
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1.num2\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1.binaryOperationResult.0\;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1.num3\ := to_unsigned(2, 32);
                        -- Starting a while loop.
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1._State_3\;
                        -- Clock cycles needed to complete this state (approximation): 0.1
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1._State_3\ => 
                        -- Repeated state of the while loop which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1._State_2\.
                        -- The while loop's condition:
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1.binaryOperationResult.1\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1.num3\ <= \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1.num2\;
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1.binaryOperationResult.1\) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1._State_5\;
                        else 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1._State_4\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0.261
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1._State_4\ => 
                        -- State after the while loop which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1._State_2\.
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1.result\ := True;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1.return\ <= True;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1._State_1\;
                        -- Clock cycles needed to complete this state (approximation): 0
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1._State_5\ => 
                        -- Waiting for the result to appear in \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1.binaryOperationResult.2\ (have to wait 10 clock cycles in this state).
                        -- The assignment needs to be kept up for multi-cycle operations for the result to actually appear in the target.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1.clockCyclesWaitedForBinaryOperationResult.0\ >= to_signed(10, 32)) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1._State_6\;
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1.clockCyclesWaitedForBinaryOperationResult.0\ := to_signed(0, 32);
                        else 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1.clockCyclesWaitedForBinaryOperationResult.0\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1.clockCyclesWaitedForBinaryOperationResult.0\ + to_signed(1, 32);
                        end if;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1.binaryOperationResult.2\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1.num\ mod \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1.num3\;
                        -- Clock cycles needed to complete this state (approximation): 10
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1._State_6\ => 
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1.binaryOperationResult.3\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1.binaryOperationResult.2\ = to_unsigned(0, 32);
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1.flag\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1.binaryOperationResult.3\;

                        -- This if-else was transformed from a .NET if-else. It spans across multiple states:
                        --     * The true branch starts in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1._State_8\ and ends in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1._State_8\.
                        --     * Execution after either branch will continue in the following state: \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1._State_7\.

                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1.flag\) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1._State_8\;
                        else 
                            -- There was no false branch, so going directly to the state after the if-else.
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1._State_7\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0.2751
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1._State_7\ => 
                        -- State after the if-else which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1._State_6\.
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1.binaryOperationResult.4\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1.num3\ + to_unsigned(1, 32);
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1.num3\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1.binaryOperationResult.4\;
                        -- Returning to the repeated state of the while loop which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1._State_2\ if the loop wasn't exited with a state change.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1._State\ = \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1._State_7\) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1._State_3\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0.3156
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1._State_8\ => 
                        -- True branch of the if-else started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1._State_6\.
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1.result\ := False;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1.return\ <= \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1.result\;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1._State_1\;
                        -- Going to the state after the if-else which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1._State_6\.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1._State\ = \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1._State_8\) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1._State_7\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0
                end case;
            end if;
        end if;
    end process;
    -- System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(System.UInt32).1 state machine end


    -- System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(System.UInt32).2 state machine start
    \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2._StateMachine\: process (\Clock\) 
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2._State\: \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2._States\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2._State_0\;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2.numberObject\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2.num\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2.num2\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2.num3\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2.flag\: boolean := false;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2.result\: boolean := false;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2.binaryOperationResult.0\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2.binaryOperationResult.1\: boolean := false;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2.binaryOperationResult.2\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2.clockCyclesWaitedForBinaryOperationResult.0\: signed(31 downto 0) := to_signed(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2.binaryOperationResult.3\: boolean := false;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2.binaryOperationResult.4\: unsigned(31 downto 0) := to_unsigned(0, 32);
    begin 
        if (rising_edge(\Clock\)) then 
            if (\Reset\ = '1') then 
                -- Synchronous reset
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2._Finished\ <= false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2.return\ <= false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2._State_0\;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2.numberObject\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2.num\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2.num2\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2.num3\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2.flag\ := false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2.result\ := false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2.binaryOperationResult.0\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2.binaryOperationResult.1\ := false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2.binaryOperationResult.2\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2.clockCyclesWaitedForBinaryOperationResult.0\ := to_signed(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2.binaryOperationResult.3\ := false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2.binaryOperationResult.4\ := to_unsigned(0, 32);
            else 
                case \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2._State\ is 
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2._State_0\ => 
                        -- Start state
                        -- Waiting for the start signal.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2._Started\ = true) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2._State_2\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2._State_1\ => 
                        -- Final state
                        -- Signaling finished until Started is pulled back to false, then returning to the start state.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2._Started\ = true) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2._Finished\ <= true;
                        else 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2._Finished\ <= false;
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2._State_0\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2._State_2\ => 
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2.numberObject\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2.numberObject.parameter.In\;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2.num\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2.numberObject\;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2.binaryOperationResult.0\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2.num\ / to_unsigned(2, 32);
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2.num2\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2.binaryOperationResult.0\;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2.num3\ := to_unsigned(2, 32);
                        -- Starting a while loop.
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2._State_3\;
                        -- Clock cycles needed to complete this state (approximation): 0.1
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2._State_3\ => 
                        -- Repeated state of the while loop which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2._State_2\.
                        -- The while loop's condition:
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2.binaryOperationResult.1\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2.num3\ <= \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2.num2\;
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2.binaryOperationResult.1\) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2._State_5\;
                        else 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2._State_4\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0.261
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2._State_4\ => 
                        -- State after the while loop which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2._State_2\.
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2.result\ := True;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2.return\ <= True;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2._State_1\;
                        -- Clock cycles needed to complete this state (approximation): 0
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2._State_5\ => 
                        -- Waiting for the result to appear in \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2.binaryOperationResult.2\ (have to wait 10 clock cycles in this state).
                        -- The assignment needs to be kept up for multi-cycle operations for the result to actually appear in the target.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2.clockCyclesWaitedForBinaryOperationResult.0\ >= to_signed(10, 32)) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2._State_6\;
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2.clockCyclesWaitedForBinaryOperationResult.0\ := to_signed(0, 32);
                        else 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2.clockCyclesWaitedForBinaryOperationResult.0\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2.clockCyclesWaitedForBinaryOperationResult.0\ + to_signed(1, 32);
                        end if;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2.binaryOperationResult.2\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2.num\ mod \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2.num3\;
                        -- Clock cycles needed to complete this state (approximation): 10
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2._State_6\ => 
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2.binaryOperationResult.3\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2.binaryOperationResult.2\ = to_unsigned(0, 32);
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2.flag\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2.binaryOperationResult.3\;

                        -- This if-else was transformed from a .NET if-else. It spans across multiple states:
                        --     * The true branch starts in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2._State_8\ and ends in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2._State_8\.
                        --     * Execution after either branch will continue in the following state: \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2._State_7\.

                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2.flag\) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2._State_8\;
                        else 
                            -- There was no false branch, so going directly to the state after the if-else.
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2._State_7\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0.2751
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2._State_7\ => 
                        -- State after the if-else which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2._State_6\.
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2.binaryOperationResult.4\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2.num3\ + to_unsigned(1, 32);
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2.num3\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2.binaryOperationResult.4\;
                        -- Returning to the repeated state of the while loop which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2._State_2\ if the loop wasn't exited with a state change.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2._State\ = \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2._State_7\) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2._State_3\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0.3156
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2._State_8\ => 
                        -- True branch of the if-else started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2._State_6\.
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2.result\ := False;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2.return\ <= \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2.result\;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2._State_1\;
                        -- Going to the state after the if-else which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2._State_6\.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2._State\ = \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2._State_8\) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2._State_7\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0
                end case;
            end if;
        end if;
    end process;
    -- System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(System.UInt32).2 state machine end


    -- System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(System.UInt32).3 state machine start
    \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3._StateMachine\: process (\Clock\) 
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3._State\: \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3._States\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3._State_0\;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3.numberObject\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3.num\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3.num2\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3.num3\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3.flag\: boolean := false;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3.result\: boolean := false;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3.binaryOperationResult.0\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3.binaryOperationResult.1\: boolean := false;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3.binaryOperationResult.2\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3.clockCyclesWaitedForBinaryOperationResult.0\: signed(31 downto 0) := to_signed(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3.binaryOperationResult.3\: boolean := false;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3.binaryOperationResult.4\: unsigned(31 downto 0) := to_unsigned(0, 32);
    begin 
        if (rising_edge(\Clock\)) then 
            if (\Reset\ = '1') then 
                -- Synchronous reset
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3._Finished\ <= false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3.return\ <= false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3._State_0\;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3.numberObject\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3.num\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3.num2\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3.num3\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3.flag\ := false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3.result\ := false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3.binaryOperationResult.0\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3.binaryOperationResult.1\ := false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3.binaryOperationResult.2\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3.clockCyclesWaitedForBinaryOperationResult.0\ := to_signed(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3.binaryOperationResult.3\ := false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3.binaryOperationResult.4\ := to_unsigned(0, 32);
            else 
                case \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3._State\ is 
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3._State_0\ => 
                        -- Start state
                        -- Waiting for the start signal.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3._Started\ = true) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3._State_2\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3._State_1\ => 
                        -- Final state
                        -- Signaling finished until Started is pulled back to false, then returning to the start state.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3._Started\ = true) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3._Finished\ <= true;
                        else 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3._Finished\ <= false;
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3._State_0\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3._State_2\ => 
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3.numberObject\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3.numberObject.parameter.In\;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3.num\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3.numberObject\;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3.binaryOperationResult.0\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3.num\ / to_unsigned(2, 32);
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3.num2\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3.binaryOperationResult.0\;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3.num3\ := to_unsigned(2, 32);
                        -- Starting a while loop.
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3._State_3\;
                        -- Clock cycles needed to complete this state (approximation): 0.1
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3._State_3\ => 
                        -- Repeated state of the while loop which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3._State_2\.
                        -- The while loop's condition:
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3.binaryOperationResult.1\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3.num3\ <= \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3.num2\;
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3.binaryOperationResult.1\) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3._State_5\;
                        else 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3._State_4\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0.261
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3._State_4\ => 
                        -- State after the while loop which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3._State_2\.
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3.result\ := True;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3.return\ <= True;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3._State_1\;
                        -- Clock cycles needed to complete this state (approximation): 0
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3._State_5\ => 
                        -- Waiting for the result to appear in \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3.binaryOperationResult.2\ (have to wait 10 clock cycles in this state).
                        -- The assignment needs to be kept up for multi-cycle operations for the result to actually appear in the target.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3.clockCyclesWaitedForBinaryOperationResult.0\ >= to_signed(10, 32)) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3._State_6\;
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3.clockCyclesWaitedForBinaryOperationResult.0\ := to_signed(0, 32);
                        else 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3.clockCyclesWaitedForBinaryOperationResult.0\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3.clockCyclesWaitedForBinaryOperationResult.0\ + to_signed(1, 32);
                        end if;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3.binaryOperationResult.2\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3.num\ mod \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3.num3\;
                        -- Clock cycles needed to complete this state (approximation): 10
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3._State_6\ => 
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3.binaryOperationResult.3\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3.binaryOperationResult.2\ = to_unsigned(0, 32);
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3.flag\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3.binaryOperationResult.3\;

                        -- This if-else was transformed from a .NET if-else. It spans across multiple states:
                        --     * The true branch starts in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3._State_8\ and ends in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3._State_8\.
                        --     * Execution after either branch will continue in the following state: \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3._State_7\.

                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3.flag\) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3._State_8\;
                        else 
                            -- There was no false branch, so going directly to the state after the if-else.
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3._State_7\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0.2751
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3._State_7\ => 
                        -- State after the if-else which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3._State_6\.
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3.binaryOperationResult.4\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3.num3\ + to_unsigned(1, 32);
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3.num3\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3.binaryOperationResult.4\;
                        -- Returning to the repeated state of the while loop which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3._State_2\ if the loop wasn't exited with a state change.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3._State\ = \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3._State_7\) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3._State_3\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0.3156
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3._State_8\ => 
                        -- True branch of the if-else started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3._State_6\.
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3.result\ := False;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3.return\ <= \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3.result\;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3._State_1\;
                        -- Going to the state after the if-else which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3._State_6\.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3._State\ = \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3._State_8\) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3._State_7\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0
                end case;
            end if;
        end if;
    end process;
    -- System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(System.UInt32).3 state machine end


    -- System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(System.UInt32).4 state machine start
    \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4._StateMachine\: process (\Clock\) 
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4._State\: \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4._States\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4._State_0\;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4.numberObject\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4.num\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4.num2\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4.num3\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4.flag\: boolean := false;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4.result\: boolean := false;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4.binaryOperationResult.0\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4.binaryOperationResult.1\: boolean := false;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4.binaryOperationResult.2\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4.clockCyclesWaitedForBinaryOperationResult.0\: signed(31 downto 0) := to_signed(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4.binaryOperationResult.3\: boolean := false;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4.binaryOperationResult.4\: unsigned(31 downto 0) := to_unsigned(0, 32);
    begin 
        if (rising_edge(\Clock\)) then 
            if (\Reset\ = '1') then 
                -- Synchronous reset
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4._Finished\ <= false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4.return\ <= false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4._State_0\;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4.numberObject\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4.num\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4.num2\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4.num3\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4.flag\ := false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4.result\ := false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4.binaryOperationResult.0\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4.binaryOperationResult.1\ := false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4.binaryOperationResult.2\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4.clockCyclesWaitedForBinaryOperationResult.0\ := to_signed(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4.binaryOperationResult.3\ := false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4.binaryOperationResult.4\ := to_unsigned(0, 32);
            else 
                case \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4._State\ is 
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4._State_0\ => 
                        -- Start state
                        -- Waiting for the start signal.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4._Started\ = true) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4._State_2\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4._State_1\ => 
                        -- Final state
                        -- Signaling finished until Started is pulled back to false, then returning to the start state.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4._Started\ = true) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4._Finished\ <= true;
                        else 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4._Finished\ <= false;
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4._State_0\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4._State_2\ => 
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4.numberObject\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4.numberObject.parameter.In\;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4.num\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4.numberObject\;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4.binaryOperationResult.0\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4.num\ / to_unsigned(2, 32);
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4.num2\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4.binaryOperationResult.0\;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4.num3\ := to_unsigned(2, 32);
                        -- Starting a while loop.
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4._State_3\;
                        -- Clock cycles needed to complete this state (approximation): 0.1
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4._State_3\ => 
                        -- Repeated state of the while loop which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4._State_2\.
                        -- The while loop's condition:
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4.binaryOperationResult.1\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4.num3\ <= \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4.num2\;
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4.binaryOperationResult.1\) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4._State_5\;
                        else 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4._State_4\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0.261
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4._State_4\ => 
                        -- State after the while loop which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4._State_2\.
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4.result\ := True;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4.return\ <= True;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4._State_1\;
                        -- Clock cycles needed to complete this state (approximation): 0
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4._State_5\ => 
                        -- Waiting for the result to appear in \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4.binaryOperationResult.2\ (have to wait 10 clock cycles in this state).
                        -- The assignment needs to be kept up for multi-cycle operations for the result to actually appear in the target.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4.clockCyclesWaitedForBinaryOperationResult.0\ >= to_signed(10, 32)) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4._State_6\;
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4.clockCyclesWaitedForBinaryOperationResult.0\ := to_signed(0, 32);
                        else 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4.clockCyclesWaitedForBinaryOperationResult.0\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4.clockCyclesWaitedForBinaryOperationResult.0\ + to_signed(1, 32);
                        end if;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4.binaryOperationResult.2\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4.num\ mod \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4.num3\;
                        -- Clock cycles needed to complete this state (approximation): 10
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4._State_6\ => 
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4.binaryOperationResult.3\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4.binaryOperationResult.2\ = to_unsigned(0, 32);
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4.flag\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4.binaryOperationResult.3\;

                        -- This if-else was transformed from a .NET if-else. It spans across multiple states:
                        --     * The true branch starts in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4._State_8\ and ends in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4._State_8\.
                        --     * Execution after either branch will continue in the following state: \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4._State_7\.

                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4.flag\) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4._State_8\;
                        else 
                            -- There was no false branch, so going directly to the state after the if-else.
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4._State_7\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0.2751
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4._State_7\ => 
                        -- State after the if-else which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4._State_6\.
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4.binaryOperationResult.4\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4.num3\ + to_unsigned(1, 32);
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4.num3\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4.binaryOperationResult.4\;
                        -- Returning to the repeated state of the while loop which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4._State_2\ if the loop wasn't exited with a state change.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4._State\ = \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4._State_7\) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4._State_3\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0.3156
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4._State_8\ => 
                        -- True branch of the if-else started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4._State_6\.
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4.result\ := False;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4.return\ <= \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4.result\;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4._State_1\;
                        -- Going to the state after the if-else which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4._State_6\.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4._State\ = \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4._State_8\) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4._State_7\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0
                end case;
            end if;
        end if;
    end process;
    -- System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(System.UInt32).4 state machine end


    -- System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(System.UInt32).5 state machine start
    \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5._StateMachine\: process (\Clock\) 
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5._State\: \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5._States\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5._State_0\;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5.numberObject\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5.num\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5.num2\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5.num3\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5.flag\: boolean := false;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5.result\: boolean := false;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5.binaryOperationResult.0\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5.binaryOperationResult.1\: boolean := false;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5.binaryOperationResult.2\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5.clockCyclesWaitedForBinaryOperationResult.0\: signed(31 downto 0) := to_signed(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5.binaryOperationResult.3\: boolean := false;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5.binaryOperationResult.4\: unsigned(31 downto 0) := to_unsigned(0, 32);
    begin 
        if (rising_edge(\Clock\)) then 
            if (\Reset\ = '1') then 
                -- Synchronous reset
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5._Finished\ <= false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5.return\ <= false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5._State_0\;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5.numberObject\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5.num\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5.num2\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5.num3\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5.flag\ := false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5.result\ := false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5.binaryOperationResult.0\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5.binaryOperationResult.1\ := false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5.binaryOperationResult.2\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5.clockCyclesWaitedForBinaryOperationResult.0\ := to_signed(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5.binaryOperationResult.3\ := false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5.binaryOperationResult.4\ := to_unsigned(0, 32);
            else 
                case \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5._State\ is 
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5._State_0\ => 
                        -- Start state
                        -- Waiting for the start signal.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5._Started\ = true) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5._State_2\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5._State_1\ => 
                        -- Final state
                        -- Signaling finished until Started is pulled back to false, then returning to the start state.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5._Started\ = true) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5._Finished\ <= true;
                        else 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5._Finished\ <= false;
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5._State_0\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5._State_2\ => 
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5.numberObject\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5.numberObject.parameter.In\;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5.num\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5.numberObject\;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5.binaryOperationResult.0\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5.num\ / to_unsigned(2, 32);
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5.num2\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5.binaryOperationResult.0\;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5.num3\ := to_unsigned(2, 32);
                        -- Starting a while loop.
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5._State_3\;
                        -- Clock cycles needed to complete this state (approximation): 0.1
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5._State_3\ => 
                        -- Repeated state of the while loop which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5._State_2\.
                        -- The while loop's condition:
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5.binaryOperationResult.1\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5.num3\ <= \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5.num2\;
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5.binaryOperationResult.1\) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5._State_5\;
                        else 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5._State_4\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0.261
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5._State_4\ => 
                        -- State after the while loop which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5._State_2\.
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5.result\ := True;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5.return\ <= True;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5._State_1\;
                        -- Clock cycles needed to complete this state (approximation): 0
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5._State_5\ => 
                        -- Waiting for the result to appear in \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5.binaryOperationResult.2\ (have to wait 10 clock cycles in this state).
                        -- The assignment needs to be kept up for multi-cycle operations for the result to actually appear in the target.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5.clockCyclesWaitedForBinaryOperationResult.0\ >= to_signed(10, 32)) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5._State_6\;
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5.clockCyclesWaitedForBinaryOperationResult.0\ := to_signed(0, 32);
                        else 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5.clockCyclesWaitedForBinaryOperationResult.0\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5.clockCyclesWaitedForBinaryOperationResult.0\ + to_signed(1, 32);
                        end if;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5.binaryOperationResult.2\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5.num\ mod \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5.num3\;
                        -- Clock cycles needed to complete this state (approximation): 10
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5._State_6\ => 
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5.binaryOperationResult.3\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5.binaryOperationResult.2\ = to_unsigned(0, 32);
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5.flag\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5.binaryOperationResult.3\;

                        -- This if-else was transformed from a .NET if-else. It spans across multiple states:
                        --     * The true branch starts in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5._State_8\ and ends in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5._State_8\.
                        --     * Execution after either branch will continue in the following state: \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5._State_7\.

                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5.flag\) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5._State_8\;
                        else 
                            -- There was no false branch, so going directly to the state after the if-else.
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5._State_7\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0.2751
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5._State_7\ => 
                        -- State after the if-else which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5._State_6\.
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5.binaryOperationResult.4\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5.num3\ + to_unsigned(1, 32);
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5.num3\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5.binaryOperationResult.4\;
                        -- Returning to the repeated state of the while loop which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5._State_2\ if the loop wasn't exited with a state change.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5._State\ = \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5._State_7\) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5._State_3\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0.3156
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5._State_8\ => 
                        -- True branch of the if-else started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5._State_6\.
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5.result\ := False;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5.return\ <= \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5.result\;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5._State_1\;
                        -- Going to the state after the if-else which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5._State_6\.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5._State\ = \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5._State_8\) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5._State_7\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0
                end case;
            end if;
        end if;
    end process;
    -- System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(System.UInt32).5 state machine end


    -- System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(System.UInt32).6 state machine start
    \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6._StateMachine\: process (\Clock\) 
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6._State\: \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6._States\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6._State_0\;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6.numberObject\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6.num\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6.num2\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6.num3\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6.flag\: boolean := false;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6.result\: boolean := false;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6.binaryOperationResult.0\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6.binaryOperationResult.1\: boolean := false;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6.binaryOperationResult.2\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6.clockCyclesWaitedForBinaryOperationResult.0\: signed(31 downto 0) := to_signed(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6.binaryOperationResult.3\: boolean := false;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6.binaryOperationResult.4\: unsigned(31 downto 0) := to_unsigned(0, 32);
    begin 
        if (rising_edge(\Clock\)) then 
            if (\Reset\ = '1') then 
                -- Synchronous reset
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6._Finished\ <= false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6.return\ <= false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6._State_0\;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6.numberObject\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6.num\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6.num2\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6.num3\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6.flag\ := false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6.result\ := false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6.binaryOperationResult.0\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6.binaryOperationResult.1\ := false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6.binaryOperationResult.2\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6.clockCyclesWaitedForBinaryOperationResult.0\ := to_signed(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6.binaryOperationResult.3\ := false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6.binaryOperationResult.4\ := to_unsigned(0, 32);
            else 
                case \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6._State\ is 
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6._State_0\ => 
                        -- Start state
                        -- Waiting for the start signal.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6._Started\ = true) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6._State_2\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6._State_1\ => 
                        -- Final state
                        -- Signaling finished until Started is pulled back to false, then returning to the start state.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6._Started\ = true) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6._Finished\ <= true;
                        else 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6._Finished\ <= false;
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6._State_0\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6._State_2\ => 
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6.numberObject\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6.numberObject.parameter.In\;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6.num\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6.numberObject\;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6.binaryOperationResult.0\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6.num\ / to_unsigned(2, 32);
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6.num2\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6.binaryOperationResult.0\;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6.num3\ := to_unsigned(2, 32);
                        -- Starting a while loop.
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6._State_3\;
                        -- Clock cycles needed to complete this state (approximation): 0.1
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6._State_3\ => 
                        -- Repeated state of the while loop which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6._State_2\.
                        -- The while loop's condition:
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6.binaryOperationResult.1\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6.num3\ <= \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6.num2\;
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6.binaryOperationResult.1\) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6._State_5\;
                        else 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6._State_4\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0.261
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6._State_4\ => 
                        -- State after the while loop which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6._State_2\.
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6.result\ := True;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6.return\ <= True;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6._State_1\;
                        -- Clock cycles needed to complete this state (approximation): 0
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6._State_5\ => 
                        -- Waiting for the result to appear in \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6.binaryOperationResult.2\ (have to wait 10 clock cycles in this state).
                        -- The assignment needs to be kept up for multi-cycle operations for the result to actually appear in the target.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6.clockCyclesWaitedForBinaryOperationResult.0\ >= to_signed(10, 32)) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6._State_6\;
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6.clockCyclesWaitedForBinaryOperationResult.0\ := to_signed(0, 32);
                        else 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6.clockCyclesWaitedForBinaryOperationResult.0\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6.clockCyclesWaitedForBinaryOperationResult.0\ + to_signed(1, 32);
                        end if;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6.binaryOperationResult.2\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6.num\ mod \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6.num3\;
                        -- Clock cycles needed to complete this state (approximation): 10
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6._State_6\ => 
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6.binaryOperationResult.3\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6.binaryOperationResult.2\ = to_unsigned(0, 32);
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6.flag\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6.binaryOperationResult.3\;

                        -- This if-else was transformed from a .NET if-else. It spans across multiple states:
                        --     * The true branch starts in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6._State_8\ and ends in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6._State_8\.
                        --     * Execution after either branch will continue in the following state: \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6._State_7\.

                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6.flag\) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6._State_8\;
                        else 
                            -- There was no false branch, so going directly to the state after the if-else.
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6._State_7\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0.2751
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6._State_7\ => 
                        -- State after the if-else which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6._State_6\.
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6.binaryOperationResult.4\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6.num3\ + to_unsigned(1, 32);
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6.num3\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6.binaryOperationResult.4\;
                        -- Returning to the repeated state of the while loop which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6._State_2\ if the loop wasn't exited with a state change.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6._State\ = \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6._State_7\) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6._State_3\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0.3156
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6._State_8\ => 
                        -- True branch of the if-else started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6._State_6\.
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6.result\ := False;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6.return\ <= \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6.result\;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6._State_1\;
                        -- Going to the state after the if-else which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6._State_6\.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6._State\ = \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6._State_8\) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6._State_7\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0
                end case;
            end if;
        end if;
    end process;
    -- System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(System.UInt32).6 state machine end


    -- System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(System.UInt32).7 state machine start
    \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7._StateMachine\: process (\Clock\) 
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7._State\: \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7._States\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7._State_0\;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7.numberObject\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7.num\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7.num2\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7.num3\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7.flag\: boolean := false;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7.result\: boolean := false;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7.binaryOperationResult.0\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7.binaryOperationResult.1\: boolean := false;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7.binaryOperationResult.2\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7.clockCyclesWaitedForBinaryOperationResult.0\: signed(31 downto 0) := to_signed(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7.binaryOperationResult.3\: boolean := false;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7.binaryOperationResult.4\: unsigned(31 downto 0) := to_unsigned(0, 32);
    begin 
        if (rising_edge(\Clock\)) then 
            if (\Reset\ = '1') then 
                -- Synchronous reset
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7._Finished\ <= false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7.return\ <= false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7._State_0\;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7.numberObject\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7.num\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7.num2\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7.num3\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7.flag\ := false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7.result\ := false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7.binaryOperationResult.0\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7.binaryOperationResult.1\ := false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7.binaryOperationResult.2\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7.clockCyclesWaitedForBinaryOperationResult.0\ := to_signed(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7.binaryOperationResult.3\ := false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7.binaryOperationResult.4\ := to_unsigned(0, 32);
            else 
                case \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7._State\ is 
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7._State_0\ => 
                        -- Start state
                        -- Waiting for the start signal.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7._Started\ = true) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7._State_2\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7._State_1\ => 
                        -- Final state
                        -- Signaling finished until Started is pulled back to false, then returning to the start state.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7._Started\ = true) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7._Finished\ <= true;
                        else 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7._Finished\ <= false;
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7._State_0\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7._State_2\ => 
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7.numberObject\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7.numberObject.parameter.In\;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7.num\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7.numberObject\;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7.binaryOperationResult.0\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7.num\ / to_unsigned(2, 32);
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7.num2\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7.binaryOperationResult.0\;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7.num3\ := to_unsigned(2, 32);
                        -- Starting a while loop.
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7._State_3\;
                        -- Clock cycles needed to complete this state (approximation): 0.1
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7._State_3\ => 
                        -- Repeated state of the while loop which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7._State_2\.
                        -- The while loop's condition:
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7.binaryOperationResult.1\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7.num3\ <= \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7.num2\;
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7.binaryOperationResult.1\) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7._State_5\;
                        else 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7._State_4\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0.261
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7._State_4\ => 
                        -- State after the while loop which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7._State_2\.
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7.result\ := True;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7.return\ <= True;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7._State_1\;
                        -- Clock cycles needed to complete this state (approximation): 0
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7._State_5\ => 
                        -- Waiting for the result to appear in \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7.binaryOperationResult.2\ (have to wait 10 clock cycles in this state).
                        -- The assignment needs to be kept up for multi-cycle operations for the result to actually appear in the target.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7.clockCyclesWaitedForBinaryOperationResult.0\ >= to_signed(10, 32)) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7._State_6\;
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7.clockCyclesWaitedForBinaryOperationResult.0\ := to_signed(0, 32);
                        else 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7.clockCyclesWaitedForBinaryOperationResult.0\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7.clockCyclesWaitedForBinaryOperationResult.0\ + to_signed(1, 32);
                        end if;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7.binaryOperationResult.2\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7.num\ mod \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7.num3\;
                        -- Clock cycles needed to complete this state (approximation): 10
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7._State_6\ => 
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7.binaryOperationResult.3\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7.binaryOperationResult.2\ = to_unsigned(0, 32);
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7.flag\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7.binaryOperationResult.3\;

                        -- This if-else was transformed from a .NET if-else. It spans across multiple states:
                        --     * The true branch starts in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7._State_8\ and ends in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7._State_8\.
                        --     * Execution after either branch will continue in the following state: \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7._State_7\.

                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7.flag\) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7._State_8\;
                        else 
                            -- There was no false branch, so going directly to the state after the if-else.
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7._State_7\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0.2751
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7._State_7\ => 
                        -- State after the if-else which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7._State_6\.
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7.binaryOperationResult.4\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7.num3\ + to_unsigned(1, 32);
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7.num3\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7.binaryOperationResult.4\;
                        -- Returning to the repeated state of the while loop which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7._State_2\ if the loop wasn't exited with a state change.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7._State\ = \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7._State_7\) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7._State_3\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0.3156
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7._State_8\ => 
                        -- True branch of the if-else started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7._State_6\.
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7.result\ := False;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7.return\ <= \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7.result\;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7._State_1\;
                        -- Going to the state after the if-else which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7._State_6\.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7._State\ = \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7._State_8\) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7._State_7\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0
                end case;
            end if;
        end if;
    end process;
    -- System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(System.UInt32).7 state machine end


    -- System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(System.UInt32).8 state machine start
    \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8._StateMachine\: process (\Clock\) 
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8._State\: \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8._States\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8._State_0\;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8.numberObject\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8.num\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8.num2\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8.num3\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8.flag\: boolean := false;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8.result\: boolean := false;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8.binaryOperationResult.0\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8.binaryOperationResult.1\: boolean := false;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8.binaryOperationResult.2\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8.clockCyclesWaitedForBinaryOperationResult.0\: signed(31 downto 0) := to_signed(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8.binaryOperationResult.3\: boolean := false;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8.binaryOperationResult.4\: unsigned(31 downto 0) := to_unsigned(0, 32);
    begin 
        if (rising_edge(\Clock\)) then 
            if (\Reset\ = '1') then 
                -- Synchronous reset
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8._Finished\ <= false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8.return\ <= false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8._State_0\;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8.numberObject\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8.num\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8.num2\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8.num3\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8.flag\ := false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8.result\ := false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8.binaryOperationResult.0\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8.binaryOperationResult.1\ := false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8.binaryOperationResult.2\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8.clockCyclesWaitedForBinaryOperationResult.0\ := to_signed(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8.binaryOperationResult.3\ := false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8.binaryOperationResult.4\ := to_unsigned(0, 32);
            else 
                case \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8._State\ is 
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8._State_0\ => 
                        -- Start state
                        -- Waiting for the start signal.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8._Started\ = true) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8._State_2\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8._State_1\ => 
                        -- Final state
                        -- Signaling finished until Started is pulled back to false, then returning to the start state.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8._Started\ = true) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8._Finished\ <= true;
                        else 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8._Finished\ <= false;
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8._State_0\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8._State_2\ => 
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8.numberObject\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8.numberObject.parameter.In\;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8.num\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8.numberObject\;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8.binaryOperationResult.0\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8.num\ / to_unsigned(2, 32);
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8.num2\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8.binaryOperationResult.0\;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8.num3\ := to_unsigned(2, 32);
                        -- Starting a while loop.
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8._State_3\;
                        -- Clock cycles needed to complete this state (approximation): 0.1
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8._State_3\ => 
                        -- Repeated state of the while loop which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8._State_2\.
                        -- The while loop's condition:
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8.binaryOperationResult.1\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8.num3\ <= \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8.num2\;
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8.binaryOperationResult.1\) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8._State_5\;
                        else 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8._State_4\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0.261
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8._State_4\ => 
                        -- State after the while loop which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8._State_2\.
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8.result\ := True;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8.return\ <= True;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8._State_1\;
                        -- Clock cycles needed to complete this state (approximation): 0
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8._State_5\ => 
                        -- Waiting for the result to appear in \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8.binaryOperationResult.2\ (have to wait 10 clock cycles in this state).
                        -- The assignment needs to be kept up for multi-cycle operations for the result to actually appear in the target.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8.clockCyclesWaitedForBinaryOperationResult.0\ >= to_signed(10, 32)) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8._State_6\;
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8.clockCyclesWaitedForBinaryOperationResult.0\ := to_signed(0, 32);
                        else 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8.clockCyclesWaitedForBinaryOperationResult.0\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8.clockCyclesWaitedForBinaryOperationResult.0\ + to_signed(1, 32);
                        end if;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8.binaryOperationResult.2\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8.num\ mod \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8.num3\;
                        -- Clock cycles needed to complete this state (approximation): 10
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8._State_6\ => 
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8.binaryOperationResult.3\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8.binaryOperationResult.2\ = to_unsigned(0, 32);
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8.flag\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8.binaryOperationResult.3\;

                        -- This if-else was transformed from a .NET if-else. It spans across multiple states:
                        --     * The true branch starts in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8._State_8\ and ends in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8._State_8\.
                        --     * Execution after either branch will continue in the following state: \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8._State_7\.

                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8.flag\) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8._State_8\;
                        else 
                            -- There was no false branch, so going directly to the state after the if-else.
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8._State_7\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0.2751
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8._State_7\ => 
                        -- State after the if-else which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8._State_6\.
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8.binaryOperationResult.4\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8.num3\ + to_unsigned(1, 32);
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8.num3\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8.binaryOperationResult.4\;
                        -- Returning to the repeated state of the while loop which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8._State_2\ if the loop wasn't exited with a state change.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8._State\ = \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8._State_7\) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8._State_3\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0.3156
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8._State_8\ => 
                        -- True branch of the if-else started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8._State_6\.
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8.result\ := False;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8.return\ <= \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8.result\;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8._State_1\;
                        -- Going to the state after the if-else which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8._State_6\.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8._State\ = \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8._State_8\) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8._State_7\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0
                end case;
            end if;
        end if;
    end process;
    -- System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(System.UInt32).8 state machine end


    -- System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(System.UInt32).9 state machine start
    \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9._StateMachine\: process (\Clock\) 
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9._State\: \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9._States\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9._State_0\;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9.numberObject\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9.num\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9.num2\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9.num3\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9.flag\: boolean := false;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9.result\: boolean := false;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9.binaryOperationResult.0\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9.binaryOperationResult.1\: boolean := false;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9.binaryOperationResult.2\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9.clockCyclesWaitedForBinaryOperationResult.0\: signed(31 downto 0) := to_signed(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9.binaryOperationResult.3\: boolean := false;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9.binaryOperationResult.4\: unsigned(31 downto 0) := to_unsigned(0, 32);
    begin 
        if (rising_edge(\Clock\)) then 
            if (\Reset\ = '1') then 
                -- Synchronous reset
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9._Finished\ <= false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9.return\ <= false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9._State_0\;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9.numberObject\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9.num\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9.num2\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9.num3\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9.flag\ := false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9.result\ := false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9.binaryOperationResult.0\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9.binaryOperationResult.1\ := false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9.binaryOperationResult.2\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9.clockCyclesWaitedForBinaryOperationResult.0\ := to_signed(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9.binaryOperationResult.3\ := false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9.binaryOperationResult.4\ := to_unsigned(0, 32);
            else 
                case \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9._State\ is 
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9._State_0\ => 
                        -- Start state
                        -- Waiting for the start signal.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9._Started\ = true) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9._State_2\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9._State_1\ => 
                        -- Final state
                        -- Signaling finished until Started is pulled back to false, then returning to the start state.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9._Started\ = true) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9._Finished\ <= true;
                        else 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9._Finished\ <= false;
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9._State_0\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9._State_2\ => 
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9.numberObject\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9.numberObject.parameter.In\;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9.num\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9.numberObject\;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9.binaryOperationResult.0\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9.num\ / to_unsigned(2, 32);
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9.num2\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9.binaryOperationResult.0\;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9.num3\ := to_unsigned(2, 32);
                        -- Starting a while loop.
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9._State_3\;
                        -- Clock cycles needed to complete this state (approximation): 0.1
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9._State_3\ => 
                        -- Repeated state of the while loop which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9._State_2\.
                        -- The while loop's condition:
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9.binaryOperationResult.1\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9.num3\ <= \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9.num2\;
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9.binaryOperationResult.1\) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9._State_5\;
                        else 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9._State_4\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0.261
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9._State_4\ => 
                        -- State after the while loop which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9._State_2\.
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9.result\ := True;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9.return\ <= True;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9._State_1\;
                        -- Clock cycles needed to complete this state (approximation): 0
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9._State_5\ => 
                        -- Waiting for the result to appear in \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9.binaryOperationResult.2\ (have to wait 10 clock cycles in this state).
                        -- The assignment needs to be kept up for multi-cycle operations for the result to actually appear in the target.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9.clockCyclesWaitedForBinaryOperationResult.0\ >= to_signed(10, 32)) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9._State_6\;
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9.clockCyclesWaitedForBinaryOperationResult.0\ := to_signed(0, 32);
                        else 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9.clockCyclesWaitedForBinaryOperationResult.0\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9.clockCyclesWaitedForBinaryOperationResult.0\ + to_signed(1, 32);
                        end if;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9.binaryOperationResult.2\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9.num\ mod \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9.num3\;
                        -- Clock cycles needed to complete this state (approximation): 10
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9._State_6\ => 
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9.binaryOperationResult.3\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9.binaryOperationResult.2\ = to_unsigned(0, 32);
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9.flag\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9.binaryOperationResult.3\;

                        -- This if-else was transformed from a .NET if-else. It spans across multiple states:
                        --     * The true branch starts in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9._State_8\ and ends in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9._State_8\.
                        --     * Execution after either branch will continue in the following state: \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9._State_7\.

                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9.flag\) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9._State_8\;
                        else 
                            -- There was no false branch, so going directly to the state after the if-else.
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9._State_7\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0.2751
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9._State_7\ => 
                        -- State after the if-else which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9._State_6\.
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9.binaryOperationResult.4\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9.num3\ + to_unsigned(1, 32);
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9.num3\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9.binaryOperationResult.4\;
                        -- Returning to the repeated state of the while loop which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9._State_2\ if the loop wasn't exited with a state change.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9._State\ = \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9._State_7\) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9._State_3\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0.3156
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9._State_8\ => 
                        -- True branch of the if-else started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9._State_6\.
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9.result\ := False;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9.return\ <= \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9.result\;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9._State_1\;
                        -- Going to the state after the if-else which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9._State_6\.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9._State\ = \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9._State_8\) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9._State_7\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0
                end case;
            end if;
        end if;
    end process;
    -- System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(System.UInt32).9 state machine end


    -- System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(System.UInt32).10 state machine start
    \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10._StateMachine\: process (\Clock\) 
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10._State\: \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10._States\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10._State_0\;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10.numberObject\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10.num\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10.num2\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10.num3\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10.flag\: boolean := false;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10.result\: boolean := false;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10.binaryOperationResult.0\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10.binaryOperationResult.1\: boolean := false;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10.binaryOperationResult.2\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10.clockCyclesWaitedForBinaryOperationResult.0\: signed(31 downto 0) := to_signed(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10.binaryOperationResult.3\: boolean := false;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10.binaryOperationResult.4\: unsigned(31 downto 0) := to_unsigned(0, 32);
    begin 
        if (rising_edge(\Clock\)) then 
            if (\Reset\ = '1') then 
                -- Synchronous reset
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10._Finished\ <= false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10.return\ <= false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10._State_0\;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10.numberObject\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10.num\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10.num2\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10.num3\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10.flag\ := false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10.result\ := false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10.binaryOperationResult.0\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10.binaryOperationResult.1\ := false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10.binaryOperationResult.2\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10.clockCyclesWaitedForBinaryOperationResult.0\ := to_signed(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10.binaryOperationResult.3\ := false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10.binaryOperationResult.4\ := to_unsigned(0, 32);
            else 
                case \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10._State\ is 
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10._State_0\ => 
                        -- Start state
                        -- Waiting for the start signal.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10._Started\ = true) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10._State_2\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10._State_1\ => 
                        -- Final state
                        -- Signaling finished until Started is pulled back to false, then returning to the start state.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10._Started\ = true) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10._Finished\ <= true;
                        else 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10._Finished\ <= false;
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10._State_0\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10._State_2\ => 
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10.numberObject\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10.numberObject.parameter.In\;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10.num\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10.numberObject\;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10.binaryOperationResult.0\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10.num\ / to_unsigned(2, 32);
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10.num2\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10.binaryOperationResult.0\;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10.num3\ := to_unsigned(2, 32);
                        -- Starting a while loop.
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10._State_3\;
                        -- Clock cycles needed to complete this state (approximation): 0.1
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10._State_3\ => 
                        -- Repeated state of the while loop which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10._State_2\.
                        -- The while loop's condition:
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10.binaryOperationResult.1\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10.num3\ <= \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10.num2\;
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10.binaryOperationResult.1\) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10._State_5\;
                        else 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10._State_4\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0.261
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10._State_4\ => 
                        -- State after the while loop which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10._State_2\.
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10.result\ := True;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10.return\ <= True;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10._State_1\;
                        -- Clock cycles needed to complete this state (approximation): 0
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10._State_5\ => 
                        -- Waiting for the result to appear in \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10.binaryOperationResult.2\ (have to wait 10 clock cycles in this state).
                        -- The assignment needs to be kept up for multi-cycle operations for the result to actually appear in the target.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10.clockCyclesWaitedForBinaryOperationResult.0\ >= to_signed(10, 32)) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10._State_6\;
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10.clockCyclesWaitedForBinaryOperationResult.0\ := to_signed(0, 32);
                        else 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10.clockCyclesWaitedForBinaryOperationResult.0\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10.clockCyclesWaitedForBinaryOperationResult.0\ + to_signed(1, 32);
                        end if;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10.binaryOperationResult.2\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10.num\ mod \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10.num3\;
                        -- Clock cycles needed to complete this state (approximation): 10
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10._State_6\ => 
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10.binaryOperationResult.3\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10.binaryOperationResult.2\ = to_unsigned(0, 32);
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10.flag\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10.binaryOperationResult.3\;

                        -- This if-else was transformed from a .NET if-else. It spans across multiple states:
                        --     * The true branch starts in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10._State_8\ and ends in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10._State_8\.
                        --     * Execution after either branch will continue in the following state: \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10._State_7\.

                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10.flag\) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10._State_8\;
                        else 
                            -- There was no false branch, so going directly to the state after the if-else.
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10._State_7\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0.2751
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10._State_7\ => 
                        -- State after the if-else which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10._State_6\.
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10.binaryOperationResult.4\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10.num3\ + to_unsigned(1, 32);
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10.num3\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10.binaryOperationResult.4\;
                        -- Returning to the repeated state of the while loop which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10._State_2\ if the loop wasn't exited with a state change.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10._State\ = \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10._State_7\) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10._State_3\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0.3156
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10._State_8\ => 
                        -- True branch of the if-else started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10._State_6\.
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10.result\ := False;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10.return\ <= \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10.result\;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10._State_1\;
                        -- Going to the state after the if-else which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10._State_6\.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10._State\ = \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10._State_8\) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10._State_7\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0
                end case;
            end if;
        end if;
    end process;
    -- System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(System.UInt32).10 state machine end


    -- System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(System.UInt32).11 state machine start
    \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11._StateMachine\: process (\Clock\) 
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11._State\: \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11._States\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11._State_0\;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11.numberObject\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11.num\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11.num2\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11.num3\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11.flag\: boolean := false;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11.result\: boolean := false;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11.binaryOperationResult.0\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11.binaryOperationResult.1\: boolean := false;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11.binaryOperationResult.2\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11.clockCyclesWaitedForBinaryOperationResult.0\: signed(31 downto 0) := to_signed(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11.binaryOperationResult.3\: boolean := false;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11.binaryOperationResult.4\: unsigned(31 downto 0) := to_unsigned(0, 32);
    begin 
        if (rising_edge(\Clock\)) then 
            if (\Reset\ = '1') then 
                -- Synchronous reset
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11._Finished\ <= false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11.return\ <= false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11._State_0\;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11.numberObject\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11.num\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11.num2\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11.num3\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11.flag\ := false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11.result\ := false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11.binaryOperationResult.0\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11.binaryOperationResult.1\ := false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11.binaryOperationResult.2\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11.clockCyclesWaitedForBinaryOperationResult.0\ := to_signed(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11.binaryOperationResult.3\ := false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11.binaryOperationResult.4\ := to_unsigned(0, 32);
            else 
                case \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11._State\ is 
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11._State_0\ => 
                        -- Start state
                        -- Waiting for the start signal.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11._Started\ = true) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11._State_2\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11._State_1\ => 
                        -- Final state
                        -- Signaling finished until Started is pulled back to false, then returning to the start state.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11._Started\ = true) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11._Finished\ <= true;
                        else 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11._Finished\ <= false;
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11._State_0\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11._State_2\ => 
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11.numberObject\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11.numberObject.parameter.In\;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11.num\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11.numberObject\;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11.binaryOperationResult.0\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11.num\ / to_unsigned(2, 32);
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11.num2\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11.binaryOperationResult.0\;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11.num3\ := to_unsigned(2, 32);
                        -- Starting a while loop.
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11._State_3\;
                        -- Clock cycles needed to complete this state (approximation): 0.1
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11._State_3\ => 
                        -- Repeated state of the while loop which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11._State_2\.
                        -- The while loop's condition:
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11.binaryOperationResult.1\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11.num3\ <= \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11.num2\;
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11.binaryOperationResult.1\) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11._State_5\;
                        else 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11._State_4\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0.261
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11._State_4\ => 
                        -- State after the while loop which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11._State_2\.
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11.result\ := True;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11.return\ <= True;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11._State_1\;
                        -- Clock cycles needed to complete this state (approximation): 0
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11._State_5\ => 
                        -- Waiting for the result to appear in \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11.binaryOperationResult.2\ (have to wait 10 clock cycles in this state).
                        -- The assignment needs to be kept up for multi-cycle operations for the result to actually appear in the target.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11.clockCyclesWaitedForBinaryOperationResult.0\ >= to_signed(10, 32)) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11._State_6\;
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11.clockCyclesWaitedForBinaryOperationResult.0\ := to_signed(0, 32);
                        else 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11.clockCyclesWaitedForBinaryOperationResult.0\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11.clockCyclesWaitedForBinaryOperationResult.0\ + to_signed(1, 32);
                        end if;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11.binaryOperationResult.2\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11.num\ mod \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11.num3\;
                        -- Clock cycles needed to complete this state (approximation): 10
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11._State_6\ => 
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11.binaryOperationResult.3\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11.binaryOperationResult.2\ = to_unsigned(0, 32);
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11.flag\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11.binaryOperationResult.3\;

                        -- This if-else was transformed from a .NET if-else. It spans across multiple states:
                        --     * The true branch starts in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11._State_8\ and ends in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11._State_8\.
                        --     * Execution after either branch will continue in the following state: \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11._State_7\.

                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11.flag\) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11._State_8\;
                        else 
                            -- There was no false branch, so going directly to the state after the if-else.
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11._State_7\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0.2751
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11._State_7\ => 
                        -- State after the if-else which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11._State_6\.
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11.binaryOperationResult.4\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11.num3\ + to_unsigned(1, 32);
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11.num3\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11.binaryOperationResult.4\;
                        -- Returning to the repeated state of the while loop which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11._State_2\ if the loop wasn't exited with a state change.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11._State\ = \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11._State_7\) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11._State_3\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0.3156
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11._State_8\ => 
                        -- True branch of the if-else started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11._State_6\.
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11.result\ := False;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11.return\ <= \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11.result\;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11._State_1\;
                        -- Going to the state after the if-else which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11._State_6\.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11._State\ = \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11._State_8\) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11._State_7\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0
                end case;
            end if;
        end if;
    end process;
    -- System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(System.UInt32).11 state machine end


    -- System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(System.UInt32).12 state machine start
    \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12._StateMachine\: process (\Clock\) 
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12._State\: \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12._States\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12._State_0\;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12.numberObject\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12.num\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12.num2\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12.num3\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12.flag\: boolean := false;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12.result\: boolean := false;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12.binaryOperationResult.0\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12.binaryOperationResult.1\: boolean := false;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12.binaryOperationResult.2\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12.clockCyclesWaitedForBinaryOperationResult.0\: signed(31 downto 0) := to_signed(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12.binaryOperationResult.3\: boolean := false;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12.binaryOperationResult.4\: unsigned(31 downto 0) := to_unsigned(0, 32);
    begin 
        if (rising_edge(\Clock\)) then 
            if (\Reset\ = '1') then 
                -- Synchronous reset
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12._Finished\ <= false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12.return\ <= false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12._State_0\;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12.numberObject\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12.num\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12.num2\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12.num3\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12.flag\ := false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12.result\ := false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12.binaryOperationResult.0\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12.binaryOperationResult.1\ := false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12.binaryOperationResult.2\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12.clockCyclesWaitedForBinaryOperationResult.0\ := to_signed(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12.binaryOperationResult.3\ := false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12.binaryOperationResult.4\ := to_unsigned(0, 32);
            else 
                case \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12._State\ is 
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12._State_0\ => 
                        -- Start state
                        -- Waiting for the start signal.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12._Started\ = true) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12._State_2\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12._State_1\ => 
                        -- Final state
                        -- Signaling finished until Started is pulled back to false, then returning to the start state.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12._Started\ = true) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12._Finished\ <= true;
                        else 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12._Finished\ <= false;
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12._State_0\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12._State_2\ => 
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12.numberObject\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12.numberObject.parameter.In\;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12.num\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12.numberObject\;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12.binaryOperationResult.0\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12.num\ / to_unsigned(2, 32);
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12.num2\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12.binaryOperationResult.0\;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12.num3\ := to_unsigned(2, 32);
                        -- Starting a while loop.
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12._State_3\;
                        -- Clock cycles needed to complete this state (approximation): 0.1
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12._State_3\ => 
                        -- Repeated state of the while loop which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12._State_2\.
                        -- The while loop's condition:
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12.binaryOperationResult.1\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12.num3\ <= \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12.num2\;
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12.binaryOperationResult.1\) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12._State_5\;
                        else 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12._State_4\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0.261
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12._State_4\ => 
                        -- State after the while loop which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12._State_2\.
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12.result\ := True;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12.return\ <= True;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12._State_1\;
                        -- Clock cycles needed to complete this state (approximation): 0
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12._State_5\ => 
                        -- Waiting for the result to appear in \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12.binaryOperationResult.2\ (have to wait 10 clock cycles in this state).
                        -- The assignment needs to be kept up for multi-cycle operations for the result to actually appear in the target.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12.clockCyclesWaitedForBinaryOperationResult.0\ >= to_signed(10, 32)) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12._State_6\;
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12.clockCyclesWaitedForBinaryOperationResult.0\ := to_signed(0, 32);
                        else 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12.clockCyclesWaitedForBinaryOperationResult.0\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12.clockCyclesWaitedForBinaryOperationResult.0\ + to_signed(1, 32);
                        end if;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12.binaryOperationResult.2\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12.num\ mod \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12.num3\;
                        -- Clock cycles needed to complete this state (approximation): 10
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12._State_6\ => 
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12.binaryOperationResult.3\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12.binaryOperationResult.2\ = to_unsigned(0, 32);
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12.flag\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12.binaryOperationResult.3\;

                        -- This if-else was transformed from a .NET if-else. It spans across multiple states:
                        --     * The true branch starts in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12._State_8\ and ends in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12._State_8\.
                        --     * Execution after either branch will continue in the following state: \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12._State_7\.

                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12.flag\) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12._State_8\;
                        else 
                            -- There was no false branch, so going directly to the state after the if-else.
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12._State_7\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0.2751
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12._State_7\ => 
                        -- State after the if-else which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12._State_6\.
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12.binaryOperationResult.4\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12.num3\ + to_unsigned(1, 32);
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12.num3\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12.binaryOperationResult.4\;
                        -- Returning to the repeated state of the while loop which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12._State_2\ if the loop wasn't exited with a state change.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12._State\ = \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12._State_7\) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12._State_3\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0.3156
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12._State_8\ => 
                        -- True branch of the if-else started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12._State_6\.
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12.result\ := False;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12.return\ <= \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12.result\;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12._State_1\;
                        -- Going to the state after the if-else which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12._State_6\.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12._State\ = \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12._State_8\) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12._State_7\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0
                end case;
            end if;
        end if;
    end process;
    -- System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(System.UInt32).12 state machine end


    -- System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(System.UInt32).13 state machine start
    \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13._StateMachine\: process (\Clock\) 
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13._State\: \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13._States\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13._State_0\;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13.numberObject\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13.num\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13.num2\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13.num3\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13.flag\: boolean := false;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13.result\: boolean := false;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13.binaryOperationResult.0\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13.binaryOperationResult.1\: boolean := false;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13.binaryOperationResult.2\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13.clockCyclesWaitedForBinaryOperationResult.0\: signed(31 downto 0) := to_signed(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13.binaryOperationResult.3\: boolean := false;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13.binaryOperationResult.4\: unsigned(31 downto 0) := to_unsigned(0, 32);
    begin 
        if (rising_edge(\Clock\)) then 
            if (\Reset\ = '1') then 
                -- Synchronous reset
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13._Finished\ <= false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13.return\ <= false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13._State_0\;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13.numberObject\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13.num\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13.num2\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13.num3\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13.flag\ := false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13.result\ := false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13.binaryOperationResult.0\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13.binaryOperationResult.1\ := false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13.binaryOperationResult.2\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13.clockCyclesWaitedForBinaryOperationResult.0\ := to_signed(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13.binaryOperationResult.3\ := false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13.binaryOperationResult.4\ := to_unsigned(0, 32);
            else 
                case \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13._State\ is 
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13._State_0\ => 
                        -- Start state
                        -- Waiting for the start signal.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13._Started\ = true) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13._State_2\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13._State_1\ => 
                        -- Final state
                        -- Signaling finished until Started is pulled back to false, then returning to the start state.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13._Started\ = true) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13._Finished\ <= true;
                        else 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13._Finished\ <= false;
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13._State_0\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13._State_2\ => 
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13.numberObject\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13.numberObject.parameter.In\;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13.num\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13.numberObject\;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13.binaryOperationResult.0\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13.num\ / to_unsigned(2, 32);
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13.num2\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13.binaryOperationResult.0\;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13.num3\ := to_unsigned(2, 32);
                        -- Starting a while loop.
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13._State_3\;
                        -- Clock cycles needed to complete this state (approximation): 0.1
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13._State_3\ => 
                        -- Repeated state of the while loop which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13._State_2\.
                        -- The while loop's condition:
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13.binaryOperationResult.1\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13.num3\ <= \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13.num2\;
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13.binaryOperationResult.1\) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13._State_5\;
                        else 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13._State_4\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0.261
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13._State_4\ => 
                        -- State after the while loop which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13._State_2\.
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13.result\ := True;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13.return\ <= True;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13._State_1\;
                        -- Clock cycles needed to complete this state (approximation): 0
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13._State_5\ => 
                        -- Waiting for the result to appear in \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13.binaryOperationResult.2\ (have to wait 10 clock cycles in this state).
                        -- The assignment needs to be kept up for multi-cycle operations for the result to actually appear in the target.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13.clockCyclesWaitedForBinaryOperationResult.0\ >= to_signed(10, 32)) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13._State_6\;
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13.clockCyclesWaitedForBinaryOperationResult.0\ := to_signed(0, 32);
                        else 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13.clockCyclesWaitedForBinaryOperationResult.0\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13.clockCyclesWaitedForBinaryOperationResult.0\ + to_signed(1, 32);
                        end if;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13.binaryOperationResult.2\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13.num\ mod \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13.num3\;
                        -- Clock cycles needed to complete this state (approximation): 10
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13._State_6\ => 
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13.binaryOperationResult.3\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13.binaryOperationResult.2\ = to_unsigned(0, 32);
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13.flag\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13.binaryOperationResult.3\;

                        -- This if-else was transformed from a .NET if-else. It spans across multiple states:
                        --     * The true branch starts in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13._State_8\ and ends in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13._State_8\.
                        --     * Execution after either branch will continue in the following state: \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13._State_7\.

                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13.flag\) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13._State_8\;
                        else 
                            -- There was no false branch, so going directly to the state after the if-else.
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13._State_7\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0.2751
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13._State_7\ => 
                        -- State after the if-else which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13._State_6\.
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13.binaryOperationResult.4\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13.num3\ + to_unsigned(1, 32);
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13.num3\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13.binaryOperationResult.4\;
                        -- Returning to the repeated state of the while loop which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13._State_2\ if the loop wasn't exited with a state change.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13._State\ = \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13._State_7\) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13._State_3\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0.3156
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13._State_8\ => 
                        -- True branch of the if-else started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13._State_6\.
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13.result\ := False;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13.return\ <= \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13.result\;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13._State_1\;
                        -- Going to the state after the if-else which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13._State_6\.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13._State\ = \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13._State_8\) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13._State_7\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0
                end case;
            end if;
        end if;
    end process;
    -- System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(System.UInt32).13 state machine end


    -- System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(System.UInt32).14 state machine start
    \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14._StateMachine\: process (\Clock\) 
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14._State\: \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14._States\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14._State_0\;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14.numberObject\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14.num\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14.num2\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14.num3\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14.flag\: boolean := false;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14.result\: boolean := false;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14.binaryOperationResult.0\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14.binaryOperationResult.1\: boolean := false;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14.binaryOperationResult.2\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14.clockCyclesWaitedForBinaryOperationResult.0\: signed(31 downto 0) := to_signed(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14.binaryOperationResult.3\: boolean := false;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14.binaryOperationResult.4\: unsigned(31 downto 0) := to_unsigned(0, 32);
    begin 
        if (rising_edge(\Clock\)) then 
            if (\Reset\ = '1') then 
                -- Synchronous reset
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14._Finished\ <= false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14.return\ <= false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14._State_0\;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14.numberObject\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14.num\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14.num2\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14.num3\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14.flag\ := false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14.result\ := false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14.binaryOperationResult.0\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14.binaryOperationResult.1\ := false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14.binaryOperationResult.2\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14.clockCyclesWaitedForBinaryOperationResult.0\ := to_signed(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14.binaryOperationResult.3\ := false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14.binaryOperationResult.4\ := to_unsigned(0, 32);
            else 
                case \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14._State\ is 
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14._State_0\ => 
                        -- Start state
                        -- Waiting for the start signal.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14._Started\ = true) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14._State_2\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14._State_1\ => 
                        -- Final state
                        -- Signaling finished until Started is pulled back to false, then returning to the start state.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14._Started\ = true) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14._Finished\ <= true;
                        else 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14._Finished\ <= false;
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14._State_0\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14._State_2\ => 
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14.numberObject\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14.numberObject.parameter.In\;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14.num\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14.numberObject\;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14.binaryOperationResult.0\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14.num\ / to_unsigned(2, 32);
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14.num2\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14.binaryOperationResult.0\;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14.num3\ := to_unsigned(2, 32);
                        -- Starting a while loop.
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14._State_3\;
                        -- Clock cycles needed to complete this state (approximation): 0.1
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14._State_3\ => 
                        -- Repeated state of the while loop which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14._State_2\.
                        -- The while loop's condition:
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14.binaryOperationResult.1\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14.num3\ <= \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14.num2\;
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14.binaryOperationResult.1\) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14._State_5\;
                        else 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14._State_4\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0.261
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14._State_4\ => 
                        -- State after the while loop which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14._State_2\.
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14.result\ := True;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14.return\ <= True;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14._State_1\;
                        -- Clock cycles needed to complete this state (approximation): 0
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14._State_5\ => 
                        -- Waiting for the result to appear in \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14.binaryOperationResult.2\ (have to wait 10 clock cycles in this state).
                        -- The assignment needs to be kept up for multi-cycle operations for the result to actually appear in the target.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14.clockCyclesWaitedForBinaryOperationResult.0\ >= to_signed(10, 32)) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14._State_6\;
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14.clockCyclesWaitedForBinaryOperationResult.0\ := to_signed(0, 32);
                        else 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14.clockCyclesWaitedForBinaryOperationResult.0\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14.clockCyclesWaitedForBinaryOperationResult.0\ + to_signed(1, 32);
                        end if;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14.binaryOperationResult.2\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14.num\ mod \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14.num3\;
                        -- Clock cycles needed to complete this state (approximation): 10
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14._State_6\ => 
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14.binaryOperationResult.3\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14.binaryOperationResult.2\ = to_unsigned(0, 32);
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14.flag\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14.binaryOperationResult.3\;

                        -- This if-else was transformed from a .NET if-else. It spans across multiple states:
                        --     * The true branch starts in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14._State_8\ and ends in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14._State_8\.
                        --     * Execution after either branch will continue in the following state: \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14._State_7\.

                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14.flag\) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14._State_8\;
                        else 
                            -- There was no false branch, so going directly to the state after the if-else.
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14._State_7\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0.2751
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14._State_7\ => 
                        -- State after the if-else which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14._State_6\.
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14.binaryOperationResult.4\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14.num3\ + to_unsigned(1, 32);
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14.num3\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14.binaryOperationResult.4\;
                        -- Returning to the repeated state of the while loop which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14._State_2\ if the loop wasn't exited with a state change.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14._State\ = \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14._State_7\) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14._State_3\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0.3156
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14._State_8\ => 
                        -- True branch of the if-else started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14._State_6\.
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14.result\ := False;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14.return\ <= \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14.result\;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14._State_1\;
                        -- Going to the state after the if-else which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14._State_6\.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14._State\ = \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14._State_8\) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14._State_7\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0
                end case;
            end if;
        end if;
    end process;
    -- System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(System.UInt32).14 state machine end


    -- System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(System.UInt32).15 state machine start
    \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15._StateMachine\: process (\Clock\) 
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15._State\: \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15._States\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15._State_0\;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15.numberObject\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15.num\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15.num2\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15.num3\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15.flag\: boolean := false;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15.result\: boolean := false;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15.binaryOperationResult.0\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15.binaryOperationResult.1\: boolean := false;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15.binaryOperationResult.2\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15.clockCyclesWaitedForBinaryOperationResult.0\: signed(31 downto 0) := to_signed(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15.binaryOperationResult.3\: boolean := false;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15.binaryOperationResult.4\: unsigned(31 downto 0) := to_unsigned(0, 32);
    begin 
        if (rising_edge(\Clock\)) then 
            if (\Reset\ = '1') then 
                -- Synchronous reset
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15._Finished\ <= false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15.return\ <= false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15._State_0\;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15.numberObject\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15.num\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15.num2\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15.num3\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15.flag\ := false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15.result\ := false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15.binaryOperationResult.0\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15.binaryOperationResult.1\ := false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15.binaryOperationResult.2\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15.clockCyclesWaitedForBinaryOperationResult.0\ := to_signed(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15.binaryOperationResult.3\ := false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15.binaryOperationResult.4\ := to_unsigned(0, 32);
            else 
                case \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15._State\ is 
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15._State_0\ => 
                        -- Start state
                        -- Waiting for the start signal.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15._Started\ = true) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15._State_2\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15._State_1\ => 
                        -- Final state
                        -- Signaling finished until Started is pulled back to false, then returning to the start state.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15._Started\ = true) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15._Finished\ <= true;
                        else 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15._Finished\ <= false;
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15._State_0\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15._State_2\ => 
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15.numberObject\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15.numberObject.parameter.In\;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15.num\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15.numberObject\;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15.binaryOperationResult.0\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15.num\ / to_unsigned(2, 32);
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15.num2\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15.binaryOperationResult.0\;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15.num3\ := to_unsigned(2, 32);
                        -- Starting a while loop.
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15._State_3\;
                        -- Clock cycles needed to complete this state (approximation): 0.1
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15._State_3\ => 
                        -- Repeated state of the while loop which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15._State_2\.
                        -- The while loop's condition:
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15.binaryOperationResult.1\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15.num3\ <= \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15.num2\;
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15.binaryOperationResult.1\) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15._State_5\;
                        else 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15._State_4\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0.261
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15._State_4\ => 
                        -- State after the while loop which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15._State_2\.
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15.result\ := True;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15.return\ <= True;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15._State_1\;
                        -- Clock cycles needed to complete this state (approximation): 0
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15._State_5\ => 
                        -- Waiting for the result to appear in \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15.binaryOperationResult.2\ (have to wait 10 clock cycles in this state).
                        -- The assignment needs to be kept up for multi-cycle operations for the result to actually appear in the target.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15.clockCyclesWaitedForBinaryOperationResult.0\ >= to_signed(10, 32)) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15._State_6\;
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15.clockCyclesWaitedForBinaryOperationResult.0\ := to_signed(0, 32);
                        else 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15.clockCyclesWaitedForBinaryOperationResult.0\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15.clockCyclesWaitedForBinaryOperationResult.0\ + to_signed(1, 32);
                        end if;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15.binaryOperationResult.2\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15.num\ mod \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15.num3\;
                        -- Clock cycles needed to complete this state (approximation): 10
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15._State_6\ => 
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15.binaryOperationResult.3\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15.binaryOperationResult.2\ = to_unsigned(0, 32);
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15.flag\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15.binaryOperationResult.3\;

                        -- This if-else was transformed from a .NET if-else. It spans across multiple states:
                        --     * The true branch starts in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15._State_8\ and ends in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15._State_8\.
                        --     * Execution after either branch will continue in the following state: \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15._State_7\.

                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15.flag\) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15._State_8\;
                        else 
                            -- There was no false branch, so going directly to the state after the if-else.
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15._State_7\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0.2751
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15._State_7\ => 
                        -- State after the if-else which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15._State_6\.
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15.binaryOperationResult.4\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15.num3\ + to_unsigned(1, 32);
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15.num3\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15.binaryOperationResult.4\;
                        -- Returning to the repeated state of the while loop which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15._State_2\ if the loop wasn't exited with a state change.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15._State\ = \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15._State_7\) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15._State_3\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0.3156
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15._State_8\ => 
                        -- True branch of the if-else started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15._State_6\.
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15.result\ := False;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15.return\ <= \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15.result\;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15._State_1\;
                        -- Going to the state after the if-else which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15._State_6\.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15._State\ = \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15._State_8\) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15._State_7\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0
                end case;
            end if;
        end if;
    end process;
    -- System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(System.UInt32).15 state machine end


    -- System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(System.UInt32).16 state machine start
    \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16._StateMachine\: process (\Clock\) 
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16._State\: \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16._States\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16._State_0\;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16.numberObject\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16.num\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16.num2\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16.num3\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16.flag\: boolean := false;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16.result\: boolean := false;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16.binaryOperationResult.0\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16.binaryOperationResult.1\: boolean := false;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16.binaryOperationResult.2\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16.clockCyclesWaitedForBinaryOperationResult.0\: signed(31 downto 0) := to_signed(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16.binaryOperationResult.3\: boolean := false;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16.binaryOperationResult.4\: unsigned(31 downto 0) := to_unsigned(0, 32);
    begin 
        if (rising_edge(\Clock\)) then 
            if (\Reset\ = '1') then 
                -- Synchronous reset
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16._Finished\ <= false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16.return\ <= false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16._State_0\;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16.numberObject\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16.num\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16.num2\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16.num3\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16.flag\ := false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16.result\ := false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16.binaryOperationResult.0\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16.binaryOperationResult.1\ := false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16.binaryOperationResult.2\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16.clockCyclesWaitedForBinaryOperationResult.0\ := to_signed(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16.binaryOperationResult.3\ := false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16.binaryOperationResult.4\ := to_unsigned(0, 32);
            else 
                case \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16._State\ is 
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16._State_0\ => 
                        -- Start state
                        -- Waiting for the start signal.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16._Started\ = true) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16._State_2\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16._State_1\ => 
                        -- Final state
                        -- Signaling finished until Started is pulled back to false, then returning to the start state.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16._Started\ = true) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16._Finished\ <= true;
                        else 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16._Finished\ <= false;
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16._State_0\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16._State_2\ => 
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16.numberObject\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16.numberObject.parameter.In\;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16.num\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16.numberObject\;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16.binaryOperationResult.0\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16.num\ / to_unsigned(2, 32);
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16.num2\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16.binaryOperationResult.0\;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16.num3\ := to_unsigned(2, 32);
                        -- Starting a while loop.
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16._State_3\;
                        -- Clock cycles needed to complete this state (approximation): 0.1
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16._State_3\ => 
                        -- Repeated state of the while loop which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16._State_2\.
                        -- The while loop's condition:
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16.binaryOperationResult.1\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16.num3\ <= \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16.num2\;
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16.binaryOperationResult.1\) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16._State_5\;
                        else 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16._State_4\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0.261
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16._State_4\ => 
                        -- State after the while loop which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16._State_2\.
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16.result\ := True;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16.return\ <= True;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16._State_1\;
                        -- Clock cycles needed to complete this state (approximation): 0
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16._State_5\ => 
                        -- Waiting for the result to appear in \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16.binaryOperationResult.2\ (have to wait 10 clock cycles in this state).
                        -- The assignment needs to be kept up for multi-cycle operations for the result to actually appear in the target.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16.clockCyclesWaitedForBinaryOperationResult.0\ >= to_signed(10, 32)) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16._State_6\;
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16.clockCyclesWaitedForBinaryOperationResult.0\ := to_signed(0, 32);
                        else 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16.clockCyclesWaitedForBinaryOperationResult.0\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16.clockCyclesWaitedForBinaryOperationResult.0\ + to_signed(1, 32);
                        end if;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16.binaryOperationResult.2\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16.num\ mod \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16.num3\;
                        -- Clock cycles needed to complete this state (approximation): 10
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16._State_6\ => 
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16.binaryOperationResult.3\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16.binaryOperationResult.2\ = to_unsigned(0, 32);
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16.flag\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16.binaryOperationResult.3\;

                        -- This if-else was transformed from a .NET if-else. It spans across multiple states:
                        --     * The true branch starts in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16._State_8\ and ends in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16._State_8\.
                        --     * Execution after either branch will continue in the following state: \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16._State_7\.

                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16.flag\) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16._State_8\;
                        else 
                            -- There was no false branch, so going directly to the state after the if-else.
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16._State_7\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0.2751
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16._State_7\ => 
                        -- State after the if-else which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16._State_6\.
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16.binaryOperationResult.4\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16.num3\ + to_unsigned(1, 32);
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16.num3\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16.binaryOperationResult.4\;
                        -- Returning to the repeated state of the while loop which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16._State_2\ if the loop wasn't exited with a state change.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16._State\ = \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16._State_7\) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16._State_3\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0.3156
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16._State_8\ => 
                        -- True branch of the if-else started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16._State_6\.
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16.result\ := False;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16.return\ <= \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16.result\;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16._State_1\;
                        -- Going to the state after the if-else which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16._State_6\.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16._State\ = \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16._State_8\) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16._State_7\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0
                end case;
            end if;
        end if;
    end process;
    -- System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(System.UInt32).16 state machine end


    -- System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(System.UInt32).17 state machine start
    \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17._StateMachine\: process (\Clock\) 
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17._State\: \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17._States\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17._State_0\;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17.numberObject\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17.num\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17.num2\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17.num3\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17.flag\: boolean := false;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17.result\: boolean := false;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17.binaryOperationResult.0\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17.binaryOperationResult.1\: boolean := false;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17.binaryOperationResult.2\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17.clockCyclesWaitedForBinaryOperationResult.0\: signed(31 downto 0) := to_signed(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17.binaryOperationResult.3\: boolean := false;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17.binaryOperationResult.4\: unsigned(31 downto 0) := to_unsigned(0, 32);
    begin 
        if (rising_edge(\Clock\)) then 
            if (\Reset\ = '1') then 
                -- Synchronous reset
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17._Finished\ <= false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17.return\ <= false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17._State_0\;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17.numberObject\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17.num\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17.num2\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17.num3\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17.flag\ := false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17.result\ := false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17.binaryOperationResult.0\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17.binaryOperationResult.1\ := false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17.binaryOperationResult.2\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17.clockCyclesWaitedForBinaryOperationResult.0\ := to_signed(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17.binaryOperationResult.3\ := false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17.binaryOperationResult.4\ := to_unsigned(0, 32);
            else 
                case \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17._State\ is 
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17._State_0\ => 
                        -- Start state
                        -- Waiting for the start signal.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17._Started\ = true) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17._State_2\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17._State_1\ => 
                        -- Final state
                        -- Signaling finished until Started is pulled back to false, then returning to the start state.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17._Started\ = true) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17._Finished\ <= true;
                        else 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17._Finished\ <= false;
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17._State_0\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17._State_2\ => 
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17.numberObject\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17.numberObject.parameter.In\;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17.num\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17.numberObject\;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17.binaryOperationResult.0\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17.num\ / to_unsigned(2, 32);
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17.num2\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17.binaryOperationResult.0\;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17.num3\ := to_unsigned(2, 32);
                        -- Starting a while loop.
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17._State_3\;
                        -- Clock cycles needed to complete this state (approximation): 0.1
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17._State_3\ => 
                        -- Repeated state of the while loop which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17._State_2\.
                        -- The while loop's condition:
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17.binaryOperationResult.1\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17.num3\ <= \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17.num2\;
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17.binaryOperationResult.1\) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17._State_5\;
                        else 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17._State_4\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0.261
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17._State_4\ => 
                        -- State after the while loop which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17._State_2\.
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17.result\ := True;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17.return\ <= True;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17._State_1\;
                        -- Clock cycles needed to complete this state (approximation): 0
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17._State_5\ => 
                        -- Waiting for the result to appear in \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17.binaryOperationResult.2\ (have to wait 10 clock cycles in this state).
                        -- The assignment needs to be kept up for multi-cycle operations for the result to actually appear in the target.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17.clockCyclesWaitedForBinaryOperationResult.0\ >= to_signed(10, 32)) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17._State_6\;
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17.clockCyclesWaitedForBinaryOperationResult.0\ := to_signed(0, 32);
                        else 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17.clockCyclesWaitedForBinaryOperationResult.0\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17.clockCyclesWaitedForBinaryOperationResult.0\ + to_signed(1, 32);
                        end if;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17.binaryOperationResult.2\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17.num\ mod \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17.num3\;
                        -- Clock cycles needed to complete this state (approximation): 10
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17._State_6\ => 
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17.binaryOperationResult.3\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17.binaryOperationResult.2\ = to_unsigned(0, 32);
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17.flag\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17.binaryOperationResult.3\;

                        -- This if-else was transformed from a .NET if-else. It spans across multiple states:
                        --     * The true branch starts in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17._State_8\ and ends in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17._State_8\.
                        --     * Execution after either branch will continue in the following state: \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17._State_7\.

                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17.flag\) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17._State_8\;
                        else 
                            -- There was no false branch, so going directly to the state after the if-else.
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17._State_7\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0.2751
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17._State_7\ => 
                        -- State after the if-else which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17._State_6\.
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17.binaryOperationResult.4\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17.num3\ + to_unsigned(1, 32);
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17.num3\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17.binaryOperationResult.4\;
                        -- Returning to the repeated state of the while loop which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17._State_2\ if the loop wasn't exited with a state change.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17._State\ = \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17._State_7\) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17._State_3\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0.3156
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17._State_8\ => 
                        -- True branch of the if-else started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17._State_6\.
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17.result\ := False;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17.return\ <= \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17.result\;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17._State_1\;
                        -- Going to the state after the if-else which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17._State_6\.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17._State\ = \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17._State_8\) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17._State_7\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0
                end case;
            end if;
        end if;
    end process;
    -- System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(System.UInt32).17 state machine end


    -- System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(System.UInt32).18 state machine start
    \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18._StateMachine\: process (\Clock\) 
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18._State\: \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18._States\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18._State_0\;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18.numberObject\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18.num\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18.num2\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18.num3\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18.flag\: boolean := false;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18.result\: boolean := false;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18.binaryOperationResult.0\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18.binaryOperationResult.1\: boolean := false;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18.binaryOperationResult.2\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18.clockCyclesWaitedForBinaryOperationResult.0\: signed(31 downto 0) := to_signed(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18.binaryOperationResult.3\: boolean := false;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18.binaryOperationResult.4\: unsigned(31 downto 0) := to_unsigned(0, 32);
    begin 
        if (rising_edge(\Clock\)) then 
            if (\Reset\ = '1') then 
                -- Synchronous reset
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18._Finished\ <= false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18.return\ <= false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18._State_0\;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18.numberObject\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18.num\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18.num2\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18.num3\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18.flag\ := false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18.result\ := false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18.binaryOperationResult.0\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18.binaryOperationResult.1\ := false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18.binaryOperationResult.2\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18.clockCyclesWaitedForBinaryOperationResult.0\ := to_signed(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18.binaryOperationResult.3\ := false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18.binaryOperationResult.4\ := to_unsigned(0, 32);
            else 
                case \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18._State\ is 
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18._State_0\ => 
                        -- Start state
                        -- Waiting for the start signal.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18._Started\ = true) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18._State_2\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18._State_1\ => 
                        -- Final state
                        -- Signaling finished until Started is pulled back to false, then returning to the start state.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18._Started\ = true) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18._Finished\ <= true;
                        else 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18._Finished\ <= false;
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18._State_0\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18._State_2\ => 
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18.numberObject\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18.numberObject.parameter.In\;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18.num\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18.numberObject\;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18.binaryOperationResult.0\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18.num\ / to_unsigned(2, 32);
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18.num2\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18.binaryOperationResult.0\;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18.num3\ := to_unsigned(2, 32);
                        -- Starting a while loop.
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18._State_3\;
                        -- Clock cycles needed to complete this state (approximation): 0.1
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18._State_3\ => 
                        -- Repeated state of the while loop which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18._State_2\.
                        -- The while loop's condition:
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18.binaryOperationResult.1\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18.num3\ <= \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18.num2\;
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18.binaryOperationResult.1\) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18._State_5\;
                        else 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18._State_4\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0.261
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18._State_4\ => 
                        -- State after the while loop which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18._State_2\.
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18.result\ := True;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18.return\ <= True;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18._State_1\;
                        -- Clock cycles needed to complete this state (approximation): 0
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18._State_5\ => 
                        -- Waiting for the result to appear in \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18.binaryOperationResult.2\ (have to wait 10 clock cycles in this state).
                        -- The assignment needs to be kept up for multi-cycle operations for the result to actually appear in the target.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18.clockCyclesWaitedForBinaryOperationResult.0\ >= to_signed(10, 32)) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18._State_6\;
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18.clockCyclesWaitedForBinaryOperationResult.0\ := to_signed(0, 32);
                        else 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18.clockCyclesWaitedForBinaryOperationResult.0\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18.clockCyclesWaitedForBinaryOperationResult.0\ + to_signed(1, 32);
                        end if;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18.binaryOperationResult.2\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18.num\ mod \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18.num3\;
                        -- Clock cycles needed to complete this state (approximation): 10
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18._State_6\ => 
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18.binaryOperationResult.3\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18.binaryOperationResult.2\ = to_unsigned(0, 32);
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18.flag\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18.binaryOperationResult.3\;

                        -- This if-else was transformed from a .NET if-else. It spans across multiple states:
                        --     * The true branch starts in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18._State_8\ and ends in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18._State_8\.
                        --     * Execution after either branch will continue in the following state: \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18._State_7\.

                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18.flag\) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18._State_8\;
                        else 
                            -- There was no false branch, so going directly to the state after the if-else.
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18._State_7\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0.2751
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18._State_7\ => 
                        -- State after the if-else which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18._State_6\.
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18.binaryOperationResult.4\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18.num3\ + to_unsigned(1, 32);
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18.num3\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18.binaryOperationResult.4\;
                        -- Returning to the repeated state of the while loop which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18._State_2\ if the loop wasn't exited with a state change.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18._State\ = \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18._State_7\) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18._State_3\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0.3156
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18._State_8\ => 
                        -- True branch of the if-else started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18._State_6\.
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18.result\ := False;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18.return\ <= \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18.result\;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18._State_1\;
                        -- Going to the state after the if-else which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18._State_6\.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18._State\ = \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18._State_8\) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18._State_7\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0
                end case;
            end if;
        end if;
    end process;
    -- System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(System.UInt32).18 state machine end


    -- System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(System.UInt32).19 state machine start
    \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19._StateMachine\: process (\Clock\) 
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19._State\: \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19._States\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19._State_0\;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19.numberObject\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19.num\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19.num2\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19.num3\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19.flag\: boolean := false;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19.result\: boolean := false;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19.binaryOperationResult.0\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19.binaryOperationResult.1\: boolean := false;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19.binaryOperationResult.2\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19.clockCyclesWaitedForBinaryOperationResult.0\: signed(31 downto 0) := to_signed(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19.binaryOperationResult.3\: boolean := false;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19.binaryOperationResult.4\: unsigned(31 downto 0) := to_unsigned(0, 32);
    begin 
        if (rising_edge(\Clock\)) then 
            if (\Reset\ = '1') then 
                -- Synchronous reset
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19._Finished\ <= false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19.return\ <= false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19._State_0\;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19.numberObject\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19.num\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19.num2\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19.num3\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19.flag\ := false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19.result\ := false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19.binaryOperationResult.0\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19.binaryOperationResult.1\ := false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19.binaryOperationResult.2\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19.clockCyclesWaitedForBinaryOperationResult.0\ := to_signed(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19.binaryOperationResult.3\ := false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19.binaryOperationResult.4\ := to_unsigned(0, 32);
            else 
                case \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19._State\ is 
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19._State_0\ => 
                        -- Start state
                        -- Waiting for the start signal.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19._Started\ = true) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19._State_2\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19._State_1\ => 
                        -- Final state
                        -- Signaling finished until Started is pulled back to false, then returning to the start state.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19._Started\ = true) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19._Finished\ <= true;
                        else 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19._Finished\ <= false;
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19._State_0\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19._State_2\ => 
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19.numberObject\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19.numberObject.parameter.In\;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19.num\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19.numberObject\;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19.binaryOperationResult.0\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19.num\ / to_unsigned(2, 32);
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19.num2\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19.binaryOperationResult.0\;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19.num3\ := to_unsigned(2, 32);
                        -- Starting a while loop.
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19._State_3\;
                        -- Clock cycles needed to complete this state (approximation): 0.1
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19._State_3\ => 
                        -- Repeated state of the while loop which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19._State_2\.
                        -- The while loop's condition:
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19.binaryOperationResult.1\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19.num3\ <= \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19.num2\;
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19.binaryOperationResult.1\) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19._State_5\;
                        else 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19._State_4\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0.261
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19._State_4\ => 
                        -- State after the while loop which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19._State_2\.
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19.result\ := True;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19.return\ <= True;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19._State_1\;
                        -- Clock cycles needed to complete this state (approximation): 0
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19._State_5\ => 
                        -- Waiting for the result to appear in \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19.binaryOperationResult.2\ (have to wait 10 clock cycles in this state).
                        -- The assignment needs to be kept up for multi-cycle operations for the result to actually appear in the target.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19.clockCyclesWaitedForBinaryOperationResult.0\ >= to_signed(10, 32)) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19._State_6\;
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19.clockCyclesWaitedForBinaryOperationResult.0\ := to_signed(0, 32);
                        else 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19.clockCyclesWaitedForBinaryOperationResult.0\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19.clockCyclesWaitedForBinaryOperationResult.0\ + to_signed(1, 32);
                        end if;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19.binaryOperationResult.2\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19.num\ mod \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19.num3\;
                        -- Clock cycles needed to complete this state (approximation): 10
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19._State_6\ => 
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19.binaryOperationResult.3\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19.binaryOperationResult.2\ = to_unsigned(0, 32);
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19.flag\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19.binaryOperationResult.3\;

                        -- This if-else was transformed from a .NET if-else. It spans across multiple states:
                        --     * The true branch starts in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19._State_8\ and ends in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19._State_8\.
                        --     * Execution after either branch will continue in the following state: \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19._State_7\.

                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19.flag\) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19._State_8\;
                        else 
                            -- There was no false branch, so going directly to the state after the if-else.
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19._State_7\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0.2751
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19._State_7\ => 
                        -- State after the if-else which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19._State_6\.
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19.binaryOperationResult.4\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19.num3\ + to_unsigned(1, 32);
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19.num3\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19.binaryOperationResult.4\;
                        -- Returning to the repeated state of the while loop which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19._State_2\ if the loop wasn't exited with a state change.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19._State\ = \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19._State_7\) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19._State_3\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0.3156
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19._State_8\ => 
                        -- True branch of the if-else started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19._State_6\.
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19.result\ := False;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19.return\ <= \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19.result\;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19._State_1\;
                        -- Going to the state after the if-else which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19._State_6\.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19._State\ = \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19._State_8\) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19._State_7\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0
                end case;
            end if;
        end if;
    end process;
    -- System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(System.UInt32).19 state machine end


    -- System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(System.UInt32).20 state machine start
    \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20._StateMachine\: process (\Clock\) 
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20._State\: \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20._States\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20._State_0\;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20.numberObject\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20.num\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20.num2\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20.num3\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20.flag\: boolean := false;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20.result\: boolean := false;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20.binaryOperationResult.0\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20.binaryOperationResult.1\: boolean := false;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20.binaryOperationResult.2\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20.clockCyclesWaitedForBinaryOperationResult.0\: signed(31 downto 0) := to_signed(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20.binaryOperationResult.3\: boolean := false;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20.binaryOperationResult.4\: unsigned(31 downto 0) := to_unsigned(0, 32);
    begin 
        if (rising_edge(\Clock\)) then 
            if (\Reset\ = '1') then 
                -- Synchronous reset
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20._Finished\ <= false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20.return\ <= false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20._State_0\;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20.numberObject\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20.num\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20.num2\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20.num3\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20.flag\ := false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20.result\ := false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20.binaryOperationResult.0\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20.binaryOperationResult.1\ := false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20.binaryOperationResult.2\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20.clockCyclesWaitedForBinaryOperationResult.0\ := to_signed(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20.binaryOperationResult.3\ := false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20.binaryOperationResult.4\ := to_unsigned(0, 32);
            else 
                case \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20._State\ is 
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20._State_0\ => 
                        -- Start state
                        -- Waiting for the start signal.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20._Started\ = true) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20._State_2\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20._State_1\ => 
                        -- Final state
                        -- Signaling finished until Started is pulled back to false, then returning to the start state.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20._Started\ = true) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20._Finished\ <= true;
                        else 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20._Finished\ <= false;
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20._State_0\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20._State_2\ => 
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20.numberObject\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20.numberObject.parameter.In\;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20.num\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20.numberObject\;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20.binaryOperationResult.0\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20.num\ / to_unsigned(2, 32);
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20.num2\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20.binaryOperationResult.0\;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20.num3\ := to_unsigned(2, 32);
                        -- Starting a while loop.
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20._State_3\;
                        -- Clock cycles needed to complete this state (approximation): 0.1
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20._State_3\ => 
                        -- Repeated state of the while loop which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20._State_2\.
                        -- The while loop's condition:
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20.binaryOperationResult.1\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20.num3\ <= \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20.num2\;
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20.binaryOperationResult.1\) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20._State_5\;
                        else 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20._State_4\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0.261
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20._State_4\ => 
                        -- State after the while loop which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20._State_2\.
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20.result\ := True;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20.return\ <= True;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20._State_1\;
                        -- Clock cycles needed to complete this state (approximation): 0
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20._State_5\ => 
                        -- Waiting for the result to appear in \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20.binaryOperationResult.2\ (have to wait 10 clock cycles in this state).
                        -- The assignment needs to be kept up for multi-cycle operations for the result to actually appear in the target.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20.clockCyclesWaitedForBinaryOperationResult.0\ >= to_signed(10, 32)) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20._State_6\;
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20.clockCyclesWaitedForBinaryOperationResult.0\ := to_signed(0, 32);
                        else 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20.clockCyclesWaitedForBinaryOperationResult.0\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20.clockCyclesWaitedForBinaryOperationResult.0\ + to_signed(1, 32);
                        end if;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20.binaryOperationResult.2\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20.num\ mod \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20.num3\;
                        -- Clock cycles needed to complete this state (approximation): 10
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20._State_6\ => 
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20.binaryOperationResult.3\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20.binaryOperationResult.2\ = to_unsigned(0, 32);
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20.flag\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20.binaryOperationResult.3\;

                        -- This if-else was transformed from a .NET if-else. It spans across multiple states:
                        --     * The true branch starts in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20._State_8\ and ends in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20._State_8\.
                        --     * Execution after either branch will continue in the following state: \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20._State_7\.

                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20.flag\) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20._State_8\;
                        else 
                            -- There was no false branch, so going directly to the state after the if-else.
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20._State_7\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0.2751
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20._State_7\ => 
                        -- State after the if-else which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20._State_6\.
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20.binaryOperationResult.4\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20.num3\ + to_unsigned(1, 32);
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20.num3\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20.binaryOperationResult.4\;
                        -- Returning to the repeated state of the while loop which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20._State_2\ if the loop wasn't exited with a state change.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20._State\ = \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20._State_7\) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20._State_3\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0.3156
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20._State_8\ => 
                        -- True branch of the if-else started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20._State_6\.
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20.result\ := False;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20.return\ <= \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20.result\;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20._State_1\;
                        -- Going to the state after the if-else which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20._State_6\.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20._State\ = \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20._State_8\) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20._State_7\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0
                end case;
            end if;
        end if;
    end process;
    -- System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(System.UInt32).20 state machine end


    -- System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(System.UInt32).21 state machine start
    \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21._StateMachine\: process (\Clock\) 
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21._State\: \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21._States\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21._State_0\;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21.numberObject\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21.num\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21.num2\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21.num3\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21.flag\: boolean := false;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21.result\: boolean := false;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21.binaryOperationResult.0\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21.binaryOperationResult.1\: boolean := false;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21.binaryOperationResult.2\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21.clockCyclesWaitedForBinaryOperationResult.0\: signed(31 downto 0) := to_signed(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21.binaryOperationResult.3\: boolean := false;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21.binaryOperationResult.4\: unsigned(31 downto 0) := to_unsigned(0, 32);
    begin 
        if (rising_edge(\Clock\)) then 
            if (\Reset\ = '1') then 
                -- Synchronous reset
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21._Finished\ <= false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21.return\ <= false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21._State_0\;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21.numberObject\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21.num\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21.num2\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21.num3\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21.flag\ := false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21.result\ := false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21.binaryOperationResult.0\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21.binaryOperationResult.1\ := false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21.binaryOperationResult.2\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21.clockCyclesWaitedForBinaryOperationResult.0\ := to_signed(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21.binaryOperationResult.3\ := false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21.binaryOperationResult.4\ := to_unsigned(0, 32);
            else 
                case \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21._State\ is 
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21._State_0\ => 
                        -- Start state
                        -- Waiting for the start signal.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21._Started\ = true) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21._State_2\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21._State_1\ => 
                        -- Final state
                        -- Signaling finished until Started is pulled back to false, then returning to the start state.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21._Started\ = true) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21._Finished\ <= true;
                        else 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21._Finished\ <= false;
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21._State_0\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21._State_2\ => 
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21.numberObject\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21.numberObject.parameter.In\;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21.num\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21.numberObject\;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21.binaryOperationResult.0\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21.num\ / to_unsigned(2, 32);
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21.num2\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21.binaryOperationResult.0\;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21.num3\ := to_unsigned(2, 32);
                        -- Starting a while loop.
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21._State_3\;
                        -- Clock cycles needed to complete this state (approximation): 0.1
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21._State_3\ => 
                        -- Repeated state of the while loop which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21._State_2\.
                        -- The while loop's condition:
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21.binaryOperationResult.1\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21.num3\ <= \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21.num2\;
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21.binaryOperationResult.1\) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21._State_5\;
                        else 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21._State_4\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0.261
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21._State_4\ => 
                        -- State after the while loop which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21._State_2\.
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21.result\ := True;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21.return\ <= True;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21._State_1\;
                        -- Clock cycles needed to complete this state (approximation): 0
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21._State_5\ => 
                        -- Waiting for the result to appear in \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21.binaryOperationResult.2\ (have to wait 10 clock cycles in this state).
                        -- The assignment needs to be kept up for multi-cycle operations for the result to actually appear in the target.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21.clockCyclesWaitedForBinaryOperationResult.0\ >= to_signed(10, 32)) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21._State_6\;
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21.clockCyclesWaitedForBinaryOperationResult.0\ := to_signed(0, 32);
                        else 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21.clockCyclesWaitedForBinaryOperationResult.0\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21.clockCyclesWaitedForBinaryOperationResult.0\ + to_signed(1, 32);
                        end if;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21.binaryOperationResult.2\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21.num\ mod \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21.num3\;
                        -- Clock cycles needed to complete this state (approximation): 10
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21._State_6\ => 
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21.binaryOperationResult.3\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21.binaryOperationResult.2\ = to_unsigned(0, 32);
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21.flag\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21.binaryOperationResult.3\;

                        -- This if-else was transformed from a .NET if-else. It spans across multiple states:
                        --     * The true branch starts in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21._State_8\ and ends in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21._State_8\.
                        --     * Execution after either branch will continue in the following state: \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21._State_7\.

                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21.flag\) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21._State_8\;
                        else 
                            -- There was no false branch, so going directly to the state after the if-else.
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21._State_7\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0.2751
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21._State_7\ => 
                        -- State after the if-else which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21._State_6\.
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21.binaryOperationResult.4\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21.num3\ + to_unsigned(1, 32);
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21.num3\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21.binaryOperationResult.4\;
                        -- Returning to the repeated state of the while loop which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21._State_2\ if the loop wasn't exited with a state change.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21._State\ = \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21._State_7\) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21._State_3\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0.3156
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21._State_8\ => 
                        -- True branch of the if-else started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21._State_6\.
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21.result\ := False;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21.return\ <= \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21.result\;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21._State_1\;
                        -- Going to the state after the if-else which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21._State_6\.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21._State\ = \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21._State_8\) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21._State_7\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0
                end case;
            end if;
        end if;
    end process;
    -- System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(System.UInt32).21 state machine end


    -- System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(System.UInt32).22 state machine start
    \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22._StateMachine\: process (\Clock\) 
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22._State\: \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22._States\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22._State_0\;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22.numberObject\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22.num\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22.num2\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22.num3\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22.flag\: boolean := false;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22.result\: boolean := false;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22.binaryOperationResult.0\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22.binaryOperationResult.1\: boolean := false;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22.binaryOperationResult.2\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22.clockCyclesWaitedForBinaryOperationResult.0\: signed(31 downto 0) := to_signed(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22.binaryOperationResult.3\: boolean := false;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22.binaryOperationResult.4\: unsigned(31 downto 0) := to_unsigned(0, 32);
    begin 
        if (rising_edge(\Clock\)) then 
            if (\Reset\ = '1') then 
                -- Synchronous reset
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22._Finished\ <= false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22.return\ <= false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22._State_0\;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22.numberObject\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22.num\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22.num2\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22.num3\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22.flag\ := false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22.result\ := false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22.binaryOperationResult.0\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22.binaryOperationResult.1\ := false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22.binaryOperationResult.2\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22.clockCyclesWaitedForBinaryOperationResult.0\ := to_signed(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22.binaryOperationResult.3\ := false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22.binaryOperationResult.4\ := to_unsigned(0, 32);
            else 
                case \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22._State\ is 
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22._State_0\ => 
                        -- Start state
                        -- Waiting for the start signal.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22._Started\ = true) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22._State_2\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22._State_1\ => 
                        -- Final state
                        -- Signaling finished until Started is pulled back to false, then returning to the start state.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22._Started\ = true) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22._Finished\ <= true;
                        else 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22._Finished\ <= false;
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22._State_0\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22._State_2\ => 
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22.numberObject\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22.numberObject.parameter.In\;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22.num\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22.numberObject\;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22.binaryOperationResult.0\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22.num\ / to_unsigned(2, 32);
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22.num2\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22.binaryOperationResult.0\;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22.num3\ := to_unsigned(2, 32);
                        -- Starting a while loop.
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22._State_3\;
                        -- Clock cycles needed to complete this state (approximation): 0.1
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22._State_3\ => 
                        -- Repeated state of the while loop which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22._State_2\.
                        -- The while loop's condition:
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22.binaryOperationResult.1\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22.num3\ <= \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22.num2\;
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22.binaryOperationResult.1\) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22._State_5\;
                        else 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22._State_4\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0.261
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22._State_4\ => 
                        -- State after the while loop which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22._State_2\.
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22.result\ := True;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22.return\ <= True;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22._State_1\;
                        -- Clock cycles needed to complete this state (approximation): 0
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22._State_5\ => 
                        -- Waiting for the result to appear in \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22.binaryOperationResult.2\ (have to wait 10 clock cycles in this state).
                        -- The assignment needs to be kept up for multi-cycle operations for the result to actually appear in the target.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22.clockCyclesWaitedForBinaryOperationResult.0\ >= to_signed(10, 32)) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22._State_6\;
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22.clockCyclesWaitedForBinaryOperationResult.0\ := to_signed(0, 32);
                        else 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22.clockCyclesWaitedForBinaryOperationResult.0\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22.clockCyclesWaitedForBinaryOperationResult.0\ + to_signed(1, 32);
                        end if;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22.binaryOperationResult.2\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22.num\ mod \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22.num3\;
                        -- Clock cycles needed to complete this state (approximation): 10
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22._State_6\ => 
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22.binaryOperationResult.3\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22.binaryOperationResult.2\ = to_unsigned(0, 32);
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22.flag\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22.binaryOperationResult.3\;

                        -- This if-else was transformed from a .NET if-else. It spans across multiple states:
                        --     * The true branch starts in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22._State_8\ and ends in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22._State_8\.
                        --     * Execution after either branch will continue in the following state: \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22._State_7\.

                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22.flag\) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22._State_8\;
                        else 
                            -- There was no false branch, so going directly to the state after the if-else.
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22._State_7\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0.2751
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22._State_7\ => 
                        -- State after the if-else which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22._State_6\.
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22.binaryOperationResult.4\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22.num3\ + to_unsigned(1, 32);
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22.num3\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22.binaryOperationResult.4\;
                        -- Returning to the repeated state of the while loop which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22._State_2\ if the loop wasn't exited with a state change.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22._State\ = \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22._State_7\) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22._State_3\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0.3156
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22._State_8\ => 
                        -- True branch of the if-else started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22._State_6\.
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22.result\ := False;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22.return\ <= \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22.result\;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22._State_1\;
                        -- Going to the state after the if-else which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22._State_6\.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22._State\ = \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22._State_8\) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22._State_7\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0
                end case;
            end if;
        end if;
    end process;
    -- System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(System.UInt32).22 state machine end


    -- System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(System.UInt32).23 state machine start
    \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23._StateMachine\: process (\Clock\) 
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23._State\: \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23._States\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23._State_0\;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23.numberObject\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23.num\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23.num2\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23.num3\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23.flag\: boolean := false;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23.result\: boolean := false;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23.binaryOperationResult.0\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23.binaryOperationResult.1\: boolean := false;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23.binaryOperationResult.2\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23.clockCyclesWaitedForBinaryOperationResult.0\: signed(31 downto 0) := to_signed(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23.binaryOperationResult.3\: boolean := false;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23.binaryOperationResult.4\: unsigned(31 downto 0) := to_unsigned(0, 32);
    begin 
        if (rising_edge(\Clock\)) then 
            if (\Reset\ = '1') then 
                -- Synchronous reset
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23._Finished\ <= false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23.return\ <= false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23._State_0\;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23.numberObject\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23.num\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23.num2\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23.num3\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23.flag\ := false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23.result\ := false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23.binaryOperationResult.0\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23.binaryOperationResult.1\ := false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23.binaryOperationResult.2\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23.clockCyclesWaitedForBinaryOperationResult.0\ := to_signed(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23.binaryOperationResult.3\ := false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23.binaryOperationResult.4\ := to_unsigned(0, 32);
            else 
                case \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23._State\ is 
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23._State_0\ => 
                        -- Start state
                        -- Waiting for the start signal.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23._Started\ = true) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23._State_2\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23._State_1\ => 
                        -- Final state
                        -- Signaling finished until Started is pulled back to false, then returning to the start state.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23._Started\ = true) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23._Finished\ <= true;
                        else 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23._Finished\ <= false;
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23._State_0\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23._State_2\ => 
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23.numberObject\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23.numberObject.parameter.In\;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23.num\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23.numberObject\;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23.binaryOperationResult.0\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23.num\ / to_unsigned(2, 32);
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23.num2\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23.binaryOperationResult.0\;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23.num3\ := to_unsigned(2, 32);
                        -- Starting a while loop.
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23._State_3\;
                        -- Clock cycles needed to complete this state (approximation): 0.1
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23._State_3\ => 
                        -- Repeated state of the while loop which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23._State_2\.
                        -- The while loop's condition:
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23.binaryOperationResult.1\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23.num3\ <= \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23.num2\;
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23.binaryOperationResult.1\) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23._State_5\;
                        else 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23._State_4\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0.261
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23._State_4\ => 
                        -- State after the while loop which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23._State_2\.
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23.result\ := True;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23.return\ <= True;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23._State_1\;
                        -- Clock cycles needed to complete this state (approximation): 0
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23._State_5\ => 
                        -- Waiting for the result to appear in \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23.binaryOperationResult.2\ (have to wait 10 clock cycles in this state).
                        -- The assignment needs to be kept up for multi-cycle operations for the result to actually appear in the target.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23.clockCyclesWaitedForBinaryOperationResult.0\ >= to_signed(10, 32)) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23._State_6\;
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23.clockCyclesWaitedForBinaryOperationResult.0\ := to_signed(0, 32);
                        else 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23.clockCyclesWaitedForBinaryOperationResult.0\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23.clockCyclesWaitedForBinaryOperationResult.0\ + to_signed(1, 32);
                        end if;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23.binaryOperationResult.2\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23.num\ mod \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23.num3\;
                        -- Clock cycles needed to complete this state (approximation): 10
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23._State_6\ => 
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23.binaryOperationResult.3\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23.binaryOperationResult.2\ = to_unsigned(0, 32);
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23.flag\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23.binaryOperationResult.3\;

                        -- This if-else was transformed from a .NET if-else. It spans across multiple states:
                        --     * The true branch starts in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23._State_8\ and ends in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23._State_8\.
                        --     * Execution after either branch will continue in the following state: \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23._State_7\.

                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23.flag\) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23._State_8\;
                        else 
                            -- There was no false branch, so going directly to the state after the if-else.
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23._State_7\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0.2751
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23._State_7\ => 
                        -- State after the if-else which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23._State_6\.
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23.binaryOperationResult.4\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23.num3\ + to_unsigned(1, 32);
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23.num3\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23.binaryOperationResult.4\;
                        -- Returning to the repeated state of the while loop which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23._State_2\ if the loop wasn't exited with a state change.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23._State\ = \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23._State_7\) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23._State_3\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0.3156
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23._State_8\ => 
                        -- True branch of the if-else started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23._State_6\.
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23.result\ := False;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23.return\ <= \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23.result\;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23._State_1\;
                        -- Going to the state after the if-else which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23._State_6\.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23._State\ = \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23._State_8\) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23._State_7\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0
                end case;
            end if;
        end if;
    end process;
    -- System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(System.UInt32).23 state machine end


    -- System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(System.UInt32).24 state machine start
    \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24._StateMachine\: process (\Clock\) 
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24._State\: \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24._States\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24._State_0\;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24.numberObject\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24.num\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24.num2\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24.num3\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24.flag\: boolean := false;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24.result\: boolean := false;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24.binaryOperationResult.0\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24.binaryOperationResult.1\: boolean := false;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24.binaryOperationResult.2\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24.clockCyclesWaitedForBinaryOperationResult.0\: signed(31 downto 0) := to_signed(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24.binaryOperationResult.3\: boolean := false;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24.binaryOperationResult.4\: unsigned(31 downto 0) := to_unsigned(0, 32);
    begin 
        if (rising_edge(\Clock\)) then 
            if (\Reset\ = '1') then 
                -- Synchronous reset
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24._Finished\ <= false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24.return\ <= false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24._State_0\;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24.numberObject\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24.num\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24.num2\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24.num3\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24.flag\ := false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24.result\ := false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24.binaryOperationResult.0\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24.binaryOperationResult.1\ := false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24.binaryOperationResult.2\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24.clockCyclesWaitedForBinaryOperationResult.0\ := to_signed(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24.binaryOperationResult.3\ := false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24.binaryOperationResult.4\ := to_unsigned(0, 32);
            else 
                case \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24._State\ is 
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24._State_0\ => 
                        -- Start state
                        -- Waiting for the start signal.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24._Started\ = true) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24._State_2\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24._State_1\ => 
                        -- Final state
                        -- Signaling finished until Started is pulled back to false, then returning to the start state.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24._Started\ = true) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24._Finished\ <= true;
                        else 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24._Finished\ <= false;
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24._State_0\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24._State_2\ => 
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24.numberObject\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24.numberObject.parameter.In\;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24.num\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24.numberObject\;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24.binaryOperationResult.0\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24.num\ / to_unsigned(2, 32);
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24.num2\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24.binaryOperationResult.0\;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24.num3\ := to_unsigned(2, 32);
                        -- Starting a while loop.
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24._State_3\;
                        -- Clock cycles needed to complete this state (approximation): 0.1
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24._State_3\ => 
                        -- Repeated state of the while loop which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24._State_2\.
                        -- The while loop's condition:
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24.binaryOperationResult.1\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24.num3\ <= \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24.num2\;
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24.binaryOperationResult.1\) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24._State_5\;
                        else 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24._State_4\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0.261
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24._State_4\ => 
                        -- State after the while loop which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24._State_2\.
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24.result\ := True;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24.return\ <= True;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24._State_1\;
                        -- Clock cycles needed to complete this state (approximation): 0
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24._State_5\ => 
                        -- Waiting for the result to appear in \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24.binaryOperationResult.2\ (have to wait 10 clock cycles in this state).
                        -- The assignment needs to be kept up for multi-cycle operations for the result to actually appear in the target.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24.clockCyclesWaitedForBinaryOperationResult.0\ >= to_signed(10, 32)) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24._State_6\;
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24.clockCyclesWaitedForBinaryOperationResult.0\ := to_signed(0, 32);
                        else 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24.clockCyclesWaitedForBinaryOperationResult.0\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24.clockCyclesWaitedForBinaryOperationResult.0\ + to_signed(1, 32);
                        end if;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24.binaryOperationResult.2\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24.num\ mod \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24.num3\;
                        -- Clock cycles needed to complete this state (approximation): 10
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24._State_6\ => 
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24.binaryOperationResult.3\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24.binaryOperationResult.2\ = to_unsigned(0, 32);
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24.flag\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24.binaryOperationResult.3\;

                        -- This if-else was transformed from a .NET if-else. It spans across multiple states:
                        --     * The true branch starts in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24._State_8\ and ends in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24._State_8\.
                        --     * Execution after either branch will continue in the following state: \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24._State_7\.

                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24.flag\) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24._State_8\;
                        else 
                            -- There was no false branch, so going directly to the state after the if-else.
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24._State_7\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0.2751
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24._State_7\ => 
                        -- State after the if-else which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24._State_6\.
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24.binaryOperationResult.4\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24.num3\ + to_unsigned(1, 32);
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24.num3\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24.binaryOperationResult.4\;
                        -- Returning to the repeated state of the while loop which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24._State_2\ if the loop wasn't exited with a state change.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24._State\ = \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24._State_7\) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24._State_3\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0.3156
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24._State_8\ => 
                        -- True branch of the if-else started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24._State_6\.
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24.result\ := False;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24.return\ <= \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24.result\;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24._State_1\;
                        -- Going to the state after the if-else which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24._State_6\.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24._State\ = \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24._State_8\) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24._State_7\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0
                end case;
            end if;
        end if;
    end process;
    -- System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(System.UInt32).24 state machine end


    -- System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(System.UInt32).25 state machine start
    \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25._StateMachine\: process (\Clock\) 
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25._State\: \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25._States\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25._State_0\;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25.numberObject\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25.num\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25.num2\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25.num3\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25.flag\: boolean := false;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25.result\: boolean := false;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25.binaryOperationResult.0\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25.binaryOperationResult.1\: boolean := false;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25.binaryOperationResult.2\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25.clockCyclesWaitedForBinaryOperationResult.0\: signed(31 downto 0) := to_signed(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25.binaryOperationResult.3\: boolean := false;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25.binaryOperationResult.4\: unsigned(31 downto 0) := to_unsigned(0, 32);
    begin 
        if (rising_edge(\Clock\)) then 
            if (\Reset\ = '1') then 
                -- Synchronous reset
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25._Finished\ <= false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25.return\ <= false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25._State_0\;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25.numberObject\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25.num\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25.num2\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25.num3\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25.flag\ := false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25.result\ := false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25.binaryOperationResult.0\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25.binaryOperationResult.1\ := false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25.binaryOperationResult.2\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25.clockCyclesWaitedForBinaryOperationResult.0\ := to_signed(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25.binaryOperationResult.3\ := false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25.binaryOperationResult.4\ := to_unsigned(0, 32);
            else 
                case \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25._State\ is 
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25._State_0\ => 
                        -- Start state
                        -- Waiting for the start signal.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25._Started\ = true) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25._State_2\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25._State_1\ => 
                        -- Final state
                        -- Signaling finished until Started is pulled back to false, then returning to the start state.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25._Started\ = true) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25._Finished\ <= true;
                        else 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25._Finished\ <= false;
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25._State_0\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25._State_2\ => 
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25.numberObject\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25.numberObject.parameter.In\;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25.num\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25.numberObject\;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25.binaryOperationResult.0\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25.num\ / to_unsigned(2, 32);
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25.num2\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25.binaryOperationResult.0\;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25.num3\ := to_unsigned(2, 32);
                        -- Starting a while loop.
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25._State_3\;
                        -- Clock cycles needed to complete this state (approximation): 0.1
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25._State_3\ => 
                        -- Repeated state of the while loop which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25._State_2\.
                        -- The while loop's condition:
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25.binaryOperationResult.1\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25.num3\ <= \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25.num2\;
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25.binaryOperationResult.1\) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25._State_5\;
                        else 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25._State_4\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0.261
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25._State_4\ => 
                        -- State after the while loop which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25._State_2\.
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25.result\ := True;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25.return\ <= True;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25._State_1\;
                        -- Clock cycles needed to complete this state (approximation): 0
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25._State_5\ => 
                        -- Waiting for the result to appear in \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25.binaryOperationResult.2\ (have to wait 10 clock cycles in this state).
                        -- The assignment needs to be kept up for multi-cycle operations for the result to actually appear in the target.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25.clockCyclesWaitedForBinaryOperationResult.0\ >= to_signed(10, 32)) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25._State_6\;
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25.clockCyclesWaitedForBinaryOperationResult.0\ := to_signed(0, 32);
                        else 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25.clockCyclesWaitedForBinaryOperationResult.0\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25.clockCyclesWaitedForBinaryOperationResult.0\ + to_signed(1, 32);
                        end if;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25.binaryOperationResult.2\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25.num\ mod \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25.num3\;
                        -- Clock cycles needed to complete this state (approximation): 10
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25._State_6\ => 
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25.binaryOperationResult.3\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25.binaryOperationResult.2\ = to_unsigned(0, 32);
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25.flag\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25.binaryOperationResult.3\;

                        -- This if-else was transformed from a .NET if-else. It spans across multiple states:
                        --     * The true branch starts in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25._State_8\ and ends in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25._State_8\.
                        --     * Execution after either branch will continue in the following state: \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25._State_7\.

                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25.flag\) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25._State_8\;
                        else 
                            -- There was no false branch, so going directly to the state after the if-else.
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25._State_7\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0.2751
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25._State_7\ => 
                        -- State after the if-else which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25._State_6\.
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25.binaryOperationResult.4\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25.num3\ + to_unsigned(1, 32);
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25.num3\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25.binaryOperationResult.4\;
                        -- Returning to the repeated state of the while loop which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25._State_2\ if the loop wasn't exited with a state change.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25._State\ = \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25._State_7\) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25._State_3\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0.3156
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25._State_8\ => 
                        -- True branch of the if-else started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25._State_6\.
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25.result\ := False;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25.return\ <= \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25.result\;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25._State_1\;
                        -- Going to the state after the if-else which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25._State_6\.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25._State\ = \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25._State_8\) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25._State_7\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0
                end case;
            end if;
        end if;
    end process;
    -- System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(System.UInt32).25 state machine end


    -- System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(System.UInt32).26 state machine start
    \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26._StateMachine\: process (\Clock\) 
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26._State\: \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26._States\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26._State_0\;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26.numberObject\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26.num\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26.num2\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26.num3\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26.flag\: boolean := false;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26.result\: boolean := false;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26.binaryOperationResult.0\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26.binaryOperationResult.1\: boolean := false;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26.binaryOperationResult.2\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26.clockCyclesWaitedForBinaryOperationResult.0\: signed(31 downto 0) := to_signed(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26.binaryOperationResult.3\: boolean := false;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26.binaryOperationResult.4\: unsigned(31 downto 0) := to_unsigned(0, 32);
    begin 
        if (rising_edge(\Clock\)) then 
            if (\Reset\ = '1') then 
                -- Synchronous reset
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26._Finished\ <= false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26.return\ <= false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26._State_0\;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26.numberObject\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26.num\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26.num2\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26.num3\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26.flag\ := false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26.result\ := false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26.binaryOperationResult.0\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26.binaryOperationResult.1\ := false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26.binaryOperationResult.2\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26.clockCyclesWaitedForBinaryOperationResult.0\ := to_signed(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26.binaryOperationResult.3\ := false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26.binaryOperationResult.4\ := to_unsigned(0, 32);
            else 
                case \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26._State\ is 
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26._State_0\ => 
                        -- Start state
                        -- Waiting for the start signal.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26._Started\ = true) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26._State_2\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26._State_1\ => 
                        -- Final state
                        -- Signaling finished until Started is pulled back to false, then returning to the start state.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26._Started\ = true) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26._Finished\ <= true;
                        else 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26._Finished\ <= false;
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26._State_0\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26._State_2\ => 
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26.numberObject\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26.numberObject.parameter.In\;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26.num\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26.numberObject\;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26.binaryOperationResult.0\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26.num\ / to_unsigned(2, 32);
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26.num2\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26.binaryOperationResult.0\;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26.num3\ := to_unsigned(2, 32);
                        -- Starting a while loop.
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26._State_3\;
                        -- Clock cycles needed to complete this state (approximation): 0.1
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26._State_3\ => 
                        -- Repeated state of the while loop which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26._State_2\.
                        -- The while loop's condition:
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26.binaryOperationResult.1\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26.num3\ <= \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26.num2\;
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26.binaryOperationResult.1\) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26._State_5\;
                        else 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26._State_4\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0.261
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26._State_4\ => 
                        -- State after the while loop which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26._State_2\.
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26.result\ := True;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26.return\ <= True;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26._State_1\;
                        -- Clock cycles needed to complete this state (approximation): 0
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26._State_5\ => 
                        -- Waiting for the result to appear in \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26.binaryOperationResult.2\ (have to wait 10 clock cycles in this state).
                        -- The assignment needs to be kept up for multi-cycle operations for the result to actually appear in the target.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26.clockCyclesWaitedForBinaryOperationResult.0\ >= to_signed(10, 32)) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26._State_6\;
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26.clockCyclesWaitedForBinaryOperationResult.0\ := to_signed(0, 32);
                        else 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26.clockCyclesWaitedForBinaryOperationResult.0\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26.clockCyclesWaitedForBinaryOperationResult.0\ + to_signed(1, 32);
                        end if;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26.binaryOperationResult.2\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26.num\ mod \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26.num3\;
                        -- Clock cycles needed to complete this state (approximation): 10
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26._State_6\ => 
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26.binaryOperationResult.3\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26.binaryOperationResult.2\ = to_unsigned(0, 32);
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26.flag\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26.binaryOperationResult.3\;

                        -- This if-else was transformed from a .NET if-else. It spans across multiple states:
                        --     * The true branch starts in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26._State_8\ and ends in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26._State_8\.
                        --     * Execution after either branch will continue in the following state: \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26._State_7\.

                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26.flag\) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26._State_8\;
                        else 
                            -- There was no false branch, so going directly to the state after the if-else.
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26._State_7\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0.2751
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26._State_7\ => 
                        -- State after the if-else which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26._State_6\.
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26.binaryOperationResult.4\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26.num3\ + to_unsigned(1, 32);
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26.num3\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26.binaryOperationResult.4\;
                        -- Returning to the repeated state of the while loop which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26._State_2\ if the loop wasn't exited with a state change.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26._State\ = \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26._State_7\) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26._State_3\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0.3156
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26._State_8\ => 
                        -- True branch of the if-else started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26._State_6\.
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26.result\ := False;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26.return\ <= \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26.result\;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26._State_1\;
                        -- Going to the state after the if-else which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26._State_6\.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26._State\ = \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26._State_8\) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26._State_7\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0
                end case;
            end if;
        end if;
    end process;
    -- System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(System.UInt32).26 state machine end


    -- System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(System.UInt32).27 state machine start
    \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27._StateMachine\: process (\Clock\) 
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27._State\: \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27._States\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27._State_0\;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27.numberObject\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27.num\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27.num2\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27.num3\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27.flag\: boolean := false;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27.result\: boolean := false;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27.binaryOperationResult.0\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27.binaryOperationResult.1\: boolean := false;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27.binaryOperationResult.2\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27.clockCyclesWaitedForBinaryOperationResult.0\: signed(31 downto 0) := to_signed(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27.binaryOperationResult.3\: boolean := false;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27.binaryOperationResult.4\: unsigned(31 downto 0) := to_unsigned(0, 32);
    begin 
        if (rising_edge(\Clock\)) then 
            if (\Reset\ = '1') then 
                -- Synchronous reset
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27._Finished\ <= false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27.return\ <= false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27._State_0\;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27.numberObject\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27.num\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27.num2\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27.num3\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27.flag\ := false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27.result\ := false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27.binaryOperationResult.0\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27.binaryOperationResult.1\ := false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27.binaryOperationResult.2\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27.clockCyclesWaitedForBinaryOperationResult.0\ := to_signed(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27.binaryOperationResult.3\ := false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27.binaryOperationResult.4\ := to_unsigned(0, 32);
            else 
                case \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27._State\ is 
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27._State_0\ => 
                        -- Start state
                        -- Waiting for the start signal.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27._Started\ = true) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27._State_2\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27._State_1\ => 
                        -- Final state
                        -- Signaling finished until Started is pulled back to false, then returning to the start state.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27._Started\ = true) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27._Finished\ <= true;
                        else 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27._Finished\ <= false;
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27._State_0\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27._State_2\ => 
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27.numberObject\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27.numberObject.parameter.In\;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27.num\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27.numberObject\;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27.binaryOperationResult.0\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27.num\ / to_unsigned(2, 32);
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27.num2\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27.binaryOperationResult.0\;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27.num3\ := to_unsigned(2, 32);
                        -- Starting a while loop.
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27._State_3\;
                        -- Clock cycles needed to complete this state (approximation): 0.1
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27._State_3\ => 
                        -- Repeated state of the while loop which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27._State_2\.
                        -- The while loop's condition:
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27.binaryOperationResult.1\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27.num3\ <= \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27.num2\;
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27.binaryOperationResult.1\) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27._State_5\;
                        else 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27._State_4\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0.261
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27._State_4\ => 
                        -- State after the while loop which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27._State_2\.
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27.result\ := True;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27.return\ <= True;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27._State_1\;
                        -- Clock cycles needed to complete this state (approximation): 0
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27._State_5\ => 
                        -- Waiting for the result to appear in \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27.binaryOperationResult.2\ (have to wait 10 clock cycles in this state).
                        -- The assignment needs to be kept up for multi-cycle operations for the result to actually appear in the target.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27.clockCyclesWaitedForBinaryOperationResult.0\ >= to_signed(10, 32)) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27._State_6\;
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27.clockCyclesWaitedForBinaryOperationResult.0\ := to_signed(0, 32);
                        else 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27.clockCyclesWaitedForBinaryOperationResult.0\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27.clockCyclesWaitedForBinaryOperationResult.0\ + to_signed(1, 32);
                        end if;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27.binaryOperationResult.2\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27.num\ mod \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27.num3\;
                        -- Clock cycles needed to complete this state (approximation): 10
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27._State_6\ => 
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27.binaryOperationResult.3\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27.binaryOperationResult.2\ = to_unsigned(0, 32);
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27.flag\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27.binaryOperationResult.3\;

                        -- This if-else was transformed from a .NET if-else. It spans across multiple states:
                        --     * The true branch starts in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27._State_8\ and ends in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27._State_8\.
                        --     * Execution after either branch will continue in the following state: \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27._State_7\.

                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27.flag\) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27._State_8\;
                        else 
                            -- There was no false branch, so going directly to the state after the if-else.
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27._State_7\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0.2751
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27._State_7\ => 
                        -- State after the if-else which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27._State_6\.
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27.binaryOperationResult.4\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27.num3\ + to_unsigned(1, 32);
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27.num3\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27.binaryOperationResult.4\;
                        -- Returning to the repeated state of the while loop which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27._State_2\ if the loop wasn't exited with a state change.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27._State\ = \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27._State_7\) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27._State_3\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0.3156
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27._State_8\ => 
                        -- True branch of the if-else started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27._State_6\.
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27.result\ := False;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27.return\ <= \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27.result\;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27._State_1\;
                        -- Going to the state after the if-else which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27._State_6\.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27._State\ = \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27._State_8\) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27._State_7\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0
                end case;
            end if;
        end if;
    end process;
    -- System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(System.UInt32).27 state machine end


    -- System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(System.UInt32).28 state machine start
    \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28._StateMachine\: process (\Clock\) 
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28._State\: \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28._States\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28._State_0\;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28.numberObject\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28.num\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28.num2\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28.num3\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28.flag\: boolean := false;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28.result\: boolean := false;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28.binaryOperationResult.0\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28.binaryOperationResult.1\: boolean := false;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28.binaryOperationResult.2\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28.clockCyclesWaitedForBinaryOperationResult.0\: signed(31 downto 0) := to_signed(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28.binaryOperationResult.3\: boolean := false;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28.binaryOperationResult.4\: unsigned(31 downto 0) := to_unsigned(0, 32);
    begin 
        if (rising_edge(\Clock\)) then 
            if (\Reset\ = '1') then 
                -- Synchronous reset
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28._Finished\ <= false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28.return\ <= false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28._State_0\;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28.numberObject\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28.num\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28.num2\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28.num3\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28.flag\ := false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28.result\ := false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28.binaryOperationResult.0\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28.binaryOperationResult.1\ := false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28.binaryOperationResult.2\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28.clockCyclesWaitedForBinaryOperationResult.0\ := to_signed(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28.binaryOperationResult.3\ := false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28.binaryOperationResult.4\ := to_unsigned(0, 32);
            else 
                case \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28._State\ is 
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28._State_0\ => 
                        -- Start state
                        -- Waiting for the start signal.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28._Started\ = true) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28._State_2\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28._State_1\ => 
                        -- Final state
                        -- Signaling finished until Started is pulled back to false, then returning to the start state.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28._Started\ = true) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28._Finished\ <= true;
                        else 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28._Finished\ <= false;
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28._State_0\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28._State_2\ => 
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28.numberObject\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28.numberObject.parameter.In\;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28.num\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28.numberObject\;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28.binaryOperationResult.0\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28.num\ / to_unsigned(2, 32);
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28.num2\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28.binaryOperationResult.0\;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28.num3\ := to_unsigned(2, 32);
                        -- Starting a while loop.
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28._State_3\;
                        -- Clock cycles needed to complete this state (approximation): 0.1
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28._State_3\ => 
                        -- Repeated state of the while loop which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28._State_2\.
                        -- The while loop's condition:
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28.binaryOperationResult.1\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28.num3\ <= \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28.num2\;
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28.binaryOperationResult.1\) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28._State_5\;
                        else 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28._State_4\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0.261
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28._State_4\ => 
                        -- State after the while loop which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28._State_2\.
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28.result\ := True;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28.return\ <= True;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28._State_1\;
                        -- Clock cycles needed to complete this state (approximation): 0
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28._State_5\ => 
                        -- Waiting for the result to appear in \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28.binaryOperationResult.2\ (have to wait 10 clock cycles in this state).
                        -- The assignment needs to be kept up for multi-cycle operations for the result to actually appear in the target.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28.clockCyclesWaitedForBinaryOperationResult.0\ >= to_signed(10, 32)) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28._State_6\;
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28.clockCyclesWaitedForBinaryOperationResult.0\ := to_signed(0, 32);
                        else 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28.clockCyclesWaitedForBinaryOperationResult.0\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28.clockCyclesWaitedForBinaryOperationResult.0\ + to_signed(1, 32);
                        end if;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28.binaryOperationResult.2\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28.num\ mod \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28.num3\;
                        -- Clock cycles needed to complete this state (approximation): 10
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28._State_6\ => 
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28.binaryOperationResult.3\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28.binaryOperationResult.2\ = to_unsigned(0, 32);
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28.flag\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28.binaryOperationResult.3\;

                        -- This if-else was transformed from a .NET if-else. It spans across multiple states:
                        --     * The true branch starts in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28._State_8\ and ends in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28._State_8\.
                        --     * Execution after either branch will continue in the following state: \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28._State_7\.

                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28.flag\) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28._State_8\;
                        else 
                            -- There was no false branch, so going directly to the state after the if-else.
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28._State_7\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0.2751
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28._State_7\ => 
                        -- State after the if-else which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28._State_6\.
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28.binaryOperationResult.4\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28.num3\ + to_unsigned(1, 32);
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28.num3\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28.binaryOperationResult.4\;
                        -- Returning to the repeated state of the while loop which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28._State_2\ if the loop wasn't exited with a state change.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28._State\ = \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28._State_7\) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28._State_3\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0.3156
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28._State_8\ => 
                        -- True branch of the if-else started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28._State_6\.
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28.result\ := False;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28.return\ <= \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28.result\;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28._State_1\;
                        -- Going to the state after the if-else which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28._State_6\.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28._State\ = \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28._State_8\) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28._State_7\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0
                end case;
            end if;
        end if;
    end process;
    -- System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(System.UInt32).28 state machine end


    -- System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(System.UInt32).29 state machine start
    \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29._StateMachine\: process (\Clock\) 
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29._State\: \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29._States\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29._State_0\;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29.numberObject\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29.num\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29.num2\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29.num3\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29.flag\: boolean := false;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29.result\: boolean := false;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29.binaryOperationResult.0\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29.binaryOperationResult.1\: boolean := false;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29.binaryOperationResult.2\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29.clockCyclesWaitedForBinaryOperationResult.0\: signed(31 downto 0) := to_signed(0, 32);
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29.binaryOperationResult.3\: boolean := false;
        Variable \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29.binaryOperationResult.4\: unsigned(31 downto 0) := to_unsigned(0, 32);
    begin 
        if (rising_edge(\Clock\)) then 
            if (\Reset\ = '1') then 
                -- Synchronous reset
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29._Finished\ <= false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29.return\ <= false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29._State_0\;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29.numberObject\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29.num\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29.num2\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29.num3\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29.flag\ := false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29.result\ := false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29.binaryOperationResult.0\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29.binaryOperationResult.1\ := false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29.binaryOperationResult.2\ := to_unsigned(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29.clockCyclesWaitedForBinaryOperationResult.0\ := to_signed(0, 32);
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29.binaryOperationResult.3\ := false;
                \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29.binaryOperationResult.4\ := to_unsigned(0, 32);
            else 
                case \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29._State\ is 
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29._State_0\ => 
                        -- Start state
                        -- Waiting for the start signal.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29._Started\ = true) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29._State_2\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29._State_1\ => 
                        -- Final state
                        -- Signaling finished until Started is pulled back to false, then returning to the start state.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29._Started\ = true) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29._Finished\ <= true;
                        else 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29._Finished\ <= false;
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29._State_0\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29._State_2\ => 
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29.numberObject\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29.numberObject.parameter.In\;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29.num\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29.numberObject\;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29.binaryOperationResult.0\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29.num\ / to_unsigned(2, 32);
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29.num2\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29.binaryOperationResult.0\;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29.num3\ := to_unsigned(2, 32);
                        -- Starting a while loop.
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29._State_3\;
                        -- Clock cycles needed to complete this state (approximation): 0.1
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29._State_3\ => 
                        -- Repeated state of the while loop which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29._State_2\.
                        -- The while loop's condition:
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29.binaryOperationResult.1\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29.num3\ <= \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29.num2\;
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29.binaryOperationResult.1\) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29._State_5\;
                        else 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29._State_4\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0.261
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29._State_4\ => 
                        -- State after the while loop which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29._State_2\.
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29.result\ := True;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29.return\ <= True;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29._State_1\;
                        -- Clock cycles needed to complete this state (approximation): 0
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29._State_5\ => 
                        -- Waiting for the result to appear in \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29.binaryOperationResult.2\ (have to wait 10 clock cycles in this state).
                        -- The assignment needs to be kept up for multi-cycle operations for the result to actually appear in the target.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29.clockCyclesWaitedForBinaryOperationResult.0\ >= to_signed(10, 32)) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29._State_6\;
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29.clockCyclesWaitedForBinaryOperationResult.0\ := to_signed(0, 32);
                        else 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29.clockCyclesWaitedForBinaryOperationResult.0\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29.clockCyclesWaitedForBinaryOperationResult.0\ + to_signed(1, 32);
                        end if;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29.binaryOperationResult.2\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29.num\ mod \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29.num3\;
                        -- Clock cycles needed to complete this state (approximation): 10
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29._State_6\ => 
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29.binaryOperationResult.3\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29.binaryOperationResult.2\ = to_unsigned(0, 32);
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29.flag\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29.binaryOperationResult.3\;

                        -- This if-else was transformed from a .NET if-else. It spans across multiple states:
                        --     * The true branch starts in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29._State_8\ and ends in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29._State_8\.
                        --     * Execution after either branch will continue in the following state: \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29._State_7\.

                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29.flag\) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29._State_8\;
                        else 
                            -- There was no false branch, so going directly to the state after the if-else.
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29._State_7\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0.2751
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29._State_7\ => 
                        -- State after the if-else which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29._State_6\.
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29.binaryOperationResult.4\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29.num3\ + to_unsigned(1, 32);
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29.num3\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29.binaryOperationResult.4\;
                        -- Returning to the repeated state of the while loop which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29._State_2\ if the loop wasn't exited with a state change.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29._State\ = \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29._State_7\) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29._State_3\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0.3156
                    when \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29._State_8\ => 
                        -- True branch of the if-else started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29._State_6\.
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29.result\ := False;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29.return\ <= \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29.result\;
                        \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29._State_1\;
                        -- Going to the state after the if-else which was started in state \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29._State_6\.
                        if (\PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29._State\ = \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29._State_8\) then 
                            \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29._State\ := \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29._State_7\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0
                end case;
            end if;
        end if;
    end process;
    -- System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(System.UInt32).29 state machine end


    -- System.Void Hast.Samples.SampleAssembly.PrimeCalculator::IsPrimeNumber(Hast.Transformer.Abstractions.SimpleMemory.SimpleMemory).0 state machine start
    \PrimeCalculator::IsPrimeNumber(SimpleMemory).0._StateMachine\: process (\Clock\) 
        Variable \PrimeCalculator::IsPrimeNumber(SimpleMemory).0._State\: \PrimeCalculator::IsPrimeNumber(SimpleMemory).0._States\ := \PrimeCalculator::IsPrimeNumber(SimpleMemory).0._State_0\;
        Variable \PrimeCalculator::IsPrimeNumber(SimpleMemory).0.number\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator::IsPrimeNumber(SimpleMemory).0.dataIn.0\: std_logic_vector(31 downto 0);
        Variable \PrimeCalculator::IsPrimeNumber(SimpleMemory).0.return.0\: boolean := false;
    begin 
        if (rising_edge(\Clock\)) then 
            if (\Reset\ = '1') then 
                -- Synchronous reset
                \PrimeCalculator::IsPrimeNumber(SimpleMemory).0._Finished\ <= false;
                \PrimeCalculator::IsPrimeNumber(SimpleMemory).0.SimpleMemory.CellIndex\ <= to_signed(0, 32);
                \PrimeCalculator::IsPrimeNumber(SimpleMemory).0.SimpleMemory.ReadEnable\ <= false;
                \PrimeCalculator::IsPrimeNumber(SimpleMemory).0.SimpleMemory.WriteEnable\ <= false;
                \PrimeCalculator::IsPrimeNumber(SimpleMemory).0.PrimeCalculator::IsPrimeNumberInternal(UInt32).number.parameter.Out.0\ <= to_unsigned(0, 32);
                \PrimeCalculator::IsPrimeNumber(SimpleMemory).0.PrimeCalculator::IsPrimeNumberInternal(UInt32)._Started.0\ <= false;
                \PrimeCalculator::IsPrimeNumber(SimpleMemory).0._State\ := \PrimeCalculator::IsPrimeNumber(SimpleMemory).0._State_0\;
                \PrimeCalculator::IsPrimeNumber(SimpleMemory).0.number\ := to_unsigned(0, 32);
                \PrimeCalculator::IsPrimeNumber(SimpleMemory).0.return.0\ := false;
            else 
                case \PrimeCalculator::IsPrimeNumber(SimpleMemory).0._State\ is 
                    when \PrimeCalculator::IsPrimeNumber(SimpleMemory).0._State_0\ => 
                        -- Start state
                        -- Waiting for the start signal.
                        if (\PrimeCalculator::IsPrimeNumber(SimpleMemory).0._Started\ = true) then 
                            \PrimeCalculator::IsPrimeNumber(SimpleMemory).0._State\ := \PrimeCalculator::IsPrimeNumber(SimpleMemory).0._State_2\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0
                    when \PrimeCalculator::IsPrimeNumber(SimpleMemory).0._State_1\ => 
                        -- Final state
                        -- Signaling finished until Started is pulled back to false, then returning to the start state.
                        if (\PrimeCalculator::IsPrimeNumber(SimpleMemory).0._Started\ = true) then 
                            \PrimeCalculator::IsPrimeNumber(SimpleMemory).0._Finished\ <= true;
                        else 
                            \PrimeCalculator::IsPrimeNumber(SimpleMemory).0._Finished\ <= false;
                            \PrimeCalculator::IsPrimeNumber(SimpleMemory).0._State\ := \PrimeCalculator::IsPrimeNumber(SimpleMemory).0._State_0\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0
                    when \PrimeCalculator::IsPrimeNumber(SimpleMemory).0._State_2\ => 
                        -- Begin SimpleMemory read.
                        \PrimeCalculator::IsPrimeNumber(SimpleMemory).0.SimpleMemory.CellIndex\ <= resize(to_signed(0, 32), 32);
                        \PrimeCalculator::IsPrimeNumber(SimpleMemory).0.SimpleMemory.ReadEnable\ <= true;
                        \PrimeCalculator::IsPrimeNumber(SimpleMemory).0._State\ := \PrimeCalculator::IsPrimeNumber(SimpleMemory).0._State_3\;
                        -- Clock cycles needed to complete this state (approximation): 0
                    when \PrimeCalculator::IsPrimeNumber(SimpleMemory).0._State_3\ => 
                        -- Waiting for the SimpleMemory operation to finish.
                        if (\ReadsDone\ = true) then 
                            -- SimpleMemory read finished.
                            \PrimeCalculator::IsPrimeNumber(SimpleMemory).0.SimpleMemory.ReadEnable\ <= false;
                            \PrimeCalculator::IsPrimeNumber(SimpleMemory).0.dataIn.0\ := \DataIn\;
                            \PrimeCalculator::IsPrimeNumber(SimpleMemory).0.number\ := ConvertStdLogicVectorToUInt32(\PrimeCalculator::IsPrimeNumber(SimpleMemory).0.dataIn.0\);
                            -- Starting state machine invocation for the following method: System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator::IsPrimeNumberInternal(System.UInt32)
                            \PrimeCalculator::IsPrimeNumber(SimpleMemory).0.PrimeCalculator::IsPrimeNumberInternal(UInt32).number.parameter.Out.0\ <= \PrimeCalculator::IsPrimeNumber(SimpleMemory).0.number\;
                            \PrimeCalculator::IsPrimeNumber(SimpleMemory).0.PrimeCalculator::IsPrimeNumberInternal(UInt32)._Started.0\ <= true;
                            \PrimeCalculator::IsPrimeNumber(SimpleMemory).0._State\ := \PrimeCalculator::IsPrimeNumber(SimpleMemory).0._State_4\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0
                    when \PrimeCalculator::IsPrimeNumber(SimpleMemory).0._State_4\ => 
                        -- Waiting for the state machine invocation of the following method to finish: System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator::IsPrimeNumberInternal(System.UInt32)
                        if (\PrimeCalculator::IsPrimeNumber(SimpleMemory).0.PrimeCalculator::IsPrimeNumberInternal(UInt32)._Started.0\ = \PrimeCalculator::IsPrimeNumber(SimpleMemory).0.PrimeCalculator::IsPrimeNumberInternal(UInt32)._Finished.0\) then 
                            \PrimeCalculator::IsPrimeNumber(SimpleMemory).0.PrimeCalculator::IsPrimeNumberInternal(UInt32)._Started.0\ <= false;
                            \PrimeCalculator::IsPrimeNumber(SimpleMemory).0.return.0\ := \PrimeCalculator::IsPrimeNumber(SimpleMemory).0.PrimeCalculator::IsPrimeNumberInternal(UInt32).return.0\;
                            -- Begin SimpleMemory write.
                            \PrimeCalculator::IsPrimeNumber(SimpleMemory).0.SimpleMemory.CellIndex\ <= resize(to_signed(0, 32), 32);
                            \PrimeCalculator::IsPrimeNumber(SimpleMemory).0.SimpleMemory.WriteEnable\ <= true;
                            \PrimeCalculator::IsPrimeNumber(SimpleMemory).0.SimpleMemory.DataOut\ <= ConvertBooleanToStdLogicVector(\PrimeCalculator::IsPrimeNumber(SimpleMemory).0.return.0\);
                            \PrimeCalculator::IsPrimeNumber(SimpleMemory).0._State\ := \PrimeCalculator::IsPrimeNumber(SimpleMemory).0._State_5\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0
                    when \PrimeCalculator::IsPrimeNumber(SimpleMemory).0._State_5\ => 
                        -- Waiting for the SimpleMemory operation to finish.
                        if (\WritesDone\ = true) then 
                            -- SimpleMemory write finished.
                            \PrimeCalculator::IsPrimeNumber(SimpleMemory).0.SimpleMemory.WriteEnable\ <= false;
                            \PrimeCalculator::IsPrimeNumber(SimpleMemory).0._State\ := \PrimeCalculator::IsPrimeNumber(SimpleMemory).0._State_1\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0
                end case;
            end if;
        end if;
    end process;
    -- System.Void Hast.Samples.SampleAssembly.PrimeCalculator::IsPrimeNumber(Hast.Transformer.Abstractions.SimpleMemory.SimpleMemory).0 state machine end


    -- System.Threading.Tasks.Task Hast.Samples.SampleAssembly.PrimeCalculator::IsPrimeNumberAsync(Hast.Transformer.Abstractions.SimpleMemory.SimpleMemory).0 state machine start
    \PrimeCalculator::IsPrimeNumberAsync(SimpleMemory).0._StateMachine\: process (\Clock\) 
        Variable \PrimeCalculator::IsPrimeNumberAsync(SimpleMemory).0._State\: \PrimeCalculator::IsPrimeNumberAsync(SimpleMemory).0._States\ := \PrimeCalculator::IsPrimeNumberAsync(SimpleMemory).0._State_0\;
    begin 
        if (rising_edge(\Clock\)) then 
            if (\Reset\ = '1') then 
                -- Synchronous reset
                \PrimeCalculator::IsPrimeNumberAsync(SimpleMemory).0._Finished\ <= false;
                \PrimeCalculator::IsPrimeNumberAsync(SimpleMemory).0.PrimeCalculator::IsPrimeNumber(SimpleMemory)._Started.0\ <= false;
                \PrimeCalculator::IsPrimeNumberAsync(SimpleMemory).0._State\ := \PrimeCalculator::IsPrimeNumberAsync(SimpleMemory).0._State_0\;
            else 
                case \PrimeCalculator::IsPrimeNumberAsync(SimpleMemory).0._State\ is 
                    when \PrimeCalculator::IsPrimeNumberAsync(SimpleMemory).0._State_0\ => 
                        -- Start state
                        -- Waiting for the start signal.
                        if (\PrimeCalculator::IsPrimeNumberAsync(SimpleMemory).0._Started\ = true) then 
                            \PrimeCalculator::IsPrimeNumberAsync(SimpleMemory).0._State\ := \PrimeCalculator::IsPrimeNumberAsync(SimpleMemory).0._State_2\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0
                    when \PrimeCalculator::IsPrimeNumberAsync(SimpleMemory).0._State_1\ => 
                        -- Final state
                        -- Signaling finished until Started is pulled back to false, then returning to the start state.
                        if (\PrimeCalculator::IsPrimeNumberAsync(SimpleMemory).0._Started\ = true) then 
                            \PrimeCalculator::IsPrimeNumberAsync(SimpleMemory).0._Finished\ <= true;
                        else 
                            \PrimeCalculator::IsPrimeNumberAsync(SimpleMemory).0._Finished\ <= false;
                            \PrimeCalculator::IsPrimeNumberAsync(SimpleMemory).0._State\ := \PrimeCalculator::IsPrimeNumberAsync(SimpleMemory).0._State_0\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0
                    when \PrimeCalculator::IsPrimeNumberAsync(SimpleMemory).0._State_2\ => 
                        -- Starting state machine invocation for the following method: System.Void Hast.Samples.SampleAssembly.PrimeCalculator::IsPrimeNumber(Hast.Transformer.Abstractions.SimpleMemory.SimpleMemory)
                        \PrimeCalculator::IsPrimeNumberAsync(SimpleMemory).0.PrimeCalculator::IsPrimeNumber(SimpleMemory)._Started.0\ <= true;
                        \PrimeCalculator::IsPrimeNumberAsync(SimpleMemory).0._State\ := \PrimeCalculator::IsPrimeNumberAsync(SimpleMemory).0._State_3\;
                        -- Clock cycles needed to complete this state (approximation): 0
                    when \PrimeCalculator::IsPrimeNumberAsync(SimpleMemory).0._State_3\ => 
                        -- Waiting for the state machine invocation of the following method to finish: System.Void Hast.Samples.SampleAssembly.PrimeCalculator::IsPrimeNumber(Hast.Transformer.Abstractions.SimpleMemory.SimpleMemory)
                        if (\PrimeCalculator::IsPrimeNumberAsync(SimpleMemory).0.PrimeCalculator::IsPrimeNumber(SimpleMemory)._Started.0\ = \PrimeCalculator::IsPrimeNumberAsync(SimpleMemory).0.PrimeCalculator::IsPrimeNumber(SimpleMemory)._Finished.0\) then 
                            \PrimeCalculator::IsPrimeNumberAsync(SimpleMemory).0.PrimeCalculator::IsPrimeNumber(SimpleMemory)._Started.0\ <= false;
                            \PrimeCalculator::IsPrimeNumberAsync(SimpleMemory).0._State\ := \PrimeCalculator::IsPrimeNumberAsync(SimpleMemory).0._State_1\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0
                end case;
            end if;
        end if;
    end process;
    -- System.Threading.Tasks.Task Hast.Samples.SampleAssembly.PrimeCalculator::IsPrimeNumberAsync(Hast.Transformer.Abstractions.SimpleMemory.SimpleMemory).0 state machine end


    -- System.Void Hast.Samples.SampleAssembly.PrimeCalculator::ArePrimeNumbers(Hast.Transformer.Abstractions.SimpleMemory.SimpleMemory).0 state machine start
    \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0._StateMachine\: process (\Clock\) 
        Variable \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0._State\: \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0._States\ := \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0._State_0\;
        Variable \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0.num\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0.num2\: signed(31 downto 0) := to_signed(0, 32);
        Variable \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0.number\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0.dataIn.0\: std_logic_vector(31 downto 0);
        Variable \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0.binaryOperationResult.0\: boolean := false;
        Variable \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0.binaryOperationResult.1\: signed(31 downto 0) := to_signed(0, 32);
        Variable \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0.dataIn.1\: std_logic_vector(31 downto 0);
        Variable \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0.binaryOperationResult.2\: signed(31 downto 0) := to_signed(0, 32);
        Variable \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0.return.0\: boolean := false;
        Variable \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0.binaryOperationResult.3\: signed(31 downto 0) := to_signed(0, 32);
    begin 
        if (rising_edge(\Clock\)) then 
            if (\Reset\ = '1') then 
                -- Synchronous reset
                \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0._Finished\ <= false;
                \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0.SimpleMemory.CellIndex\ <= to_signed(0, 32);
                \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0.SimpleMemory.ReadEnable\ <= false;
                \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0.SimpleMemory.WriteEnable\ <= false;
                \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0.PrimeCalculator::IsPrimeNumberInternal(UInt32).number.parameter.Out.0\ <= to_unsigned(0, 32);
                \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0.PrimeCalculator::IsPrimeNumberInternal(UInt32)._Started.0\ <= false;
                \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0._State\ := \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0._State_0\;
                \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0.num\ := to_unsigned(0, 32);
                \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0.num2\ := to_signed(0, 32);
                \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0.number\ := to_unsigned(0, 32);
                \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0.binaryOperationResult.0\ := false;
                \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0.binaryOperationResult.1\ := to_signed(0, 32);
                \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0.binaryOperationResult.2\ := to_signed(0, 32);
                \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0.return.0\ := false;
                \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0.binaryOperationResult.3\ := to_signed(0, 32);
            else 
                case \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0._State\ is 
                    when \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0._State_0\ => 
                        -- Start state
                        -- Waiting for the start signal.
                        if (\PrimeCalculator::ArePrimeNumbers(SimpleMemory).0._Started\ = true) then 
                            \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0._State\ := \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0._State_2\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0
                    when \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0._State_1\ => 
                        -- Final state
                        -- Signaling finished until Started is pulled back to false, then returning to the start state.
                        if (\PrimeCalculator::ArePrimeNumbers(SimpleMemory).0._Started\ = true) then 
                            \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0._Finished\ <= true;
                        else 
                            \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0._Finished\ <= false;
                            \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0._State\ := \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0._State_0\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0
                    when \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0._State_2\ => 
                        -- Begin SimpleMemory read.
                        \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0.SimpleMemory.CellIndex\ <= resize(to_signed(0, 32), 32);
                        \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0.SimpleMemory.ReadEnable\ <= true;
                        \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0._State\ := \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0._State_3\;
                        -- Clock cycles needed to complete this state (approximation): 0
                    when \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0._State_3\ => 
                        -- Waiting for the SimpleMemory operation to finish.
                        if (\ReadsDone\ = true) then 
                            -- SimpleMemory read finished.
                            \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0.SimpleMemory.ReadEnable\ <= false;
                            \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0.dataIn.0\ := \DataIn\;
                            \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0.num\ := ConvertStdLogicVectorToUInt32(\PrimeCalculator::ArePrimeNumbers(SimpleMemory).0.dataIn.0\);
                            \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0.num2\ := to_signed(0, 32);
                            -- Starting a while loop.
                            \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0._State\ := \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0._State_4\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0
                    when \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0._State_4\ => 
                        -- Repeated state of the while loop which was started in state \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0._State_3\.
                        -- The while loop's condition:
                        \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0.binaryOperationResult.0\ := resize(\PrimeCalculator::ArePrimeNumbers(SimpleMemory).0.num2\, 64) < signed((resize(\PrimeCalculator::ArePrimeNumbers(SimpleMemory).0.num\, 64)));
                        if (\PrimeCalculator::ArePrimeNumbers(SimpleMemory).0.binaryOperationResult.0\) then 
                            \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0.binaryOperationResult.1\ := to_signed(1, 32) + \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0.num2\;
                            -- Begin SimpleMemory read.
                            \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0.SimpleMemory.CellIndex\ <= resize(\PrimeCalculator::ArePrimeNumbers(SimpleMemory).0.binaryOperationResult.1\, 32);
                            \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0.SimpleMemory.ReadEnable\ <= true;
                            \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0._State\ := \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0._State_6\;
                        else 
                            \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0._State\ := \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0._State_5\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0.6053
                    when \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0._State_5\ => 
                        -- State after the while loop which was started in state \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0._State_3\.
                        \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0._State\ := \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0._State_1\;
                        -- Clock cycles needed to complete this state (approximation): 0
                    when \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0._State_6\ => 
                        -- Waiting for the SimpleMemory operation to finish.
                        if (\ReadsDone\ = true) then 
                            -- SimpleMemory read finished.
                            \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0.SimpleMemory.ReadEnable\ <= false;
                            \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0.dataIn.1\ := \DataIn\;
                            \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0.number\ := ConvertStdLogicVectorToUInt32(\PrimeCalculator::ArePrimeNumbers(SimpleMemory).0.dataIn.1\);
                            \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0.binaryOperationResult.2\ := to_signed(1, 32) + \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0.num2\;
                            -- Starting state machine invocation for the following method: System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator::IsPrimeNumberInternal(System.UInt32)
                            \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0.PrimeCalculator::IsPrimeNumberInternal(UInt32).number.parameter.Out.0\ <= \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0.number\;
                            \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0.PrimeCalculator::IsPrimeNumberInternal(UInt32)._Started.0\ <= true;
                            \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0._State\ := \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0._State_7\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0.3156
                    when \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0._State_7\ => 
                        -- Waiting for the state machine invocation of the following method to finish: System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator::IsPrimeNumberInternal(System.UInt32)
                        if (\PrimeCalculator::ArePrimeNumbers(SimpleMemory).0.PrimeCalculator::IsPrimeNumberInternal(UInt32)._Started.0\ = \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0.PrimeCalculator::IsPrimeNumberInternal(UInt32)._Finished.0\) then 
                            \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0.PrimeCalculator::IsPrimeNumberInternal(UInt32)._Started.0\ <= false;
                            \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0.return.0\ := \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0.PrimeCalculator::IsPrimeNumberInternal(UInt32).return.0\;
                            -- Begin SimpleMemory write.
                            \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0.SimpleMemory.CellIndex\ <= resize(\PrimeCalculator::ArePrimeNumbers(SimpleMemory).0.binaryOperationResult.2\, 32);
                            \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0.SimpleMemory.WriteEnable\ <= true;
                            \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0.SimpleMemory.DataOut\ <= ConvertBooleanToStdLogicVector(\PrimeCalculator::ArePrimeNumbers(SimpleMemory).0.return.0\);
                            \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0._State\ := \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0._State_8\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0
                    when \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0._State_8\ => 
                        -- Waiting for the SimpleMemory operation to finish.
                        if (\WritesDone\ = true) then 
                            -- SimpleMemory write finished.
                            \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0.SimpleMemory.WriteEnable\ <= false;
                            \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0.binaryOperationResult.3\ := \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0.num2\ + to_signed(1, 32);
                            \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0.num2\ := \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0.binaryOperationResult.3\;
                            -- Returning to the repeated state of the while loop which was started in state \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0._State_3\ if the loop wasn't exited with a state change.
                            if (\PrimeCalculator::ArePrimeNumbers(SimpleMemory).0._State\ = \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0._State_8\) then 
                                \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0._State\ := \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0._State_4\;
                            end if;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0.3156
                end case;
            end if;
        end if;
    end process;
    -- System.Void Hast.Samples.SampleAssembly.PrimeCalculator::ArePrimeNumbers(Hast.Transformer.Abstractions.SimpleMemory.SimpleMemory).0 state machine end


    -- System.Void Hast.Samples.SampleAssembly.PrimeCalculator::ParallelizedArePrimeNumbers(Hast.Transformer.Abstractions.SimpleMemory.SimpleMemory).0 state machine start
    \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0._StateMachine\: process (\Clock\) 
        Variable \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0._State\: \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0._States\ := \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0._State_0\;
        Variable \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.num\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.array\: \boolean_Array\(0 to 29) := (others => false);
        Variable \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.num2\: signed(31 downto 0) := to_signed(0, 32);
        Variable \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.i\: signed(31 downto 0) := to_signed(0, 32);
        Variable \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.num3\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.arg_5D_1\: signed(31 downto 0) := to_signed(0, 32);
        Variable \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.j\: signed(31 downto 0) := to_signed(0, 32);
        Variable \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.dataIn.0\: std_logic_vector(31 downto 0);
        Variable \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.binaryOperationResult.0\: boolean := false;
        Variable \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.binaryOperationResult.1\: boolean := false;
        Variable \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.binaryOperationResult.2\: signed(31 downto 0) := to_signed(0, 32);
        Variable \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.binaryOperationResult.3\: signed(31 downto 0) := to_signed(0, 32);
        Variable \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.dataIn.1\: std_logic_vector(31 downto 0);
        Variable \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).invocationIndex\: integer range 0 to 29 := 0;
        Variable \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.binaryOperationResult.4\: signed(31 downto 0) := to_signed(0, 32);
        Variable \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.return.0\: boolean := false;
        Variable \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.return.1\: boolean := false;
        Variable \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.return.2\: boolean := false;
        Variable \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.return.3\: boolean := false;
        Variable \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.return.4\: boolean := false;
        Variable \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.return.5\: boolean := false;
        Variable \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.return.6\: boolean := false;
        Variable \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.return.7\: boolean := false;
        Variable \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.return.8\: boolean := false;
        Variable \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.return.9\: boolean := false;
        Variable \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.return.10\: boolean := false;
        Variable \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.return.11\: boolean := false;
        Variable \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.return.12\: boolean := false;
        Variable \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.return.13\: boolean := false;
        Variable \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.return.14\: boolean := false;
        Variable \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.return.15\: boolean := false;
        Variable \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.return.16\: boolean := false;
        Variable \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.return.17\: boolean := false;
        Variable \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.return.18\: boolean := false;
        Variable \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.return.19\: boolean := false;
        Variable \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.return.20\: boolean := false;
        Variable \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.return.21\: boolean := false;
        Variable \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.return.22\: boolean := false;
        Variable \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.return.23\: boolean := false;
        Variable \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.return.24\: boolean := false;
        Variable \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.return.25\: boolean := false;
        Variable \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.return.26\: boolean := false;
        Variable \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.return.27\: boolean := false;
        Variable \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.return.28\: boolean := false;
        Variable \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.return.29\: boolean := false;
        Variable \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.binaryOperationResult.5\: boolean := false;
        Variable \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.binaryOperationResult.6\: signed(31 downto 0) := to_signed(0, 32);
        Variable \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.binaryOperationResult.7\: signed(31 downto 0) := to_signed(0, 32);
        Variable \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.binaryOperationResult.8\: signed(31 downto 0) := to_signed(0, 32);
        Variable \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.binaryOperationResult.9\: signed(31 downto 0) := to_signed(0, 32);
    begin 
        if (rising_edge(\Clock\)) then 
            if (\Reset\ = '1') then 
                -- Synchronous reset
                \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0._Finished\ <= false;
                \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.SimpleMemory.CellIndex\ <= to_signed(0, 32);
                \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.SimpleMemory.ReadEnable\ <= false;
                \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.SimpleMemory.WriteEnable\ <= false;
                \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).numberObject.parameter.Out.0\ <= to_unsigned(0, 32);
                \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.0\ <= false;
                \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).numberObject.parameter.Out.1\ <= to_unsigned(0, 32);
                \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.1\ <= false;
                \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).numberObject.parameter.Out.2\ <= to_unsigned(0, 32);
                \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.2\ <= false;
                \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).numberObject.parameter.Out.3\ <= to_unsigned(0, 32);
                \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.3\ <= false;
                \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).numberObject.parameter.Out.4\ <= to_unsigned(0, 32);
                \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.4\ <= false;
                \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).numberObject.parameter.Out.5\ <= to_unsigned(0, 32);
                \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.5\ <= false;
                \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).numberObject.parameter.Out.6\ <= to_unsigned(0, 32);
                \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.6\ <= false;
                \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).numberObject.parameter.Out.7\ <= to_unsigned(0, 32);
                \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.7\ <= false;
                \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).numberObject.parameter.Out.8\ <= to_unsigned(0, 32);
                \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.8\ <= false;
                \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).numberObject.parameter.Out.9\ <= to_unsigned(0, 32);
                \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.9\ <= false;
                \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).numberObject.parameter.Out.10\ <= to_unsigned(0, 32);
                \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.10\ <= false;
                \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).numberObject.parameter.Out.11\ <= to_unsigned(0, 32);
                \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.11\ <= false;
                \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).numberObject.parameter.Out.12\ <= to_unsigned(0, 32);
                \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.12\ <= false;
                \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).numberObject.parameter.Out.13\ <= to_unsigned(0, 32);
                \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.13\ <= false;
                \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).numberObject.parameter.Out.14\ <= to_unsigned(0, 32);
                \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.14\ <= false;
                \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).numberObject.parameter.Out.15\ <= to_unsigned(0, 32);
                \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.15\ <= false;
                \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).numberObject.parameter.Out.16\ <= to_unsigned(0, 32);
                \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.16\ <= false;
                \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).numberObject.parameter.Out.17\ <= to_unsigned(0, 32);
                \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.17\ <= false;
                \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).numberObject.parameter.Out.18\ <= to_unsigned(0, 32);
                \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.18\ <= false;
                \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).numberObject.parameter.Out.19\ <= to_unsigned(0, 32);
                \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.19\ <= false;
                \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).numberObject.parameter.Out.20\ <= to_unsigned(0, 32);
                \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.20\ <= false;
                \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).numberObject.parameter.Out.21\ <= to_unsigned(0, 32);
                \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.21\ <= false;
                \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).numberObject.parameter.Out.22\ <= to_unsigned(0, 32);
                \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.22\ <= false;
                \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).numberObject.parameter.Out.23\ <= to_unsigned(0, 32);
                \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.23\ <= false;
                \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).numberObject.parameter.Out.24\ <= to_unsigned(0, 32);
                \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.24\ <= false;
                \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).numberObject.parameter.Out.25\ <= to_unsigned(0, 32);
                \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.25\ <= false;
                \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).numberObject.parameter.Out.26\ <= to_unsigned(0, 32);
                \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.26\ <= false;
                \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).numberObject.parameter.Out.27\ <= to_unsigned(0, 32);
                \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.27\ <= false;
                \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).numberObject.parameter.Out.28\ <= to_unsigned(0, 32);
                \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.28\ <= false;
                \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).numberObject.parameter.Out.29\ <= to_unsigned(0, 32);
                \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.29\ <= false;
                \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0._State\ := \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0._State_0\;
                \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.num\ := to_unsigned(0, 32);
                \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.array\ := (others => false);
                \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.num2\ := to_signed(0, 32);
                \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.i\ := to_signed(0, 32);
                \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.num3\ := to_unsigned(0, 32);
                \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.arg_5D_1\ := to_signed(0, 32);
                \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.j\ := to_signed(0, 32);
                \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.binaryOperationResult.0\ := false;
                \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.binaryOperationResult.1\ := false;
                \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.binaryOperationResult.2\ := to_signed(0, 32);
                \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.binaryOperationResult.3\ := to_signed(0, 32);
                \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).invocationIndex\ := 0;
                \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.binaryOperationResult.4\ := to_signed(0, 32);
                \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.return.0\ := false;
                \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.return.1\ := false;
                \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.return.2\ := false;
                \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.return.3\ := false;
                \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.return.4\ := false;
                \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.return.5\ := false;
                \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.return.6\ := false;
                \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.return.7\ := false;
                \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.return.8\ := false;
                \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.return.9\ := false;
                \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.return.10\ := false;
                \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.return.11\ := false;
                \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.return.12\ := false;
                \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.return.13\ := false;
                \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.return.14\ := false;
                \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.return.15\ := false;
                \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.return.16\ := false;
                \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.return.17\ := false;
                \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.return.18\ := false;
                \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.return.19\ := false;
                \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.return.20\ := false;
                \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.return.21\ := false;
                \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.return.22\ := false;
                \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.return.23\ := false;
                \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.return.24\ := false;
                \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.return.25\ := false;
                \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.return.26\ := false;
                \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.return.27\ := false;
                \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.return.28\ := false;
                \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.return.29\ := false;
                \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.binaryOperationResult.5\ := false;
                \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.binaryOperationResult.6\ := to_signed(0, 32);
                \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.binaryOperationResult.7\ := to_signed(0, 32);
                \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.binaryOperationResult.8\ := to_signed(0, 32);
                \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.binaryOperationResult.9\ := to_signed(0, 32);
            else 
                case \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0._State\ is 
                    when \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0._State_0\ => 
                        -- Start state
                        -- Waiting for the start signal.
                        if (\PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0._Started\ = true) then 
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0._State\ := \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0._State_2\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0
                    when \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0._State_1\ => 
                        -- Final state
                        -- Signaling finished until Started is pulled back to false, then returning to the start state.
                        if (\PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0._Started\ = true) then 
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0._Finished\ <= true;
                        else 
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0._Finished\ <= false;
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0._State\ := \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0._State_0\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0
                    when \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0._State_2\ => 
                        -- Begin SimpleMemory read.
                        \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.SimpleMemory.CellIndex\ <= resize(to_signed(0, 32), 32);
                        \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.SimpleMemory.ReadEnable\ <= true;
                        \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0._State\ := \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0._State_3\;
                        -- Clock cycles needed to complete this state (approximation): 0
                    when \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0._State_3\ => 
                        -- Waiting for the SimpleMemory operation to finish.
                        if (\ReadsDone\ = true) then 
                            -- SimpleMemory read finished.
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.SimpleMemory.ReadEnable\ <= false;
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.dataIn.0\ := \DataIn\;
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.num\ := ConvertStdLogicVectorToUInt32(\PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.dataIn.0\);
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.array\ := (others => false);
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.num2\ := to_signed(0, 32);
                            -- Starting a while loop.
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0._State\ := \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0._State_4\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0
                    when \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0._State_4\ => 
                        -- Repeated state of the while loop which was started in state \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0._State_3\.
                        -- The while loop's condition:
                        \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.binaryOperationResult.0\ := resize(\PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.num2\, 64) < signed((resize(\PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.num\, 64)));
                        if (\PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.binaryOperationResult.0\) then 
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.i\ := to_signed(0, 32);
                            -- Starting a while loop.
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0._State\ := \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0._State_6\;
                        else 
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0._State\ := \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0._State_5\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0.2897
                    when \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0._State_5\ => 
                        -- State after the while loop which was started in state \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0._State_3\.
                        \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0._State\ := \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0._State_1\;
                        -- Clock cycles needed to complete this state (approximation): 0
                    when \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0._State_6\ => 
                        -- Repeated state of the while loop which was started in state \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0._State_4\.
                        -- The while loop's condition:
                        \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.binaryOperationResult.1\ := \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.i\ < to_signed(30, 32);
                        if (\PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.binaryOperationResult.1\) then 
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.binaryOperationResult.2\ := to_signed(1, 32) + \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.num2\;
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.binaryOperationResult.3\ := \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.binaryOperationResult.2\ + \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.i\;
                            -- Begin SimpleMemory read.
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.SimpleMemory.CellIndex\ <= resize(\PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.binaryOperationResult.3\, 32);
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.SimpleMemory.ReadEnable\ <= true;
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0._State\ := \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0._State_8\;
                        else 
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0._State\ := \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0._State_7\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0.8922
                    when \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0._State_7\ => 
                        -- State after the while loop which was started in state \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0._State_4\.
                        \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0._State\ := \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0._State_9\;
                        -- Clock cycles needed to complete this state (approximation): 0
                    when \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0._State_8\ => 
                        -- Waiting for the SimpleMemory operation to finish.
                        if (\ReadsDone\ = true) then 
                            -- SimpleMemory read finished.
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.SimpleMemory.ReadEnable\ <= false;
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.dataIn.1\ := \DataIn\;
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.num3\ := ConvertStdLogicVectorToUInt32(\PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.dataIn.1\);
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.arg_5D_1\ := \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.i\;
                            -- Starting state machine invocation for the following method: System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(System.UInt32)
                            case \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).invocationIndex\ is 
                                when 0 => 
                                    \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).numberObject.parameter.Out.0\ <= \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.num3\;
                                    \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.0\ <= true;
                                when 1 => 
                                    \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).numberObject.parameter.Out.1\ <= \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.num3\;
                                    \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.1\ <= true;
                                when 2 => 
                                    \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).numberObject.parameter.Out.2\ <= \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.num3\;
                                    \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.2\ <= true;
                                when 3 => 
                                    \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).numberObject.parameter.Out.3\ <= \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.num3\;
                                    \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.3\ <= true;
                                when 4 => 
                                    \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).numberObject.parameter.Out.4\ <= \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.num3\;
                                    \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.4\ <= true;
                                when 5 => 
                                    \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).numberObject.parameter.Out.5\ <= \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.num3\;
                                    \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.5\ <= true;
                                when 6 => 
                                    \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).numberObject.parameter.Out.6\ <= \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.num3\;
                                    \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.6\ <= true;
                                when 7 => 
                                    \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).numberObject.parameter.Out.7\ <= \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.num3\;
                                    \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.7\ <= true;
                                when 8 => 
                                    \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).numberObject.parameter.Out.8\ <= \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.num3\;
                                    \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.8\ <= true;
                                when 9 => 
                                    \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).numberObject.parameter.Out.9\ <= \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.num3\;
                                    \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.9\ <= true;
                                when 10 => 
                                    \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).numberObject.parameter.Out.10\ <= \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.num3\;
                                    \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.10\ <= true;
                                when 11 => 
                                    \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).numberObject.parameter.Out.11\ <= \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.num3\;
                                    \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.11\ <= true;
                                when 12 => 
                                    \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).numberObject.parameter.Out.12\ <= \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.num3\;
                                    \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.12\ <= true;
                                when 13 => 
                                    \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).numberObject.parameter.Out.13\ <= \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.num3\;
                                    \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.13\ <= true;
                                when 14 => 
                                    \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).numberObject.parameter.Out.14\ <= \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.num3\;
                                    \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.14\ <= true;
                                when 15 => 
                                    \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).numberObject.parameter.Out.15\ <= \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.num3\;
                                    \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.15\ <= true;
                                when 16 => 
                                    \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).numberObject.parameter.Out.16\ <= \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.num3\;
                                    \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.16\ <= true;
                                when 17 => 
                                    \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).numberObject.parameter.Out.17\ <= \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.num3\;
                                    \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.17\ <= true;
                                when 18 => 
                                    \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).numberObject.parameter.Out.18\ <= \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.num3\;
                                    \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.18\ <= true;
                                when 19 => 
                                    \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).numberObject.parameter.Out.19\ <= \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.num3\;
                                    \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.19\ <= true;
                                when 20 => 
                                    \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).numberObject.parameter.Out.20\ <= \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.num3\;
                                    \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.20\ <= true;
                                when 21 => 
                                    \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).numberObject.parameter.Out.21\ <= \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.num3\;
                                    \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.21\ <= true;
                                when 22 => 
                                    \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).numberObject.parameter.Out.22\ <= \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.num3\;
                                    \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.22\ <= true;
                                when 23 => 
                                    \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).numberObject.parameter.Out.23\ <= \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.num3\;
                                    \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.23\ <= true;
                                when 24 => 
                                    \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).numberObject.parameter.Out.24\ <= \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.num3\;
                                    \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.24\ <= true;
                                when 25 => 
                                    \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).numberObject.parameter.Out.25\ <= \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.num3\;
                                    \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.25\ <= true;
                                when 26 => 
                                    \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).numberObject.parameter.Out.26\ <= \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.num3\;
                                    \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.26\ <= true;
                                when 27 => 
                                    \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).numberObject.parameter.Out.27\ <= \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.num3\;
                                    \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.27\ <= true;
                                when 28 => 
                                    \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).numberObject.parameter.Out.28\ <= \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.num3\;
                                    \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.28\ <= true;
                                when 29 => 
                                    \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).numberObject.parameter.Out.29\ <= \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.num3\;
                                    \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.29\ <= true;
                            end case;
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).invocationIndex\ := \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).invocationIndex\ + 1;
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.binaryOperationResult.4\ := \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.i\ + to_signed(1, 32);
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.i\ := \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.binaryOperationResult.4\;
                            -- Returning to the repeated state of the while loop which was started in state \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0._State_4\ if the loop wasn't exited with a state change.
                            if (\PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0._State\ = \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0._State_8\) then 
                                \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0._State\ := \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0._State_6\;
                            end if;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0.3156
                    when \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0._State_9\ => 
                        -- Waiting for the state machine invocation of the following method to finish: System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(System.UInt32)
                        if (\PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.1\ = \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Finished.1\ and \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.2\ = \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Finished.2\ and \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.3\ = \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Finished.3\ and \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.4\ = \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Finished.4\ and \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.5\ = \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Finished.5\ and \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.6\ = \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Finished.6\ and \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.7\ = \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Finished.7\ and \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.8\ = \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Finished.8\ and \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.9\ = \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Finished.9\ and \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.10\ = \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Finished.10\ and \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.11\ = \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Finished.11\ and \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.12\ = \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Finished.12\ and \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.13\ = \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Finished.13\ and \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.14\ = \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Finished.14\ and \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.15\ = \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Finished.15\ and \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.16\ = \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Finished.16\ and \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.17\ = \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Finished.17\ and \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.18\ = \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Finished.18\ and \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.19\ = \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Finished.19\ and \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.20\ = \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Finished.20\ and \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.21\ = \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Finished.21\ and \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.22\ = \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Finished.22\ and \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.23\ = \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Finished.23\ and \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.24\ = \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Finished.24\ and \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.25\ = \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Finished.25\ and \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.26\ = \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Finished.26\ and \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.27\ = \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Finished.27\ and \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.28\ = \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Finished.28\ and \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.29\ = \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Finished.29\ and \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.0\ = \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Finished.0\) then 
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.0\ <= false;
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.1\ <= false;
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.2\ <= false;
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.3\ <= false;
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.4\ <= false;
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.5\ <= false;
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.6\ <= false;
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.7\ <= false;
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.8\ <= false;
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.9\ <= false;
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.10\ <= false;
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.11\ <= false;
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.12\ <= false;
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.13\ <= false;
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.14\ <= false;
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.15\ <= false;
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.16\ <= false;
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.17\ <= false;
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.18\ <= false;
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.19\ <= false;
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.20\ <= false;
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.21\ <= false;
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.22\ <= false;
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.23\ <= false;
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.24\ <= false;
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.25\ <= false;
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.26\ <= false;
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.27\ <= false;
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.28\ <= false;
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.29\ <= false;
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).invocationIndex\ := 0;
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.return.0\ := \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).return.0\;
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.return.1\ := \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).return.1\;
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.return.2\ := \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).return.2\;
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.return.3\ := \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).return.3\;
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.return.4\ := \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).return.4\;
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.return.5\ := \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).return.5\;
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.return.6\ := \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).return.6\;
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.return.7\ := \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).return.7\;
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.return.8\ := \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).return.8\;
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.return.9\ := \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).return.9\;
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.return.10\ := \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).return.10\;
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.return.11\ := \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).return.11\;
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.return.12\ := \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).return.12\;
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.return.13\ := \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).return.13\;
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.return.14\ := \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).return.14\;
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.return.15\ := \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).return.15\;
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.return.16\ := \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).return.16\;
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.return.17\ := \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).return.17\;
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.return.18\ := \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).return.18\;
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.return.19\ := \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).return.19\;
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.return.20\ := \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).return.20\;
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.return.21\ := \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).return.21\;
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.return.22\ := \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).return.22\;
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.return.23\ := \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).return.23\;
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.return.24\ := \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).return.24\;
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.return.25\ := \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).return.25\;
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.return.26\ := \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).return.26\;
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.return.27\ := \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).return.27\;
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.return.28\ := \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).return.28\;
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.return.29\ := \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).return.29\;
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.array\(0) := \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.return.0\;
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.array\(1) := \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.return.1\;
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.array\(2) := \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.return.2\;
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.array\(3) := \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.return.3\;
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.array\(4) := \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.return.4\;
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.array\(5) := \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.return.5\;
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.array\(6) := \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.return.6\;
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.array\(7) := \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.return.7\;
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.array\(8) := \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.return.8\;
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.array\(9) := \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.return.9\;
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.array\(10) := \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.return.10\;
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.array\(11) := \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.return.11\;
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.array\(12) := \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.return.12\;
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.array\(13) := \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.return.13\;
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.array\(14) := \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.return.14\;
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.array\(15) := \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.return.15\;
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.array\(16) := \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.return.16\;
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.array\(17) := \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.return.17\;
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.array\(18) := \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.return.18\;
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.array\(19) := \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.return.19\;
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.array\(20) := \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.return.20\;
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.array\(21) := \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.return.21\;
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.array\(22) := \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.return.22\;
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.array\(23) := \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.return.23\;
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.array\(24) := \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.return.24\;
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.array\(25) := \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.return.25\;
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.array\(26) := \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.return.26\;
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.array\(27) := \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.return.27\;
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.array\(28) := \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.return.28\;
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.array\(29) := \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.return.29\;
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.j\ := to_signed(0, 32);
                            -- Starting a while loop.
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0._State\ := \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0._State_10\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0
                    when \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0._State_10\ => 
                        -- Repeated state of the while loop which was started in state \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0._State_9\.
                        -- The while loop's condition:
                        \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.binaryOperationResult.5\ := \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.j\ < to_signed(30, 32);
                        if (\PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.binaryOperationResult.5\) then 
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.binaryOperationResult.6\ := to_signed(1, 32) + \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.num2\;
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.binaryOperationResult.7\ := \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.binaryOperationResult.6\ + \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.j\;
                            -- Begin SimpleMemory write.
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.SimpleMemory.CellIndex\ <= resize(\PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.binaryOperationResult.7\, 32);
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.SimpleMemory.WriteEnable\ <= true;
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.SimpleMemory.DataOut\ <= ConvertBooleanToStdLogicVector(\PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.array\(to_integer(\PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.j\)));
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0._State\ := \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0._State_12\;
                        else 
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0._State\ := \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0._State_11\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0.8922
                    when \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0._State_11\ => 
                        -- State after the while loop which was started in state \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0._State_9\.
                        \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.binaryOperationResult.9\ := \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.num2\ + to_signed(30, 32);
                        \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.num2\ := \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.binaryOperationResult.9\;
                        -- Returning to the repeated state of the while loop which was started in state \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0._State_3\ if the loop wasn't exited with a state change.
                        if (\PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0._State\ = \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0._State_11\) then 
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0._State\ := \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0._State_4\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0.3156
                    when \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0._State_12\ => 
                        -- Waiting for the SimpleMemory operation to finish.
                        if (\WritesDone\ = true) then 
                            -- SimpleMemory write finished.
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.SimpleMemory.WriteEnable\ <= false;
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.binaryOperationResult.8\ := \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.j\ + to_signed(1, 32);
                            \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.j\ := \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.binaryOperationResult.8\;
                            -- Returning to the repeated state of the while loop which was started in state \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0._State_9\ if the loop wasn't exited with a state change.
                            if (\PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0._State\ = \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0._State_12\) then 
                                \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0._State\ := \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0._State_10\;
                            end if;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0.3156
                end case;
            end if;
        end if;
    end process;
    -- System.Void Hast.Samples.SampleAssembly.PrimeCalculator::ParallelizedArePrimeNumbers(Hast.Transformer.Abstractions.SimpleMemory.SimpleMemory).0 state machine end


    -- System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator::IsPrimeNumberInternal(System.UInt32).0 state machine start
    \PrimeCalculator::IsPrimeNumberInternal(UInt32).0._StateMachine\: process (\Clock\) 
        Variable \PrimeCalculator::IsPrimeNumberInternal(UInt32).0._State\: \PrimeCalculator::IsPrimeNumberInternal(UInt32).0._States\ := \PrimeCalculator::IsPrimeNumberInternal(UInt32).0._State_0\;
        Variable \PrimeCalculator::IsPrimeNumberInternal(UInt32).0.number\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator::IsPrimeNumberInternal(UInt32).0.num\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator::IsPrimeNumberInternal(UInt32).0.num2\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator::IsPrimeNumberInternal(UInt32).0.flag\: boolean := false;
        Variable \PrimeCalculator::IsPrimeNumberInternal(UInt32).0.result\: boolean := false;
        Variable \PrimeCalculator::IsPrimeNumberInternal(UInt32).0.binaryOperationResult.0\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator::IsPrimeNumberInternal(UInt32).0.binaryOperationResult.1\: boolean := false;
        Variable \PrimeCalculator::IsPrimeNumberInternal(UInt32).0.binaryOperationResult.2\: unsigned(31 downto 0) := to_unsigned(0, 32);
        Variable \PrimeCalculator::IsPrimeNumberInternal(UInt32).0.clockCyclesWaitedForBinaryOperationResult.0\: signed(31 downto 0) := to_signed(0, 32);
        Variable \PrimeCalculator::IsPrimeNumberInternal(UInt32).0.binaryOperationResult.3\: boolean := false;
        Variable \PrimeCalculator::IsPrimeNumberInternal(UInt32).0.binaryOperationResult.4\: unsigned(31 downto 0) := to_unsigned(0, 32);
    begin 
        if (rising_edge(\Clock\)) then 
            if (\Reset\ = '1') then 
                -- Synchronous reset
                \PrimeCalculator::IsPrimeNumberInternal(UInt32).0._Finished\ <= false;
                \PrimeCalculator::IsPrimeNumberInternal(UInt32).0.return\ <= false;
                \PrimeCalculator::IsPrimeNumberInternal(UInt32).0._State\ := \PrimeCalculator::IsPrimeNumberInternal(UInt32).0._State_0\;
                \PrimeCalculator::IsPrimeNumberInternal(UInt32).0.number\ := to_unsigned(0, 32);
                \PrimeCalculator::IsPrimeNumberInternal(UInt32).0.num\ := to_unsigned(0, 32);
                \PrimeCalculator::IsPrimeNumberInternal(UInt32).0.num2\ := to_unsigned(0, 32);
                \PrimeCalculator::IsPrimeNumberInternal(UInt32).0.flag\ := false;
                \PrimeCalculator::IsPrimeNumberInternal(UInt32).0.result\ := false;
                \PrimeCalculator::IsPrimeNumberInternal(UInt32).0.binaryOperationResult.0\ := to_unsigned(0, 32);
                \PrimeCalculator::IsPrimeNumberInternal(UInt32).0.binaryOperationResult.1\ := false;
                \PrimeCalculator::IsPrimeNumberInternal(UInt32).0.binaryOperationResult.2\ := to_unsigned(0, 32);
                \PrimeCalculator::IsPrimeNumberInternal(UInt32).0.clockCyclesWaitedForBinaryOperationResult.0\ := to_signed(0, 32);
                \PrimeCalculator::IsPrimeNumberInternal(UInt32).0.binaryOperationResult.3\ := false;
                \PrimeCalculator::IsPrimeNumberInternal(UInt32).0.binaryOperationResult.4\ := to_unsigned(0, 32);
            else 
                case \PrimeCalculator::IsPrimeNumberInternal(UInt32).0._State\ is 
                    when \PrimeCalculator::IsPrimeNumberInternal(UInt32).0._State_0\ => 
                        -- Start state
                        -- Waiting for the start signal.
                        if (\PrimeCalculator::IsPrimeNumberInternal(UInt32).0._Started\ = true) then 
                            \PrimeCalculator::IsPrimeNumberInternal(UInt32).0._State\ := \PrimeCalculator::IsPrimeNumberInternal(UInt32).0._State_2\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0
                    when \PrimeCalculator::IsPrimeNumberInternal(UInt32).0._State_1\ => 
                        -- Final state
                        -- Signaling finished until Started is pulled back to false, then returning to the start state.
                        if (\PrimeCalculator::IsPrimeNumberInternal(UInt32).0._Started\ = true) then 
                            \PrimeCalculator::IsPrimeNumberInternal(UInt32).0._Finished\ <= true;
                        else 
                            \PrimeCalculator::IsPrimeNumberInternal(UInt32).0._Finished\ <= false;
                            \PrimeCalculator::IsPrimeNumberInternal(UInt32).0._State\ := \PrimeCalculator::IsPrimeNumberInternal(UInt32).0._State_0\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0
                    when \PrimeCalculator::IsPrimeNumberInternal(UInt32).0._State_2\ => 
                        \PrimeCalculator::IsPrimeNumberInternal(UInt32).0.number\ := \PrimeCalculator::IsPrimeNumberInternal(UInt32).0.number.parameter.In\;
                        \PrimeCalculator::IsPrimeNumberInternal(UInt32).0.binaryOperationResult.0\ := \PrimeCalculator::IsPrimeNumberInternal(UInt32).0.number\ / to_unsigned(2, 32);
                        \PrimeCalculator::IsPrimeNumberInternal(UInt32).0.num\ := \PrimeCalculator::IsPrimeNumberInternal(UInt32).0.binaryOperationResult.0\;
                        \PrimeCalculator::IsPrimeNumberInternal(UInt32).0.num2\ := to_unsigned(2, 32);
                        -- Starting a while loop.
                        \PrimeCalculator::IsPrimeNumberInternal(UInt32).0._State\ := \PrimeCalculator::IsPrimeNumberInternal(UInt32).0._State_3\;
                        -- Clock cycles needed to complete this state (approximation): 0.1
                    when \PrimeCalculator::IsPrimeNumberInternal(UInt32).0._State_3\ => 
                        -- Repeated state of the while loop which was started in state \PrimeCalculator::IsPrimeNumberInternal(UInt32).0._State_2\.
                        -- The while loop's condition:
                        \PrimeCalculator::IsPrimeNumberInternal(UInt32).0.binaryOperationResult.1\ := \PrimeCalculator::IsPrimeNumberInternal(UInt32).0.num2\ <= \PrimeCalculator::IsPrimeNumberInternal(UInt32).0.num\;
                        if (\PrimeCalculator::IsPrimeNumberInternal(UInt32).0.binaryOperationResult.1\) then 
                            \PrimeCalculator::IsPrimeNumberInternal(UInt32).0._State\ := \PrimeCalculator::IsPrimeNumberInternal(UInt32).0._State_5\;
                        else 
                            \PrimeCalculator::IsPrimeNumberInternal(UInt32).0._State\ := \PrimeCalculator::IsPrimeNumberInternal(UInt32).0._State_4\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0.261
                    when \PrimeCalculator::IsPrimeNumberInternal(UInt32).0._State_4\ => 
                        -- State after the while loop which was started in state \PrimeCalculator::IsPrimeNumberInternal(UInt32).0._State_2\.
                        \PrimeCalculator::IsPrimeNumberInternal(UInt32).0.result\ := True;
                        \PrimeCalculator::IsPrimeNumberInternal(UInt32).0.return\ <= True;
                        \PrimeCalculator::IsPrimeNumberInternal(UInt32).0._State\ := \PrimeCalculator::IsPrimeNumberInternal(UInt32).0._State_1\;
                        -- Clock cycles needed to complete this state (approximation): 0
                    when \PrimeCalculator::IsPrimeNumberInternal(UInt32).0._State_5\ => 
                        -- Waiting for the result to appear in \PrimeCalculator::IsPrimeNumberInternal(UInt32).0.binaryOperationResult.2\ (have to wait 10 clock cycles in this state).
                        -- The assignment needs to be kept up for multi-cycle operations for the result to actually appear in the target.
                        if (\PrimeCalculator::IsPrimeNumberInternal(UInt32).0.clockCyclesWaitedForBinaryOperationResult.0\ >= to_signed(10, 32)) then 
                            \PrimeCalculator::IsPrimeNumberInternal(UInt32).0._State\ := \PrimeCalculator::IsPrimeNumberInternal(UInt32).0._State_6\;
                            \PrimeCalculator::IsPrimeNumberInternal(UInt32).0.clockCyclesWaitedForBinaryOperationResult.0\ := to_signed(0, 32);
                        else 
                            \PrimeCalculator::IsPrimeNumberInternal(UInt32).0.clockCyclesWaitedForBinaryOperationResult.0\ := \PrimeCalculator::IsPrimeNumberInternal(UInt32).0.clockCyclesWaitedForBinaryOperationResult.0\ + to_signed(1, 32);
                        end if;
                        \PrimeCalculator::IsPrimeNumberInternal(UInt32).0.binaryOperationResult.2\ := \PrimeCalculator::IsPrimeNumberInternal(UInt32).0.number\ mod \PrimeCalculator::IsPrimeNumberInternal(UInt32).0.num2\;
                        -- Clock cycles needed to complete this state (approximation): 10
                    when \PrimeCalculator::IsPrimeNumberInternal(UInt32).0._State_6\ => 
                        \PrimeCalculator::IsPrimeNumberInternal(UInt32).0.binaryOperationResult.3\ := \PrimeCalculator::IsPrimeNumberInternal(UInt32).0.binaryOperationResult.2\ = to_unsigned(0, 32);
                        \PrimeCalculator::IsPrimeNumberInternal(UInt32).0.flag\ := \PrimeCalculator::IsPrimeNumberInternal(UInt32).0.binaryOperationResult.3\;

                        -- This if-else was transformed from a .NET if-else. It spans across multiple states:
                        --     * The true branch starts in state \PrimeCalculator::IsPrimeNumberInternal(UInt32).0._State_8\ and ends in state \PrimeCalculator::IsPrimeNumberInternal(UInt32).0._State_8\.
                        --     * Execution after either branch will continue in the following state: \PrimeCalculator::IsPrimeNumberInternal(UInt32).0._State_7\.

                        if (\PrimeCalculator::IsPrimeNumberInternal(UInt32).0.flag\) then 
                            \PrimeCalculator::IsPrimeNumberInternal(UInt32).0._State\ := \PrimeCalculator::IsPrimeNumberInternal(UInt32).0._State_8\;
                        else 
                            -- There was no false branch, so going directly to the state after the if-else.
                            \PrimeCalculator::IsPrimeNumberInternal(UInt32).0._State\ := \PrimeCalculator::IsPrimeNumberInternal(UInt32).0._State_7\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0.2751
                    when \PrimeCalculator::IsPrimeNumberInternal(UInt32).0._State_7\ => 
                        -- State after the if-else which was started in state \PrimeCalculator::IsPrimeNumberInternal(UInt32).0._State_6\.
                        \PrimeCalculator::IsPrimeNumberInternal(UInt32).0.binaryOperationResult.4\ := \PrimeCalculator::IsPrimeNumberInternal(UInt32).0.num2\ + to_unsigned(1, 32);
                        \PrimeCalculator::IsPrimeNumberInternal(UInt32).0.num2\ := \PrimeCalculator::IsPrimeNumberInternal(UInt32).0.binaryOperationResult.4\;
                        -- Returning to the repeated state of the while loop which was started in state \PrimeCalculator::IsPrimeNumberInternal(UInt32).0._State_2\ if the loop wasn't exited with a state change.
                        if (\PrimeCalculator::IsPrimeNumberInternal(UInt32).0._State\ = \PrimeCalculator::IsPrimeNumberInternal(UInt32).0._State_7\) then 
                            \PrimeCalculator::IsPrimeNumberInternal(UInt32).0._State\ := \PrimeCalculator::IsPrimeNumberInternal(UInt32).0._State_3\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0.3156
                    when \PrimeCalculator::IsPrimeNumberInternal(UInt32).0._State_8\ => 
                        -- True branch of the if-else started in state \PrimeCalculator::IsPrimeNumberInternal(UInt32).0._State_6\.
                        \PrimeCalculator::IsPrimeNumberInternal(UInt32).0.result\ := False;
                        \PrimeCalculator::IsPrimeNumberInternal(UInt32).0.return\ <= \PrimeCalculator::IsPrimeNumberInternal(UInt32).0.result\;
                        \PrimeCalculator::IsPrimeNumberInternal(UInt32).0._State\ := \PrimeCalculator::IsPrimeNumberInternal(UInt32).0._State_1\;
                        -- Going to the state after the if-else which was started in state \PrimeCalculator::IsPrimeNumberInternal(UInt32).0._State_6\.
                        if (\PrimeCalculator::IsPrimeNumberInternal(UInt32).0._State\ = \PrimeCalculator::IsPrimeNumberInternal(UInt32).0._State_8\) then 
                            \PrimeCalculator::IsPrimeNumberInternal(UInt32).0._State\ := \PrimeCalculator::IsPrimeNumberInternal(UInt32).0._State_7\;
                        end if;
                        -- Clock cycles needed to complete this state (approximation): 0
                end case;
            end if;
        end if;
    end process;
    -- System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator::IsPrimeNumberInternal(System.UInt32).0 state machine end


    -- System.Void Hast::ExternalInvocationProxy() start
    \Finished\ <= \FinishedInternal\;
    \Hast::ExternalInvocationProxy()\: process (\Clock\) 
    begin 
        if (rising_edge(\Clock\)) then 
            if (\Reset\ = '1') then 
                -- Synchronous reset
                \FinishedInternal\ <= false;
                \Hast::ExternalInvocationProxy().PrimeCalculator::IsPrimeNumber(SimpleMemory)._Started.0\ <= false;
                \Hast::ExternalInvocationProxy().PrimeCalculator::IsPrimeNumberAsync(SimpleMemory)._Started.0\ <= false;
                \Hast::ExternalInvocationProxy().PrimeCalculator::ArePrimeNumbers(SimpleMemory)._Started.0\ <= false;
                \Hast::ExternalInvocationProxy().PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory)._Started.0\ <= false;
            else 
                if (\Started\ = true and \FinishedInternal\ = false) then 
                    -- Starting the state machine corresponding to the given member ID.
                    case \MemberId\ is 
                        when 0 => 
                            if (\Hast::ExternalInvocationProxy().PrimeCalculator::IsPrimeNumber(SimpleMemory)._Started.0\ = false) then 
                                \Hast::ExternalInvocationProxy().PrimeCalculator::IsPrimeNumber(SimpleMemory)._Started.0\ <= true;
                            elsif (\Hast::ExternalInvocationProxy().PrimeCalculator::IsPrimeNumber(SimpleMemory)._Started.0\ = \Hast::ExternalInvocationProxy().PrimeCalculator::IsPrimeNumber(SimpleMemory)._Finished.0\) then 
                                \Hast::ExternalInvocationProxy().PrimeCalculator::IsPrimeNumber(SimpleMemory)._Started.0\ <= false;
                                \FinishedInternal\ <= true;
                            end if;
                        when 1 => 
                            if (\Hast::ExternalInvocationProxy().PrimeCalculator::IsPrimeNumberAsync(SimpleMemory)._Started.0\ = false) then 
                                \Hast::ExternalInvocationProxy().PrimeCalculator::IsPrimeNumberAsync(SimpleMemory)._Started.0\ <= true;
                            elsif (\Hast::ExternalInvocationProxy().PrimeCalculator::IsPrimeNumberAsync(SimpleMemory)._Started.0\ = \Hast::ExternalInvocationProxy().PrimeCalculator::IsPrimeNumberAsync(SimpleMemory)._Finished.0\) then 
                                \Hast::ExternalInvocationProxy().PrimeCalculator::IsPrimeNumberAsync(SimpleMemory)._Started.0\ <= false;
                                \FinishedInternal\ <= true;
                            end if;
                        when 2 => 
                            if (\Hast::ExternalInvocationProxy().PrimeCalculator::ArePrimeNumbers(SimpleMemory)._Started.0\ = false) then 
                                \Hast::ExternalInvocationProxy().PrimeCalculator::ArePrimeNumbers(SimpleMemory)._Started.0\ <= true;
                            elsif (\Hast::ExternalInvocationProxy().PrimeCalculator::ArePrimeNumbers(SimpleMemory)._Started.0\ = \Hast::ExternalInvocationProxy().PrimeCalculator::ArePrimeNumbers(SimpleMemory)._Finished.0\) then 
                                \Hast::ExternalInvocationProxy().PrimeCalculator::ArePrimeNumbers(SimpleMemory)._Started.0\ <= false;
                                \FinishedInternal\ <= true;
                            end if;
                        when 3 => 
                            if (\Hast::ExternalInvocationProxy().PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory)._Started.0\ = false) then 
                                \Hast::ExternalInvocationProxy().PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory)._Started.0\ <= true;
                            elsif (\Hast::ExternalInvocationProxy().PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory)._Started.0\ = \Hast::ExternalInvocationProxy().PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory)._Finished.0\) then 
                                \Hast::ExternalInvocationProxy().PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory)._Started.0\ <= false;
                                \FinishedInternal\ <= true;
                            end if;
                        when others => 
                            null;
                    end case;
                else 
                    -- Waiting for Started to be pulled back to zero that signals the framework noting the finish.
                    if (\Started\ = false and \FinishedInternal\ = true) then 
                        \FinishedInternal\ <= false;
                    end if;
                end if;
            end if;
        end if;
    end process;
    -- System.Void Hast::ExternalInvocationProxy() end


    -- System.Void Hast::InternalInvocationProxy().System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator::IsPrimeNumberInternal(System.UInt32) start
    \Hast::InternalInvocationProxy().PrimeCalculator::IsPrimeNumberInternal(UInt32)\: process (\Clock\) 
        Variable \Hast::InternalInvocationProxy().PrimeCalculator::IsPrimeNumberInternal(UInt32).PrimeCalculator::IsPrimeNumber(SimpleMemory).0.runningIndex.0\: integer range 0 to 0 := 0;
        Variable \Hast::InternalInvocationProxy().PrimeCalculator::IsPrimeNumberInternal(UInt32).PrimeCalculator::IsPrimeNumber(SimpleMemory).0.runningState.0\: \Hast::InternalInvocationProxy()._RunningStates\ := WaitingForStarted;
        Variable \Hast::InternalInvocationProxy().PrimeCalculator::IsPrimeNumberInternal(UInt32).PrimeCalculator::ArePrimeNumbers(SimpleMemory).0.runningIndex.0\: integer range 0 to 0 := 0;
        Variable \Hast::InternalInvocationProxy().PrimeCalculator::IsPrimeNumberInternal(UInt32).PrimeCalculator::ArePrimeNumbers(SimpleMemory).0.runningState.0\: \Hast::InternalInvocationProxy()._RunningStates\ := WaitingForStarted;
    begin 
        if (rising_edge(\Clock\)) then 
            if (\Reset\ = '1') then 
                -- Synchronous reset
                \Hast::InternalInvocationProxy().PrimeCalculator::IsPrimeNumberInternal(UInt32).PrimeCalculator::IsPrimeNumber(SimpleMemory).0.runningIndex.0\ := 0;
                \Hast::InternalInvocationProxy().PrimeCalculator::IsPrimeNumberInternal(UInt32).PrimeCalculator::IsPrimeNumber(SimpleMemory).0.runningState.0\ := WaitingForStarted;
                \Hast::InternalInvocationProxy().PrimeCalculator::IsPrimeNumberInternal(UInt32).PrimeCalculator::ArePrimeNumbers(SimpleMemory).0.runningIndex.0\ := 0;
                \Hast::InternalInvocationProxy().PrimeCalculator::IsPrimeNumberInternal(UInt32).PrimeCalculator::ArePrimeNumbers(SimpleMemory).0.runningState.0\ := WaitingForStarted;
                \PrimeCalculator::IsPrimeNumber(SimpleMemory).0.PrimeCalculator::IsPrimeNumberInternal(UInt32)._Finished.0\ <= false;
                \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0.PrimeCalculator::IsPrimeNumberInternal(UInt32)._Finished.0\ <= false;
            else 

                -- Invocation handler #0 out of 1 corresponding to System.Void Hast.Samples.SampleAssembly.PrimeCalculator::IsPrimeNumber(Hast.Transformer.Abstractions.SimpleMemory.SimpleMemory).0
                case \Hast::InternalInvocationProxy().PrimeCalculator::IsPrimeNumberInternal(UInt32).PrimeCalculator::IsPrimeNumber(SimpleMemory).0.runningState.0\ is 
                    when WaitingForStarted => 
                        if (\PrimeCalculator::IsPrimeNumber(SimpleMemory).0.PrimeCalculator::IsPrimeNumberInternal(UInt32)._Started.0\) then 
                            \PrimeCalculator::IsPrimeNumber(SimpleMemory).0.PrimeCalculator::IsPrimeNumberInternal(UInt32)._Finished.0\ <= false;
                            \Hast::InternalInvocationProxy().PrimeCalculator::IsPrimeNumberInternal(UInt32).PrimeCalculator::IsPrimeNumber(SimpleMemory).0.runningState.0\ := WaitingForFinished;
                            \Hast::InternalInvocationProxy().PrimeCalculator::IsPrimeNumberInternal(UInt32).PrimeCalculator::IsPrimeNumber(SimpleMemory).0.runningIndex.0\ := 0;
                            \PrimeCalculator::IsPrimeNumberInternal(UInt32).0._Started\ <= true;
                            \PrimeCalculator::IsPrimeNumberInternal(UInt32).0.number.parameter.In\ <= \PrimeCalculator::IsPrimeNumber(SimpleMemory).0.PrimeCalculator::IsPrimeNumberInternal(UInt32).number.parameter.Out.0\;
                        end if;
                    when WaitingForFinished => 
                        case \Hast::InternalInvocationProxy().PrimeCalculator::IsPrimeNumberInternal(UInt32).PrimeCalculator::IsPrimeNumber(SimpleMemory).0.runningIndex.0\ is 
                            when 0 => 
                                if (\PrimeCalculator::IsPrimeNumberInternal(UInt32).0._Finished\) then 
                                    \Hast::InternalInvocationProxy().PrimeCalculator::IsPrimeNumberInternal(UInt32).PrimeCalculator::IsPrimeNumber(SimpleMemory).0.runningState.0\ := AfterFinished;
                                    \PrimeCalculator::IsPrimeNumber(SimpleMemory).0.PrimeCalculator::IsPrimeNumberInternal(UInt32)._Finished.0\ <= true;
                                    \PrimeCalculator::IsPrimeNumberInternal(UInt32).0._Started\ <= false;
                                    \PrimeCalculator::IsPrimeNumber(SimpleMemory).0.PrimeCalculator::IsPrimeNumberInternal(UInt32).return.0\ <= \PrimeCalculator::IsPrimeNumberInternal(UInt32).0.return\;
                                end if;
                        end case;
                    when AfterFinished => 
                        -- Invoking components need to pull down the Started signal to false.
                        if (\PrimeCalculator::IsPrimeNumber(SimpleMemory).0.PrimeCalculator::IsPrimeNumberInternal(UInt32)._Started.0\ = false) then 
                            \Hast::InternalInvocationProxy().PrimeCalculator::IsPrimeNumberInternal(UInt32).PrimeCalculator::IsPrimeNumber(SimpleMemory).0.runningState.0\ := WaitingForStarted;
                            \PrimeCalculator::IsPrimeNumber(SimpleMemory).0.PrimeCalculator::IsPrimeNumberInternal(UInt32)._Finished.0\ <= false;
                        end if;
                end case;


                -- Invocation handler #0 out of 1 corresponding to System.Void Hast.Samples.SampleAssembly.PrimeCalculator::ArePrimeNumbers(Hast.Transformer.Abstractions.SimpleMemory.SimpleMemory).0
                case \Hast::InternalInvocationProxy().PrimeCalculator::IsPrimeNumberInternal(UInt32).PrimeCalculator::ArePrimeNumbers(SimpleMemory).0.runningState.0\ is 
                    when WaitingForStarted => 
                        if (\PrimeCalculator::ArePrimeNumbers(SimpleMemory).0.PrimeCalculator::IsPrimeNumberInternal(UInt32)._Started.0\) then 
                            \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0.PrimeCalculator::IsPrimeNumberInternal(UInt32)._Finished.0\ <= false;
                            \Hast::InternalInvocationProxy().PrimeCalculator::IsPrimeNumberInternal(UInt32).PrimeCalculator::ArePrimeNumbers(SimpleMemory).0.runningState.0\ := WaitingForFinished;
                            \Hast::InternalInvocationProxy().PrimeCalculator::IsPrimeNumberInternal(UInt32).PrimeCalculator::ArePrimeNumbers(SimpleMemory).0.runningIndex.0\ := 0;
                            \PrimeCalculator::IsPrimeNumberInternal(UInt32).0._Started\ <= true;
                            \PrimeCalculator::IsPrimeNumberInternal(UInt32).0.number.parameter.In\ <= \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0.PrimeCalculator::IsPrimeNumberInternal(UInt32).number.parameter.Out.0\;
                        end if;
                    when WaitingForFinished => 
                        case \Hast::InternalInvocationProxy().PrimeCalculator::IsPrimeNumberInternal(UInt32).PrimeCalculator::ArePrimeNumbers(SimpleMemory).0.runningIndex.0\ is 
                            when 0 => 
                                if (\PrimeCalculator::IsPrimeNumberInternal(UInt32).0._Finished\) then 
                                    \Hast::InternalInvocationProxy().PrimeCalculator::IsPrimeNumberInternal(UInt32).PrimeCalculator::ArePrimeNumbers(SimpleMemory).0.runningState.0\ := AfterFinished;
                                    \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0.PrimeCalculator::IsPrimeNumberInternal(UInt32)._Finished.0\ <= true;
                                    \PrimeCalculator::IsPrimeNumberInternal(UInt32).0._Started\ <= false;
                                    \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0.PrimeCalculator::IsPrimeNumberInternal(UInt32).return.0\ <= \PrimeCalculator::IsPrimeNumberInternal(UInt32).0.return\;
                                end if;
                        end case;
                    when AfterFinished => 
                        -- Invoking components need to pull down the Started signal to false.
                        if (\PrimeCalculator::ArePrimeNumbers(SimpleMemory).0.PrimeCalculator::IsPrimeNumberInternal(UInt32)._Started.0\ = false) then 
                            \Hast::InternalInvocationProxy().PrimeCalculator::IsPrimeNumberInternal(UInt32).PrimeCalculator::ArePrimeNumbers(SimpleMemory).0.runningState.0\ := WaitingForStarted;
                            \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0.PrimeCalculator::IsPrimeNumberInternal(UInt32)._Finished.0\ <= false;
                        end if;
                end case;

            end if;
        end if;
    end process;
    -- System.Void Hast::InternalInvocationProxy().System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator::IsPrimeNumberInternal(System.UInt32) end


    -- System.Void Hast::InternalInvocationProxy().System.Void Hast.Samples.SampleAssembly.PrimeCalculator::IsPrimeNumber(Hast.Transformer.Abstractions.SimpleMemory.SimpleMemory) start
    \Hast::InternalInvocationProxy().PrimeCalculator::IsPrimeNumber(SimpleMemory)\: process (\Clock\) 
        Variable \Hast::InternalInvocationProxy().PrimeCalculator::IsPrimeNumber(SimpleMemory).PrimeCalculator::IsPrimeNumberAsync(SimpleMemory).0.runningIndex.0\: integer range 0 to 0 := 0;
        Variable \Hast::InternalInvocationProxy().PrimeCalculator::IsPrimeNumber(SimpleMemory).PrimeCalculator::IsPrimeNumberAsync(SimpleMemory).0.runningState.0\: \Hast::InternalInvocationProxy()._RunningStates\ := WaitingForStarted;
        Variable \Hast::InternalInvocationProxy().PrimeCalculator::IsPrimeNumber(SimpleMemory).Hast::ExternalInvocationProxy().runningIndex.0\: integer range 0 to 0 := 0;
        Variable \Hast::InternalInvocationProxy().PrimeCalculator::IsPrimeNumber(SimpleMemory).Hast::ExternalInvocationProxy().runningState.0\: \Hast::InternalInvocationProxy()._RunningStates\ := WaitingForStarted;
    begin 
        if (rising_edge(\Clock\)) then 
            if (\Reset\ = '1') then 
                -- Synchronous reset
                \Hast::InternalInvocationProxy().PrimeCalculator::IsPrimeNumber(SimpleMemory).PrimeCalculator::IsPrimeNumberAsync(SimpleMemory).0.runningIndex.0\ := 0;
                \Hast::InternalInvocationProxy().PrimeCalculator::IsPrimeNumber(SimpleMemory).PrimeCalculator::IsPrimeNumberAsync(SimpleMemory).0.runningState.0\ := WaitingForStarted;
                \Hast::InternalInvocationProxy().PrimeCalculator::IsPrimeNumber(SimpleMemory).Hast::ExternalInvocationProxy().runningIndex.0\ := 0;
                \Hast::InternalInvocationProxy().PrimeCalculator::IsPrimeNumber(SimpleMemory).Hast::ExternalInvocationProxy().runningState.0\ := WaitingForStarted;
                \PrimeCalculator::IsPrimeNumberAsync(SimpleMemory).0.PrimeCalculator::IsPrimeNumber(SimpleMemory)._Finished.0\ <= false;
                \Hast::ExternalInvocationProxy().PrimeCalculator::IsPrimeNumber(SimpleMemory)._Finished.0\ <= false;
            else 

                -- Invocation handler #0 out of 1 corresponding to System.Threading.Tasks.Task Hast.Samples.SampleAssembly.PrimeCalculator::IsPrimeNumberAsync(Hast.Transformer.Abstractions.SimpleMemory.SimpleMemory).0
                case \Hast::InternalInvocationProxy().PrimeCalculator::IsPrimeNumber(SimpleMemory).PrimeCalculator::IsPrimeNumberAsync(SimpleMemory).0.runningState.0\ is 
                    when WaitingForStarted => 
                        if (\PrimeCalculator::IsPrimeNumberAsync(SimpleMemory).0.PrimeCalculator::IsPrimeNumber(SimpleMemory)._Started.0\) then 
                            \PrimeCalculator::IsPrimeNumberAsync(SimpleMemory).0.PrimeCalculator::IsPrimeNumber(SimpleMemory)._Finished.0\ <= false;
                            \Hast::InternalInvocationProxy().PrimeCalculator::IsPrimeNumber(SimpleMemory).PrimeCalculator::IsPrimeNumberAsync(SimpleMemory).0.runningState.0\ := WaitingForFinished;
                            \Hast::InternalInvocationProxy().PrimeCalculator::IsPrimeNumber(SimpleMemory).PrimeCalculator::IsPrimeNumberAsync(SimpleMemory).0.runningIndex.0\ := 0;
                            \PrimeCalculator::IsPrimeNumber(SimpleMemory).0._Started\ <= true;
                        end if;
                    when WaitingForFinished => 
                        case \Hast::InternalInvocationProxy().PrimeCalculator::IsPrimeNumber(SimpleMemory).PrimeCalculator::IsPrimeNumberAsync(SimpleMemory).0.runningIndex.0\ is 
                            when 0 => 
                                if (\PrimeCalculator::IsPrimeNumber(SimpleMemory).0._Finished\) then 
                                    \Hast::InternalInvocationProxy().PrimeCalculator::IsPrimeNumber(SimpleMemory).PrimeCalculator::IsPrimeNumberAsync(SimpleMemory).0.runningState.0\ := AfterFinished;
                                    \PrimeCalculator::IsPrimeNumberAsync(SimpleMemory).0.PrimeCalculator::IsPrimeNumber(SimpleMemory)._Finished.0\ <= true;
                                    \PrimeCalculator::IsPrimeNumber(SimpleMemory).0._Started\ <= false;
                                end if;
                        end case;
                    when AfterFinished => 
                        -- Invoking components need to pull down the Started signal to false.
                        if (\PrimeCalculator::IsPrimeNumberAsync(SimpleMemory).0.PrimeCalculator::IsPrimeNumber(SimpleMemory)._Started.0\ = false) then 
                            \Hast::InternalInvocationProxy().PrimeCalculator::IsPrimeNumber(SimpleMemory).PrimeCalculator::IsPrimeNumberAsync(SimpleMemory).0.runningState.0\ := WaitingForStarted;
                            \PrimeCalculator::IsPrimeNumberAsync(SimpleMemory).0.PrimeCalculator::IsPrimeNumber(SimpleMemory)._Finished.0\ <= false;
                        end if;
                end case;


                -- Invocation handler #0 out of 1 corresponding to System.Void Hast::ExternalInvocationProxy()
                case \Hast::InternalInvocationProxy().PrimeCalculator::IsPrimeNumber(SimpleMemory).Hast::ExternalInvocationProxy().runningState.0\ is 
                    when WaitingForStarted => 
                        if (\Hast::ExternalInvocationProxy().PrimeCalculator::IsPrimeNumber(SimpleMemory)._Started.0\) then 
                            \Hast::ExternalInvocationProxy().PrimeCalculator::IsPrimeNumber(SimpleMemory)._Finished.0\ <= false;
                            \Hast::InternalInvocationProxy().PrimeCalculator::IsPrimeNumber(SimpleMemory).Hast::ExternalInvocationProxy().runningState.0\ := WaitingForFinished;
                            \Hast::InternalInvocationProxy().PrimeCalculator::IsPrimeNumber(SimpleMemory).Hast::ExternalInvocationProxy().runningIndex.0\ := 0;
                            \PrimeCalculator::IsPrimeNumber(SimpleMemory).0._Started\ <= true;
                        end if;
                    when WaitingForFinished => 
                        case \Hast::InternalInvocationProxy().PrimeCalculator::IsPrimeNumber(SimpleMemory).Hast::ExternalInvocationProxy().runningIndex.0\ is 
                            when 0 => 
                                if (\PrimeCalculator::IsPrimeNumber(SimpleMemory).0._Finished\) then 
                                    \Hast::InternalInvocationProxy().PrimeCalculator::IsPrimeNumber(SimpleMemory).Hast::ExternalInvocationProxy().runningState.0\ := AfterFinished;
                                    \Hast::ExternalInvocationProxy().PrimeCalculator::IsPrimeNumber(SimpleMemory)._Finished.0\ <= true;
                                    \PrimeCalculator::IsPrimeNumber(SimpleMemory).0._Started\ <= false;
                                end if;
                        end case;
                    when AfterFinished => 
                        -- Invoking components need to pull down the Started signal to false.
                        if (\Hast::ExternalInvocationProxy().PrimeCalculator::IsPrimeNumber(SimpleMemory)._Started.0\ = false) then 
                            \Hast::InternalInvocationProxy().PrimeCalculator::IsPrimeNumber(SimpleMemory).Hast::ExternalInvocationProxy().runningState.0\ := WaitingForStarted;
                            \Hast::ExternalInvocationProxy().PrimeCalculator::IsPrimeNumber(SimpleMemory)._Finished.0\ <= false;
                        end if;
                end case;

            end if;
        end if;
    end process;
    -- System.Void Hast::InternalInvocationProxy().System.Void Hast.Samples.SampleAssembly.PrimeCalculator::IsPrimeNumber(Hast.Transformer.Abstractions.SimpleMemory.SimpleMemory) end


    -- System.Void Hast::InternalInvocationProxy().System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(System.UInt32) start
    -- Signal connections for System.Void Hast.Samples.SampleAssembly.PrimeCalculator::ParallelizedArePrimeNumbers(Hast.Transformer.Abstractions.SimpleMemory.SimpleMemory).0 (#0):
    \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0._Started\ <= \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.0\;
    \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0.numberObject.parameter.In\ <= \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).numberObject.parameter.Out.0\;
    \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Finished.0\ <= \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0._Finished\;
    \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).return.0\ <= \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).0.return\;
    -- Signal connections for System.Void Hast.Samples.SampleAssembly.PrimeCalculator::ParallelizedArePrimeNumbers(Hast.Transformer.Abstractions.SimpleMemory.SimpleMemory).0 (#1):
    \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1._Started\ <= \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.1\;
    \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1.numberObject.parameter.In\ <= \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).numberObject.parameter.Out.1\;
    \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Finished.1\ <= \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1._Finished\;
    \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).return.1\ <= \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).1.return\;
    -- Signal connections for System.Void Hast.Samples.SampleAssembly.PrimeCalculator::ParallelizedArePrimeNumbers(Hast.Transformer.Abstractions.SimpleMemory.SimpleMemory).0 (#2):
    \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2._Started\ <= \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.2\;
    \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2.numberObject.parameter.In\ <= \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).numberObject.parameter.Out.2\;
    \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Finished.2\ <= \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2._Finished\;
    \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).return.2\ <= \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).2.return\;
    -- Signal connections for System.Void Hast.Samples.SampleAssembly.PrimeCalculator::ParallelizedArePrimeNumbers(Hast.Transformer.Abstractions.SimpleMemory.SimpleMemory).0 (#3):
    \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3._Started\ <= \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.3\;
    \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3.numberObject.parameter.In\ <= \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).numberObject.parameter.Out.3\;
    \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Finished.3\ <= \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3._Finished\;
    \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).return.3\ <= \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).3.return\;
    -- Signal connections for System.Void Hast.Samples.SampleAssembly.PrimeCalculator::ParallelizedArePrimeNumbers(Hast.Transformer.Abstractions.SimpleMemory.SimpleMemory).0 (#4):
    \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4._Started\ <= \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.4\;
    \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4.numberObject.parameter.In\ <= \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).numberObject.parameter.Out.4\;
    \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Finished.4\ <= \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4._Finished\;
    \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).return.4\ <= \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).4.return\;
    -- Signal connections for System.Void Hast.Samples.SampleAssembly.PrimeCalculator::ParallelizedArePrimeNumbers(Hast.Transformer.Abstractions.SimpleMemory.SimpleMemory).0 (#5):
    \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5._Started\ <= \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.5\;
    \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5.numberObject.parameter.In\ <= \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).numberObject.parameter.Out.5\;
    \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Finished.5\ <= \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5._Finished\;
    \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).return.5\ <= \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).5.return\;
    -- Signal connections for System.Void Hast.Samples.SampleAssembly.PrimeCalculator::ParallelizedArePrimeNumbers(Hast.Transformer.Abstractions.SimpleMemory.SimpleMemory).0 (#6):
    \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6._Started\ <= \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.6\;
    \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6.numberObject.parameter.In\ <= \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).numberObject.parameter.Out.6\;
    \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Finished.6\ <= \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6._Finished\;
    \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).return.6\ <= \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).6.return\;
    -- Signal connections for System.Void Hast.Samples.SampleAssembly.PrimeCalculator::ParallelizedArePrimeNumbers(Hast.Transformer.Abstractions.SimpleMemory.SimpleMemory).0 (#7):
    \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7._Started\ <= \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.7\;
    \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7.numberObject.parameter.In\ <= \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).numberObject.parameter.Out.7\;
    \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Finished.7\ <= \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7._Finished\;
    \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).return.7\ <= \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).7.return\;
    -- Signal connections for System.Void Hast.Samples.SampleAssembly.PrimeCalculator::ParallelizedArePrimeNumbers(Hast.Transformer.Abstractions.SimpleMemory.SimpleMemory).0 (#8):
    \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8._Started\ <= \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.8\;
    \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8.numberObject.parameter.In\ <= \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).numberObject.parameter.Out.8\;
    \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Finished.8\ <= \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8._Finished\;
    \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).return.8\ <= \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).8.return\;
    -- Signal connections for System.Void Hast.Samples.SampleAssembly.PrimeCalculator::ParallelizedArePrimeNumbers(Hast.Transformer.Abstractions.SimpleMemory.SimpleMemory).0 (#9):
    \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9._Started\ <= \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.9\;
    \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9.numberObject.parameter.In\ <= \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).numberObject.parameter.Out.9\;
    \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Finished.9\ <= \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9._Finished\;
    \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).return.9\ <= \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).9.return\;
    -- Signal connections for System.Void Hast.Samples.SampleAssembly.PrimeCalculator::ParallelizedArePrimeNumbers(Hast.Transformer.Abstractions.SimpleMemory.SimpleMemory).0 (#10):
    \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10._Started\ <= \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.10\;
    \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10.numberObject.parameter.In\ <= \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).numberObject.parameter.Out.10\;
    \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Finished.10\ <= \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10._Finished\;
    \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).return.10\ <= \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).10.return\;
    -- Signal connections for System.Void Hast.Samples.SampleAssembly.PrimeCalculator::ParallelizedArePrimeNumbers(Hast.Transformer.Abstractions.SimpleMemory.SimpleMemory).0 (#11):
    \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11._Started\ <= \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.11\;
    \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11.numberObject.parameter.In\ <= \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).numberObject.parameter.Out.11\;
    \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Finished.11\ <= \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11._Finished\;
    \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).return.11\ <= \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).11.return\;
    -- Signal connections for System.Void Hast.Samples.SampleAssembly.PrimeCalculator::ParallelizedArePrimeNumbers(Hast.Transformer.Abstractions.SimpleMemory.SimpleMemory).0 (#12):
    \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12._Started\ <= \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.12\;
    \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12.numberObject.parameter.In\ <= \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).numberObject.parameter.Out.12\;
    \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Finished.12\ <= \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12._Finished\;
    \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).return.12\ <= \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).12.return\;
    -- Signal connections for System.Void Hast.Samples.SampleAssembly.PrimeCalculator::ParallelizedArePrimeNumbers(Hast.Transformer.Abstractions.SimpleMemory.SimpleMemory).0 (#13):
    \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13._Started\ <= \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.13\;
    \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13.numberObject.parameter.In\ <= \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).numberObject.parameter.Out.13\;
    \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Finished.13\ <= \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13._Finished\;
    \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).return.13\ <= \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).13.return\;
    -- Signal connections for System.Void Hast.Samples.SampleAssembly.PrimeCalculator::ParallelizedArePrimeNumbers(Hast.Transformer.Abstractions.SimpleMemory.SimpleMemory).0 (#14):
    \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14._Started\ <= \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.14\;
    \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14.numberObject.parameter.In\ <= \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).numberObject.parameter.Out.14\;
    \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Finished.14\ <= \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14._Finished\;
    \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).return.14\ <= \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).14.return\;
    -- Signal connections for System.Void Hast.Samples.SampleAssembly.PrimeCalculator::ParallelizedArePrimeNumbers(Hast.Transformer.Abstractions.SimpleMemory.SimpleMemory).0 (#15):
    \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15._Started\ <= \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.15\;
    \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15.numberObject.parameter.In\ <= \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).numberObject.parameter.Out.15\;
    \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Finished.15\ <= \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15._Finished\;
    \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).return.15\ <= \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).15.return\;
    -- Signal connections for System.Void Hast.Samples.SampleAssembly.PrimeCalculator::ParallelizedArePrimeNumbers(Hast.Transformer.Abstractions.SimpleMemory.SimpleMemory).0 (#16):
    \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16._Started\ <= \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.16\;
    \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16.numberObject.parameter.In\ <= \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).numberObject.parameter.Out.16\;
    \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Finished.16\ <= \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16._Finished\;
    \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).return.16\ <= \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).16.return\;
    -- Signal connections for System.Void Hast.Samples.SampleAssembly.PrimeCalculator::ParallelizedArePrimeNumbers(Hast.Transformer.Abstractions.SimpleMemory.SimpleMemory).0 (#17):
    \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17._Started\ <= \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.17\;
    \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17.numberObject.parameter.In\ <= \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).numberObject.parameter.Out.17\;
    \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Finished.17\ <= \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17._Finished\;
    \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).return.17\ <= \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).17.return\;
    -- Signal connections for System.Void Hast.Samples.SampleAssembly.PrimeCalculator::ParallelizedArePrimeNumbers(Hast.Transformer.Abstractions.SimpleMemory.SimpleMemory).0 (#18):
    \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18._Started\ <= \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.18\;
    \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18.numberObject.parameter.In\ <= \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).numberObject.parameter.Out.18\;
    \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Finished.18\ <= \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18._Finished\;
    \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).return.18\ <= \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).18.return\;
    -- Signal connections for System.Void Hast.Samples.SampleAssembly.PrimeCalculator::ParallelizedArePrimeNumbers(Hast.Transformer.Abstractions.SimpleMemory.SimpleMemory).0 (#19):
    \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19._Started\ <= \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.19\;
    \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19.numberObject.parameter.In\ <= \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).numberObject.parameter.Out.19\;
    \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Finished.19\ <= \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19._Finished\;
    \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).return.19\ <= \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).19.return\;
    -- Signal connections for System.Void Hast.Samples.SampleAssembly.PrimeCalculator::ParallelizedArePrimeNumbers(Hast.Transformer.Abstractions.SimpleMemory.SimpleMemory).0 (#20):
    \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20._Started\ <= \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.20\;
    \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20.numberObject.parameter.In\ <= \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).numberObject.parameter.Out.20\;
    \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Finished.20\ <= \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20._Finished\;
    \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).return.20\ <= \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).20.return\;
    -- Signal connections for System.Void Hast.Samples.SampleAssembly.PrimeCalculator::ParallelizedArePrimeNumbers(Hast.Transformer.Abstractions.SimpleMemory.SimpleMemory).0 (#21):
    \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21._Started\ <= \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.21\;
    \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21.numberObject.parameter.In\ <= \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).numberObject.parameter.Out.21\;
    \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Finished.21\ <= \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21._Finished\;
    \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).return.21\ <= \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).21.return\;
    -- Signal connections for System.Void Hast.Samples.SampleAssembly.PrimeCalculator::ParallelizedArePrimeNumbers(Hast.Transformer.Abstractions.SimpleMemory.SimpleMemory).0 (#22):
    \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22._Started\ <= \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.22\;
    \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22.numberObject.parameter.In\ <= \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).numberObject.parameter.Out.22\;
    \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Finished.22\ <= \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22._Finished\;
    \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).return.22\ <= \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).22.return\;
    -- Signal connections for System.Void Hast.Samples.SampleAssembly.PrimeCalculator::ParallelizedArePrimeNumbers(Hast.Transformer.Abstractions.SimpleMemory.SimpleMemory).0 (#23):
    \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23._Started\ <= \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.23\;
    \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23.numberObject.parameter.In\ <= \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).numberObject.parameter.Out.23\;
    \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Finished.23\ <= \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23._Finished\;
    \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).return.23\ <= \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).23.return\;
    -- Signal connections for System.Void Hast.Samples.SampleAssembly.PrimeCalculator::ParallelizedArePrimeNumbers(Hast.Transformer.Abstractions.SimpleMemory.SimpleMemory).0 (#24):
    \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24._Started\ <= \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.24\;
    \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24.numberObject.parameter.In\ <= \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).numberObject.parameter.Out.24\;
    \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Finished.24\ <= \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24._Finished\;
    \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).return.24\ <= \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).24.return\;
    -- Signal connections for System.Void Hast.Samples.SampleAssembly.PrimeCalculator::ParallelizedArePrimeNumbers(Hast.Transformer.Abstractions.SimpleMemory.SimpleMemory).0 (#25):
    \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25._Started\ <= \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.25\;
    \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25.numberObject.parameter.In\ <= \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).numberObject.parameter.Out.25\;
    \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Finished.25\ <= \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25._Finished\;
    \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).return.25\ <= \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).25.return\;
    -- Signal connections for System.Void Hast.Samples.SampleAssembly.PrimeCalculator::ParallelizedArePrimeNumbers(Hast.Transformer.Abstractions.SimpleMemory.SimpleMemory).0 (#26):
    \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26._Started\ <= \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.26\;
    \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26.numberObject.parameter.In\ <= \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).numberObject.parameter.Out.26\;
    \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Finished.26\ <= \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26._Finished\;
    \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).return.26\ <= \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).26.return\;
    -- Signal connections for System.Void Hast.Samples.SampleAssembly.PrimeCalculator::ParallelizedArePrimeNumbers(Hast.Transformer.Abstractions.SimpleMemory.SimpleMemory).0 (#27):
    \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27._Started\ <= \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.27\;
    \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27.numberObject.parameter.In\ <= \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).numberObject.parameter.Out.27\;
    \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Finished.27\ <= \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27._Finished\;
    \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).return.27\ <= \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).27.return\;
    -- Signal connections for System.Void Hast.Samples.SampleAssembly.PrimeCalculator::ParallelizedArePrimeNumbers(Hast.Transformer.Abstractions.SimpleMemory.SimpleMemory).0 (#28):
    \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28._Started\ <= \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.28\;
    \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28.numberObject.parameter.In\ <= \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).numberObject.parameter.Out.28\;
    \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Finished.28\ <= \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28._Finished\;
    \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).return.28\ <= \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).28.return\;
    -- Signal connections for System.Void Hast.Samples.SampleAssembly.PrimeCalculator::ParallelizedArePrimeNumbers(Hast.Transformer.Abstractions.SimpleMemory.SimpleMemory).0 (#29):
    \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29._Started\ <= \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Started.29\;
    \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29.numberObject.parameter.In\ <= \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).numberObject.parameter.Out.29\;
    \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32)._Finished.29\ <= \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29._Finished\;
    \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).return.29\ <= \PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(UInt32).29.return\;
    -- System.Void Hast::InternalInvocationProxy().System.Boolean Hast.Samples.SampleAssembly.PrimeCalculator/<>c::<ParallelizedArePrimeNumbers>b__9_0(System.UInt32) end


    -- System.Void Hast::InternalInvocationProxy().System.Threading.Tasks.Task Hast.Samples.SampleAssembly.PrimeCalculator::IsPrimeNumberAsync(Hast.Transformer.Abstractions.SimpleMemory.SimpleMemory) start
    -- Signal connections for System.Void Hast::ExternalInvocationProxy() (#0):
    \PrimeCalculator::IsPrimeNumberAsync(SimpleMemory).0._Started\ <= \Hast::ExternalInvocationProxy().PrimeCalculator::IsPrimeNumberAsync(SimpleMemory)._Started.0\;
    \Hast::ExternalInvocationProxy().PrimeCalculator::IsPrimeNumberAsync(SimpleMemory)._Finished.0\ <= \PrimeCalculator::IsPrimeNumberAsync(SimpleMemory).0._Finished\;
    -- System.Void Hast::InternalInvocationProxy().System.Threading.Tasks.Task Hast.Samples.SampleAssembly.PrimeCalculator::IsPrimeNumberAsync(Hast.Transformer.Abstractions.SimpleMemory.SimpleMemory) end


    -- System.Void Hast::InternalInvocationProxy().System.Void Hast.Samples.SampleAssembly.PrimeCalculator::ArePrimeNumbers(Hast.Transformer.Abstractions.SimpleMemory.SimpleMemory) start
    -- Signal connections for System.Void Hast::ExternalInvocationProxy() (#0):
    \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0._Started\ <= \Hast::ExternalInvocationProxy().PrimeCalculator::ArePrimeNumbers(SimpleMemory)._Started.0\;
    \Hast::ExternalInvocationProxy().PrimeCalculator::ArePrimeNumbers(SimpleMemory)._Finished.0\ <= \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0._Finished\;
    -- System.Void Hast::InternalInvocationProxy().System.Void Hast.Samples.SampleAssembly.PrimeCalculator::ArePrimeNumbers(Hast.Transformer.Abstractions.SimpleMemory.SimpleMemory) end


    -- System.Void Hast::InternalInvocationProxy().System.Void Hast.Samples.SampleAssembly.PrimeCalculator::ParallelizedArePrimeNumbers(Hast.Transformer.Abstractions.SimpleMemory.SimpleMemory) start
    -- Signal connections for System.Void Hast::ExternalInvocationProxy() (#0):
    \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0._Started\ <= \Hast::ExternalInvocationProxy().PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory)._Started.0\;
    \Hast::ExternalInvocationProxy().PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory)._Finished.0\ <= \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0._Finished\;
    -- System.Void Hast::InternalInvocationProxy().System.Void Hast.Samples.SampleAssembly.PrimeCalculator::ParallelizedArePrimeNumbers(Hast.Transformer.Abstractions.SimpleMemory.SimpleMemory) end


    -- System.Void Hast::SimpleMemoryOperationProxy() start
    \CellIndex\ <= to_integer(\PrimeCalculator::IsPrimeNumber(SimpleMemory).0.SimpleMemory.CellIndex\) when \PrimeCalculator::IsPrimeNumber(SimpleMemory).0.SimpleMemory.ReadEnable\ or \PrimeCalculator::IsPrimeNumber(SimpleMemory).0.SimpleMemory.WriteEnable\ else to_integer(\PrimeCalculator::ArePrimeNumbers(SimpleMemory).0.SimpleMemory.CellIndex\) when \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0.SimpleMemory.ReadEnable\ or \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0.SimpleMemory.WriteEnable\ else to_integer(\PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.SimpleMemory.CellIndex\) when \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.SimpleMemory.ReadEnable\ or \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.SimpleMemory.WriteEnable\ else 0;
    \DataOut\ <= \PrimeCalculator::IsPrimeNumber(SimpleMemory).0.SimpleMemory.DataOut\ when \PrimeCalculator::IsPrimeNumber(SimpleMemory).0.SimpleMemory.WriteEnable\ else \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0.SimpleMemory.DataOut\ when \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0.SimpleMemory.WriteEnable\ else \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.SimpleMemory.DataOut\ when \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.SimpleMemory.WriteEnable\ else "00000000000000000000000000000000";
    \ReadEnable\ <= \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0.SimpleMemory.ReadEnable\ or \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.SimpleMemory.ReadEnable\ or \PrimeCalculator::IsPrimeNumber(SimpleMemory).0.SimpleMemory.ReadEnable\;
    \WriteEnable\ <= \PrimeCalculator::ArePrimeNumbers(SimpleMemory).0.SimpleMemory.WriteEnable\ or \PrimeCalculator::ParallelizedArePrimeNumbers(SimpleMemory).0.SimpleMemory.WriteEnable\ or \PrimeCalculator::IsPrimeNumber(SimpleMemory).0.SimpleMemory.WriteEnable\;
    -- System.Void Hast::SimpleMemoryOperationProxy() end

end Imp;
