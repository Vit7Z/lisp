///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_101_elemer_tpu_205: dialog {label = "Элемер ТПУ-205";

:row {label="";
	:column {label="";
		:text {label="Базовое обозначение";}
		:text {label="";}
		:text {label="";}
		:list_box  {key="txt-01"; list=""; width=30; height=12;}//popup_list
	}//column

	:column {label="";
		:text {label="Корпус";}
		:text {label="";}
		:text {label="(4)";}
		:list_box {key="txt-02"; list=""; width=8; height=12;}
	}//column

	:column {label="";
		:text {label="Кабельный";}
		:text {label="ввод";}
		:text {label="(5)";}
		:list_box {key="txt-03"; list=""; width=12; height=12;}
	}//column

	:column {label="";
		:text {label="Климатич.";}
		:text {label="исп.";}
		:text {label="(6)";}
		:list_box {key="txt-04"; list=""; width=12; height=12;}
	}//column

	:column {label="";
		:text {label="НСХ";}
		:text {label="";}
		:text {label="(7)";}
		:list_box {key="txt-05"; list=""; width=8; height=12;}
	}//column
	
	:column {label="";
    :text {label="Диап.";}
    :text {label="измерений";}
		:text {label="(8)";}
		:list_box {key="txt-06"; list=""; width=12; height=12;}
	}//column	
	
	:column {label="";
    :text {label="Lпогр.,";}
    :text {label="мм";}
    :text {label="(9)";}
		:list_box {key="txt-07"; list=""; width=10; height=12;}
	}//column	
	
	:column {label="";
    :text {label="Диаметр";}
    :text {label="термозонда, мм";}
    :text {label="(10)";}
		:list_box {label=""; key="txt-08"; list=""; width=14; height=12; value= "";}
	}//column	

	:column {label="";
    :text {label="Класс";}
    :text {label="точности";}
    :text {label="(11)";}
		:list_box {label=""; key="txt-09"; list=""; width=12; height=12; value= "";}
	}//column	

	:column {label="";
    :text {label="Поверка";}
    :text {label="";}
    :text {label="(12)";}
		:list_box {label=""; key="txt-10"; list=""; width=10; height=12; value= "";}
	}//column	
}//row

:row {label="";
  :column {label="";
    :text {label="Описание";}
    :list_box {key="txt-900"; list=""; width=90; height=7; value=0;}//list_box
  }//column
}//row

:column {label="";
	:text {label="Выбрано";}
	:list_box {label=""; key="txt-901"; list=""; width=22; height=9; value= "0";}
}//column

:row {label="";
	:button {label="Запомнить"; key="but1"; height=1;}
	:button {label="ПЭ"; key="but2"; height=1;}
	:button {label="СПЦФ"; key="but3"; height=1;}
	:button {label="Удалить"; key="but5"; height=1;}
	:button {label="Вверх"; key="but6"; height=1;}
	ok_only;
}//row
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////
