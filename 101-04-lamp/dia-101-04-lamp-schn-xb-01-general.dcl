///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_101_04_lamp_xb: dialog {label = "";

:row {label="";
  :column {label="";
    :text {label="Серия";}
    :text {label="";}
    :list_box {key="txt-01"; list=""; width=10; height=10; value=0;}//list_box
  }//column
 
  :column {label="";
    :text {label="Артикул";}
    :text {label="";}
    :list_box {key="txt-02"; list=""; width=15; height=10; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Цвет";}
    :text {label="";}
    :list_box {key="txt-03"; list=""; width=10; height=10; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Uпит, В";}
    :text {label="";}
    :list_box {key="txt-04"; list=""; width=10; height=10; value=0;}//list_box
  }//column
 
  :column {label="";
    :text {label="Присоед.";}
    :text {label="";}
    :list_box {key="txt-05"; list=""; width=10; height=10; value=0;}//list_box
  }//column  
 
  :column {label="";
    :text {label="Форма";}
    :text {label="";}
    :list_box {key="txt-06"; list=""; width=10; height=10; value=0;}//list_box
  }//column 
 
  :column {label="";
    :text {label="Диаметр,";}
    :text {label="мм";}
    :list_box {key="txt-07"; list=""; width=8; height=10; value=0;}//list_box
  }//column 
 
  :column {label="";
    :text {label="Корпус";}
    :text {label="";}
    :list_box {key="txt-08"; list=""; width=12; height=10; value=0;}//list_box
  }//column 
}//row

:row {label="";
	:column {label="";
    :text {label="Описание";}
    :list_box {key="txt-900"; list=""; width=60; height=4; value=0;}//list_box
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
