dia_101_08_general: dialog {label = "Монтажные узлы и изделия";

:row {label="";
	:column {label="";
		:text {label="Для измерения";}
		:text {label="температуры";}
		
		:list_box {key="txt-01"; list=""; width=18; height=15; value=0;}
	}//column

	:column {label="";
		:text {label="Для измерения";}
		:text {label="давления";}
		:list_box {key="txt-02"; list=""; width=26; height=15; value=0;}
	}//column

	:column {label="";
		:text {label="Кабельные";}
		:text {label="конструкции";}

		:list_box {key="txt-03"; list=""; width=25; height=15; value=0;}
	}//column

	:column {label="";
		:text {label="Корпуса шкафов,";}
		:text {label="аксессуары";}
		
		:list_box {key="txt-04"; list=""; width=25; height=15; value=0;}
	}//column

	:column {label="";
		:text {label="Клеммы и";}
		:text {label="аксессуары";}

		:list_box {key="txt-05"; list=""; width=24; height=15; value=0;}
	}//column

	:column {label="";
		:text {label="Коробки";}
		:text {label="";}
		
		:list_box {key="txt-06"; list=""; width=18; height=15; value=0;}
	}//column

	:column {label="";
		:text {label="Разное";}
		:text {label="";}

		:list_box {key="txt-07"; list=""; width=20; height=15; value=0;}
	}//column

}//row




:row {label="";
	ok_only;
}//row
}

