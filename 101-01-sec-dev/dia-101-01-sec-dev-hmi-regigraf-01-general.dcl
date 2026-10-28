///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_101_01_secondary_device_regigraf: dialog {label = "";

:row {label="";
  :column {
    :text {label="Аналоговые";}
    :text {label="входы (AIn)";}
    :list_box {key="txt-01"; list=""; width=10; height=6;}//list_box
  }//column

  :column {
    :text {label="Аналоговые";}
    :text {label="выходы (AOut)";}
    :list_box {key="txt-02"; list=""; width=10; height=6;}//list_box
  }//column

  :column {  
    :text {label="Дискретные";}
    :text {label="выходы (DOut)";}
    :list_box {key="txt-03"; list=""; width=10; height=6;}//list_box  
  }//column

  :column {  
    :text {label="Электропитание,";}
    :text {label="В";}
    :list_box {key="txt-04"; list=""; width=34; height=6;}//list_box
	}//column

  :column {	
    :text {label="Интерфейс";}
    :text {label="";}
    :list_box {key="txt-05"; list=""; width=10; height=6;}//list_box  
	}//column

  :column {	
    :text {label="Математич.";}
    :text {label="каналы";}
    :list_box {key="txt-06"; list=""; width=10; height=6;}//list_box
	}//column

  :column {	 
    :text {label="Исполнение";}
    :text {label="";}
    :list_box {key="txt-07"; list=""; width=22; height=6;}//list_box 
  }//column

  :column {
    :text {label="Класс безопасн.";}
    :text {label="по ОПБ88/97";}
    :list_box {key="txt-08"; list=""; width=6; height=6;}//list_box
  }//column

  :column {
    :text {label="Приемка";}
    :text {label="";}
    :list_box {key="txt-09"; list=""; width=16; height=6;}//list_box
  }//column

  :column {
    :text {label="Поверка";}
    :text {label="";}
    :list_box {key="txt-10"; list=""; width=6; height=6;}//list_box
  }//column

  :column {
    :text {label="Упаковка";}
    :text {label="";}
    :list_box {key="txt-11"; list=""; width=16; height=6;}//list_box
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