///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_101_04_relay_schneider_electric_control: dialog {label = "";

:row {label="";
  :column {label="";
    :text {label="Модель";}
    :text {label="";}
    :list_box {key="txt-00"; list=""; width=10; height=15; value=0;}//list_box
  }//column
 
  :column {label="";
    :text {label="Артикул";}
    :text {label="";}
    :list_box {key="txt-01"; list=""; width=20; height=15; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Функции";}
    :text {label="";}
    :list_box {key="txt-02"; list=""; width=20; height=15; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Напряжение,";}
    :text {label="В";}
    :list_box {key="txt-03"; list=""; width=20; height=15; value=0;}//list_box
  }//column
 
  :column {label="";
    :text {label="Выход";}
    :text {label="";}
    :list_box {key="txt-04"; list=""; width=20; height=15; value=0;}//list_box
  }//column  

	:column {label="";
		:text {label="Выбрано"; }//text
		:text {label="";}
		:list_box {label=""; key="txt-901"; list=""; width=50; height=15; value= "0";}
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
