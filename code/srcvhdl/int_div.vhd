--//**-----------------文件信息---------------------------------
--//**文   件   名:  int_div.vhd
--//**创   建   人:  
--//**最后修改日期:  
--//**描        述:  分频电路
--//**               
--//*------------------当前版本修订------------------------------
--//** 修改人: 
--//** 日　期:
--//** 描　述:此为任意分频模块
--//** 当为奇数倍分频时,输出的波形为对称方波,
--//** 奇数倍分频要比偶数倍分频复杂，实现奇数倍分频的方法不是惟一的，但最简单的是错位"异或"法(即相同时取"0",相反时取"1")
--//**-----------------------------------------------------------
--//**************************************************************-/
LIBRARY IEEE;                      
USE IEEE.STD_LOGIC_1164.ALL; --这3个程序包足发应付大部分的VHDL程序设计
USE IEEE.STD_LOGIC_Arith.ALL;
USE IEEE.STD_LOGIC_Unsigned.ALL;

ENTITY int_div IS              
GENERIC(N:Integer:=3);--此处定义了一个默认值N＝3，即电路为3分频电路;
Port
(Clockin:IN STD_LOGIC;
ClockOut:OUT STD_LOGIC           
);
END;


ARCHITECTURE Devider OF int_div IS
SIGNAL Counter:Integer RANGE 0 TO N-1;     
SIGNAL Temp1,Temp2:STD_LOGIC;		   --信号的声明在结构体内，进程外部
BEGIN
	PROCESS(Clockin)
BEGIN 
IF RISING_EDGE(Clockin) THEN 
	IF Counter=N-1 THEN
		counter<=0;
		Temp1<=Not Temp1;
	ELSE
		Counter<=Counter+1;
	END IF;
END IF;

IF falling_edge(clockin)	THEN
	IF Counter=N/2 THEN
		Temp2<=NOT Temp2;
	END IF;
END IF;
END PROCESS;
ClockOut<=Temp1 XOR Temp2;
END;