///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_101_case_metal: dialog {label = "";

:row {label="";
  :column {label="";
    :text {label="Размеры";}
    :text {label="ВхШхГ, мм.";}
    :list_box {key="txt-02"; list=""; width=20; height=10; value=0;}//list_box
  }//column
 
  :column {label="";
    :text {label="Номер";}
    :text {label="габарита";}
    :list_box {key="txt-03"; list=""; width=20; height=10; value=0; is_enabled=false;}//list_box
  }//column

  :column {label="";
    :text {label="Вес, кг.";}
    :text {label="";}
    :list_box {key="txt-04"; list=""; width=20; height=10; value=0; is_enabled=false;}//list_box
  }//column
 
  :column {label="";
    :text {label="Обслуживание";}
    :text {label="";}
    :list_box {key="txt-05"; list=""; width=20; height=10; value=0; is_enabled=false;}//list_box
  }//column
}//row

:row {label="";
	:text {label=""; key="ptxt-061";}
}//row

	:column {label="";
		:text {label="Выбрано"; }//text
		:list_box {label=""; key="txt-901"; list=""; width=74; height=10; value= "0";}
	}//column   

:row {label="";
	:button {label="Запомнить"; key="but1"; height=1;}
	:button {label="СПЦФ"; key="but3"; height=1;}
	:button {label="ОВШ"; key="but4"; height=1;}
	:button {label="Удалить"; key="but5"; height=1;}
	:button {label="Вверх"; key="but6"; height=1;}
	ok_only;
}//row
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////
