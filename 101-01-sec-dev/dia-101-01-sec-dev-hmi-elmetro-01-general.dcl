///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_101_01_secondary_device_elmetro: dialog {label = "";

:row {label="";
  :column {
    :text {label="Модель";}
    :text {label="";}
    :list_box {key="txt-01"; list=""; width=30; height=10;}//list_box
  }//column

  :column {
    :text {label="Слот 1";}
    :text {label="";}
    :list_box {key="txt-02"; list=""; width=8; height=10;}//list_box
  }//column

  :column {  
    :text {label="Слот 2";}
    :text {label="";}
    :list_box {key="txt-03"; list=""; width=8; height=10;}//list_box  
  }//column

  :column {  
    :text {label="Слот 3";}
    :text {label="";}
    :list_box {key="txt-04"; list=""; width=8; height=10;}//list_box
	}//column

  :column {	
    :text {label="Слот 4";}
    :text {label="";}
    :list_box {key="txt-05"; list=""; width=8; height=10;}//list_box  
	}//column

  :column {	
    :text {label="Слот 5";}
    :text {label="";}
    :list_box {key="txt-06"; list=""; width=8; height=10;}//list_box
	}//column

  :column {	 
    :text {label="Слот 6";}
    :text {label="";}
    :list_box {key="txt-07"; list=""; width=8; height=10;}//list_box 
  }//column

  :column {
    :text {label="Интерфейс";}
    :text {label="";}
    :list_box {key="txt-08"; list=""; width=26; height=10;}//list_box
  }//column

  :column {
    :text {label="Температурн.";}
    :text {label="исполнен., °С";}
    :list_box {key="txt-09"; list=""; width=10; height=10;}//list_box
  }//column

  :column {
    :text {label="Наработка";}
    :text {label="на отказ";}
    :list_box {key="txt-10"; list=""; width=6; height=10;}//list_box
  }//column

  :column {
    :text {label="Компенс.";}
    :text {label="хол. спая";}
    :list_box {key="txt-11"; list=""; width=6; height=10;}//list_box
  }//column

  :column {
    :text {label="Гос.";}
    :text {label="поверка";}
    :list_box {key="txt-12"; list=""; width=10; height=10;}//list_box
  }//column  
}//row

:row {label="";
	:column {
		:text {label=""; key="ptxt-01"; value="4АВ - 4 универсальных аналоговых входа (U, I, R, термопара, теромосопротивление).";}
		:text {label=""; key="ptxt-02"; value="4АП - 4 универсальных аналоговых входа (U, I) с изолированным питанием.";}
		:text {label=""; key="ptxt-03"; value="4АЕ - 4 универсальных аналоговых входа 0...24 мА.";}
		:text {label=""; key="ptxt-04"; value="8ДВ - 8 дискретных входов.";}
		:text {label=""; key="ptxt-05"; value="8ЧВ - 8 частотно-импульсных входов.";}
		:text {label=""; key="ptxt-06"; value="4ИП - 4 источника питания, излориованные, 24В/100мА.";}
		:text {label=""; key="ptxt-07"; value="4Р - 4 реле (1 переключающий контакт).";}
		:text {label=""; key="ptxt-16"; value="";}
	}//column

	:column {
		:text {label=""; key="ptxt-08"; value="8Р - 8 реле (1 переключающий контакт).";}
		:text {label=""; key="ptxt-09"; value="16Р - 16 реле (1 переключающий контакт).";}
		:text {label=""; key="ptxt-10"; value="8РП - 8 реле (поляризованное).";}
		:text {label=""; key="ptxt-11"; value="16РП - 16 реле (поляризованное).";}
		:text {label=""; key="ptxt-12"; value="8РС - 8 реле (сигнальное).";}
		:text {label=""; key="ptxt-13"; value="16РС - 16 реле (сигнальное).";}
		:text {label=""; key="ptxt-14"; value="8С - 8 симисторных выходов.";}
		:text {label=""; key="ptxt-15"; value="16С - 16 симисторных выходов.";}
	}//column
}//row

:column {
	:text {label="Выбрано"; }//text
	:list_box {label=""; key="txt-901"; list=""; width=3; height=7; value= "0";}
}//column

:row {label="";
	:button {label="Запомнить"; key="but1"; height=1;}
	:button {label="ПЭ"; key="but2"; height=1;}
	:button {label="СПЦФ"; key="but3"; height=1;}
	:button {label="ОВШ"; key="but4"; height=1;}
	:button {label="Удалить"; key="but5"; height=1;}
	:button {label="Вверх"; key="but6"; height=1;}
	ok_only;
}//row

}

///////////////////////////////////////////////////////////////////////////////////////////////////////////