#include "led.h"
#include "delay.h"
#include "key.h"
#include "sys.h"
#include "usart.h"
#include "timer.h"
#include "exti.h"
 
/************************************************
 ALIENTEKս��STM32������ʵ��9
 PWM���ʵ��  
 ����֧�֣�www.openedv.com
 �Ա����̣�http://eboard.taobao.com 
 ��ע΢�Ź���ƽ̨΢�źţ�"����ԭ��"����ѻ�ȡSTM32���ϡ�
 ������������ӿƼ����޹�˾  
 ���ߣ�����ԭ�� @ALIENTEK
************************************************/

u16 pwm=1951;//1951�߽�

 int main(void)
 {
		delay_init();	    	 	//��ʱ������ʼ��	  
		NVIC_PriorityGroupConfig(NVIC_PriorityGroup_2); 	 //����NVIC�жϷ���2:2λ��ռ���ȼ���2λ��Ӧ���ȼ�
		uart_init(115200);	 	//���ڳ�ʼ��Ϊ115200
		LED_Init();			     	//LED�˿ڳ�ʼ��
   	BEEP_Init();         	//��ʼ���������˿�
		TIM3_PWM_Init(1999,719);	//����Ƶ��PWM����=2000*720/72000000=20ms��720��ʾ��ʱ��Ƶ�ʷ�Ƶ��100khz,Ϊ0.1ms����һ��
    TIM2_Int_Init(39999,7199); //��ʱ6��
		 
		KEY_Init();         	//��ʼ���밴�����ӵ�Ӳ���ӿ�
		EXTIX_Init();		 			//�ⲿ�жϳ�ʼ��
   	while(1)
		{
      BEEP=0;
			delay_ms(200);   
			TIM_SetCompare2(TIM3,pwm); 
      delay_ms(200);
            
		}	 
 }

