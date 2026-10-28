dia_101_01_temp_01_general: dialog {label = "Температура";

:row {label="";
	:column {label="";
		:text {label="Показывающие";}
		:list_box {key="txt-01"; list=""; width=24; height=20; value=0;}
	}//column

	:column {label="";
		:text {label="Датчики";}
		:list_box {key="txt-02"; list=""; width=32; height=20; value=0;}
	}//column

	:column {label="";
		:text {label="Сигнализирующие";}
		:list_box {key="txt-03"; list=""; width=20; height=20; value=0;}
	}//column
}//row

:row {label="";
	ok_only;
}//row
}

