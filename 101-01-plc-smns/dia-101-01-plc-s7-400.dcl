///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_101_s7_300_siemens: dialog {label = "Контроллеры \"Siemens\"";

:row {label=""; 
  :column {label="";
    :text {label="Тип модуля"; key="ptxt-011";}
    :text {label=""; key="ptxt-012";}
    :list_box {key="txt-01"; list=""; width=25; height=15; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Обозначение"; key="ptxt-021";}
    :text {label=""; key="ptxt-022";}
    :list_box {key="txt-02"; list=""; width=20; height=15; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Артикул"; key="ptxt-031";}
    :text {label=""; key="ptxt-032";}
    :list_box {key="txt-03"; list=""; width=20; height=15; value=0;}//list_box
  }//column
 
  :column {label="";
    :text {label="Описание"; key="ptxt-041";}
    :text {label=""; key="ptxt-042";}
    :list_box {key="txt-04"; list=""; width=130; height=15; value=0;}//list_box
  }//column  

  :column {label="";
    :text {label="Масса"; key="ptxt-991";}
    :text {label=""; key="ptxt-992";}
    :list_box {key="txt-99"; list=""; width=10; height=15; value=0;}//list_box
  }//column
}//row

:row {label="";
	:text {label=""; key="ptxt-101"; value="";}
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
