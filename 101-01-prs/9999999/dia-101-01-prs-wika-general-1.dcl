///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_101_01_press_sens_wika_general_1: dialog {label = "WIKA";

:row {label="";
	:column {label="";
		:text {label="Модель";}
		:text {label="";}
		:list_box {key="txt-01"; list=""; width=20; height=10;}
	}//column
	
  :column {label="";
    :text {label="Пределы изм.,";}
    :text {label="МПа (бар)";}
    :list_box {key="txt-02"; list=""; width=15; height=10;}
  }//column

  :column {label="";
    :text {label="Выходной";}
    :text {label="сигнал";}
    :list_box {key="txt-03"; list=""; width=15; height=10;}
  }//column  

  :column {label="";
    :text {label="Присоединение";}
    :text {label="к процессу";}
    :list_box {key="txt-04"; list=""; width=15; height=10;}
  }//column

  :column {label="";
    :text {label="Присоединение";}
    :text {label="кабеля";}
    :list_box {key="txt-05"; list=""; width=30; height=10;}
  }//column

  :column {label="";
    :text {label="Индикация";}
    :text {label="";}
    :list_box {key="txt-06"; list=""; width=15; height=10;}
  }//column

  :column {label="";
    :text {label="Артикул";}
    :text {label="";}
    :list_box {key="txt-07"; list=""; width=15; height=10;}
  }//column
}//row

:column {label="";
	:text {label="Выбрано";}
	:list_box {label=""; key="txt-901"; list=""; width=120; height=12; value= "0";}
}//column

:row {label="";
	:button {label="Запомнить"; key="but1"; height=1;}
	:button {label="ПЭ"; key="but2"; height=1;}
	:button {label="СПЦФ"; key="but3"; height=1;}
	:button {label="Удалить"; key="but5"; height=1;}
	:button {label="Вверх"; key="but6"; height=1;}
	ok_only;
}//row
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////
