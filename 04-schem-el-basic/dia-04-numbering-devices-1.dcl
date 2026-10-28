dia_04_numbering_dev_1: dialog {label = "";

:row {label=""; 

	:column {label=""; children_alignment=true;
	
		:text {label="Пост. часть";}
	
		:edit_box {label=""; key="txt-01"; list=""; width=10; height=1; value=X;}
		
		:spacer {height=0.1;}
	
	}//column
	
	

	:column {label=""; children_alignment=true;
		
		:text {label="Перем. часть";}
		
		:edit_box {key="txt-12"; list=""; width=15; height=1; value=1;}
		
		:spacer {height=0.1;}
		
	}//column		
	
	:column {label=""; children_alignment=true; 
	
		:text {label="";}
		
		:button {label="Рисовать"; key="butn-11"; height=1;}
		
		:spacer {height=0.01;}

	}//column
	
}//row

:row {label="";
	ok_only;
}//row
}

