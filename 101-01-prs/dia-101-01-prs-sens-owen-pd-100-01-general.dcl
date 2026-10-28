///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_101_01_press_sens_owen_pd_100_general_01: dialog {label = "ОВЕН ПД100";

:row {label="";
	:column {label="";
		:text {label="Серия";}
		:text {label="";}
		:list_box {key="txt-01"; list=""; width=20; height=10;}
	}//column

	:column {label="";
		:text {label="Тип";}
		:text {label="давления";}
		:list_box {key="txt-02"; list=""; width=20; height=10;}
	}//column
	
  :column {label="";
    :text {label="Верхний предел";}
    :text {label="изм., МПа";}
    :list_box {key="txt-03"; list=""; width=15; height=10;}
  }//column

  :column {label="";
    :text {label="Код модели,";}
    :text {label="штуцер";}
    :list_box {key="txt-04"; list=""; width=20; height=10;}
  }//column

  :column {label="";
    :text {label="Класс";}
    :text {label="точности";}
    :list_box {key="txt-05"; list=""; width=10; height=10;}
  }//column

  :column {label="";
    :text {label="Индикация";}
    :text {label="";}
    :list_box {key="txt-06"; list=""; width=12; height=10;}
  }//column
  
  :column {label="";
    :text {label="Тип";}
    :text {label="интерфейса";}
    :list_box {key="txt-07"; list=""; width=12; height=10;}
  }//column  
}//row

:row {label="";
  :column {label="";
    :text {label="Взрывозащита";}
    :list_box {key="txt-08"; list=""; width=15; height=4;}
  }//column

  :column {label="";
    :text {label="Длина встроенного кабеля";}
    :list_box {key="txt-09"; list=""; width=15; height=4;}
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
