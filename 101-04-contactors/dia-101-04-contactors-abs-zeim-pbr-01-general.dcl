///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_101_04_contactors_pbr_general: dialog {label = "";

:row {label="";  
  :column {label="";
    :text {label="Модификация";}
    :text {label="";}
    :list_box {key="txt-01"; list=""; width=20; height=10; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="U, В";}
    :text {label="";}
    :list_box {key="txt-02"; list=""; width=10; height=10; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Коммутиру-";}
    :text {label="емый ток, А";}
    :list_box {key="txt-03"; list=""; width=10; height=10; value=0;}//list_box
  }//column
 
  :column {label="";
    :text {label="Климатическое";}
    :text {label="исполнение";}
    :list_box {key="txt-04"; list=""; width=20; height=10; value=0;}//list_box
  }//column  

  :column {label="";
    :text {label="Интерфейс";}
    :text {label="";}
    :list_box {key="txt-05"; list=""; width=10; height=10; value=0;}//list_box
  }//column
  
   :column {label="";
    :text {label="Тепловая";}
    :text {label="защита";}
    :list_box {key="txt-06"; list=""; width=10; height=10; value=0;}//list_box
  }//column

   :column {label="";
    :text {label="Силовой";}
    :text {label="ключ";}
    :list_box {key="txt-07"; list=""; width=10; height=10; value=0;}//list_box
  }//column

   :column {label="";
    :text {label="Датчик";}
    :text {label="тока";}
    :list_box {key="txt-08"; list=""; width=10; height=10; value=0;}//list_box
  }//column

   :column {label="";
    :text {label="Дополнительно";}
    :text {label="";}
    :list_box {key="txt-09"; list=""; width=20; height=10; value=0;}//list_box
  }//column

   :column {label="";
    :text {label="Масса,";}
    :text {label="кг";}
    :list_box {key="txt-99"; list=""; width=10; height=10; value=0;}//list_box
  }//column
}//row

:column {label="";
		:text {label="Выбрано"; }
		:list_box {label=""; key="txt-901"; list=""; width=50; height=7; value= "0";}
}//column

:row {label="";
//	:column {label="";
//		:text {label=""; key="ptxt-111";}
//		:text {label=""; key="ptxt-112";}
//	}//column
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
