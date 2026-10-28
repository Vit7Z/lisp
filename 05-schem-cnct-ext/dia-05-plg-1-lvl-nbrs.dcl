dia_05_plg_1_lvl: dialog {label = "Клеммы 1 ярус";

initial_focus = "start-num";

:column {
	:edit_box {label = "Начальный номер";	key="start-num";	value=1;	edit_width = 4; edit_limit = 3;}
}//column

:row {label="";
	:column {label="10 мм";		
		:radio_button {label="XT + клеммы"; key="but15"; height=1;}
		:radio_button {label="Клеммы"; key="but12"; height=1;}
		:radio_button {label="XT"; key="but11"; height=1;}
		:radio_button {label="Разборный тип клеммы"; key="but13"; height=1;}
		:radio_button {label="Разъемный тип клеммы"; key="but14"; height=1;}
		:radio_button {label="Разрыв"; key="but18"; height=1;}
		:radio_button {label="1/2 Разрыв"; key="but19"; height=1;}
	}//column

	:column {label="15 мм";		
		:radio_button {label="XT + клеммы"; key="but22"; height=1;}
		:radio_button {label="XT"; key="but21"; height=1;}
		:text {label=""; height=1;}
		:text {label=""; height=1;}
		:text {label=""; height=1;}
		:text {label=""; height=1;}
		:text {label=""; height=1.5;}
	}//column

	:column {label="5 мм";		
		:radio_button {label="Клеммы"; key="but32"; height=1;}
		:radio_button {label="XT"; key="but31"; height=1;}
		:radio_button {label="Разборный тип клеммы"; key="but33"; height=1;}
		:radio_button {label="Разъемный тип клеммы"; key="but34"; height=1;}
		:text {label=""; height=1;}
		:text {label=""; height=1;}
		:text {label=""; height=1.5;}
	}//column
}//row

:row {label="";
	ok_only;
}//row

}