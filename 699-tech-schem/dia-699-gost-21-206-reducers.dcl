///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_699_gost_21_206_reducers: dialog {label = "Переход";

:row {label="";
	:column {label=""; 
		:radio_button {label="Начало(Ш), конец"; key="txt-01"; value=1; height=0;}//
		:radio_button {label="Конец (Уз), начало"; key="txt-02"; value=0; height=0;}//
		:radio_button {label="Середина, направление"; key="txt-03"; value=0; height=0;}//
	}//column
}//row

:row {label="";
	ok_only;
}//row

}

