///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_101_08_punched: dialog {label = "Перфоизделия";

:row {label="";
	:column { 
		:text {label="Номенклатура";}
		:text {label="";}
		:list_box {label=""; key="txt-01"; list=""; width=25; height=9; }//list_box
	}//column
	
	:column {
		:text {label="Типоразмер";}
		:text {label="(ШхВхД, мм)"; key="ptxt-022";}
		:list_box {label=""; key="txt-02"; list=""; width=15; height=9;}//list_box
	}//column

	:column {
		:text {label="Масса, кг";}
		:text {label="";}
		:list_box {label=""; key="txt-99"; list=""; width=10; height=9;}//list_box
	}//column
}//row

:column { 
	:text {label="Выбрано";}
	:list_box {key="txt-901"; list=""; width=7; height=9;}//list_box
}//column

:row {label="";
	:button {label="Запомнить"; key="but1"; height=1;}
	:button {label="ПЭ"; key="but2"; height=1;}
	:button {label="СПЦФ"; key="but3"; height=1;}
	:button {label="ЧРО"; key="but4"; height=1;}
	:button {label="Удалить"; key="but5"; height=1;}
	:button {label="Вверх"; key="but6"; height=1;}
	ok_only;
}//row

}

///////////////////////////////////////////////////////////////////////////////////////////////////////////
