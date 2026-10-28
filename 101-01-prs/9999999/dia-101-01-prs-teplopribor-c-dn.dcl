///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_101_01_press_sens_spz_dg: dialog {label = "Тягонапоромеры ДГ";

:row {label="";
  :column {label="";
    :text {label="Модель";}
    :text {label="";}
    :list_box {key="txt-01"; list=""; width=10; height=10; value=0;}//list_box
  }//column

  :column {label="";  
  	:text {label="Диапазон показаний,";}
    :text {label="кПа";}
    :list_box {key="txt-02"; list=""; width=10; height=10; value=0;}//list_box
  }//column

  :column {label="";  
  	:text {label="Масса,";}
    :text {label="кг";}
    :list_box {key="txt-99"; list=""; width=10; height=10; value=0;}//list_box
  }//column

  :column {label="";  
  	:text {label="Описание";}
    :text {label="";}
    :list_box {key="txt-1001"; list=""; width=60; height=10; value=0;}//list_box
  }//column

}//row

:row {label="";
	:button {label="Запомнить"; key="but1"; height=1;}
	:button {label="ПЭ"; key="but2"; height=1;}
	:button {label="СПЦФ"; key="but3"; height=1;}
	:button {label="Удалить"; key="but5"; height=1;}
	:button {label="Вверх"; key="but6"; height=1;}
	ok_only;
}//row

:row {label="";
	:column {
		:text {label="Выбрано"; }//text
		:list_box {label=""; key="txt-901"; list=""; width=18; height=8; value= "0";}
	}//column
}//row
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////
