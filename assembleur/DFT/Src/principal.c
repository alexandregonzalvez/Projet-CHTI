#include "gassp72.h"

float somme(int index);

int m2k(int k, u16 * tabSig);

extern u16 TabSig;

int main(void)
{
	/*
	float min = 10.0;
	float max = 0.0;
	
	for (int i = 0; i < 63; i++) {
		float s = somme(i);
		if (s > max) {
			max = s;
		} else if (s < min) {
			min = s;
		}
	}*/	
	
	m2k(1, &TabSig);
	
	
	while	(1)
		{
		}
}
