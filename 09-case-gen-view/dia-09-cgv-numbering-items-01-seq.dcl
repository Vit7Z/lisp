dia_09_cgv_numbering_items: dialog {label = "";

initial_focus = "txt-01";

:column {label=""; 
	:column {label="";
		:text {label="Начальное значение";}
		:edit_box {label=""; key="txt-01"; list=""; width=14; height=1;}
	}//column	

	:row {label="";
		:text {label="+";}
		:edit_box {label=""; key="txt-02"; list=""; width=4; height=1; value=0;}	
	}//row
		
	:text {label="или";}
		
	:row {label="";
		:text {label="-";}
		:edit_box {label=""; key="txt-03"; list=""; width=4; height=1; value=0; }	
	}//row	



}//row

:row {label="";
	ok_only;
}//row
}

