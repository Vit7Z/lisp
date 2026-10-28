///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_101_logika: dialog {label = "Теплосчетчики";

:row {label="";
  :column {label=""; 
    :text {label="Типа";}
    :text {label="теплосчетчика";}
    :list_box {key="txt-00"; list=""; width=10; height=22; value=0;}//list_box
  }//column
  
  :column {label=""; 
    :text {label="Преобразователь";}
    :text {label="расхода";}
    :list_box {key="txt-01"; list=""; width=20; height=22; value=0; multiple_select=true;}//list_box
  }//column
  
  :column {label=""; 
      :text {label="Модель";}
      :text {label="теплосчетчика";}
      :list_box {key="txt-02"; list=""; width=20; height=22; value=0; multiple_select=true; is_enabled=false;}//list_box
  }//column
  
  :column {label=""; 
      :text {label="Преобразователь";}
      :text {label="температуры";}
      :list_box {key="txt-03"; list=""; width=10; height=22; value=0; is_enabled=false;}//list_box
  }//column
  
  :column {label=""; 
      :text {label="Преобразователь";}
      :text {label="разн. температур";}
      :list_box {key="txt-04"; list=""; width=10; height=22; value=0; is_enabled=false;}//list_box
  }//column
  
  :column {label=""; 
      :text {label="Преобраз. давления,";}
      :text {label="разн. давлений";}
      :list_box {key="txt-05"; list=""; width=10; height=22; value=0; is_enabled=false;}//list_box
	}//column
	
	:column {label="";
		:text {label="Выбрано"; }//text
		:text {label=""; }//text
		:list_box {label=""; key="txt-901"; list=""; width=34; height=22; value= "0";}
	}//column

}//row

:row {label="";
}//row

:row {label="";
	:button {label="Выбрать"; key="but1"; height=1;}
	:button {label="ПЭ"; key="but2"; height=1;}
	:button {label="СПЦФ"; key="but3"; height=1;}
	:button {label="ОВШ"; key="but4"; height=1;}
	ok_only;
}//row

}

///////////////////////////////////////////////////////////////////////////////////////////////////////////
