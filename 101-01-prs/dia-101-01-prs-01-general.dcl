dia_101_01_press_sens: dialog {label = "Давление";

:row {label="";
	:column {label="";
		:text {label="Показывающие";}
		:text {label="";}
		:list_box {key="txt-01"; list=""; width=30; height=15; value=0;}
	}//column

	:column {label="";
		:text {label="Датчики";}
		:text {label="(изб., абс.)";}
		:list_box {key="txt-02"; list=""; width=22; height=15; value=0;}
	}//column

	:column {label="";
		:text {label="Датчики";}
		:text {label="(перепад)";}
		:list_box {key="txt-03"; list=""; width=24; height=15; value=0;}
	}//column

	:column {label="";
		:text {label="Сигнализирующие";}
		:text {label="(изб., абс.)";}
		:list_box {key="txt-04"; list=""; width=24; height=15; value=0;}
	}//column
	
	:column {label="";
		:text {label="Сигнализирующие";}
		:text {label="(перепад)";}
		:list_box {key="txt-05"; list=""; width=30; height=15; value=0;}
	}//column
}//row

:row {label=""; height=1;
}//row

:row {label="";
	ok_only;
}//row
}

