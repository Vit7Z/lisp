///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_101_04_lamp_other: dialog {label = "Лампы";

:row {label="";
  :column {label="";
    :text {label="Наименование";}
    :text {label="";}
    :text {label=""; }
    :list_box {key="txt-01"; list=""; width=30; height=10; value=0;}//list_box
  }//column
  
  :column {label="";
    :text {label="Модель";}
    :text {label="";}
    :text {label="";}
    :list_box {key="txt-02"; list=""; width=30; height=10; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Uпит,";}
    :text {label="В";}
    :text {label="";}
    :list_box {key="txt-03"; list=""; width=10; height=10; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Потр.";}
    :text {label="мощность,";}
    :text {label="Вт";}
    :list_box {key="txt-04"; list=""; width=10; height=10; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Масса,";}
    :text {label="кг";}
    :text {label="";}
    :list_box {key="txt-99"; list=""; width=10; height=10; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Примечане";}
    :text {label="";}
    :text {label="";}
    :list_box {key="txt-1001"; list=""; width=50; height=10; value=0;}//list_box
  }//column
}//row

:column {label="";
		:text {label="Выбрано"; }//text
		:list_box {label=""; key="txt-901"; list=""; width=50; height=10; value= "0";}
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
