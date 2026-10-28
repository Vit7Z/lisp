///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_101_08_cable_connect_01_general: dialog {label = "Разъемы";

:row {label="";
  :column {label="";
    :text {label="Наименование";}
    :text {label="";}
    :list_box {key="txt-01"; list=""; width=28; height=7; value=0;}//list_box
  }//column
  
  :column {label="";
    :text {label="Обозначение";}
    :text {label="";}
    :list_box {key="txt-02"; list=""; width=20; height=7; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Категория"; key="mln-31";}
    :text {label=""; key="mln-32";}
    :list_box {key="txt-03"; list=""; width=10; height=7; value=0;}//list_box
  }//column
  
  :column {label="";
    :text {label="Экран"; key="mln-41";}
    :text {label=""; key="mln-42";}
    :list_box {key="txt-04"; list=""; width=10; height=7; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Производитель"; key="mln-51";}
    :text {label=""; key="mln-52";}
    :list_box {key="txt-05"; list=""; width=20; height=7; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Масса,"; key="mln-61";}
    :text {label="кг"; key="mln-62";}
    :list_box {key="txt-06"; list=""; width=10; height=7; value=0;}//list_box
  }//column
}//row

:row {label="";
	:column {
		:text {label="Описание";}
		:list_box {label=""; key="txt-900"; list=""; height=4; width=50; value= "";}
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
