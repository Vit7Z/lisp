///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_699_gost_21_205_stream_direction: dialog {label = "Направление потока";

:row {label="";
	:column {label=""; 
		:radio_button {label="Начало, конец"; key="txt-01"; value=1; height=0;}//
		:radio_button {label="Конец, начало"; key="txt-02"; value=0; height=0;}//
		:radio_button {label="Середина, направление"; key="txt-03"; value=0; height=0;}//
	}//column
}//row

:row {label="";
	ok_only;
}//row

}

