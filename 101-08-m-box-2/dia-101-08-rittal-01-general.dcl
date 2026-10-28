///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_101_08_rittal_01: dialog {label = "Rittal +";

:row {label="";
	:column {label="";
		:text {label="Наименование";}
		:text {label="";}
		:text {label=""; }//text
		:list_box {key="txt-01"; list=""; width=40; height=18; value=0;}//list_box
	}//column
			
	:column {label="";
		:text {label="Размеры"; key="ml-21";}
		:text {label="ШхВхГ, мм."; key="ml-22";}
		:text {label=""; key="ml-23";}//text
		:list_box {key="txt-02"; list=""; width=20; height=18; value=0;}//list_box
	}//column

	:column {label="";
		:text {label="Артикул"; key="ml-31";}
		:text {label=""; key="ml-32";}
		:text {label="";  key="ml-33";}//text
		:list_box {key="txt-03"; list=""; width=18; height=18; value=0;}//list_box
	}//column

	:column {label="";
		:text {label="Панель"; key="ml-41";}
		:text {label="монтажная,"; key="ml-42";}
		:text {label="ШхВ, мм.";  key="ml-43";}//text
		:list_box {key="txt-04"; list=""; width=22; height=18; value=0;}//list_box
	}//column 

	:column {label="";
		:text {label="Вес,"; key="ml-51";}
		:text {label="кг"; key="ml-52";}
		:text {label=""; key="ml-53";}//text
		:list_box {key="txt-05"; list=""; width=20; height=18; value=0;}//list_box
	}//column

	:column {label="";
		:text {label="Цвет"; key="ml-61";}
		:text {label=""; key="ml-62";}
		:text {label=""; key="ml-63";}//text
		:list_box {key="txt-06"; list=""; width=20; height=18; value=0;}//list_box
	}//column

	:column {label="";
		:text {label=""; key="ml-71";}
		:text {label=""; key="ml-72";}
		:text {label=""; key="ml-73";}//text
		:list_box {key="txt-07"; list=""; width=15; height=18; value=0;}//list_box
	}//column
}//row

:row {label="";
	:column {label="";
		:text {label="Справка";}
		:list_box {key="txt-900"; list=""; width=15; height=5;}//list_box
	}//column
}//row

:row {label="";
	:column {label="";
		:text {label="Выбрано"; }//text
		:list_box {label=""; key="txt-901"; list=""; width=60; height=15; value= "0";}	
	}//column
}//row


:row {label="";
	:button {label="Запомнить"; key="but1"; height=1;}
	:button {label="СПЦФ"; key="but3"; height=1;}
	:button {label="ОВШ"; key="but4"; height=1;}
	:button {label="Удалить"; key="but5"; height=1;}
	:button {label="Вверх"; key="but6"; height=1;}
	ok_only;
}//row
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////
