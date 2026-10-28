///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_101_04_lamp_iek: dialog {label = "";

:row {label="";
  :column {label="";
    :text {label="Тип";}
    :text {label="";}
    :list_box {key="txt-01"; list=""; width=10; height=10; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Артикул";}
    :text {label="";}
    :list_box {key="txt-02"; list=""; width=20; height=10; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Длина,";}
    :text {label="мм.";}
    :list_box {key="txt-03"; list=""; width=10; height=10; value=0;}//list_box
  }//column

   :column {label="";
    :text {label="Uпит.,";}
    :text {label="В";}
    :list_box {key="txt-04"; list=""; width=10; height=10; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Мощность,";}
    :text {label="Вт";}
    :list_box {key="txt-05"; list=""; width=10; height=10; value=0;}//list_box
  }//column
 
  :column {label="";
    :text {label="Масса,";}
    :text {label="кг";}
    :list_box {key="txt-99"; list=""; width=10; height=10; value=0;}//list_box
  }//column 

  :column {label="";
    :text {label="Описание";}
    :text {label="";}
    :list_box {key="txt-1001"; list=""; width=60; height=10; value=0;}//list_box
  }//column  


}//row

:row {label="";
	:column {label="";
		:text {label="Выбрано";}
		:list_box {label=""; key="txt-901"; list=""; width=50; height=10; value= "0";}
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
