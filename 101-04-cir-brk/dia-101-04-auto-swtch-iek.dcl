///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_101_04_auto_swtch_iek: dialog {label = "";

:row {label="";

  :column {label="";
    :text {label="Модель, хар-ка";}
    :text {label="срабатывания";}
    :text {label="расцепителя";}
    :list_box {key="txt-01"; list=""; width=30; height=20; value=0;}
  }//column

  :column {label="";
    :text {label="Кол.";}
    :text {label="полюсов";}
    :text {label="";}
    :list_box {key="txt-02"; list=""; width=10; height=20; value=0;}
  }//column
 
  :column {label="";
    :text {label="Ном. ток,";}
    :text {label="А";}
    :text {label="";}
    :list_box {key="txt-03"; list=""; width=10; height=20; value=0;}//list_box
  }//column  
  
  :column {label="";
    :text {label="Артикул";}
    :text {label="";}
    :text {label="";}
    :list_box {key="txt-04"; list=""; width=20; height=20; value=0;}//list_box
  }//column

	:column {label="";
		:text {label="Выбрано";}
		:text {label="";}
		:text {label="";}
		:list_box {label=""; key="txt-901"; list=""; width=70; height=20; value= "0";}
	}//column
}//row

:row {label="";
	:text {label=""; key="ptxt-061";}
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
