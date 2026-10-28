dia_03_symbols_devices_general: dialog {label = "Приборы";

:row {label="";

:column {label="";
	:row {label="";
		:column {label="";
			:text {label="Температура";}
			:list_box {key="txt-01"; list=""; width=10; height=7; value=0;}//list_box
		}//column
	
		:column {label="";
			:text {label="Давление";}
			:list_box {key="txt-02"; list=""; width=10; height=7; value=0;}//list_box
		}//column
	
		:column {label="";
			:text {label="Перепад";}
			:list_box {key="txt-03"; list=""; width=10; height=7; value=0;}//list_box
		}//column
	
		:column {label="";
			:text {label="Расход";}
			:list_box {key="txt-04"; list=""; width=10; height=7; value=0;}//list_box
		}//column
	
		:column {label="";
			:text {label="Уровень";}
			:list_box {key="txt-05"; list=""; width=10; height=7; value=0;}//list_box
		}//column

		:column {label="";
			:text {label="Загазованность";}
			:list_box {key="txt-07"; list=""; width=10; height=7; value=0;}//list_box
		}//column
	}//row

	:row {label="";
		:column {label="";
				:text {label="E - первичный изм. преобразователь (чувствительный элемент)";}
				:text {label="T - дистанционная передача. S - контактное устройство";}
				:text {label="G - первичный показывающий прибор";}
			}//column
	}//row
}//column

:column {label="";
	:row {label="";
		:column {label="";
			:text {label="Ширина знака";}
			:list_box {key="txt-06"; list=""; width=10; height=5; value=0;}//list_box
		}//column
	}//row

	:row {label="";
		:button {label="Замена надпси"; key="but-01"; height=2;}
	}//row

	:row {label=""; height=6;}//row

	:row {label=""; ok_cancel; }//row
}//column

}//row
}

