///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_101_04_pwr_unt_elemer: dialog {label = "Блок питания, Элемер";

:row {label="";
	:column {label="Модель"; 
  	:text {label="";}
    :list_box {key="txt-001"; list=""; width=20; height=9; value= "0"; multiple_select=true;}
  }//column
  
	:column {label="Вых. напря-"; 
  	:text {label=" жение, В";}
    :list_box {key="txt-002"; list=""; width=7; height=9; value= "0"; is_enabled=false; multiple_select=true;}
  }//column

  :column {label="Кол."; 
  	:text {label=" каналов";}
    :list_box {key="txt-003"; list=""; width=7; height=9; value=0; is_enabled=false; multiple_select=true;}//list_box
  }//column

  :column {label="Макс. ток"; 
  	:text {label=" нагрузки, А";}
    :list_box {key="txt-004"; list=""; width=7; height=9; value= "0"; is_enabled=false;  multiple_select=true;}
  }//column 

  :column {label="Крепление"; 
  	:text {label="";}
    :list_box {key="txt-005"; list=""; width=7; height=9; value= "0"; is_enabled=false;  multiple_select=true;}
  }//column

  :column {label="Исполнение"; 
  	:text {label="";}
    :list_box {key="txt-006"; list=""; width=7; height=9; value= "0"; is_enabled=false;  multiple_select=true;}
  }//column

  :column {label="Класс"; 
  	:text {label=" безопан.";}
    :list_box {key="txt-007"; list=""; width=7; height=9; value= "0"; is_enabled=false;  multiple_select=true;}
  }//column

  :column {label="Присое-"; 
  	:text {label=" динение";}
    :list_box {key="txt-008"; list=""; width=7; height=9; value= "0"; is_enabled=false;  multiple_select=true;}
  }//column

  :column {label="Климатич."; 
  	:text {label=" исполнен.";}
    :list_box {key="txt-009"; list=""; width=7; height=9; value= "0"; is_enabled=false;  multiple_select=true;}
  }//column

	:column {label="Выбрано    ";
		:text {label=""; }//text
		:list_box {label=""; key="txt-101"; list=""; width=22; height=9; value= "0";}
	}//column
}//row

:text {label="добавить примечание для аэс"; }//text
:text {label="добавить про гальваноразвязку каналов"; }//text

:row {label="";
	:button {label="Запомнить"; key="but1"; height=1;}
	:button {label="ПЭ"; key="but2"; height=1;}
	:button {label="СПЦФ"; key="but3"; height=1;}
	:button {label="ОВШ"; key="but4"; height=1;}
	ok_only;
}//row

}
///////////////////////////////////////////////////////////////////////////////////////////////////////////
