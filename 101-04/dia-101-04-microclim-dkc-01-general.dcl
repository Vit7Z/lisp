///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_101_04_microclim_dkc_01_general: dialog {label = "Микроклимат ДКС +";

:row {label="";
	:column {label="";
		:text {label="Тип";}
		:text {label="оборудования";}
		:text {label="";}
		:list_box {key="txt-01"; list=""; width=20; height=8; value=0;}//list_box
	}//column
			
	:column {label="";
		:text {label="Артикул";}
		:text {label="";}
		:text {label="";}
		:list_box {key="txt-02"; list=""; width=14; height=8; value=0;}//list_box
	}//column

	:column {label="";
		:text {label="Uпит., "; key="ml-31";}
		:text {label="В"; key="ml-32";}
		:text {label=""; key="ml-33";}
		:list_box {key="txt-03"; list=""; width=14; height=8; value=0;}//list_box
	}//column

	:column {label="";
		:text {label="Расход"; key="ml-41";}
		:text {label="воздуха,"; key="ml-42";}
		:text {label="м3/ч"; key="ml-43";}
		:list_box {key="txt-04"; list=""; width=14; height=8; value=0;}//list_box
	}//column 

	:column {label="";
		:text {label="Размеры"; key="ml-51";}
		:text {label="ВхШ, мм"; key="ml-52";}
		:text {label=""; key="ml-53";}
		:list_box {key="txt-05"; list=""; width=14; height=8; value=0;}//list_box
	}//column 

	:column {label="";
		:text {label="Масса,"; key="ml-61";}
		:text {label="кг"; key="ml-62";}
		:text {label=""; key="ml-63";}
		:list_box {key="txt-06"; list=""; width=8; height=8; value=0;}//list_box
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
		:list_box {label=""; key="txt-901"; list=""; width=60; height=8; value= "0";}	
	}//column
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
