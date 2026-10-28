///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_101_06_power_01: dialog {label = "Кабели силовые";

:row {label="";
  :column {label="";
    :text {label="Обозначение";}
    :text {label="";}
    :list_box {key="txt-01"; list=""; width=25; height=20; value=0;}//list_box
  }//column
  
  :column {label="";
    :text {label="Кол. жил х";}
    :text {label="Диам. ж.";}
    :list_box {key="txt-02"; list=""; width=10; height=20; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Наружн.";}
    :text {label="диаметр, мм";}
    :list_box {key="txt-03"; list=""; width=10; height=20; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Масса 1м";}
    :text {label="кабеля, кг";}
    :list_box {key="txt-04"; list=""; width=10; height=20; value=0;}//list_box
  }//column

	:column {label="";
		:text {label="Выбрано"; }//text
		:text {label=""; }//text
		:list_box {label=""; key="txt-901"; list=""; width=32; height=20; value= "0";}
	}//column

  :column {label="";
    :text {label="Производитель";}
    :text {label="";}
    :list_box {key="txt-05"; list=""; width=30; height=7; value=0;}//list_box
    
    :text {label="Сертификат";}
    :list_box {key="txt-06"; list=""; width=10; height=7; value=0;}//list_box
		:spacer {height=4.3;}
  }//column  
}//row

:row {label="";
  :column {label="";
    :text {label="Описание";}
    :list_box {key="txt-1001"; list=""; width=60; height=5;}//list_box
  }//column
}//row

:row {label="";
	:button {label="Запомнить"; key="but1"; height=1;}
	:button {label="Удалить"; key="but5"; height=1;}
	:button {label="Вверх"; key="but6"; height=1;}
	:button {label="ПЭ"; key="but2"; height=1;}
	:button {label="СПЦФ"; key="but3"; height=1;}
	
	ok_only;
}//row
}
