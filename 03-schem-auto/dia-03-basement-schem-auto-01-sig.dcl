dia_03_basement_schem_auto_01: dialog {label = "Подвал ФСА, сигналы";

:row {label="";
	:column {label="";
		:text {label="Аналоговые";}
		:toggle {label="Ain (4...20)"; key="tgl-11"; value=0;}//toggle
		:toggle {label="Ain Exi (4...20)"; key="tgl-12"; value=0;}//toggle
		:toggle {label="Aout (4...20)"; key="tgl-13"; value=0;}//toggle
		:toggle {label="Aout Exi (4...20)"; key="tgl-14"; value=0;}//toggle
	}//column
	
	:column {label="";
		:text {label="Дискретные";}
		:toggle {label="Din (=24)"; key="tgl-21"; value=0;}//toggle
		:toggle {label="Din NAMUR"; key="tgl-22"; value=0;}//toggle
		:toggle {label="Dout"; key="tgl-23"; value=0;}//toggle
		:text {label="";}
	}//column
	
	:column {label="";
		:text {label="Пром сети";}
		:toggle {label="RS485"; key="tgl-31"; value=0;}//toggle
		:toggle {label="Ethernet"; key="tgl-32"; value=0;}//toggle
		:text {label="";}
		:text {label="";}
	}//column
}//row

:row {label="";
	ok_cancel;
}//row
}

