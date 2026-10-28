///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_101_01_press_sens_mpti_manotom: dialog {label = "Манометры технические";

:row {label="";
  :column {label="";
    :text {label="Модель";}
    :text {label="";}
    :list_box {key="txt-01"; list=""; width=35; height=7; value=0;}//list_box
  }//column

  :column {label="";  
  	:text {label="Единицы изм.";}
    :text {label="";}
    :list_box {key="txt-02"; list=""; width=20; height=7; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Предел изм.";}
    :text {label="";}
    :list_box {key="txt-03"; list=""; width=20; height=7; value=0;}//list_box
  }//column
  
  :column {label="";
    :text {label="Климатич.";}
    :text {label="исп.";}
    :list_box {key="txt-04"; list=""; width=20; height=7; value=0;}//list_box
  }//column
  
  :column {label="";
    :text {label="Среда";}
    :text {label="";}
    :list_box {key="txt-05"; list=""; width=20; height=7; value=0;}//list_box
  }//column
  
  :column {label="";
    :text {label="Присоед.";}
    :text {label="резьба";}
    :list_box {key="txt-06"; list=""; width=20; height=7; value=0;}//list_box
  }//column
}//row

:row {label="";
  :column {label="";
    :text {label="Технологич.";}
    :text {label="черта";}
    :list_box {key="txt-07"; list=""; width=20; height=3; value=0;}//list_box
  }//column

	:column {label="";
    :text {label="АЭС";}
    :text {label="";}
    :list_box {key="txt-08"; list=""; width=20; height=3; value=0;}//list_box
  }//column 

  :column {label="";
    :text {label="Номер";}
    :text {label="";}
    :list_box {key="txt-09"; list=""; width=20; height=3; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Поверка";}
    :text {label="";}
    :list_box {key="txt-10"; list=""; width=20; height=3; value=0;}
  }//column

  :column {label="";
    :text {label="Пломбировка";}
    :text {label="";}
    :list_box {key="txt-11"; list=""; width=20; height=3; value=0;}
  }//column
}//row

:row {label="";
	:text {label="* - стандартное исполнение"; key="ptxt-801";}
	:text {label=""; key="ptxt-802";}
}//row

:row {label="";
	:button {label="Запомнить"; key="but1"; height=1;}
	:button {label="ПЭ"; key="but2"; height=1;}
	:button {label="СПЦФ"; key="but3"; height=1;}
	ok_only;
}//row

:row {label="";
	:column {
		:text {label="Выбрано"; }//text
		:list_box {label=""; key="txt-901"; list=""; width=18; height=8; value= "0";}
	}//column
}//row
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////
