dia_101_01_gas_detection: dialog {label = "Загазованность";

:row {label="";
	:column {label="";
		:text {label="Кислород О2";}
		:list_box {key="txt-01"; list=""; width=26; height=15; value=0;}
	}//column

	:column {label="";
		:text {label="Водород Н2";}
		:list_box {key="txt-02"; list=""; width=26; height=15; value=0;}
	}//column
}//row

:row {label="";
	ok_only;
}//row
}

