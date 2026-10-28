///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_101_06_01_general: dialog {label = "Кабели и Провода";

:row {label="";

  :column {label="";
    :text {label="Тип кабеля (провода)";}
    :text {label="";}
    :text {label="";}
    :list_box {key="txt-01"; list=""; width=36; height=24; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Марка";}
    :text {label="";}
    :text {label="";}
    :list_box {key="txt-02"; list=""; width=24; height=24; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Жила х"; key="hm-31";}
    :text {label="Диаметр"; key="hm-32";}
    :text {label=""; key="hm-33";}
    :list_box {key="txt-03"; list=""; width=16; height=24; value=0;}//list_box
  }//column
  
  :column {label="";
    :text {label="Наруж."; key="hm-41";}
    :text {label="диаметр,"; key="hm-42";}
    :text {label="мм"; key="hm-43";}
    :list_box {key="txt-04"; list=""; width=12; height=24; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Масса"; key="hm-51";}
    :text {label="1 м, кг"; key="hm-52";}
    :text {label=""; key="hm-53";}
    :list_box {key="txt-05"; list=""; width=12; height=24; value=0;}//list_box
  }//column

  :column {label="";
    :text {label=""; key="hm-61";}
    :text {label=""; key="hm-62";}
    :text {label=""; key="hm-63";}
    :list_box {key="txt-06"; list=""; width=14; height=24; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Производитель";}
    :text {label="";}
    :text {label="";}
    :list_box {key="txt-07"; list=""; width=40; height=11; value=0;}//list_box
		:spacer {height=0.3;}
  
    :text {label="Сертификат";}
    :list_box {key="txt-08"; list=""; width=40; height=12; value=0;}//list_box
  }//column  

	:column {label="";
		:text {label="Выбрано";}
		:text {label="";}
		:text {label="";}
		:list_box {label=""; key="txt-901"; list=""; width=30; height=24; value= "0";}
	}//column
}//row


:row {label="";
  :column {label="";
    :text {label="Описание";}
    :list_box {key="txt-900"; list=""; height=7;}//list_box
  }//column
}//row

:row {label="";
	:button {label="Запомнить"; key="but1"; height=1;}
	:button {label="ПЭ"; key="but2"; height=1;}
	:button {label="СПЦФ"; key="but3"; height=1;}
	:button {label="ОВШ"; key="but4"; height=1;}
	:button {label="Удалить"; key="but5"; height=1;}
	:button {label="Вверх"; key="but6"; height=1;}
	:button {label="Вниз"; key="but7"; height=1;}
	
	ok_only;
}//row

}
