dia_09_cgv_numbering_items_delta: dialog {label = "Нумерация";

:row {label=""; 
	:column {label="";
		:row {label="";
			:text {label="+";}
			:edit_box {label=""; key="txt-01"; list=""; width=4; height=1; value=0;}	
		}//row
		
		:text {label="или";}
		
		:row {label="";
			:text {label="-";}
			:edit_box {label=""; key="txt-02"; list=""; width=4; height=1; value=0; }	
		}//row	
	}//column
}//row

:row {label="";
	ok_only;
}//row
}

