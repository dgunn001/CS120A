-- Vhdl test bench created from schematic C:\CS\CS120 Labs\ee120a_L2P1_sprinkler_valve_controller\sprinkler_circuit.sch - Wed Apr 10 19:22:27 2019
--
-- Notes: 
-- 1) This testbench template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the unit under test.
-- Xilinx recommends that these types always be used for the top-level
-- I/O of a design in order to guarantee that the testbench will bind
-- correctly to the timing (post-route) simulation model.
-- 2) To use this template as your testbench, change the filename to any
-- name of your choice with the extension .vhd, and use the "Source->Add"
-- menu in Project Navigator to import the testbench. Then
-- edit the user defined section below, adding code to generate the 
-- stimulus for your design.
--
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
LIBRARY UNISIM;
USE UNISIM.Vcomponents.ALL;
ENTITY sprinkler_circuit_sprinkler_circuit_sch_tb IS
END sprinkler_circuit_sprinkler_circuit_sch_tb;
ARCHITECTURE behavioral OF sprinkler_circuit_sprinkler_circuit_sch_tb IS 

   COMPONENT sprinkler_circuit
   PORT( A	:	IN	STD_LOGIC; 
          C	:	IN	STD_LOGIC; 
          B	:	IN	STD_LOGIC; 
          Enable	:	IN	STD_LOGIC; 
          D0	:	OUT	STD_LOGIC; 
          D1	:	OUT	STD_LOGIC; 
          D2	:	OUT	STD_LOGIC; 
          D3	:	OUT	STD_LOGIC; 
          D4	:	OUT	STD_LOGIC; 
          D5	:	OUT	STD_LOGIC; 
          D6	:	OUT	STD_LOGIC; 
          D7	:	OUT	STD_LOGIC);
   END COMPONENT;

   SIGNAL A	:	STD_LOGIC;
   SIGNAL C	:	STD_LOGIC;
   SIGNAL B	:	STD_LOGIC;
   SIGNAL Enable	:	STD_LOGIC;
   SIGNAL D0	:	STD_LOGIC;
   SIGNAL D1	:	STD_LOGIC;
   SIGNAL D2	:	STD_LOGIC;
   SIGNAL D3	:	STD_LOGIC;
   SIGNAL D4	:	STD_LOGIC;
   SIGNAL D5	:	STD_LOGIC;
   SIGNAL D6	:	STD_LOGIC;
   SIGNAL D7	:	STD_LOGIC;

BEGIN

   UUT: sprinkler_circuit PORT MAP(
		A => A, 
		C => C, 
		B => B, 
		Enable => Enable, 
		D0 => D0, 
		D1 => D1, 
		D2 => D2, 
		D3 => D3, 
		D4 => D4, 
		D5 => D5, 
		D6 => D6, 
		D7 => D7
   );

-- *** Test Bench - User Defined Section ***
   tb : PROCESS
   BEGIN
      WAIT; -- will wait forever
   END PROCESS;
-- *** End Test Bench - User Defined Section ***

END;
