dia_101_01_secondary_device_general: dialog {label = "Приборы и средства автоматизации";

:row {label="";
	:column {label="";
		:text {label="HMI";}
		:text {label="";}
		:list_box {key="txt-01"; list=""; width=20; height=7; value=0;}
	}//column
	
	:column {label="";
		:text {label="Регуляторы,";}
		:text {label="измерители";}
		:list_box {key="txt-02"; list=""; width=20; height=7; value=0;}
	}//column	

	:column {label="";
		:text {label="Преобраз.";}
		:text {label="сигналов";}
		:list_box {key="txt-03"; list=""; width=20; height=7; value=0;}
	}//column

	:column {label="";
		:text {label="Блоки";}
		:text {label="искрозащиты";}
		:list_box {key="txt-04"; list=""; width=20; height=7; value=0;}
	}//column

	:column {label="";
		:text {label="Сетевое";}
		:text {label="оборуд.";}
		:list_box {key="txt-05"; list=""; width=20; height=7; value=0;}
	}//column

	:column {label="";
		:text {label="Разное";}
		:text {label="";}
		:list_box {key="txt-06"; list=""; width=30; height=7; value=0;}
	}//column
}//row

//:row {label="";
//	:column {label="";
//		:text {label="HMI";}
//		:text {label="";}
//		:list_box {key="txt-08"; list=""; width=20; height=7; value=0;}
//	}//column
//
//	:column {label="";
//		:text {label="Сетвое";}
//		:text {label="оборудование";}
//		:list_box {key="txt-09"; list=""; width=20; height=7; value=0;}
//	}//column
//}//row

:row {label="";
	ok_only;
}//row
}

