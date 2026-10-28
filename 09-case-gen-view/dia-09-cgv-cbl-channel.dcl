///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_09_cbl_channel: dialog {label = "Кабельные каналы ОВШ";

:row {label="";
	:column {label=""; 
		:text {label="Типоразмер"; }//text
		:text {label="Ш, мм"; }//text
		:list_box {label=""; key="txt-01"; list=""; width=10; height=10; multiple_select=true;}//list_box
	}//column

	:column {label="";
		:text {label="Выравнивание"; }//text
		:text {label=""; }//text
		:list_box {label=""; key="txt-02"; list=""; width=10; height=10; multiple_select=true; value= "0";}
	}//column
}//row

:row {label="";
	:button {label="Выбрать"; key="but1"; height=1;}
	ok_only;
}//row

}// 
///////////////////////////////////////////////////////////////////////////////////////////////////////////

