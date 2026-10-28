dia_04_numbering_wiring_down: dialog {label = "Жилы поз. вниз";

//initial_focus = "txt-01";

:column {label=""; children_alignment=true;
	:radio_button {label="="; key="but-11"; height=1;}
	:row {label="";
	  :radio_button {label="+"; key="but-12"; height=1;}
	  :edit_box {label=""; key="txt-01"; list=""; width=4; height=1; value=1100;}
	}//row
	:radio_button {label="Нет"; key="but-13"; height=1;}
}//column

ok_only;
}