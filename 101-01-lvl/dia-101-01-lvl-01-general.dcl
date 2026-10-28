dia_101_01_lvl_sens_general: dialog {label = "Уровень";

:row {label="";
	:column {label="";
		:text {label="Показывающие";}
		:list_box {key="txt-01"; list=""; width=30; height=15; value=0;}
	}//column

	:column {label="";
		:text {label="Датчики";}
		:list_box {key="txt-03"; list=""; width=30; height=15; value=0;}
	}//column

	:column {label="";
		:text {label="Сигнализирующие";}
		:list_box {key="txt-02"; list=""; width=30; height=15; value=0;}
	}//column	
}//row

:row {label="";
	ok_only;
}//row
}

