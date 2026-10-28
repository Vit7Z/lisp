///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_101_06_ground: dialog {label = "Проводник заземляющий";

:row {label="";
  :column {label="";
    :text {label="Обозначение";}
    :text {label="";}
    :list_box {key="txt-01"; list=""; width=15; height=7; value=0;}//list_box
  }//column
  
  :column {label="";
    :text {label="Длина,";}
    :text {label="мм";}
    :list_box {key="txt-02"; list=""; width=8; height=7; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Масса 1шт.,";}
    :text {label="кг";}
    :list_box {key="txt-03"; list=""; width=10; height=7; value=0;}//list_box
  }//column

	:column {label="";
		:text {label="Выбрано"; }//text
		:text {label="";}//text
		:list_box {label=""; key="txt-901"; list=""; width=20; height=7; value= "0";}
	}//column
}//row

:row {label="";
  :column {label="";
    :text {label="Описание";}
    :list_box {key="txt-900"; list=""; height=5;}//list_box
  }//column
}//row

:row {label="";
	:button {label="Запомнить"; key="but1"; height=1;}
	:button {label="ПЭ"; key="but2"; height=1;}
	:button {label="СПЦФ"; key="but3"; height=1;}
	:button {label="Удалить"; key="but5"; height=1;}
	:button {label="Вверх"; key="but6"; height=1;}
	
	ok_only;
}//row
}