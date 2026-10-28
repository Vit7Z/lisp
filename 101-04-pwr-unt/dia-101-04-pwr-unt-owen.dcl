///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_101_04_pwr_unt_owen: dialog {label = "";

:row {label="";

	:column {label=""; 
		:text {label="Модель";}
		:text {label="";}
    :list_box {key="txt-01"; list=""; width=20; height=15; value= "0";}
  }//column
    
  :column {label=""; 
    :text {label="Вых. напря-";}
    :text {label="жение, В";}
    :list_box {key="txt-02"; list=""; width=10; height=15; value= "0";}
  }//column

	:column {label="";
  	:text {label="Кол.";}
  	:text {label="каналов";}
    :list_box {key="txt-03"; list=""; width=10; height=15; value=0;}//list_box
  }//column

  :column {label=""; 
  	:text {label="Макс. ток,";}
  	:text {label="нагрузки, А";}
    :list_box {key="txt-04"; list=""; width=10; height=15; value= "0";}
  }//column 

  :column {label=""; 
  	:text {label="Крепление";}
  	:text {label="";}
    :list_box {key="txt-05"; list=""; width=20; height=15; value= "0";}
  }//column

  :column {label=""; 
  	:text {label="Гальв. развязка";}
  	:text {label="между каналами";}
    :list_box {key="txt-06"; list=""; width=20; height=15; value= "0";}
  }//column

  :column {label=""; 
  	:text {label="Масса,";}
  	:text {label="кг";}
    :list_box {key="txt-99"; list=""; width=5; height=15; value= "0";}
  }//column
        
	:column {label="";
		:text {label="Выбрано";}
		:text {label="";}
		:list_box {label=""; key="txt-901"; list=""; width=50; height=15; value= "0";}
	}//column
}//row

:text {label=""; }//text

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
