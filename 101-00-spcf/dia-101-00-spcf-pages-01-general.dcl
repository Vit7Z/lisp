dia_101_00_spcf_pages_01_general: dialog {label = "Листы СПЦФ";

:row {label="";

	:column {label="";
		:row {label="";
			:column {label="";
				:text {label="Марки В Файле";}
				:list_box {key="txt-01"; list=""; width=30; height=10;}
			}//column
		
			:column {label="";
				:text {label="Индекс";}
				:list_box {key="txt-03"; list=""; width=10; height=10;}
			}//column
		}//row
	
		:column {label="";
			:button {label="Новая"; key="but-01"; height=1;}
			:text {label=""; height=1.5;}
		}//row
	
	}//column

	:column {label="";
		:text {label="Спецификации В Файле";}
		:list_box {key="txt-02"; list=""; width=32; height=10;}
		
		:button {label="Лист 1, штамп 55"; key="but-02";}
		:button {label="Лист 2, штамп 15"; key="but-03";}		
	}//column
}//row	

:row {label="";
	ok_only;
}//row
}
