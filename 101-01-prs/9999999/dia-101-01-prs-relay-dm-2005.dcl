///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_101_dm_2005: dialog {label = "ДМ2005";

:row {label="";
  :column {label="";
    :text {label="Модель";}
    :text {label="";}
    :list_box {key="txt-01"; list=""; width=20; height=7; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Класс";}
    :text {label="точности";}
    :list_box {key="txt-02"; list=""; width=10; height=7; value=0;}//list_box
  }//column

  :column {label="";  
  	:text {label="Единицы";}
    :text {label="изм.";}
    :list_box {key="txt-03"; list=""; width=10; height=7; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Предел изм.";}
    :text {label="";}
    :list_box {key="txt-04"; list=""; width=20; height=7; value=0;}//list_box
  }//column
  
  :column {label="";
    :text {label="Степень";}
    :text {label="защиты";}
    :list_box {key="txt-05"; list=""; width=10; height=7; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Исполнение";}
    :text {label="конструкции";}
    :list_box {key="txt-06"; list=""; width=20; height=7; value=0;}//list_box
  }//column
  
  :column {label="";
    :text {label="Исполнение"; key="ptxt-091";}   
    :text {label="по контактам"; key="ptxt-092";} 
    :list_box {key="txt-07"; list=""; width=20; height=7; value=0;}
  }//column
}//row

:row {label=""; height=1;}

:row {label="";
	:text {label=""; key="ptxt-801"; value="Температура окружающего воздуха: от -50° до +60°С";}
	:text {label=""; key="ptxt-802"; value="Климатическое исполнение У2 по ГОСТ 15150-69";}
}//row

:row {label="";
	:button {label="Запомнить"; key="but1"; height=1;}
	:button {label="ПЭ"; key="but2"; height=1;}
	:button {label="СПЦФ"; key="but3"; height=1;}
	:button {label="Удалить"; key="but5"; height=1;}
	:button {label="Вверх"; key="but6"; height=1;}
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
