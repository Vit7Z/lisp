dia_101_01_secondary_device_soft_general: dialog {label = "Software";

:row {label="";
	:column {label="";
		:text {label="Наименование";}
		:list_box {key="txt-01"; list=""; width=35; height=15; value=0;}
	}//column
	
	:column {label="";
		:text {label="Версия";}
		:list_box {key="txt-02"; list=""; width=20; height=15; value=0;}
	}//column	

	:column {label="";
		:text {label="Код заказа";}
		:list_box {key="txt-03"; list=""; width=20; height=15; value=0;}
	}//column

	:column {label="";
		:text {label="Производитель";}
		:list_box {key="txt-04"; list=""; width=20; height=15; value=0;}
	}//column

	:column {label="";
		:text {label="Описание";}
		:list_box {key="txt-1001"; list=""; width=90; height=15; value=0;}
	}//column
}//row



:row {label="";
	:column {label="";
		:text {label="Выбрано"; }//text
		:list_box {label=""; key="txt-901"; list=""; width=10; height=10; value= "0";}
	}//column
}//row

:row {label="";
	:button {label="Запомнить"; key="but1"; height=1;}
	:button {label="ПЭ"; key="but2"; height=1;}
	:button {label="СПЦФ"; key="but3"; height=1;}
	ok_only;
}//row

}