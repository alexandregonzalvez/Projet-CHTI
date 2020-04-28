#include "gfssp72.h"

int m2k(int k, u16 * tabSig);

extern u16 TabSig;

unsigned short int dma_buf[64];

unsigned int SYSTICK_PER = 360000;

void sys_callback();

// occurences de tir
int occurences[6];

// score des joueurs
int scores[6];

// seuil de d�tection du tir
int M2TIR = 1000000;

int main(void)
{
    //m2k(24, &TabSig);
      
		// activation de la PLL qui multiplie la fr�quence du quartz par 9
		CLOCK_Configure();
		// PA2 (ADC voie 2) = entr�e analog
		GPIO_Configure(GPIOA, 2, INPUT, ANALOG);
		// PB1 = sortie pour profilage � l'oscillo
		GPIO_Configure(GPIOB, 1, OUTPUT, OUTPUT_PPULL);
		// PB14 = sortie pour LED
		GPIO_Configure(GPIOB, 14, OUTPUT, OUTPUT_PPULL);

		// activation ADC, sampling time 1us
		Init_TimingADC_ActiveADC_ff( ADC1, 0x43 ); //51
		Single_Channel_ADC( ADC1, 2 );
		// D�clenchement ADC par timer2, periode (72MHz/320kHz)ticks
		Init_Conversion_On_Trig_Timer_ff( ADC1, TIM2_CC2, 225 );
		// Config DMA pour utilisation du buffer dma_buf (a cr��r)
		Init_ADC1_DMA1( 0, dma_buf );

		// Config Timer, p�riode exprim�e en p�riodes horloge CPU (72 MHz)
		Systick_Period_ff( SYSTICK_PER );
		// enregistrement de la fonction de traitement de l'interruption timer
		// ici le 3 est la priorit�, sys_callback est l'adresse de cette fonction, a cr��r en C
		Systick_Prio_IT( 3, sys_callback );
		SysTick_On;
		SysTick_Enable_IT;
  
    while(1)
        {
        }
}

void sys_callback(){
	// D�marrage DMA pour 64 points
	Start_DMA1(64);
	Wait_On_End_Of_DMA1();
	Stop_DMA1;
	
	int m2ksig1_1 = m2k(17 , dma_buf);
	int m2ksig1_2 = m2k(18 , dma_buf);
	int m2ksig1_3 = m2k(19 , dma_buf);
	int m2ksig1_4 = m2k(20 , dma_buf);
	int m2ksig1_5 = m2k(23 , dma_buf);
	int m2ksig2 = m2k(24 , dma_buf);
	
	if (m2ksig1_1 > M2TIR){
		occurences[0]++;
	}
	if (m2ksig1_2 > M2TIR){
		occurences[1]++;
	}	
	if (m2ksig1_3 > M2TIR){
		occurences[2]++;
	}	
	if (m2ksig1_4 > M2TIR){
		occurences[3]++;
	}	
	if (m2ksig1_5 > M2TIR){
		occurences[4]++;
	}	
	if (m2ksig2 > M2TIR){
		occurences[5]++;
	}
	
	for (int i = 0; i < 6; i++){
		if (occurences[i] > 18){
			occurences[i] = 0;
			scores[i] ++;
		}
			
	}
	
}
