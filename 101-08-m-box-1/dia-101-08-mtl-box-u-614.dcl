///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_101_metall_box_u_614: dialog {label = "Коробки У614А, У615А";

:row {label="";
  :column {label="";
    :text {label="Модель";}
    :text {label="";}
    :list_box {key="txt-01"; list=""; width=10; height=10; value=0;}//list_box
  }//column
  
  :column {label="";
    :text {label="Количество";}
    :text {label="клемм";}
    :list_box {key="txt-02"; list=""; width=20; height=10; value=0;}//list_box
  }//column
 
  :column {label="";
    :text {label="Количество сальников";}
    :text {label="(диаметр кабеля, мм)";}
    :list_box {key="txt-03"; list=""; width=40; height=10; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Вес, кг.";}
    :text {label="";}
    :list_box {key="txt-04"; list=""; width=10; height=10; value=0;}//list_box
  }//column
}//row

:row {label="";
}//row

:column {label="";
	:text {label="Выбрано"; }//text
	:list_box {label=""; key="txt-901"; list=""; width=74; height=10; value= "0";}
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
