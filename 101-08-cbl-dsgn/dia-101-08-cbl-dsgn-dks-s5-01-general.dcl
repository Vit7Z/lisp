///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_101_08_cbl_dsgn_dks_s5: dialog {label = "Лотки, аксессуары DKS S5 Combitech";

:row {label="";
	:column { 
		:text {label="Наименование,";}
		:text {label="тех. характеристика"; }
		:list_box {label=""; key="txt-01"; list=""; width=40; height=24; }//list_box
	}//column
		
	:column {
		:text {label="ВхШхД, мм"; key="ptxt-21";}
		:text {label="";  key="ptxt-22";}
		:list_box {label=""; key="txt-02"; list=""; width=20; height=24; value=0;}//list_box
	}//column
		
	:column {
		:text {label="Код"; key="ptxt-31";}
		:text {label="заказа"; key="ptxt-32";}
		:list_box {label=""; key="txt-03"; list=""; width=15; height=24; value=0;}
	}//column
		
	:column {
		:text {label="Масса,"; key="ptxt-41";}//text
		:text {label="кг"; key="ptxt-42";}//text
		:list_box {label=""; key="txt-04"; list=""; width=20; height=24; value=0;}
	}//column
				
	:column {
		:text {label=""; key="ptxt-51";}
		:text {label=""; key="ptxt-52";}
		:list_box {label=""; key="txt-05"; list=""; width=10; height=24; value=0;}
	}//column

	:column {
		:text {label="Выбрано";}
		:text {label="";}
		:list_box {label=""; key="txt-901"; list=""; width=77; height=24;}
	}//column
}//row

:row {
	:column {label="";
  	:list_box {key="txt-900"; list=""; width=180; height=6;}//list_box
  }//column
}//row

:row {
	:button {label="Выбрать"; key="but1"; height=1;}
	:button {label="ЧРО"; key="but2"; height=1;}	
	:button {label="СПЦФ"; key="but3"; height=1;}
	:button {label="Удалить"; key="but5"; height=1;}
	ok_only;
}//row	
	
}//dialog
///////////////////////////////////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_101_08_s6: dialog {label = "++++++";


		

  
	  :ok_button {label="Выбрать"; key="but21"; height=1;}
  
	
}//dialog
///////////////////////////////////////////////////////////////////////////////////////////////////////////
