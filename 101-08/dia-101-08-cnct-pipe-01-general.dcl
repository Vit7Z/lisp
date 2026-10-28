///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_101_08_connecting_pipe_general: dialog {label = "Ниппельные соединения";

:row {label="";
  :column {label="";
    :text {label="Наименование";}
    :text {label="";}
    :list_box {key="txt-01"; list=""; width=24; height=10; value=0;}//list_box
  }//column
  
  :column {label="";
    :text {label="Обозначение";}
    :text {label="";}
    :list_box {key="txt-02"; list=""; width=30; height=10; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Вход";}
    :text {label="";}
    :list_box {key="txt-03"; list=""; width=18; height=10; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Выход";}
    :text {label="";}
    :list_box {key="txt-04"; list=""; width=18; height=10; value=0;}//list_box
  }//column
 
  :column {label="";
    :text {label="Материал";}
    :text {label="";}
    :list_box {key="txt-05"; list=""; width=20; height=10; value=0;}//list_box
  }//column  
  
  :column {label="";
    :text {label="Давление,";}
    :text {label="кгс/см2";}
    :list_box {key="txt-06"; list=""; width=10; height=10; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Температура,";}
    :text {label="С";}
    :list_box {key="txt-07"; list=""; width=12; height=10; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Производитель";}
    :text {label="";}
    :list_box {key="txt-08"; list=""; width=18; height=10; value=0;}//list_box
  }//column

}//row

:row {label="";
	:text {label=""; key="ptxt-081";}
}//row

:row {label="";
	:column {label="";
		:text {label="Выбрано"; }//text
		:list_box {label=""; key="txt-901"; list=""; width=40; height=10; value= "0";}
	}//column
}//row

:row {label="";
	:button {label="Запомнить"; key="but1"; height=1;}
	:button {label="ПЭ"; key="but2"; height=1;}
	:button {label="СПЦФ"; key="but3"; height=1;}
	:button {label="Удалить"; key="but5"; height=1;}
	:button {label="Вверх"; key="but6"; height=1;}
	:button {label="Вниз"; key="but7"; height=1;}
	ok_only;
}//row
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////
