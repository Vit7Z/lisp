///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_101_kpi_35: dialog {label = "Danfoss KPI 35";

:row {label="";
  :column {label="";
    :text {label="Модель";}
    :text {label="";}
    :list_box {key="txt-01"; list=""; width=20; height=7; value=0;}//list_box
  }//column

  :column {label="";  
  	:text {label="Диапазон";}
    :text {label="настройки, бар";}
    :list_box {key="txt-02"; list=""; width=20; height=7; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Диапазон";}
    :text {label="настройки, МПа";}
    :list_box {key="txt-03"; list=""; width=20; height=7; value=0;}//list_box
  }//column
  
  :column {label="";
    :text {label="Диапазон";}
    :text {label="настройки, кПа";}
    :list_box {key="txt-04"; list=""; width=20; height=7; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Дифференциал,";}
    :text {label="бар";}
    :list_box {key="txt-05"; list=""; width=20; height=7; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Присоединение";}
    :text {label="";}
    :list_box {key="txt-06"; list=""; width=20; height=7; value=0;}//list_box
  }//column
  
  :column {label="";
    :text {label="Код заказа";}
    :text {label="";}
    :list_box {key="txt-07"; list=""; width=20; height=7; value=0;}//list_box
  }//column 
}//row

:column {label="";
		:text {label="Выбрано"; }//text
		:list_box {label=""; key="txt-901"; list=""; width=50; height=10; value= "0";}
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
