dia_09_cgv_pages_01_general: dialog {label = "Листы ОВШ";
:row {label="";
	:column {label="";
		:row {label="";
			:column {label="";
				:text {label="Марки В Файле";}
				:list_box {key="txt-01"; list=""; width=30; height=12;}
			}//column
		
			:column {label="";
				:text {label="Индекс";}
				:list_box {key="txt-02"; list=""; width=10; height=12;}
			}//column
		}//row
	
		:column {label="";
			:button {label="Новый"; key="but-01"; height=1;}
			:button {label=""; is_enabled=falshe;}
			:button {label=""; is_enabled=falshe;}
		}//row
	}//column

	:column {label="";
		:text {label="ОВШ (ЭЧНИ) В Файле";}
		:list_box {key="txt-03"; list=""; width=32; height=12;}
		
		:button {label="Лист А4, штамп 55"; key="but-02";}
		:button {label="Лист А4, штамп 15"; key="but-03";}
		:button {label="Лист А3, штамп 15"; key="but-04";}		
	}//column
}//row	

:row {label="";
	ok_only;
}//row
}
