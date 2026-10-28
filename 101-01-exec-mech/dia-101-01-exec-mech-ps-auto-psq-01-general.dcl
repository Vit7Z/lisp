///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_101_01_exec_mech_ps_auto: dialog {label = "";

:row {label="";
  :column {label="";
    :text {label="Модель";}
    :text {label="";}
    :list_box {key="txt-01"; list=""; width=10; height=10; value=0;}
  }//column

  :column {label="";
    :text {label="Мкрут.,";}
    :text {label="Нм";}
    :list_box {key="txt-02"; list=""; width=8; height=10; value=0;}
  }//column
  
  :column {label="";
    :text {label="Uпит,";}
    :text {label="В";}
    :list_box {key="txt-03"; list=""; width=14; height=10; value=0;}
  }//column

  :column {label="";
    :text {label="Pпотр.,";}
    :text {label="Вт";}
    :list_box {key="txt-04"; list=""; width=8; height=10; value=0;}
  }//column
 
  :column {label="";
    :text {label="Iмакс.,";}
    :text {label="А";}
    :list_box {key="txt-05"; list=""; width=8; height=10; value=0;}
  }//column  
 
  :column {label="";
    :text {label="Датчик";}
    :text {label="положения";}
    :list_box {key="txt-06"; list=""; width=12; height=10; value=0;}
  }//column  
 
  :column {label="";
    :text {label="Местный";}
    :text {label="ПУ";}
    :list_box {key="txt-07"; list=""; width=10; height=10; value=0;}
  }//column  
  
  :column {label="";
    :text {label="Масса,";}
    :text {label="кг";}
    :list_box {key="txt-08"; list=""; width=10; height=10; value=0;}//list_box
  }//column
}//row

:row {label="";
	:list_box {label=""; key="txt-900"; height=3; is_enabled=falshe;}
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
