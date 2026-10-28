dia_101_03_general_ready: dialog {label = "Щиты и пульты";

:row {label="";
	:column {label="";
		:text {label="Поз. обозн.";}
		:list_box {key="txt-01"; list=""; width=10; height=10; value=0;}
	}//column

	:column {label="";
		:text {label="Наименование";}
		:list_box {key="txt-02"; list=""; width=60; height=10; value=0;}
	}//column

	:column {label="";
		:text {label="Производитель";}
		:list_box {key="txt-03"; list=""; width=35; height=10; value=0;}
	}//column

	:column {label="";
		:text {label="Город";}
		:list_box {key="txt-04"; list=""; width=20; height=10; value=0;}
	}//column

	:column {label="";
		:text {label="Масса, кг";}
		:list_box {key="txt-99"; list=""; width=10; height=10; value=0;}
	}//column
}//row

:row {label="";
	:column {label="";
		:text {label="Выбрано"; }//text
		:list_box {label=""; key="txt-901"; list=""; width=50; height=7; value= "0";}
	}//column
}//row

:row {label="";
	:button {label="Запомнить"; key="but1"; height=1;}
	:button {label="ПЭ"; key="but2"; height=1;}
	:button {label="СПЦФ"; key="but3"; height=1;}
	ok_only;
}//row
}

