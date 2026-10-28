///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_101_01_gas_detection_hydrogen: dialog {label = "ИГС-98 Верба-Д, водород";

:row {label=""; 
  :column {label="";
    :text {label="Сенсор";}
    :text {label="";}
    :list_box {key="txt-01"; list=""; width=28; height=5; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Uпит.";}
    :text {label="";}
    :list_box {key="txt-02"; list=""; width=8; height=5; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Вых.";}
    :text {label="сигнал";}
    :list_box {key="txt-03"; list=""; width=10; height=5; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Взрывозащита";}
    :text {label="";}
    :list_box {key="txt-04"; list=""; width=18; height=5; value=0;}//list_box
  }//column  

  :column {label="";
    :text {label="IP";}
    :text {label="";}
    :list_box {key="txt-05"; list=""; width=8; height=5; value=0;}//list_box
  }//column
    
  :column {label="";
    :text {label="Масса,";}
    :text {label="кг";}
    :list_box {key="txt-99"; list=""; width=8; height=5; value=0;}//list_box
  }//column  
}//row

:row {label="";
	:column {label="";
		:text {label="Выбрано"; }//text
		:list_box {label=""; key="txt-901"; list=""; width=50; height=7; value= "0";}
	}//column
}//row

:row {label="";
	:button {label="Запомнить"; key="but1"; height=1;}
	:button {label="ПЭ"; key="but2"; height=1;}
	:button {label="СПЦФ"; key="but3"; height=1;}
	:button {label="ОВШ"; key="but4"; height=1;}
	ok_only;
}//row
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////
