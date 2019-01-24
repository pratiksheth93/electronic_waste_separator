#include <REGX51.H>	// standard 8051 defines
#include <stdio.h> // printf


sbit RELAY1=P3^4;
sbit RELAY2=P3^3;

// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
// -=-=-=-=-  Main Program     -=-=-=-=-=-=-=
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
void main()
{

	lcdInit();
	serial_initialize();
	timer0_initialize();

	RELAY1=0;
	RELAY2=0;

	BUZZER = 0;

	counter = 0;	

// -=-=- Welcome LCD Message -=-=-=
	lcdClear();
	lcdGotoXY(0,0);	 // 1st Line of LCD
	//       "xxxxxxxxxxxxxxxx"
	lcdPrint("SHAPE DETECTION");
	lcdGotoXY(0,1);	 // 2nd Line of LCD
	//       "xxxxxxxxxxxxxxxx"
	lcdPrint("SYSTEM");
	delayms(2000); // 2 sec 

	lcdClear();
	lcdPrint("Welcome BY .");
// -=-=- Program Loop -=-=-=
	while(1)
	{
		c=mygetchar();
				switch(lastc)
				{
					case '1`':
						RELAY1=1;
						lcdClear();
						lcdPrint("CIRCULAR SHAPE");
					break;
					case '2':
						RELAY1=0;
						lcdClear();
						lcdPrint("SQUARE SHAPE");
					break;	
				}
			}
		lastc=c;
	}
}