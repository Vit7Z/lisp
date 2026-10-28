///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_101_01_plc_s7_et_200sp: dialog {label = "S7 ET200SP";

:row {label=""; 
	:column {label="";
		:row {label=""; 
			:column {label="";
				:text {label="Тип";}
				:text {label="";}
				:list_box {key="txt-01"; list=""; width=28; height=15; value=0;}//list_box
			}//column
		
			:column {label="";
				:text {label="Обозначение, артикул";}
				:text {label="";}
				:list_box {key="txt-02"; list=""; width=58; height=15; value=0;}//list_box
			}//column
		 
			:column {label="";
				:text {label="Память, коммуникации"; key="ml-31";}
				:text {label=""; key="ml-32";}
				:list_box {key="txt-03"; list=""; width=45; height=15; value=0;}//list_box
			}//column

			:column {label="";
				:text {label="Масса,";}
				:text {label="кг";}
				:list_box {key="txt-04"; list=""; width=8; height=15; value=0;}//list_box
			}//column
		}//row
	
		:column {label="";
			:text {label="Выбрано"; }//text
			:list_box {label=""; key="txt-901"; list=""; width=50; height=10; value= "0";}
		}//column
	}//column 

	:column {label="";
		:text {label="Описание"; }//text
		:text {label="";}
		:list_box {label=""; key="txt-05"; list=""; width=65; height=25; value= "0";}
	}//column
}//row

:row {label="";
	:button {label="Запомнить"; key="but1"; height=1;}
	:button {label="ПЭ"; key="but2"; height=1;}
	:button {label="СПЦФ"; key="but3"; height=1;}
	:button {label="ОВШ"; key="but4"; height=1;}
	:button {label="Удалить"; key="but5"; height=1;}
	:button {label="Вверх"; key="but6"; height=1;}
	ok_only;
}//row
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////
