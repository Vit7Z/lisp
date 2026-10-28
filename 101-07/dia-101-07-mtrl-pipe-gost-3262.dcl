///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_101_07_mtrl_pipe_gost_3262: dialog {label = "Труба ВГП ГОСТ 3262";

:row {label="";
	:column {
		:row {label="";
			:column {
				:text {label="Ду х толщ.";}
    		:text {label="стенки,";}
    		:text {label="мм";}
				:list_box {key="txt-01"; list=""; width=8; height=20; value=0;}//list_box
			}//column
		
			:column {
				:text {label="Наружн.";}
    		:text {label="диаметр,";}
    		:text {label="мм";}
				:list_box {key="txt-02"; list=""; width=6; height=20; value=0;}//list_box
			}//column
		
			:column {
				:text {label="Масса";}
    		:text {label="1м, кг";}
    		:text {label="";}
				:list_box {key="txt-03"; list=""; width=6; height=20; value=0;}//list_box
			}//column
		
			:column {
				:text {label="Тип";}
    		:text {label="трубы";}
    		:text {label="";}
				:list_box {key="txt-04"; list=""; width=6; height=20; value=0;}//list_box
			}//column
		}//row
	
		:row {label="";
			:column {
				:list_box {label=""; key="txt-900"; list=""; height=5; width=50; value= "";}
			}//column
		}//row
	}//column

	:column {label="";
		:row {label="";
			:column {
				:text {label="Выбрано"; }//text
				:text {label="";}
				:text {label="";}
				:list_box {label=""; key="txt-901"; list=""; height=23.5; width=22; value= "0";}
			}//column
		}//row
	}//column
}//row

:row {label="";
	:button {label="Запомнить"; key="but1"; height=1;}
//	:button {label="ПЭ"; key="but2"; height=1;}
	:button {label="ПЭ ЧРО"; key="but3"; height=1;}
	:button {label="СПЦФ"; key="but4"; height=1;}
	ok_only;
}//row
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////
