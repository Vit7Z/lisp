///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_101_01_controllers_siemens_logo: dialog {label = "Siemens LOGO!";

:row {label=""; 
  :column {label="";
    :text {label="Тип модуля";}
    :text {label="";}
    :list_box {key="txt-01"; list=""; width=23; height=7; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Обозначение";}
    :text {label="";}
    :list_box {key="txt-02"; list=""; width=20; height=7; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Артикул";}
    :text {label="";}
    :list_box {key="txt-03"; list=""; width=23; height=7; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Эл. питание";}
    :text {label="";}
    :list_box {key="txt-04"; list=""; width=24; height=7; value=0;}//list_box
  }//column  

  :column {label="";
    :text {label="Масса,";}
    :text {label="кг";}
    :list_box {key="txt-99"; list=""; width=5; height=7; value=0;}//list_box
  }//column
}//row

:row {label="";
	:column {label="";
    :text {label="Особенности";}
    :list_box {key="txt-05"; list=""; width=45; height=7; value=0;}//list_box
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
	:button {label="ОВШ"; key="but4"; height=1;}
	:button {label="Удалить"; key="but5"; height=1;}
	:button {label="Вверх"; key="but6"; height=1;}
	ok_only;
}//row
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////
