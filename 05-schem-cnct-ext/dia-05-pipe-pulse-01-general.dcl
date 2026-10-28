///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_05_pipe_pulse_01: dialog {label = "Трубы импульсные";

:row {label="";
	:column {label="";
		:text {label="Нар. диам. х";}
		:text {label="толщ. стенки, мм";}
		:list_box {key="txt-01"; list=""; width=10; height=16;}//popup_list
	}//column

	:column {label="";
		:text {label="ГОСТ или";}
		:text {label="НТД";}
		:list_box {key="txt-02"; list=""; width=20; height=16;}//popup_list
	}//column

	:column {label="";
		:text {label="Материал";}
		:text {label="";}
		:list_box {key="txt-03"; list=""; width=15; height=16;}//popup_list
	}//column

	:column {label="";
		:text {label="Среда";}
		:text {label="";}
		:list_box {key="txt-04"; list=""; width=18; height=16;}//popup_list
	}//column

	:column {label="";
		:text {label="Давление,";}
		:text {label="МПа";}
		:list_box {key="txt-05"; list=""; width=10; height=16;}//popup_list
	}//column

	:column {label="";
		:text {label="Температура,";}
		:text {label="С";}
		:list_box {key="txt-06"; list=""; width=10; height=16;}//popup_list
	}//column

	:column {label="";
		:text {label="Длина линии,";}
		:text {label="мм";}
		:list_box {key="txt-07"; list=""; width=6; height=16;}//popup_list
	}//column
}//row

:row {label="";
  :toggle {label="Нумерация"; key="tgl-01";}
}//row

:row {label="";
	ok_cancel;
}//row
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////
