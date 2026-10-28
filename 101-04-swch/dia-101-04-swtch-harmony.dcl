///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_101_04_swtch_harmony: dialog {label = "";

:row {label="";
  :column {label="";
    :text {label="Серия";}
    :list_box {key="txt-00"; list=""; width=10; height=20; value=0;}//list_box
  }//column
 
  :column {label="";
    :text {label="Артикул";}
    :list_box {key="txt-01"; list=""; width=15; height=20; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Контакты";}
    :list_box {key="txt-02"; list=""; width=10; height=20; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Цвет";}
    :list_box {key="txt-03"; list=""; width=10; height=20; value=0;}//list_box
  }//column
 
  :column {label="";
    :text {label="Подсветка";}
    :list_box {key="txt-04"; list=""; width=10; height=20; value=0;}//list_box
  }//column  
 
  :column {label="";
    :text {label="Эл. питание";}
    :list_box {key="txt-05"; list=""; width=10; height=20; value=0;}//list_box
  }//column 
 
  :column {label="";
    :text {label="Форма";}
    :list_box {key="txt-06"; list=""; width=10; height=20; value=0;}//list_box
  }//column 
 
  :column {label="";
    :text {label="Возврат";}
    :list_box {key="txt-07"; list=""; width=20; height=20; value=0;}//list_box
  }//column 
  
  :column {label="";
    :text {label="Корпус";}
    :list_box {key="txt-08"; list=""; width=10; height=20; value=0;}//list_box
  }//column 
}//row

:row {label="";
	:column {label="";
		:text {label="Выбрано";}
		:list_box {label=""; key="txt-901"; list=""; width=50; height=7; value= "0";}
	}//column
}//row

:row {label="";
	:text {label=""; key="ptxt-071"; value="";}
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
