///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_101_din_rail_01_general: dialog {label = "DIN-рейка";

:row {label="";
	:column {
		:row {label="";
			:column {
				:text {label="Типоразмер,";}
				:text {label="производитель";}
				:list_box {key="txt-01"; list=""; width=15; height=10; value=0;}//list_box
			}//column
		
			:column {
				:text {label="Артикул";}
				:text {label="";}
				:list_box {key="txt-02"; list=""; width=15; height=10; value=0;}//list_box
			}//column
		
			:column {
				:text {label="Длина,";}
				:text {label="мм";}
				:list_box {key="txt-03"; list=""; width=10; height=10; value=0;}//list_box
			}//column
		
			:column {
				:text {label="Масса,";}
				:text {label="кг";}
				:list_box {key="txt-04"; list=""; width=10; height=10; value=0;}//list_box
			}//column
		}//row
	
		:row {label="";
			:column {
				:list_box {label=""; key="txt-900"; list=""; height=6; width=50; value= "";}
			}//column
		}//row
	}//column

	:column {label="";
		:text {label="Выбрано"; }//text
		:text {label="";}
		:list_box {label=""; key="txt-901"; list=""; height=15; width=22; value= "0";}
	}//column
}//row

:row {label="";
	:button {label="Запомнить"; key="but1"; height=1;}
	:button {label="ПЭ"; key="but2"; height=1;}
	:button {label="СПЦФ"; key="but3"; height=1;}
	:button {label="ОВШ"; key="but4"; height=1;}
	ok_only;
}//row
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////
