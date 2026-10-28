///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_101_04_resistors_01_general: dialog {label = "Радиодетали";

:row {label="";  
  :column {label="";
    :text {label="Модель";}
    :text {label="";}
    :list_box {key="txt-01"; list=""; width=32; height=10; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Номинал";}
    :text {label="";}
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
    :list_box {key="txt-900"; list=""; width=60; height=10; value=0;}//list_box
  }//column
}//row

:column {label="";
		:text {label="Выбрано"; }//text
		:list_box {label=""; key="txt-901"; list=""; width=50; height=15; value= "0";}
}//column

:row {label="";
}//row

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
