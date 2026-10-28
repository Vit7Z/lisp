///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_101_08_mtl_box_kzns: dialog {label = "Коробки";

:row {label="";
  :column {label="";
    :text {label="Модель";}
    :text {label="";}
    :list_box {key="txt-01"; list=""; width=10; height=20; value=0;}//list_box
  }//column
  
  :column {label="";
    :text {label="Кол.";}
    :text {label="клемм";}
    :list_box {key="txt-02"; list=""; width=5; height=20; value=0;}//list_box
  }//column
 
  :column {label="";
    :text {label="Кол. сальников";}
    :text {label="(диаметр кабеля, мм)";}
    :list_box {key="txt-03"; list=""; width=60; height=20; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Степень";}
    :text {label="защиты";}
    :list_box {key="txt-04"; list=""; width=10; height=20; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Вес,";}
    :text {label="кг.";}
    :list_box {key="txt-05"; list=""; width=7; height=20; value=0;}//list_box
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
